/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('purchase_grid', {
    id: {
      type: DataTypes.UUIDV4,
      allowNull: false,
      primaryKey: true
    },
    purchase_id: {
      type: DataTypes.UUIDV4,
      allowNull: false
    },
    srno: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    product_id: {
      type: DataTypes.UUIDV4,
      allowNull: true
    },
    qty: {
      type: DataTypes.DOUBLE,
      allowNull: true
    },
    mrp: {
      type: DataTypes.DOUBLE,
      allowNull: true
    },
    qty_mrp: {
      type: DataTypes.DOUBLE,
      allowNull: true
    }
  }, {
    tableName: 'purchase_grid'
  });
};
