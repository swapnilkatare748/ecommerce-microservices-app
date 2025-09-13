import React from 'react'
import styles from "./CartPage.module.css";
import CartPageCom from '../../Components/CartPageCom/CartPageCom';


function CartPage() {
  return (
    <div className={styles.CartPage}> 
      <CartPageCom/>
    </div>
  )
}

export default CartPage
