const express = require("express");
const router = express.Router();
const Auth = require("../util/authenticate");

const categoryBL = require("./../bl/category");

router.get("/search", Auth.isAuthenticated, async function(req, res, next) {
  const name = req.query.name;

  try {
    const rows = await categoryBL.Search(name);

    res.json(rows);
  } catch (e) {
    res.status(401).json(err.toString());
  }
});

module.exports = router;
