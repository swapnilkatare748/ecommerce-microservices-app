import React, { useState, useEffect } from "react";
import styles from "./HomePage.module.css";
import HeroHome from "../../Components/HomeComponents/HeroHome/HeroHome";
import FligntlmageBanner from "../../Components/HomeComponents/FliteBanner/FilterBanner.jsx";
import ProductList from "../../Components/HomeComponents/ProductList/ProductList.jsx";
import {MobileProducts, LaptopProducts} from "../../Files/Data.js"; // Ensure this file contains product data
import { images } from "../../assets/image.js";
import OfferBanner from "../../Components/HomeComponents/OffersBannerContainer/OfferBanner.jsx";
import BackToTop from "../../Components/footer/BackToTop/BackToTop.jsx";


function HomePage() {

  return (
    <div className={styles.HomePage}>
      <HeroHome />
       <OfferBanner images={images}/>
      <ProductList products={MobileProducts} />
      <FligntlmageBanner />
      <ProductList products={LaptopProducts} />
      <BackToTop/>
    </div>
  );
}

export default HomePage;
