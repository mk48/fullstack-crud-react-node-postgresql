const models = require("../models");

async function Query({
  pageSize,
  pageIndex,
  sortBy,
  filters,
  table,
  include,
  attributes
}) {
  const sortedArray = sortBy.map((s, i) => [s.id, s.desc ? "DESC" : "ASC"]);

  let filtersWithoutEmpty = {};

  //remove empty filters
  for (var key in filters) {
    if (filters.hasOwnProperty(key)) {
      if (filters[key]) {
        //check the field data type, if string then add wild-card letters - LIKE operator
        if (table.tableAttributes[key].type.constructor.key === "STRING") {
          filtersWithoutEmpty[key] = {
            [models.Sequelize.Op.iLike]: `%${filters[key]}%`
          };
        } else {
          filtersWithoutEmpty[key] = filters[key];
        }
      }
    }
  }

  //count number of rows
  const totalRowsResult = await table.findAll({
    where: filtersWithoutEmpty,
    attributes: [[models.Sequelize.fn("COUNT", 1), "tot"]]
  });
  const totalRows = totalRowsResult[0].dataValues.tot;

  const rows = await table.findAll({
    where: filtersWithoutEmpty,
    limit: pageSize,
    offset: pageSize * pageIndex,
    order: sortedArray,
    include: include,
    attributes: attributes
  });

  return { rows: rows, totalRows: totalRows };
}


module.exports = {
    Query: Query
};