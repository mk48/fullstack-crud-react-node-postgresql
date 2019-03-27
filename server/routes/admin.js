var express = require("express");
var router = express.Router();

const userBL = require("./../bl/user");

//http://localhost:3001/admin/createSampleUser
router.get("/createSampleUser", async function(req, res, next) {
  try {
    await userBL.Add("k", "k", "k@gmail.com");

    res.json({ success: true });
  } catch (e) {
    res.status(401).json(err.toString());
  }
});

module.exports = router;
