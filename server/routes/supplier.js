var express = require("express");
var router = express.Router();
var models = require("../models");
const Auth = require("../util/authenticate");

router.get("/search", Auth.isAuthenticated, async function(req, res, next) {
  const name = req.query.name;

  try {
    const rows = await models.supplier.findAll({
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
