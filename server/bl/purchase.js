const models = require("../models");
const uuidv4 = require("uuid/v4");

const common = require("./common");

async function Get(id) {
  const purchaseRow = await models.purchase_txt.findOne({
    where: { id: id },
    include: [
      {
        model: models.supplier,
        attributes: ["id", "name"]
      },
      {
        model: models.purchase_grid,
        attributes: ["id", "srno", "qty", "mrp", "qty_mrp"],
        include: [
          {
            model: models.product,
            attributes: ["id", "name"]
          }
        ]
      }
    ],
    order: [[models.purchase_grid, "srno", "asc"]]
  });

  return purchaseRow;
}

async function Add(
  billno,
  bill_date,
  supplier_id,
  purchase_grid,
  amount,
  discount_percentage,
  discount_amount,
  tot
) {
  let T;

  try {
    T = await models.sequelize.transaction();

    //purchase TXT
    const purchaseID = uuidv4();
    await models.purchase_txt.create(
      {
        id: purchaseID,
        billno: billno,
        bill_date: bill_date,
        supplier_id: supplier_id,
        amount: amount,
        discount_percentage: discount_percentage,
        discount_amount: discount_amount,
        tot: tot
      },
      { transaction: T }
    );

    //insert all grid items
    const Tot = purchase_grid.length;
    for (let index = 0; index < Tot; index++) {
      const pgItem = purchase_grid[index];
      await models.purchase_grid.create(
        {
          id: uuidv4(),
          purchase_id: purchaseID,
          srno: pgItem.srno,
          product_id: pgItem.product.id,
          qty: pgItem.qty,
          mrp: pgItem.mrp,
          qty_mrp: pgItem.qty_mrp
        },
        { transaction: T }
      );
    }

    // commit
    await T.commit();

    return true;
  } catch (e) {
    // Rollback transaction if any errors were encountered
    if (T) await T.rollback();
    return false;
  }
}

async function Update(
  purchaseID,
  billno,
  bill_date,
  supplier_id,
  purchase_grid,
  amount,
  discount_percentage,
  discount_amount,
  tot
) {
  let T;

  try {
    T = await models.sequelize.transaction();

    //purchase TXT
    await models.purchase_txt.update(
      {
        billno: billno,
        bill_date: bill_date,
        supplier_id: supplier_id,
        amount: amount,
        discount_percentage: discount_percentage,
        discount_amount: discount_amount,
        tot: tot
      },
      {
        where: { id: purchaseID }
      },
      { transaction: T }
    );

    //insert all grid items
    const Tot = purchase_grid.length;
    for (let index = 0; index < Tot; index++) {
      const pgItem = purchase_grid[index];

      if (pgItem.id) {
        //if grid doesn't have id then it's newly added row
        await models.purchase_grid.update(
          {
            //purchase_id: purchaseID, //no need to update foreign key
            srno: pgItem.srno,
            product_id: pgItem.product.id,
            qty: pgItem.qty,
            mrp: pgItem.mrp,
            qty_mrp: pgItem.qty_mrp
          },
          {
            where: { id: pgItem.id }
          },
          { transaction: T }
        );
      } else {
        //gird item is new, so add
        await models.purchase_grid.create(
          {
            id: uuidv4(),
            purchase_id: purchaseID,
            srno: pgItem.srno,
            product_id: pgItem.product.id,
            qty: pgItem.qty,
            mrp: pgItem.mrp,
            qty_mrp: pgItem.qty_mrp
          },
          { transaction: T }
        );
      }
    }

    // commit
    await T.commit();

    return true;
  } catch (e) {
    // Rollback transaction if any errors were encountered
    if (T) await T.rollback();
    return false;
  }
}

async function Query(pageSize, pageIndex, sortBy, filters) {
  const result = common.Query({
    pageSize,
    pageIndex,
    sortBy,
    filters,
    table: models.purchase_txt,
    include: [
      {
        model: models.supplier,
        attributes: ["id", "name"]
        //where: { id: models.Sequelize.col("product.category_id") }
      }
    ],
    attributes: [
      "id",
      "billno",
      "bill_date",
      "amount",
      "discount_percentage",
      "discount_amount",
      "tot"
    ]
  });

  return result;
}

module.exports = {
  Get: Get,
  Add: Add,
  Update: Update,
  Query: Query
};
