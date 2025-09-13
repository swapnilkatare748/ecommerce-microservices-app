import React, { useState, useEffect } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import styles from './AllProductsSmallProducts.module.css';
import { AllProductsData } from "../../../Files/Data.js";
import { FaStar } from "react-icons/fa";

function AllProductsSmallProducts() {
  const navigate = useNavigate();
  const location = useLocation();
  
  // Handle search parameters
  const searchParams = new URLSearchParams(location.search);
  const categoryParam = searchParams.get('category') || '';
  const brandParam = searchParams.get('brand') || '';
  const searchQuery = searchParams.get("search") || "";


  console.log(categoryParam,brandParam,"this is catagary");

  const [filters, setFilters] = useState({ brand: brandParam, category: categoryParam });
  const [currentPage, setCurrentPage] = useState(1);
  const productsPerPage = 8;

  useEffect(() => {
    // Update filters when URL parameters change
    setFilters({ brand: brandParam, category: categoryParam });
    setCurrentPage(1); // Reset to page 1 when filters change
  }, [location.search]); 

  // Filtering logic
  const filteredProducts = AllProductsData.filter((product) => {
    const matchesBrand = !filters.brand || product.brand === filters.brand;
    const matchesCategory = !filters.category || product.category === filters.category;
    const matchesSearch = !searchQuery || product.name.toLowerCase().includes(searchQuery.toLowerCase());
    return matchesBrand && matchesCategory && matchesSearch;
  });

  // Pagination logic
  const totalPages = Math.ceil(filteredProducts.length / productsPerPage);
  const startIndex = (currentPage - 1) * productsPerPage;
  const currentProducts = filteredProducts.slice(startIndex, startIndex + productsPerPage);

  const handleNextPage = () => {
    if (currentPage < totalPages) setCurrentPage(currentPage + 1);
  };

  const handlePrevPage = () => {
    if (currentPage > 1) setCurrentPage(currentPage - 1);
  };

  const handleNavigate = (id) => {
    navigate(`/product/${id}`);
  };

  return (
    <div className={styles.AllProductsSmallProducts}>
      <div className={styles.productsList}>
        {currentProducts.length > 0 ? (
          currentProducts.map((product) => (
            <div
              key={product.id}
              className={styles.product}
              onClick={() => handleNavigate(product.id)}
            >
              <div className={styles.productimages}>
                <img src={product.images?.[0] || "default-image.jpg"} alt={product.name} />
              </div>
              <div className={styles.ProductInfo}>
                <div className={styles.productName}>
                  <h3>{product.name}</h3>
                  <p className={styles.price}>
                    Price: <strong>${product.price}</strong>
                  </p>
                </div>
                <div className={styles.rating}>
                  {[...Array(5)].map((_, i) => (
                    <FaStar
                      key={i}
                      className={i < Math.round(product.rating) ? styles.starFilled : styles.starEmpty}
                    />
                  ))}
                  <span className={styles.ratingText}> {product.rating} / 5</span>
                </div>
                <p className={styles.productDescription}>
                  <strong>Brand: </strong> {product.brand} <br />
                  <strong>Specifications: </strong>
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
                  <br />
                </p>
              </div>
            </div>
          ))
        ) : (
          <p>No products available</p>
        )}
      </div>

      {/* Pagination Controls */}
      <div className={styles.pagination}>
        <button onClick={handlePrevPage} disabled={currentPage === 1}>⬅️</button>
        <span> Page {currentPage} of {totalPages} </span>
        <button onClick={handleNextPage} disabled={currentPage === totalPages}>Next ➡️</button>
      </div>
    </div>
  );
}

export default AllProductsSmallProducts;
