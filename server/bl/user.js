const models = require("../models");
const uuidv4 = require("uuid/v4");
const bcrypt = require("bcryptjs");

const sessionBL = require("./session");

const saltRounds = 6;

async function Login(username, password) {
  const user = await models.user.findOne({
    where: { username: username }
  });

  const isPasswordCorrect = await bcrypt.compare(password, user.pass);
  if (!isPasswordCorrect) {
    throw new Error("Password not correct");
  }

  const sessionId = await sessionBL.Add(user.id);

  return { sessionId: sessionId, userName: user.username };
}

async function Add(username, password, email) {
  const passHash = await bcrypt.hash(password, saltRounds);

  await models.user.create({
    id: uuidv4(),
    username: username,
    pass: passHash,
    email: email
  });
}

module.exports = {
  Login: Login,
  Add: Add
};
