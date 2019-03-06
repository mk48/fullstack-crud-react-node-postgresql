/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('purchase_txt', {
    id: {
      type: DataTypes.UUIDV4,
      allowNull: false,
      primaryKey: true
    },
    billno: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    bill_date: {
      type: DataTypes.DATEONLY,
      allowNull: false
    },
    supplier_id: {
      type: DataTypes.UUIDV4,
      allowNull: true
    },
    amount: {
      type: DataTypes.DOUBLE,
      allowNull: true
    },
    discount_percentage: {
      type: DataTypes.DOUBLE,
      allowNull: true
    },
    discount_amount: {
      type: DataTypes.DOUBLE,
      allowNull: true
    },
    tot: {
      type: DataTypes.DOUBLE,
      allowNull: true
    }
  }, {
    tableName: 'purchase_txt'
  });
};
