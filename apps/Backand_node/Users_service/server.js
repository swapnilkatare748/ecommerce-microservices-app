const app = require("./Src/app"); // Corrected the file extension

const PORT = process.env.PORT || 8001;

app.listen(PORT, () => {
  console.log(`Server is run on customer services the http://localhost:${PORT}`);
});
