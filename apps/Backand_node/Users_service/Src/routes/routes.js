const express = require("express");

const {signup,login} = require("../Controllers/authController.js");


const {
  deleteUser,
  updateuserById,
  getUserById,
  getAllUsers,
  createUser,
} = require("../Controllers/UserController.js");

const router = express.router();

// atuh routes 
router.post("/login",login);
router.post("/signup",signup);

// usser routes 

router.get("/", getAllUsers);
router.get("/:id", getUserById);
router.delet("/:id", deleteUser);
router.put("/:id", updateuserById);
router.post("/", createUser);

module.exports = router;

