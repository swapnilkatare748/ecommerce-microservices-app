import React from "react";
import Slider from "react-slick";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import styles from "./HeroHome.module.css";
import { FaArrowLeft, FaArrowRight } from "react-icons/fa"; // Import icons for custom arrows
import {Hero1,Hero2,Hero3,Hero4,Hero5} from "../../../assets/image.js";


// Custom Previous Arrow Component
const PrevArrow = ({ onClick }) => (
  <div className={`${styles.arrow} ${styles.prev}`} onClick={onClick}>
    <FaArrowLeft />
  </div>
);

// Custom Next Arrow Component
const NextArrow = ({ onClick }) => (
  <div className={`${styles.arrow} ${styles.next}`} onClick={onClick}>
    <FaArrowRight />
  </div>
);

function HeroHome() {
  const settings = {
    dots: true,
    infinite: true,
    speed: 500,
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 3000,
    arrows: true,
    prevArrow: <PrevArrow />,
    nextArrow: <NextArrow />,
  };

  return (
    <div className={styles.HeroHome}>
      <Slider {...settings}>
        <div>
          <img src={Hero1} alt="Banner 1" className={styles.slideImage} />
        </div>
        <div>
          <img src={Hero2} alt="Banner 2" className={styles.slideImage} />
        </div>
        <div>
          <img src={Hero3} alt="Banner 3" className={styles.slideImage} />
        </div>
        <div>
          <img src={Hero4} alt="Banner 3" className={styles.slideImage} />
        </div>
        <div>
          <img src={Hero5} alt="Banner 3" className={styles.slideImage} />
        </div>
      </Slider>
    </div>
  );
}

export default HeroHome;
