import React from "react";
import Slider from "react-slick";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import ProductCard from "../ProductCard/ProductCard";
import styles from "./ProductList.module.css";

function ProductList({ products }) {
  const settings = {
    dots: false,
    infinite: true,
    speed: 500,
    slidesToShow: 4, // Show 4 products at a time
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 3000,
    arrows: false, // Disabled arrows
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 3,
        },
      },
      {
        breakpoint: 768,
        settings: {
          slidesToShow: 2,
        },
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
        },
      },
    ],
  };

  return (
    <div className={styles.productList}>
      <Slider {...settings}>
        {products.length > 0 ? (
          products.map((product) => (
            <div key={product.id}>
              <ProductCard product={product} />
            </div>
          ))
        ) : (
          <p className={styles.noProducts}>No products available</p>
        )}
      </Slider>
    </div>
  );
}

export default ProductList;
