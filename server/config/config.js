module.exports = {
    development: {
        username: "postgres",
        password: "Sony",
        database: "store",
        host: "localhost",
        dialect: 'postgres',
        define: { timestamps: false },
      },
    development2: {
      dialect: "sqlite",
      storage: "./db.development.sqlite",
      define: { timestamps: false },
    },
    test: {
      dialect: "sqlite",
      storage: ":memory:",
      define: { timestamps: false },
    },
    production: {
      username: process.env.DB_USERNAME,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME,
      host: process.env.DB_HOSTNAME,
      dialect: 'postgres',
      define: { timestamps: false },
    }
  };
  
