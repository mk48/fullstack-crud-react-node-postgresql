var express = require("express");
var router = express.Router();
var models = require("../models");
const uuidv4 = require("uuid/v4");

router.get("/", async function(req, res, next) {
  const id = req.query.id;
  try {
    const productRow = await models.product.findOne({
      where: {id: id},
      include: [
        {
          model: models.category,
          attributes: ["id", "name"]
        }
      ]
    });

    res.json(productRow);
  } catch (e) {
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
          models.product.tableAttributes[key].type.constructor.key === "STRING"
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
    const totalRowsResult = await models.product.findAll({
      where: filtersWithoutEmpty,
      attributes: [[models.Sequelize.fn("COUNT", 1), "tot"]]
    });
    const totalRows = totalRowsResult[0].dataValues.tot;

    const products = await models.product.findAll({
      where: filtersWithoutEmpty,
      limit: pageSize,
      offset: pageSize * pageIndex,
      order: sortedArray,
      include: [
        {
          model: models.category,
          attributes: ["id", "name"]
          //where: { id: models.Sequelize.col("product.category_id") }
        }
      ],
      attributes: [
        "id",
        "name",
        //"category_id",
        "expiry_date",
        "is_expiry",
        "price",
        "size",
        "description"
      ]
    });

    res.json({ rows: products, totalRows: totalRows });
  } catch (e) {
    res.status(401).json(e.toString());
  }
});

router.post("/", async function(req, res, next) {
  const name = req.body.name;
  const category_id = req.body.category_id;
  const expiry_date = Date(req.body.expiry_date);
  const is_expiry = Boolean(req.body.is_expiry);
  const price = req.body.price;
  const size = req.body.size;
  const description = req.body.description;

  try {
    await models.product.create({
      id: uuidv4(),
      name: name,
      category_id: category_id,
      expiry_date: expiry_date,
      is_expiry: is_expiry,
      price: price,
      size: size,
      description: description
    });

    res.json({ success: true });
  } catch (e) {
    res.status(401).json(e.toString());
  }
});


router.post("/update", async function(req, res, next) {
  const id = req.body.id;
  const name = req.body.name;
  const category_id = req.body.category_id;
  const expiry_date = Date(req.body.expiry_date);
  const is_expiry = Boolean(req.body.is_expiry);
  const price = req.body.price;
  const size = req.body.size;
  const description = req.body.description;

  try {
    await models.product.update({
      name: name,
      category_id: category_id,
      expiry_date: expiry_date,
      is_expiry: is_expiry,
      price: price,
      size: size,
      description: description
    }, {
      where: {id: id}
    });

    res.json({ success: true });
  } catch (e) {
    res.status(401).json(e.toString());
  }
});

router.get("/search", async function(req, res, next) {
  const name = req.query.name;

  try {
    const rows = await models.product.findAll({
      attributes: ["id", "name", "price"],
      where: {
        name: { [models.Sequelize.Op.iLike]: `%${name}%` }
      }
    });

    res.json(rows);
  } catch (e) {
    res.status(401).json(err.toString());
  }
});

module.exports = router;
