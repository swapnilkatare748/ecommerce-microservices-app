import React from "react";
import styles from "./CartPageCom.module.css";
import { useCart } from "../../Context/CartContext";
import { FaStar } from "react-icons/fa"; // For ratings
import DeleteButton from "../buttons/DeleteButton/DeleteButton";
import BtnPrimary from "../buttons/BtnPrimary/BtnPrimary";

function CartPageCom() {
  const { cart, updateQuantity, removeFromCart } = useCart();

  const totalPrice = cart.reduce(
    (sum, item) => sum + item.price * item.quantity,
    0
  );

  return (
    <div className={styles.cartPage}>
      <div className={styles.productSection}>
        <h1 className={styles.heading}>Shopping Cart 🛒</h1>

        {cart.length === 0 ? (
          <p className={styles.emptyCart}>Your cart is empty.</p>
        ) : (
          cart.map((item) => (
            <div key={item.id} className={styles.cartItem}>
              <img
                src={item.images[0]}
                alt={item.name}
                className={styles.productImage}
              />
              <div className={styles.itemDetails}>
                <div className={styles.productName}>
                  <h3>{item.name}</h3>{" "}
                  <p className={styles.price}>
                    Price: <strong>${item.price}</strong>
                  </p>
                </div>
                <div className={styles.rating}>
                  {[...Array(5)].map((_, i) => (
                    <FaStar
                      key={i}
                      className={
                        i < Math.round(item.rating)
                          ? styles.starFilled
                          : styles.starEmpty
                      }
                    />
                  ))}
                  <span className={styles.ratingText}> {item.rating} / 5</span>
                </div>
                <p className={styles.productDescription}>
                  <strong>Description:</strong> {item.description}
                </p>

                 <div className={styles.buttonsSection}>
                 <div className={styles.quantityControl}>
                  <button
                    onClick={() => updateQuantity(item.id, item.quantity - 1)}
                    disabled={item.quantity <= 1}
                  >
                    ➖
                  </button>
                  <span>{item.quantity}</span>
                  <button
                    onClick={() => updateQuantity(item.id, item.quantity + 1)}
                  >
                    ➕
                  </button>
                </div>
                <DeleteButton
                  text="Remove"
                  className={styles.removeButton}
                  onClick={() => removeFromCart(item.id)}
                />
                 </div>
              </div>
            </div>
          ))
        )}
      </div>

      {/* Summary Section */}
      <div className={styles.summarySection}>
        <h3>Cart Summary</h3>
        <p>
          Total Items: <strong>{cart.length}</strong>
        </p>
        <p>
          Total Price: <strong>${totalPrice.toFixed(2)}</strong>
        </p>
    
        <button text="Checkout"  className={styles.checkoutButton} onClick={() => alert("Proceeding to Checkout")} > Procced to Buy </button>
      </div>
    </div>
  );
}

export default CartPageCom;
