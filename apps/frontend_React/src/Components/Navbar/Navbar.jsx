import React, { useState, useEffect } from "react";
import styles from "./Navbar.module.css";
import { Link } from "react-router-dom";
import ThemeToggel from "../ThemeToggle/ThemeToggel.jsx";
import APP_CONFIG from "../../Files/AppData.jsx";
import PrimaryinputFields from "../InputFields/Primaryinputfields/PrimaryinputFields.jsx";
import {FaAngleDown,IoLocationOutline, GiShoppingCart, CgProfile } from "../../assets/Icons.js";
import CartSection from "../CartSection/CartSection.jsx";
import SubNavbar from "./SubNavbar/SubNavbar.jsx";


function Navbar() {
  const [isNavbarActive, setIsNavbarActive] = useState(false);
  const [isThemeActive, setIsThemeActive] = useState(false);
  const [isScrolled, setIsScrolled] = useState(false);

  const toggleNavbar = () => {
    setIsNavbarActive(!isNavbarActive);
  };

  window.onload = () => {
    const element = document.getElementById("ul");
    element.classList.add('slide');
  };
  
  useEffect(() => {
    const handleScroll = () => {
      if (window.scrollY > 50) {
        setIsScrolled(true);
      } else {
        setIsScrolled(false);
      }
    };

    window.addEventListener("scroll", handleScroll);

    // Cleanup the event listener on unmount
    return () => {
      window.removeEventListener("scroll", handleScroll);
    };
  }, []);


  //nav bar animation

  document.addEventListener("DOMContentLoaded", () => {
    const navbar = document.querySelector(".navbar");
    const navbarLinks = document.querySelectorAll(".navbarLink");
  
    // Add the 'active' class on page load
    setTimeout(() => {
      navbar.classList.add("active");
    }, 100); // Delay for smooth animation after page load
  
    // Re-apply the animation on window resize
    window.addEventListener("resize", () => {
      navbar.classList.remove("active");
      navbarLinks.forEach((link) => {
        link.style.transition = "none"; // Remove transition temporarily
      });
  
      setTimeout(() => {
        navbarLinks.forEach((link) => {
          link.style.transition = ""; // Reset transition
        });
        navbar.classList.add("active");
      }, 100); // Re-apply with a slight delay for smoothness
    });
  });
  

  return (
    <>
    <header
      className={`${styles.header} ${
        isNavbarActive ? styles.active : ""
      } ${isScrolled ? styles.scrolled : ""}`}
      
    >
      <div className={styles.container}>
        <h1 className={styles.logo}>
          <a href="#" className="appName">
          {APP_CONFIG.APP_NAME}
          </a>
        </h1>

        <div className={styles.navbarVisible}>
          <ul id="ul">
            
            <li className={styles.PrimaryinputFields}>
              <PrimaryinputFields placeholder="Search for Product,Brands and More.."/>
            </li>
            <li>
              <Link  className={styles.navbarLink}>
                Whats's new <FaAngleDown/>
              </Link>
            </li> 

            <li>
               <Link className={`${styles.navbarLink} flexCenter`}>
                 <IoLocationOutline size={25}/> <small>Pune <br /> MH 12</small>
              </Link>
              </li>
          </ul>
        </div>

        <div className={styles.navbarActions}>
          <select name="language" id="lang" className={styles.languageSelect}>
            <option value="en">En</option>
            <option value="ar">Ar</option>
          </select>          
          <CartSection  />
           <div className="UsrProfile">
               <Link to="profile"> 
               <CgProfile size={30}/>
               </Link>
           </div>
        </div>

        <button
          className={`${styles.navToggleBtn} ${
            isNavbarActive ? styles.active : ""
          }`}
          aria-expanded={isNavbarActive}
          aria-label="Toggle Menu"
          title="Toggle Menu"
          onClick={toggleNavbar}
        >
          <span className={styles.one}></span>
          <span className={styles.two}></span>
          <span className={styles.three}></span>
        </button>
  
        <nav
          className={`${styles.navbar} ${
            isNavbarActive ? styles.active : ""
          }`}
        >
          <ul className={styles.navbarList}>
            <li>
              <a href="/" className={styles.navbarLink}>
                Home
              </a>
            </li>
            <li>
              <a href="/about" className={styles.navbarLink}>
                About
              </a>
            </li>
            <li>
              <a href="/skills" className={styles.navbarLink}>
                Skills
              </a>
            </li>
            <li>
              <a href="/portfolio" className={styles.navbarLink}>
                Portfolio
              </a>
            </li>
            <li>
              <a href="/contact" className={styles.navbarLink}>
                Contact
              </a>
            </li>
          </ul>
        </nav>
      </div>
    </header>
    <SubNavbar/>
    </>
  );
}

export default Navbar;
