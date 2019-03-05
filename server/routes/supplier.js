var express = require("express");
var router = express.Router();
var models = require("../models");

router.get("/search", async function(req, res, next) {
  const name = req.query.name;

  try {
    const rows = await models.supplier.findAll({
      attributes: ["id", "name"],
      where: {
        name: { [models.Sequelize.Op.like]: `%${name}%` }
      }
    });

    res.json(rows);
  } catch (e) {
    res.status(401).json(err.toString());
  }
});

module.exports = router;
