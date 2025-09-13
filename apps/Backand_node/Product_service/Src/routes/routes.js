const { authMiddleware} = require("");
const upload = require("../utils/");

const express = require("express");

const {
  addProduct,
  getAllProducts,
  getProductById,
  updateProductById,
  deleteProduct,

} = require("../Controllers/productControllers.js");

const router = express.router();

router.post("/",authMiddleware,upload.arry("images",5),addProduct);
router.get("/", getAllProducts);
router.get("/:id",getProductById);
router.put("/:id",authMiddleware,upload.array("images",5),updateProductById);
router.delete("/:id", authMiddleware, deleteProduct);

module.exports = router;
