var express = require("express");
var router = express.Router();
var models = require("../models");
const uuidv4 = require("uuid/v4");

router.get("/", async function(req, res, next) {
  const id = req.query.id;
  try {
    const purchaseRow = await models.purchase_txt.findOne({
      where: {id: id},
      include: [
        {
          model: models.supplier,
          attributes: ["name"]
        },
        {
          model: models.purchase_grid,
          attributes: ["srno", "qty", "mrp", "qty_mrp"],
          include: [
            {
              model: models.product,
              attributes: ["name"]
            }
          ]
        }
      ]
    });

    res.json(purchaseRow);
  } catch (e) {
    res.status(401).json(e.toString());
  }
});

router.post("/", async function(req, res, next) {
  const billno = req.body.billno;
  const bill_date = req.body.bill_date;
  const supplier_id = req.body.supplier_id;
  const purchase_grid = req.body.purchase_grid;
  const amount = req.body.amount;
  const discount_percentage = req.body.discount_percentage;
  const discount_amount = req.body.discount_amount;
  const tot = req.body.tot;

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
          product_id: pgItem.product_id,
          qty: pgItem.qty,
          mrp: pgItem.mrp,
          qty_mrp: pgItem.qty_mrp
        },
        { transaction: T }
      );
    }

    // commit
    await T.commit();

    res.json({ success: true });
  } catch (e) {
    // Rollback transaction if any errors were encountered
    if (T) await T.rollback();
    res.status(401).json(e.toString());
  }
});

router.post("/query", async function(req, res, next) {
    //sortBy, filters, pageIndex, pageSize
    const pageSize = req.body.pageSize;
    const pageIndex = req.body.pageIndex;
    const sortBy = req.body.sortBy;
    const filters = req.body.filters;
  
    const sortedArray = sortBy.map((s, i) => [s.id, s.desc ? "DESC" : "ASC"]);
  
    let filtersWithoutEmpty = {};
  
    //remove empty filters
    for (var key in filters) {
      if (filters.hasOwnProperty(key)) {
        if (filters[key]) {
          //check the field data type, if string then add wild-card letters - LIKE operator
          if (
            models.purchase_txt.tableAttributes[key].type.constructor.key === "STRING"
          ) {
            filtersWithoutEmpty[key] = {
              [models.Sequelize.Op.iLike]: `%${filters[key]}%`
            };
          } else {
            filtersWithoutEmpty[key] = filters[key];
          }
        }
      }
    }
  
    try {
      //count number of rows
      const totalRowsResult = await models.purchase_txt.findAll({
        where: filtersWithoutEmpty,
        attributes: [[models.Sequelize.fn("COUNT", 1), "tot"]]
      });
      const totalRows = totalRowsResult[0].dataValues.tot;
  
      const purchaseBills = await models.purchase_txt.findAll({
        where: filtersWithoutEmpty,
        limit: pageSize,
        offset: pageSize * pageIndex,
        order: sortedArray,
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
  
      res.json({ rows: purchaseBills, totalRows: totalRows });
    } catch (e) {
      res.status(401).json(e.toString());
    }
  });

module.exports = router;
