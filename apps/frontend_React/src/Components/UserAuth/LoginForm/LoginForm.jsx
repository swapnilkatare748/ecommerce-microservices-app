import React from 'react';
import styles from './LoginForm.module.css';
import APP_CONFIG from "../../../Files/AppData";
import Loginimg from "../../../assets/local pages/loginPage.jpeg";
import { Link, useNavigate } from "react-router-dom";

const LoginForm = () => {
    const navigate = useNavigate();

    const LonginSubmit = (event) => {
        event.preventDefault(); // Prevent page refresh
        navigate('/admin'); // Redirect to admin page
    };

    return (
        <div className={styles.container}>
            <h1 className={styles.companyName}> {APP_CONFIG.APP_NAME} login</h1>
            <div className={styles.subContainer}>
                <div className={styles.heading}>
                    <img src={Loginimg} className={styles.loginimg} alt="Login img" />
                </div>
                <div className={styles.loginBox}>
                    <form onSubmit={LonginSubmit}>  {/* Correct way to handle form submission */}
                        <div className={styles.inputGroup}>
                            <label>Email</label>
                            <input type="email" placeholder="Enter your email" required />
                        </div>
                        <div className={styles.inputGroup}>
                            <label>Password</label>
                            <input type="password" placeholder="Enter your password" required />
                        </div>
                        <button type="submit" className={styles.loginButton}>Login</button>
                    </form>
                    <p className={styles.registerLink}>
                        Don't have an account? <Link to="/signUp" className={styles.signup}>Sign up</Link>
                    </p>
                </div>
            </div>
        </div>
    );
};

export default LoginForm;
