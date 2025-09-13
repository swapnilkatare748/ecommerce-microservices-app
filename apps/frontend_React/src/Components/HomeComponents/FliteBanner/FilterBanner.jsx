import React from 'react'
import { FlitelmageBanner } from '../../../assets/image';
import styles from "./FilterBanner.module.css";

function FligntlmageBanner() {
  return (
    <div className={styles.FilterBanner}>
      <img src={FlitelmageBanner}  className={styles.FilterBannerimg} alt="flitebanner" />
    </div>
  )
}

export default FligntlmageBanner
