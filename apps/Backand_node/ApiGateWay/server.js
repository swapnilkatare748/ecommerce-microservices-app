const app = require("./Src/app"); // Corrected the file extension

const PORT = process.env.PORT || 8001;  

app.listen(PORT, () => {
  console.log(
    `Ecommars - Server is run on the http://localhost:${PORT}`
  );
});
