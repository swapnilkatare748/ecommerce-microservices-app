import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import styles from "./PrimaryinputFields.module.css";
import { CiSearch } from "../../../assets/Icons";

function PrimaryinputFields({ placeholder }) {
  const [searchQuery, setSearchQuery] = useState("");
  const navigate = useNavigate();

  const handleSearch = (event) => {
    event.preventDefault(); // ✅ Prevents page reload
    if (searchQuery.trim()) {
      navigate(`/all-products?search=${encodeURIComponent(searchQuery)}`);
    }
  };

  return (
    <form onSubmit={handleSearch} className={styles.PrimaryinputFields}> {/* ✅ Wrapped in <form> */}
      <select name="Category" className={styles.selectCategory}>
        <option value="all">All</option>
        <option value="mobiles">Mobiles</option>
        <option value="laptop">Laptop</option>
      </select>
      <input
        type="text"
        className={styles.inputFields}
        value={searchQuery}
        onChange={(e) => setSearchQuery(e.target.value)}
        placeholder={placeholder} // ✅ Uses props correctly
      />
      <button type="submit" className={styles.SearchButton}> {/* ✅ Correct button type */}
        <CiSearch size={20} />
      </button>
    </form>
  );
}

export default PrimaryinputFields;
