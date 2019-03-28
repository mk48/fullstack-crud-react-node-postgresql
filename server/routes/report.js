var express = require("express");
var router = express.Router();
var fs = require("fs");
const uuidv4 = require("uuid/v4");
const Auth = require("../util/authenticate");

const jsreport = require("jsreport-core")();
jsreport.init();

router.get("/testpdf", Auth.isAuthenticated, async function(req, res, next) {
  try {
    const resp = await jsreport.render({
      template: {
        content: "<h1>Hello {{foo}}</h1>",
        engine: "handlebars",
        recipe: "chrome-pdf"
      },
      data: {
        foo: "world"
      }
    });

    //console.log(resp.content.toString())
    const reportFolder = "public/generatedReport";
    if (!fs.existsSync(reportFolder)){
        fs.mkdirSync(reportFolder);
    }

    const filePath = `${reportFolder}/my_file.${uuidv4()}.pdf`;
    var stream = fs.createWriteStream(filePath);
    stream.once("open", fd => {
      stream.write(resp.content);
      stream.end();
      res.download(filePath);
    });
  } catch (e) {
    res.status(401).json(e.toString());
  }
});

router.get("/testhtml", Auth.isAuthenticated, async function(req, res, next) {
  try {
    const resp = await jsreport.render({
      template: {
        content: "<h1>Hello {{foo}}</h1>",
        engine: "handlebars",
        recipe: "html"
      },
      data: {
        foo: "world"
      }
    });

    res.json({report: resp.content.toString()});
   
  } catch (e) {
    res.status(401).json(e.toString());
  }
});

module.exports = router;
