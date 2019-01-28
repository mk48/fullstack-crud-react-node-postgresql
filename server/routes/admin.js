var express = require('express');
var router = express.Router();
var ToClient = require('./../util/data')
var models = require("../models");

router.get('/kumaran', function(req, res, next) {
   
    models.couple.destroy({ truncate: true });
    models.family.destroy({ truncate: true });
    models.invite.destroy({ truncate: true });
    models.member.destroy({ truncate: true });
    models.otp.destroy({ truncate: true });
    models.user_family.destroy({ truncate: true });
    models.user.destroy({ truncate: true });

    let toClient = {done:"ok"};
    ToClient(res, toClient)
});


module.exports = router;
