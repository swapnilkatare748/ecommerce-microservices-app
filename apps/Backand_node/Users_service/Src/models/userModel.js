const mongoose = require("mongoose");

const userSchema = new mongoose.Schema(
  {
    name: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true },

    gender: {
      type: String,
      enum: ["male", "female", "trans", "other"], 
      default: "other",
    },

    role: {
      type: String,
      enum: ["customer", "admin"],
      default: "customer",
    },

    profilePhoto: { type: String, default: "/Public/User_default.webp" },
    profileBanner: { type: String, default: "/Public/User_default.webp" },

    phone: { type: String },
    address: { type: String },

    isVerified: { type: Boolean, default: false },
    birthday: { type: Date },

    shippingAddress: {
      street: { type: String },
      city: { type: String },
      state: { type: String },
      country: { type: String },
      zip: { type: String },
    },

    billingAddress: {
      street: { type: String },
      city: { type: String },
      state: { type: String },
      country: { type: String },
      zip: { type: String },
    },

    cart: [
      {
        productId: { type: mongoose.Schema.Types.ObjectId, ref: "Product" }, 
        quantity: { type: Number, default: 1 },
      },
    ],

    orders: [
      {
        orderId: { type: mongoose.Schema.Types.ObjectId, ref: "Order" }, 
        date: { type: Date, default: Date.now },
        totalAmount: { type: Number },
        status: {
          type: String,
          enum: ["pending", "shipped", "delivered", "cancelled"],
          default: "pending",
        },
      },
    ],

    paymentMethods: [
      {
        cardType: { type: String, enum: ["Credit", "Debit", "UPI", "COD"] },
        cardNumber: { type: String }, 
      },
    ],
  },
  { timestamps: true } 
);

module.exports = mongoose.model("User", userSchema);
