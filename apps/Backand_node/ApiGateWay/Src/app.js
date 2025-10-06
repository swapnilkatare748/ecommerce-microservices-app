const express = require("express");
const dotenv = require("dotenv");
const cors = require("cors");
const proxy = require("express-http-proxy");
// const ConnectDB = require("./db/db.js");
// const ApiesRoutes = require("./Routes/Routes.js");


const app = express();
dotenv.config({ override: true });

// data base connection
// ConnectDB();

// middleware
app.use(cors());
app.use(express.json());

// app.use("/apis", ApiesRoutes);

//services 
app.use("/customer", proxy("http://localhost:8001"));
app.use("/product", proxy("http://localhost:8002"));
app.use("/shopping", proxy("http://localhost:8003"));


app.use("/app", (req, res) => {
  res.send("Welcome App getway to the app !");
});

module.exports = app;
