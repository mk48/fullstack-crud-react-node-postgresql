var express = require("express");
var router = express.Router();
var models = require("../models");

router.get("/search", async function(req, res, next) {
  const name = req.query.name;

  try {
    const rows = await models.category.findAll({
      attributes: [["id", "value"], ["name", "label"]],
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
