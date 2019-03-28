var express = require("express");
var router = express.Router();
const Auth = require("../util/authenticate");

const purchaseBL = require("./../bl/purchase");

router.get("/", Auth.isAuthenticated, async function(req, res, next) {
  const id = req.query.id;
  try {
    const purchaseRow = await purchaseBL.Get(id);

    res.json(purchaseRow);
  } catch (e) {
    res.status(401).json(e.toString());
  }
});

router.post("/", Auth.isAuthenticated, async function(req, res, next) {
  const billno = req.body.billno;
  const bill_date = req.body.bill_date;
  const supplier_id = req.body.supplier_id;
  const purchase_grid = req.body.purchase_grid;
  const amount = req.body.amount;
  const discount_percentage = req.body.discount_percentage;
  const discount_amount = req.body.discount_amount;
  const tot = req.body.tot;

  const result = await purchaseBL.Add(
    billno,
    bill_date,
    supplier_id,
    purchase_grid,
    amount,
    discount_percentage,
    discount_amount,
    tot
  );

  if (result) {
    res.json({ success: true });
  } else {
    res.status(401).json({ success: false });
  }
});

router.post("/update", Auth.isAuthenticated, async function(req, res, next) {
  const purchaseID = req.body.id;
  const billno = req.body.billno;
  const bill_date = req.body.bill_date;
  const supplier_id = req.body.supplier_id;
  const purchase_grid = req.body.purchase_grid;
  const amount = req.body.amount;
  const discount_percentage = req.body.discount_percentage;
  const discount_amount = req.body.discount_amount;
  const tot = req.body.tot;

  const result = await purchaseBL.Update(
    purchaseID,
    billno,
    bill_date,
    supplier_id,
    purchase_grid,
    amount,
    discount_percentage,
    discount_amount,
    tot
  );

  if (result) {
    res.json({ success: true });
  } else {
    res.status(401).json({ success: false });
  }
});

router.post("/query", Auth.isAuthenticated, async function(req, res, next) {
  //sortBy, filters, pageIndex, pageSize
  const pageSize = req.body.pageSize;
  const pageIndex = req.body.pageIndex;
  const sortBy = req.body.sortBy;
  const filters = req.body.filters;

  try {
    const result = await purchaseBL.Query(pageSize, pageIndex, sortBy, filters);
    res.json(result);
  } catch (e) {
    res.status(401).json(e.toString());
  }
});

module.exports = router;
