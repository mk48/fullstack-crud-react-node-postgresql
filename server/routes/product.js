var express = require("express");
var router = express.Router();
var models = require("../models");
const uuidv4 = require("uuid/v4");

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
      //category: category, TODO
      expiry_date: expiryDate,
      is_expiry: isExpiry,
      price: price,
      size: size,
      description: description
    });

    res.json({ success: true });
  } catch (e) {
    console.log(e);
    res.json({ err: e });
  }
});

module.exports = router;
