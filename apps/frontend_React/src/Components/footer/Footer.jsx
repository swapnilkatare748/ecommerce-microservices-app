import React from "react";
import styles from "./Footer.module.css";
import APP_CONFIG from "../../Files/AppData.jsx";
import {FaLinkedin,FaGithub,FaTwitter,FaFacebookSquare} from "../../assets/Icons.js";
import ThemeToggel from '../ThemeToggle/ThemeToggel.jsx';

function Footer() {
  return (
    <footer className={styles.footer}>
      <div className={styles.footerTop}>
        <div className={styles.footerBrand}>
          <a href="www.linkedin.com/in/swapnil-katare" className={`${styles.logo} appName`}>
            {APP_CONFIG.APP_NAME}
          </a>
          <p className={styles.footerText}>
            A great platform to buy, sell  your prodect's without any
            agent or commissions.
          </p>
          <ul className={styles.socialList}>
          <li>
            <a href="https://my-portfolio-swapnil.vercel.app/" className={styles.socialLink}>
               <FaLinkedin/>
            </a>
          </li>
          <li>
            <a href="https://my-portfolio-swapnil.vercel.app/" className={styles.socialLink}>
             <FaGithub/>
            </a>
          </li>
          <li>
            <a href="www.linkedin.com/in/swapnil-katare" className={styles.socialLink}>
               <FaFacebookSquare/>
            </a>
          </li>
          <li>
            <a href="www.linkedin.com/in/swapnil-katare" className={styles.socialLink}>
            <FaTwitter/>
          
            </a>
          </li>
        </ul>

        </div>

        <ul className={styles.footerList}>
          <li>
            <p className={styles.footerListTitle}>Company</p>
          </li>
          <li>
            <a href="#" className={styles.footerLink}>
           About us
            </a>
          </li>
          <li>
            <a href="#" className={styles.footerLink}>
           Services
            </a>
          </li>
          <li>
            <a href="#" className={styles.footerLink}>
          Pricing
            </a>
          </li>
          <li>
            <a href="#" className={styles.footerLink}>
               Blog
            </a>
          </li>
          <li>
            <a href="#" className={styles.footerLink}>
              Login
            </a>
          </li>
        </ul>

        <ul className={styles.footerList}>
          <li>
            <p className={styles.footerListTitle}>Useful Links</p>
          </li>
          <li>
            <a href="#" className={styles.footerLink}>
              Terms of Services
            </a>
          </li>
          <li>
            <a href="#" className={styles.footerLink}>
              Privacy Policy
            </a>
          </li>
          <li>
            <a href="#" className={styles.footerLink}>
            Listing
            </a>
          </li>
          <li>
            <a href="#" className={styles.footerLink}>
                  Contact
            </a>
          </li>
        </ul>

        <ul className={styles.footerList}>
          <li>
            <p className={styles.footerListTitle}>Contact Details</p>
          </li>
          <li className={styles.footerItem}>
            <ion-icon name="location-outline"></ion-icon>
            <address className={styles.address}>
              C/54 Northwest Freeway, Suite 558, Houston, USA 485
              <br />
              <a href="#" className={styles.addressLink}>
                View on Google map
              </a>
            </address>
          </li>
          <li className={styles.footerItem}>
            <ion-icon name="mail-outline"></ion-icon>
            <a href="mailto:contact@example.com" className={styles.footerLink}>
              contact@example.com
            </a>
          </li>
          <li className={styles.footerItem}>
            <a href="tel:+152534468854" className={styles.footerLink}>
              +91 9637053245
            </a>
          </li>
        </ul>
      </div>
    
      <div className={styles.footerBottom}>
        <p className={styles.copyright}>
          &copy;  {APP_CONFIG.APP_NAME} RealEstate Pvt. <a href="#" className={styles.copyrightLink}>Ltd.</a>
        </p>
          <p className={styles.copyright}>+91 9637053245</p>
          <p className={styles.copyright} >Connect with us : https://my-portfolio-swapnil.vercel.app/</p>
      </div>
    </footer>
  );
}

export default Footer;
