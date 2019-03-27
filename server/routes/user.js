var express = require("express");
var router = express.Router();
const userBL = require("./../bl/user");

router.post("/login", async function(req, res, next) {
  const userName = req.body.username;
  const password = req.body.password;

  try {
    const sessionInfo = await userBL.Login(userName, password);

    res.json(sessionInfo);
  } catch (e) {
    res.status(401).json(e.toString());
  }
});

module.exports = router;
