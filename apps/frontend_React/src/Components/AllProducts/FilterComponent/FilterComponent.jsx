import React, { useState } from "react";
import styles from "./FilterComponent.module.css";

function FilterComponent({ onFilterChange }) {
  const [brand, setBrand] = useState("");
  const [priceRange, setPriceRange] = useState("");
  const [rating, setRating] = useState("");

  const handleFilterChange = () => {
    onFilterChange({ brand, priceRange, rating });
  };

  return (
    <div className={styles.FilterComponent}>
      <h2>Filter Products</h2>

      {/* Brand Filter */}
      <label>Brand:</label>
      <select value={brand} onChange={(e) => setBrand(e.target.value)} onBlur={handleFilterChange}>
        <option value="">All</option>
        <option value="Apple">Apple</option>
        <option value="Samsung">Samsung</option>
        <option value="Dell">Dell</option>
        <option value="HP">HP</option>
      </select>

      {/* Price Range Filter */}
      <label>Price Range:</label>
      <select value={priceRange} onChange={(e) => setPriceRange(e.target.value)} onBlur={handleFilterChange}>
        <option value="">All</option>
        <option value="0-500">$0 - $500</option>
        <option value="500-1000">$500 - $1000</option>
        <option value="1000-2000">$1000 - $2000</option>
      </select>

      {/* Rating Filter */}
      <label>Minimum Rating:</label>
      <select value={rating} onChange={(e) => setRating(e.target.value)} onBlur={handleFilterChange}>
        <option value="">All</option>
        <option value="1">1 ⭐ & Up</option>
        <option value="2">2 ⭐ & Up</option>
        <option value="3">3 ⭐ & Up</option>
        <option value="4">4 ⭐ & Up</option>
      </select>

      <button onClick={handleFilterChange}>Apply Filters</button>
    </div>
  );
}

export default FilterComponent;
