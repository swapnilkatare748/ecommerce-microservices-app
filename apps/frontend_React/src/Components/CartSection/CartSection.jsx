import React from 'react';
import styles from "./CartSection.module.css";
import { GiShoppingCart } from "../../assets/Icons.js";
import { useNavigate } from 'react-router-dom';
import { useCart } from '../../Context/CartContext'; // Import useCart hook

function CartSection() {
  const navigate = useNavigate();
  const { cart } = useCart(); // Get the cart items

  // Calculate total quantity of items in the cart
  const totalItems = cart.reduce((total, item) => total + item.quantity, 0);

  return (
    <div className={styles.CartSection} onClick={() => navigate("/cart")}>
      <GiShoppingCart size={30} />
      {totalItems > 0 && <span className={styles.cartCount}>{totalItems}</span>} {/* Show count if items exist */}
    </div>
  );
}

export default CartSection;
