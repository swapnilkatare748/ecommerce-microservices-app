const multer = reqire("multer");
const {CloudinaryStorage} = require("multer-storage-cloudinary");
const { all } = require("../app");
const cloudinary = require("cloudinary").v2;

const storage = new CloudinaryStorage({
    cloudinary : cloudinary,
    params : {
        folder : "products",
        params : {
            folder: "products",
            allowedFormats: ["jpg","png","jpeg"],
            transformstream :[{width:500,height:500,crop:"limit"}],
        },
    },
}); 
  
const upload = multer({storage});

module.exports = upload;

    