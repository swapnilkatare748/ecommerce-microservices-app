const  Product = require("../models/productmodles.js");

const cloudinary = require("../utils/cloudinary.js");

const addProduct = async (req, res) => {
    try {
        const images = [];

        if(req.files && req.files.length > 0){
            for(const file of teq.files){
                images.push(file.path);
            }
        }
    

    const product = new Product({
      ...req.body,
        images,
    });

    await product.save();
    res.status(201).json({message : "porduct added sucessfully",product});
     
}
catch(error){
    res.status(500).json({message : error.message});
}
};


const getAllProducts = async (req,res)=>{
    try{
        const products = await Product.find();
        res.status(200).json(products);
    }catch(error){
        res.status(500).json({message : error.message});
    }
};

const getProductById = async(req,res)=>{
    try{
        const product = await Product.findById(req.params.id);
        if(!product){
            return res.status(404).json({message:"product not found"});
        }
        res.status(200).json(product);
    }catch(error){
        res.status(500).json({message : error.message});
    }       
        
};

const updateProductById = async(req,res)=>{
    try{
        const {id} = req.params;
        let product = await Product.findById(id);
        if(!product){
            return res.status(404).json({message:"product not found"});
        }
        let images = product.images;
        if(req,files && req.files.length > 0){
            images = [];
            for (const file of req.files){
                const result = await cloudinary.uploader.upload(file.path);
                images.push(result.secure_url);
            }
        }
        product = await Product.findByIdAndUpdate(
            id,
            {...req.body, images},
            {new:true}
        );
        res.status(200).json({message:"product updated sucessfully", product});

    }catch(error){
        
        res.status(500).json({message : error.message});

    }
};

const deleteProduct = async(req,res)=>{
    try{
        const product = await Product.findByIdAndUpdate(req.params.id);
        if(!product){
            res.status(404).json({message:"product deleted sucessfully"});
        }
    }
        catch(error){
            res.status(500).json({error :error.message});
        }
 };

 module.exports = { addProduct, getAllProducts, getProductById, updateProductById, deleteProduct };
