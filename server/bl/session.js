const models = require("../models");
const uuidv4 = require("uuid/v4");

async function Get(sessionId) {
  const row = await models.session.findOne({
    where: { id: sessionId }
  });

  if (row.user_id) {
    throw new Error("Session expired");
  }

  return row;
}

async function Add(userId) {
  const sessionId = uuidv4();

  //create a session
  await models.session.create({
    id: uuidv4(),
    user_id: userId
  });

  return sessionId;
}

module.exports = {
  Get: Get,
  Add: Add
};
