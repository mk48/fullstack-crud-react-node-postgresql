/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('session', {
    id: {
      type: DataTypes.UUIDV4,
      allowNull: false,
      primaryKey: true
    },
    user_id: {
      type: DataTypes.UUIDV4,
      allowNull: false,
      primaryKey: true
    }
  }, {
    tableName: 'session'
  });
};
