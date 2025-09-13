const monggose = require("mongoose");

const ConnectDB = async () => {
  try {
    await monggose.connect(process.env.MONGO_DB);
    console.log("MongoDB connection Sucessfull.");
  } catch (error) {
    console.log("Data base connection error : ", error);
    process.exit(1);
  }
};

module.exports = ConnectDB;
