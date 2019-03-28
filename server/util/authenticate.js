var SessionBL = require("../bl/session");

const isAuthenticated = async function(req, res, next) {
  try {
    var token = req.headers["x-access-token"];
    if (!token) {
      return res
        .status(403)
        .send({ auth: false, message: "No token provided." });
    }

    const session = await SessionBL.Get(token);

    if (session) {
      req.session = session;
      return next();
    } else {
      res.status(401).json({ err: "session expired" });
    }
  } catch (err) {
    res.status(400).json(err.message);
  }
};

module.exports = {
  isAuthenticated: isAuthenticated
};
