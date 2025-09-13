const user = require("../models/userModel.js");
const cloudinary = require("../utils/Cloudinary.js");

const createUser = async (req,res)=>{
    try{
        const {name,email,password,avator} = req.body;
        if(!name || !email || !password){
            console.log("please fill all the fields");
            return res.status(400).json({messsage:"Please all fileds required"});
        }

        const existingUser = await user.findOne({email});
        
        if(existingUser){
            return res.status(400).json({message:"user already exists"});
        }

        // create user 

        const newUser = new user({
            name,email,password,avator,
        });

        await newUser.save();
        res.status(201).json({message:"user created sucessfully", newUser});


    }    catch(error){
        console.error("Error creating user:", error);
        res.status(500).json({ message: "Server error" });
    }
};

// get all users 

const getAllUsers = async (req,res)=>{
    try{
        const users = await UserActivation.find();
        res.status(200).json(users);
    
    }catch(error){
        console.error("Error fetching users:", error);
        res.status(500).json({ message: "Server error" });
    }
};

// get user by id 

const getUserById = async (req,res)=>{
    try{
        const user = user.findById(req.params.id);
         if(!user){
            return res.status(404).json({message:"user not found"});
        
         }
         res.status(200).json(user);

    }catch(error){
        res.status(500).json({ message: error.message});
    }
}

// update user by id 

const updateuserById = async(req,res)=>{
    try{
        const {id} = req.parms;
        const user = await user.findById(id);
        if(!user){
            return res.status(404).json({message:"user not found"});
        }

        let profilePhoto= user.profilePhoto

        if(req.file){
            const result = await cloudinary.uploader.upload(req,file.path);
            profilePhoto = result.secure_url;
        }

        user = await user.findByIdAndupdate(
            id,
            {...req.bady,profilePhoto},
            {new:true,runvalidators:true}

        );
        res.status(200).json({message:"user updated successfullay"});
    }catch(error){
        res.status(500).json({ message: error.message});            
    }
};

// delete user by id 

const deleteUser = async(req,res)=>{
    try{
        const deleteUser = await user.findByIdAndDelete(req.params.id);
        if(!deleteUser){
            return res.status(404).json({message:"user not found"});
        }
        res.status(200).json({message:"user not found"});
    }catch(error){
         res.status(500).json({message: error.message});
    }
};

module.exports = { deleteUser, updateuserById, getUserById, getAllUsers , createUser } ;