const authMiddleware = require("../middlewares/AuthMiddleware.js");
const upload = require("../middlewares/multer.js");

const express = require("express");

const {
  addProduct,
  getAllProducts,
  getProductById,
  updateProductById,
  deleteProduct,

} = require("../Controllers/productControllers.js");

const router = express.Router();

router.post("/",authMiddleware,upload.array("images",5),addProduct);

// get all products
router.get("/", getAllProducts);

// get product by id 
router.get("/:id",getProductById);

// update product by id 
router.put("/:id",authMiddleware,upload.array("images",5),updateProductById);

// delete product 
router.delete("/:id", authMiddleware, deleteProduct);

module.exports = router;
