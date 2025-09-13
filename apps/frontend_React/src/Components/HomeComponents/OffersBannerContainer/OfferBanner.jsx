import React from 'react';
import styles from './OfferBanner.module.css';

function OfferBanner({ images }) {
  return (
    <div className={styles.banner}>
      {images.map((image, index) => (
        <img key={index} src={image} alt={`Offer ${index + 1}`} className={styles.image} />
      ))}
    </div>
  );
}

export default OfferBanner;