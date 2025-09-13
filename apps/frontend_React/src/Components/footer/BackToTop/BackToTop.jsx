import React from "react";
import styles from "../BackToTop/BackToTop.module.css";
import BtnSecondary from "../../../Components/buttons/btnSecondary/btnSecondary";
import {Link} from "react-router-dom";

function BackToTop() {
  return (
    <div className={styles.BackToTop}>

      <div className={styles.newCustomer}>
           <h2>See personalized recommendations</h2>
           <BtnSecondary color="var(--gold)" text="Sign In" />
           <br /> <small> New Customer start her <Link to="/signUp" className={styles.clickme}>Click me</Link></small>
           </div>
    </div>
  );
}

export default BackToTop;
