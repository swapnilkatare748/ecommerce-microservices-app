import React, { useState } from "react";
import { useParams, useNavigate } from "react-router-dom"; // Import useNavigate
import styles from "./ProductDetailPage.module.css";
import {AllProductsData} from "../../Files/Data.js";
import { FaStar } from "react-icons/fa"; // For ratings
import BtnPrimary from "../../Components/buttons/BtnPrimary/BtnPrimary.jsx";
import { useCart } from "../../Context/CartContext";

function ProductDetailPage() {
  const { id } = useParams();
  const navigate = useNavigate(); // Initialize navigation
  const { addToCart } = useCart(); // Get addToCart function from context

  const allProducts = [...AllProductsData];
  const product = allProducts.find((p) => p.id === parseInt(id));
  const [mainImage, setMainImage] = useState(product?.images?.[0] || "");

  if (!product) {
    return <h2 className={styles.notFound}>Product not found</h2>;
  }

  // Handle Add to Cart with navigation and success message
  const handleAddToCart = () => {
    addToCart(product);
    alert("✅ Product added to cart successfully!"); // Show success popup
    navigate("/all-products"); // Redirect to home page
  };

  return (
    <div className={styles.productPage}>
      <div className={styles.productDetails}>
        <div className={styles.imagesContainer}>
          <div className={styles.mainImageContainer}>
            <img src={mainImage} alt={product.name} className={styles.mainImage} />
          </div>

          <div className={styles.imagesContainerThumbnails}>
            {product.images.map((img, index) => (
              <img
                key={index}
                src={img}
                alt={`${product.name} ${index + 1}`}
                className={styles.thumbnail}
                onClick={() => setMainImage(img)}
              />
            ))}
          </div>
        </div>

        <div className={styles.productDetailsinfo}>
          <h1 className={styles.productName}>{product.name}</h1>

          <div className={styles.rating}>
            {[...Array(5)].map((_, i) => (
              <FaStar
                key={i}
                className={
                  i < Math.round(product.rating)
                    ? styles.starFilled
                    : styles.starEmpty
                }
              />
            ))}
            <span className={styles.ratingText}> {product.rating} / 5</span>
          </div>

          <p className={styles.productBrand}>
            <strong>Brand:</strong> {product.brand}
          </p>

          <p className={styles.productPrice}>
            <strong>Price:</strong> ${product.price}
          </p>

          <p className={styles.productStock}>
            <strong>Availability:</strong>{" "}
            {product.stock > 0 ? `In Stock (${product.stock} left)` : "Out of Stock"}
          </p>

          <p className={styles.productDescription}>
            <strong>Description:</strong> {product.description}
          </p>

          <div className={styles.moreInfo}>
            <div className={styles.features}>
              <h3>Features:</h3>
              <ul>
                {product.features.map((feature, index) => (
                  <li key={index}>✅ {feature}</li>
                ))}
              </ul>
            </div>
            <div className={styles.specifications}>
              <h3>Specifications:</h3>
              <ul>
                {Object.entries(product.specifications).map(([key, value]) => (
                  <li key={key}>
                    <strong>{key.toUpperCase()}:</strong> {value}
                  </li>
                ))}
              </ul>
            </div>
          </div>

          {/* Buttons Section */}
          <div className={styles.buttonContainer}>
            <BtnPrimary text="🛒 Add to Cart" onClick={handleAddToCart} />
            <BtnPrimary text="💳 Pay Now" onClick={() => alert("Proceeding to Payment")} />
          </div>
        </div>
      </div>
    </div>
  );
}

export default ProductDetailPage;
