import img1 from "../assets/local pages/Profile.jpeg";
import userDefolt from "../assets/local pages/User_defolt.webp";

export const users = [
  {
    id: 1,
    name: "Swapnil Katare",
    email: "swapnil@example.com",
    gender: "Male",
    profilePhoto: userDefolt ?? "https://example.com/profile1.jpg",
    profileBanner: img1 ?? "https://example.com/profile1.jpg",
    dateOfBirth: "2000-05-15",
    phone: "+91 9876543210",
    shippingAddress: {
      street: "123 Main Street",
      city: "Pune",
      state: "Maharashtra",
      postalCode: "411001",
      country: "India",
    },
    billingAddress: {
      street: "456 Market Road",
      city: "Mumbai",
      state: "Maharashtra",
      postalCode: "400001",
      country: "India",
    },
    userRole: "Customer",
    description:
      "Swapnil Katare is a passionate tech enthusiast and customer of our platform. He enjoys exploring the latest technology trends and shopping for gadgets. With a keen interest in cybersecurity and data science, he ensures his online presence is secure. He has been an active user of our platform since March 2024.",
    createdAt: "2024-03-10T14:23:00Z",
    lastLogin: "2024-09-28T10:45:00Z",
    wishlist: [101, 102, 105],
    cart: [
      { productId: 201, quantity: 2 },
      { productId: 305, quantity: 1 },
    ],
    orders: [
      {
        orderId: "ORD12345",
        date: "2024-08-15",
        totalAmount: 4500,
        status: "Delivered",
      },
    ],
    paymentMethods: [
      {
        type: "Credit Card",
        maskedNumber: "**** **** **** 1234",
        expiry: "12/26",
      },
    ],
    notifications: {
      email: true,
      sms: false,
      push: true,
    },
    socialLogin: {
      google: true,
      facebook: false,
    },
    security: {
      twoFactorAuth: true,
      recoveryEmail: "swapnil.recovery@example.com",
    },
  },
];
