import React from 'react';
import LoginForm from '../../Components/UserAuth/LoginForm/LoginForm';
import styles from "./LoginPage.module.css";


function LoginPage() {
  return (
    <div className={`${styles.LoginPage}`}>
          <LoginForm/>
    </div>
  )
}

export default LoginPage
