import React from 'react';
import styles from "./SignUPPage.module.css";
import SignupForm from '../../Components/UserAuth/SignUpForm/SignUpForm';
import sigupimg from "../../assets/local pages/signUP.webp";

function SignUPPage() {
  return (
    <div className={styles.SignUPPage}>
         <div className={styles.signUpContainer}>
              <div className={styles.imagcontainer}>
                 <img src={sigupimg} className={styles.imagcontainerimg} alt=" banner img sign up " />
              </div>
              <SignupForm/>
         </div>

    </div>
  )
}

export default SignUPPage
