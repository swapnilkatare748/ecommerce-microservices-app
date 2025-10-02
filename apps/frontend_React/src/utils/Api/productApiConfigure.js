import { ProductService_Url } from "../constent";
import axios from "axios";

export const createProduct = async (data) => {
    try{
        const response = await axios.post(`${ProductService_Url}/create`,data);
         return response.data;
    }catch(error){
        throw error.response?.data?.message || "failed to create product.";
    }   
};

// function to get all products 
export const getAlLProducts = async()=>{
    try{
        const response = await axios.get(`${ProductService_Url}`);
        return response.data;

    }catch(error){
        throw error.response?.data?.message || "failed to fetch products.";
    }
};

// function to get product by id
export const getProductById = async(id)=>{
     try{
        const response = await axios.get(`${ProductService_Url}/${id}`);
        return response.data
     }catch(error){
        throw error.response?.data?.message || "failed to fetch product.";
     }
};


// function to usdate the product 
export const updateProduct = async(id,data)=>{
    try{
        const response = await axios.put(`${ProductService_Url}/${id}`,data);
        return response.data;
    }catch(error){
        throw error.response?.data?.message || "failed to update product.";
    }
};

//function to delete the product 
export const deleteProduct = async(id)=>{
    try{
        const response = await axios.delete(`${ProductService_Url}/${id}`);
        return response.data;
    }catch(error){
        throw error.response?.data?.message || "failed to delete product.";
    }
};

// filter products by category
