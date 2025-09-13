import React, { useState } from "react";
import { useNavigate,useLocation } from "react-router-dom";
import styles from "./AllProducts.module.css";
import { MobileProducts, LaptopProducts } from "../../Files/Data.js";
import FilterComponent from "./FilterComponent/FilterComponent.jsx";
import { FaStar } from "react-icons/fa"; // For ratings
 import NotFound from "../NotFound/NotFoud.jsx";

function AllProducts() {
  const allProducts = [...MobileProducts, ...LaptopProducts];
  const navigate = useNavigate();
  const location = useLocation();

  // State for filters
  const [filters, setFilters] = useState({ brand: "", priceRange: "", rating: "" });

  // State for pagination
  const [currentPage, setCurrentPage] = useState(1);
  const productsPerPage = 4;

const searchParams = new URLSearchParams(location.search);
const searchQuery = searchParams.get("search") || "";


  // Filter products
  const filteredProducts = allProducts.filter((product) => {
    const matchesBrand = !filters.brand || product.brand === filters.brand;
    const matchesPrice =
      !filters.priceRange ||
      (parseInt(product.price) >= parseInt(filters.priceRange.split("-")[0]) &&
        parseInt(product.price) <= parseInt(filters.priceRange.split("-")[1]));
    const matchesRating = !filters.rating || product.rating >= parseInt(filters.rating);
    const matchesSearch = !searchQuery || product.name.toLowerCase().includes(searchQuery.toLowerCase());

    return matchesBrand && matchesPrice && matchesRating && matchesSearch;
  });


  // Calculate total pages based on filtered products
  const totalPages = Math.ceil(filteredProducts.length / productsPerPage);

  // Get current page products from filteredProducts
  const startIndex = (currentPage - 1) * productsPerPage;
  const currentProducts = filteredProducts.slice(startIndex, startIndex + productsPerPage);

  // Pagination Functions
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
    <div className={styles.AllProducts}>
      <div >
        <FilterComponent onFilterChange={setFilters} />
      </div>

      <div className={styles.productsList}>
        {currentProducts.length > 0 ? (
          currentProducts.map((product) => (
            <div
              key={product.id}
              className={styles.product}
              onClick={() => handleNavigate(product.id)}
            >
              <div className={styles.productimages}>
                <img src={product.images[0]} alt={product.name} />
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
                  <div className={styles.Specifications}>
                    <p><strong>Display: </strong>{product.specifications.display}</p>
                    <p><strong>Battery: </strong>{product.specifications.battery}</p>
                    <p><strong>OS: </strong>{product.specifications.os}</p>
                    <p><strong>RAM: </strong>{product.specifications.ram}</p>
                    <p><strong>Processor: </strong>{product.specifications.processor}</p>
                    <p><strong>Storage: </strong>{product.specifications.storage}</p>
                  </div>
                  <br />
                  <strong>Description:</strong> {product.description} <br />
                </p>
              </div>
            </div>
          ))
        ) : (
          <p>No products available</p>
        )}
        
        {/* Pagination Controls */}
        <div className={styles.pagination}>
          <button onClick={handlePrevPage} disabled={currentPage === 1}>⬅️</button>
          <span> Page {currentPage} of {totalPages} </span>
          <button onClick={handleNextPage} disabled={currentPage === totalPages}>Next ➡️</button>
        </div>
      </div>
    </div>
  );
}

export default AllProducts;
