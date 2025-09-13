const jwt = require('jsonwebtoken');

module.exports = req.res,next =>{
    const token = req.header("Authorization");

    if(!token){
        return res.status(401).json({message:"no token,authorization denied"});
    }

    try{
        const decoded = jwt.verify(token,process.env,jwt_SECRET);
        req.user = decoded;
        next();

    }catch(error){
         res.status(404).json({message: 'invalid token'});
    }
};