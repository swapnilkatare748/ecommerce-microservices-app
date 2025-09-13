const user = require("../models/userModel.js");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const sendEmail = require("../utils/nodemeailer.js");
const dotenv = require("dotenv");

dotenv.config();

const generateToken = (id) =>{
    return jwt.sign({id},process.env.JWT_SECRET,{expiresIn:"1d"});
};

exports.signup = async (req,res)=>{
    try{
        const {name,email,password} = req.body;

        // check if user already exists 
        let user = await user.findOne({email});
        if(user){
            return res.status(400).json({message:"user already exists"});

        }

        user = new user({
            name,
            email,
            password,
        });

        await user.save();
        const token = generatetoken(user._id);
        
        const emailSent = await sendEmail({
            to:user.email,
            subject:"verify your email",
            text: 'hello ${user.name}, please verify your email by clicking on the link: http://localhost:5000/api/verify/${token}',
            
        });

        if(!emailSent){
            res.status(201).json({message:"user signup sucessfully,but email not sent"});
        };
        res.status(201).json({message:"signup sucessfully chack your email for virification.",
            user:{id : user._id,name : user.name,email : user.email},
        });

    }catch(error){
        res.status(500).json({message:"signup failed",error: error.message});

    }
};

exports.login = async (req,res)=>{

    try{
       const {email,password} = req.body;

       const user = await User.findOne({email});
       if(!user){
        return res.status(400).json({message:"invialid email or password"});
       }
       const isMathch = await bcrypt.compare(password,user.password);
       if(!isMathch){
        return res.status(400).json({message:"invalid email or password"});
       }

       const token = generateToken(user._id);

       res.status(200).json({message:"Login sucessfully!",
        user:{id:user.id,name:user.name,email:user.email}
        ,token,
       });

    }catch(error){
        res.status(500).json({message:"login failed",error: error.message});
    }
};

