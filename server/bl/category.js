const models = require("../models");

async function Search(name) {
  const rows = await models.category.findAll({
    attributes: [["id", "value"], ["name", "label"]],
    where: {
      name: { [models.Sequelize.Op.iLike]: `%${name}%` }
    }
  });

  return rows;
}


module.exports = {
    Search: Search
};