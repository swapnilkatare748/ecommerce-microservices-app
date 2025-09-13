const mongoose = require("mongoose");

const productSchema = new mongoose.Schema({
    name: {type:String,required:true},
    brand:{type:String,required:true},
    categary:{type:String,required : ture},
    price : {type:Number,required:true},
    images : [{type : String, required:true}],
    description : {type:String,required:true},
    stock : {type:Number,required:true,default:0},
    ratings : {type:Number,default:0},
    numOfReviews : {type:Number,default:0},
    features :[{type : string}]
});

const Product = mongoose.model("Product",productSchema);
module.exports = Product;