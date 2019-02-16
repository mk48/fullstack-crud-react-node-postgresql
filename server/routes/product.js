var express = require("express");
var router = express.Router();
var models = require("../models");
const uuidv4 = require("uuid/v4");

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
        if (models.product.tableAttributes[key].type.constructor.key === "STRING") {
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
      attributes: [[models.Sequelize.fn('COUNT', 1), 'tot']]
    });
    const totalRows = totalRowsResult[0].dataValues.tot;

    const products = await models.product.findAll({
      where: filtersWithoutEmpty,
      limit: pageSize,
      offset: pageSize * pageIndex,
      order: sortedArray,
      attributes: [
        "id",
        "name",
        "category_id",
        "expiry_date",
        "is_expiry",
        "price",
        "size",
        "description"
      ]
    });

    res.json({rows: products, totalRows: totalRows});
  } catch (e) {
    res.status(401).json(e.toString());
  }
});

router.post("/", async function(req, res, next) {
  const name = req.body.name;
  const category = req.body.category;
  const expiryDate = Date(req.body.expiryDate);
  const isExpiry = Boolean(req.body.isExpiry);
  const price = req.body.price;
  const size = req.body.size;
  const description = req.body.description;

  try {
    await models.product.create({
      id: uuidv4(),
      name: name,
      category_id: category,
      expiry_date: expiryDate,
      is_expiry: isExpiry,
      price: price,
      size: size,
      description: description
    });

    res.json({ success: true });
  } catch (e) {
    res.status(401).json(e.toString());
  }
});

module.exports = router;
