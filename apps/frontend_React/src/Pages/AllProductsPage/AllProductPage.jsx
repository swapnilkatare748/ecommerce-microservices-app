import React from 'react';
import styles from "./AllProductPage.module.css";
import AllProducts from '../../Components/AllProducts/AllProducts';
import AllProductsSmallProducts from '../../Components/AllProducts/AllProductsSmallProducts/AllProductsSmallProducts';

function AllProductPage() {
  return (
    <div className={styles.AllProductPage}>
      
      <AllProductsSmallProducts/>
      
       {/* <AllProducts/> */}
    </div>
  )
}

export default AllProductPage
