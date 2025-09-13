const app = require("./Src/app"); 

const PORT = process.env.PORT || 8001;

app.listen(PORT, () => {
  console.log(` shppping service is run on the http://localhost:${PORT}`);
});
