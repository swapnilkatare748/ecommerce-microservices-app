const User = require("../models/userModel.js");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const sendEmail = require("../utils/nodemeailer.js");
const dotenv = require("dotenv");

dotenv.config();

const generateToken = (id) => {
  return jwt.sign({ id }, process.env.JWT_SECRET, { expiresIn: "1d" });
};

// SIGNUP
exports.signup = async (req, res) => {
  try {
    const { name, email, password, confirmPassword } = req.body;

    // check if user already exists
    let existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ message: "User already exists" });
    }

    if (password !== confirmPassword) {
      return res.status(400).json({ message: "Passwords do not match" });
    }

    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    let Newuser = new User({
      name,
      email,
      password: hashedPassword,
    });

    await Newuser.save();
    const token = generateToken(Newuser._id);

    const emailSent = await sendEmail({
      to: Newuser.email,
      subject: "Verify your email",
      text: `Hello ${Newuser.name}, please verify your email by clicking on the link: http://localhost:5000/api/verify/${token}`,
    });

    if (!emailSent) {
      return res
        .status(201)
        .json({ message: "User signup successfully, but email not sent" });
    }

    res.status(201).json({
      message: "Signup successfully! Check your email for verification.",
      user: { id: Newuser._id, name: Newuser.name, email: Newuser.email },
      token : token,
    });
  } catch (error) {
    res.status(500).json({ message: "Signup failed", error: error.message });
  }
};

// LOGIN
exports.login = async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });
    if (!user) {
      return res.status(400).json({ message: "Invalid email or password" });
    }

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ message: "Invalid email or password" });
    }

    const token = generateToken(user._id);

    res.status(200).json({
      message: "Login successfully!",
      user: { id: user._id, name: user.name, email: user.email },
      token,
    });
  } catch (error) {
    res.status(500).json({ message: "Login failed", error: error.message });
  }
};
