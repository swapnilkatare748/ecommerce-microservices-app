
const nodemailer = require("nodemailer");
const dotenv = require("dotenv");
const AppName = require("./constants.js");


dotenv.config();

const sendEmail = async ({ to, subject, text }) => {
  try {
    const transporter = nodemailer.createTransport({
      host: process.env.EMAIL_HOST,
      port: process.env.EMAIL_PORT,
      secure: false,
      auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASS,
      },
    });

    const info = await transporter.sendMail({
      from: `"${AppName}" <${process.env.EMAIL_USER}>`,
      to,
      subject,
      text,
      html: `<p>${text}</p>`, 
    });

    console.log("Email sent:", info.messageId);
    return true;
  } catch (error) {
    console.error("Error sending email:", error);
    return false;
  }
};

module.exports = sendEmail;