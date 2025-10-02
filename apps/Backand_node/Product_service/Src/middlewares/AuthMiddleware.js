const jwt = require("jsonwebtoken");

const authMiddleware = (req, res, next) => {
  try {
    const authHeader = req.headers["authorization"];

    if (!authHeader) {
      return res.status(401).json({ message: "Authorization header missing" });
    }

    const token = authHeader.split(" ")[1]; // ✅ correct split

    if (!token) {
      return res
        .status(401)
        .json({ message: "Token missing, authorization denied" });
    }

    const decoded = jwt.verify(token, process.env.jwt_secret);

    req.user = decoded;
    next();            // allow request to continue
  } catch (error) {
    return res
      .status(401)
      .json({ message: "Invalid or expired token", error: error.message });
  }
};


module.exports = authMiddleware; 