import React, { useState } from "react";
import styles from "./SubNavbar.module.css";
import { Link, useNavigate } from "react-router-dom";
import { HiOutlineMenuAlt1 } from "react-icons/hi"; // Corrected import path

const navItems = [
  // { name: "All Products", path: "/all-products" },
  // { name: "Fresh", path: "/fresh" },
  {
    name: "mobiles",
    path: "/mobiles",
    subRoutes: [
      { name: "Apple", path: "/apple" },
      { name: "Samsung ", path: "/samsung " },
      { name: "Google", path: "/Google" },
      { name: "OnePlus", path: "/OnePlus" },
    ],
  },
  {
    name: "Laptops",
    path: "/laptops",
    subRoutes: [
      { name: "Apple (MacBook)", path: "/laptops/apple" },
      { name: "Dell", path: "/laptops/dell" },
      { name: "HP", path: "/laptops/hp" },
      { name: "Lenovo", path: "/laptops/lenovo" },
      { name: "Asus", path: "/laptops/asus" },
      { name: "Acer", path: "/laptops/acer" },
    ],
  },
  {
    name: "Tablets",
    path: "/tablets",
    subRoutes: [
      { name: "Apple (iPad)", path: "/tablets/apple" },
      { name: "Samsung", path: "/tablets/samsung" },
      { name: "Lenovo", path: "/tablets/lenovo" },
      { name: "Microsoft Surface", path: "/tablets/microsoft" },
    ],
  },
  {
    name: "Appliances",
    path: "/appliances",
    subRoutes: [
      { name: "Refrigerators", path: "/appliances/refrigerators" },
      { name: "Samsung", path: "/appliances/washing-machines" },
      { name: "LG", path: "/appliances/air-conditioners" },
      { name: "Microwaves", path: "/appliances/microwaves" },
    ],
  },
  {
    name: "Best Sellers",
    path: "/best-sellers",
    subRoutes: [
      { name: "Product 1", path: "/product1" },
      { name: "Product 2", path: "/product2" },
      { name: "Product 3", path: "/product3" },
    ],
  },
  {
    name: "Pants",
    path: "/pants",
    subRoutes: [
      { name: "Gince", path: "/pants/gince" },
      { name: "Silky", path: "/pants/silky" },
      { name: "Ladies", path: "/pants/ladies" },
    ],
  },
  { name: "Sell", path: "/sell" },
  { name: "Prime", path: "/prime" },
  { name: "New Releases", path: "/new-releases" },
];

function SubNavbar() {
  const [selectedCategory, setSelectedCategory] = useState("All Products");
  const navigate = useNavigate();

  const handleCategoryClick = (category, subCategory = "") => {
    setSelectedCategory(category);

    let queryParams = new URLSearchParams();

    if (category !== "All Products") {
      queryParams.set("category", category);
      if (subCategory) {
        queryParams.set("brand", subCategory);
      }
    }

    // If "All Products" is clicked, go to "/all-products" without filters
    navigate(
      category === "All Products"
        ? "/all-products"
        : `/all-products?${queryParams.toString()}`
    );
  };

  return (
    <div className={styles.SubNavbar}>
      <div className={styles.primaryNavSection}>
        <ul>
          <li className={styles.navbarLink}>
            <HiOutlineMenuAlt1 size={24} />
          </li>

          <Link
            to="/all-products"
            onClick={() => handleCategoryClick("All Products")}
          >
            All Products
          </Link>

          {navItems.map((navitems, index) => (
            <li key={index} className={styles.navbarLink}>
              <Link
                to={`/all-products?category=${navitems.name}`}
                onClick={() => handleCategoryClick(navitems.name)}
              >
                {navitems.name}
              </Link>
              {/* Check if subRoutes exist before mapping */}
              {navitems.subRoutes && (
                <ul className={styles.sliderMenu}>
                  {navitems.subRoutes.map((subItem, subIndex) => (
                    <li
                      key={subIndex}
                      onClick={() =>
                        handleCategoryClick(navitems.name, subItem.name)
                      }
                    >
                      <Link
                        to={`/all-products?category=${navitems.name}&brand=${subItem.name}`}
                      >
                        {subItem.name}
                      </Link>
                    </li>
                  ))}
                </ul>
              )}
            </li>
          ))}
        </ul>
      </div>
      <div className={styles.OfferSection}>Best of 60%</div>
    </div>
  );
}

export default SubNavbar;
