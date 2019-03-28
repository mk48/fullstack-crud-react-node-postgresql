var express = require("express");
var router = express.Router();
const Auth = require("../util/authenticate");

const productBL = require("./../bl/product");

router.get("/", Auth.isAuthenticated, async function(req, res, next) {
  const id = req.query.id;
  try {
    const productRow = await productBL.Get(id);

    res.json(productRow);
  } catch (e) {
    res.status(401).json(e.toString());
  }
});


router.post("/query", Auth.isAuthenticated, async function(req, res, next) {
  //sortBy, filters, pageIndex, pageSize
  const pageSize = req.body.pageSize;
  const pageIndex = req.body.pageIndex;
  const sortBy = req.body.sortBy;
  const filters = req.body.filters;

  try {
    const result = await productBL.Query(pageSize, pageIndex, sortBy, filters);
    res.json(result);
  } catch (e) {
    res.status(401).json(e.toString());
  }
});

router.post("/", Auth.isAuthenticated, async function(req, res, next) {
  const name = req.body.name;
  const category_id = req.body.category_id;
  const expiry_date = Date(req.body.expiry_date);
  const is_expiry = Boolean(req.body.is_expiry);
  const price = req.body.price;
  const size = req.body.size;
  const description = req.body.description;

  try {
    await productBL.Add(
      name,
      category_id,
      expiry_date,
      is_expiry,
      price,
      size,
      description
    );

    res.json({ success: true });
  } catch (e) {
    res.status(401).json(e.toString());
  }
});

router.post("/update", Auth.isAuthenticated, async function(req, res, next) {
  const id = req.body.id;
  const name = req.body.name;
  const category_id = req.body.category_id;
  const expiry_date = Date(req.body.expiry_date);
  const is_expiry = Boolean(req.body.is_expiry);
  const price = req.body.price;
  const size = req.body.size;
  const description = req.body.description;

  try {
    await productBL.Update(
      id,
      name,
      category_id,
      expiry_date,
      is_expiry,
      price,
      size,
      description
    );

    res.json({ success: true });
  } catch (e) {
    res.status(401).json(e.toString());
  }
});

router.get("/search", Auth.isAuthenticated, async function(req, res, next) {
  const name = req.query.name;

  try {
    const rows = await productBL.Search(name);

    res.json(rows);
  } catch (e) {
    res.status(401).json(err.toString());
  }
});

module.exports = router;
