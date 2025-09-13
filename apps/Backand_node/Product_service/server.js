const app = require("./Src/app"); // Corrected the file extension

const PORT = process.env.PORT || 8001;

app.listen(PORT, () => {
  console.log(`Server is run product service on the http://localhost:${PORT}`);
});
