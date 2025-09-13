const express = require("express");
const dotenv = require("dotenv");
const cors = require("cors");
const ConnectDB = require("./db/db.js");
const ApiesRoutes = require("./Routes/Routes.js");

dotenv.config();
const app = express();

// data base connection
ConnectDB();

// middleware
app.use(cors());
app.use(express.json());

app.use("/apis", ApiesRoutes);

app.use("/app", (req, res) => {
  res.send("Welcome priduct services to the app !");
});

module.exports = app;
