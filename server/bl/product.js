const models = require("../models");
const uuidv4 = require("uuid/v4");

const common = require("./common");

async function Get(id) {
  const row = await models.product.findOne({
    where: { id: id },
    include: [
      {
        model: models.category,
        attributes: ["id", "name"]
      }
    ]
  });

  return row;
}

async function Query(pageSize, pageIndex, sortBy, filters) {
  const result = common.Query({
    pageSize,
    pageIndex,
    sortBy,
    filters,
    table: models.product,
    include: [
      {
        model: models.category,
        attributes: ["id", "name"]
        //where: { id: models.Sequelize.col("product.category_id") }
      }
    ],
    attributes: [
      "id",
      "name",
      //"category_id",
      "expiry_date",
      "is_expiry",
      "price",
      "size",
      "description"
    ]
  });

  return result;
}

async function Add(
  name,
  category_id,
  expiry_date,
  is_expiry,
  price,
  size,
  description
) {
  await models.product.create({
    id: uuidv4(),
    name: name,
    category_id: category_id,
    expiry_date: expiry_date,
    is_expiry: is_expiry,
    price: price,
    size: size,
    description: description
  });
}

async function Update(
  id,
  name,
  category_id,
  expiry_date,
  is_expiry,
  price,
  size,
  description
) {
  await models.product.update(
    {
      name: name,
      category_id: category_id,
      expiry_date: expiry_date,
      is_expiry: is_expiry,
      price: price,
      size: size,
      description: description
    },
    {
      where: { id: id }
    }
  );
}

async function Search(name) {
  const rows = await models.product.findAll({
    attributes: ["id", "name", "price"],
    where: {
      name: { [models.Sequelize.Op.iLike]: `%${name}%` }
    }
  });

  return rows;
}

module.exports = {
  Get: Get,
  Query: Query,
  Add: Add,
  Update: Update,
  Search: Search
};
