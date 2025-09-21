import { UserService_Url } from "../constent";
import axios from "axios";

export const signup = async (data) => {
    try{
        const response = await axiios.post(`${UserService_Url}/signup`,data);
        return response.data;
    }catch(error){
        throw error.response?.data?.maessage || "failed to signup.";
    }
};

// function to get all exam 

export const login = async(data)=>{
    try{
        const response = await axios.post(`${UserService_Url}/login`,data);
        return response.data;

    }catch(error){
        throw error.response?.data?.maessage || "filed to login ." ;
    }
}


// user routes 

export const getAllUsers = async()=>{
    try{
        const response = await axios.get(`${UserService_Url}`);
        return response.data;
    }catch(error){
        throw error.response?.data?.maessage || "faoiled to featch users.";

    }
}

export const getUserById = async(id)=>{
    try{
        const response = await axios.get(`${UserService_Url}/${id}`);
        return response.data;
    }catch(error){
        throw error.response?.data?.maessage || "faoiled to featch user.";
    }
};

export const updateUser = async(id,data)=>{
    try {
        const response = await axios.get(`${userService_Url}/${id}`,data);
        return response.data;
    }catch(error){
        throw error.response?.data?.maessage || "faoiled to update user.";
    }
};
export const deleteUser = async(id)=>{
    try{
            const response = await axios.delete(`${UserService_Url}/${id}`);
            return response.data;
    }catch{
        const error = new Error("faoiled to delete user.");
        error.response = {data:{maessage:"faoiled to delete user."}};
        throw error;
    }
};

export const changePassword = async(id,data)=>{
    try{
        const response = await axios.post(`${UserService_Url}/change-password/${id}`,data);
        return response.data;
    }catch(error){
        throw error.response?.data?.maessage || "faoiled to change password.";      
    }
}

