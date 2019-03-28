const models = require("../models");
const uuidv4 = require("uuid/v4");

async function Get(sessionId) {
  const row = await models.session.findOne({
    where: { id: sessionId }
  });

  if (!row.dataValues.user_id) {
    throw new Error("Session expired");
  }

  return row.dataValues;
}

async function Add(userId) {
  const sessionId = uuidv4();

  //create a session
  await models.session.create({
    id: sessionId,
    user_id: userId
  });

  return sessionId;
}

async function Remove(sessionId) {
  
  //create a session
  await models.session.destroy({
    where: {id : sessionId}
  });

  return true;
}


module.exports = {
  Get: Get,
  Add: Add,
  Remove: Remove
};
