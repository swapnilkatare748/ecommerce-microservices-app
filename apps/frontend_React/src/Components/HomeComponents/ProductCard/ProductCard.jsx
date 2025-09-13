import React from "react";
import { Link, useNavigate } from "react-router-dom";
import styles from "./ProductCard.module.css";
import { FaStar } from "react-icons/fa"; // For ratings

function ProductCard({ product }) {
  const navigate = useNavigate(); // Corrected variable name

  const handleCardClick = (event) => {
    // Prevents triggering navigation when clicking the Link
    if (!event.target.closest("a")) {
      navigate(`/product/${product.id}`); // Fixed function call
    }
  };

  return (
    <div className={styles.card} onClick={handleCardClick}>
      <div className={styles.imageContainer}>
        <img 
          src={product.images[0]} 
          alt={product.name} 
          className={styles.image} 
        />
      </div>
      <div className={styles.details}>
        <h2 className={styles.productName}>{product.name}</h2>
        <p className={styles.productBrand}>{product.brand}</p>

        <div className={styles.rating}>
          {[...Array(5)].map((_, i) => (
            <FaStar 
              key={i} 
              className={i < Math.round(product.rating) ? styles.starFilled : styles.starEmpty} 
            />
          ))}
          <span className={styles.ratingText}> {product.rating} / 5</span>
        </div>
        <p className={styles.price}>${product.price}</p>
        <p className={styles.stock}>
          {product.stock > 0 ? `In Stock (${product.stock} left)` : "Out of Stock"}
        </p>
        <Link to={`/product/${product.id}`} className={styles.detailsButton} onClick={(e) => e.stopPropagation()}>
          View Details
        </Link>
      </div>
    </div>
  );
}

export default ProductCard;
