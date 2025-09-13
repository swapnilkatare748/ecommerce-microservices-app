import React, { useState } from "react";
import styles from "./SignupForm.module.css"; // Importing modular CSS
import APP_CONFIG from "../../../Files/AppData";

const SignupForm = () => {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    password: "",
    confirmPassword: "",
  });

  const [errors, setErrors] = useState({});
  const [submitted, setSubmitted] = useState(false);

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const validateForm = () => {
    let newErrors = {};
    if (!formData.name.trim()) newErrors.name = "Name is required";
    if (!formData.email.match(/^[^\s@]+@[^\s@]+\.[^\s@]+$/))
      newErrors.email = "Enter a valid email";
    if (formData.password.length < 6)
      newErrors.password = "Password must be at least 6 characters";
    if (formData.password !== formData.confirmPassword)
      newErrors.confirmPassword = "Passwords do not match";
    
    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (validateForm()) {
      setSubmitted(true);
      console.log("User Data:", formData);
    }
  };

  return (
    <div className={styles.signupContainer}>
      <h2 className={styles.heading}>Welcome To {APP_CONFIG.APP_NAME} </h2>
      {submitted && <p className={styles.success}>Signup Successful!</p>}
      
      <form onSubmit={handleSubmit} className={styles.form}>
        <div className={styles.formGroup}>
          <label className={styles.label}>Name:</label>
          <input
            type="text"
            name="name"
            placeholder="name"
            className={styles.input}
            value={formData.name}
            onChange={handleChange}
          />
          {errors.name && <p className={styles.error}>{errors.name}</p>}
        </div>

        <div className={styles.formGroup}>
          <label className={styles.label}>Email:</label>
          <input
            type="email"
            name="email"
            placeholder="email"
            className={styles.input}
            value={formData.email}
            onChange={handleChange}
          />
          {errors.email && <p className={styles.error}>{errors.email}</p>}
        </div>

        <div className={styles.formGroup}>
          <label className={styles.label}>Password:</label>
          <input
            type="password"
            name="password"
            placeholder="Password"
            className={styles.input}
            value={formData.password}
            onChange={handleChange}
          />
          {errors.password && <p className={styles.error}>{errors.password}</p>}
        </div>

        <div className={styles.formGroup}>
          <label className={styles.label}>Confirm Password:</label>
          <input
            type="password"
            name="confirmPassword"
            placeholder="Confirm Password"
            className={styles.input}
            value={formData.confirmPassword}
            onChange={handleChange}
          />
          {errors.confirmPassword && <p className={styles.error}>{errors.confirmPassword}</p>}
        </div>

        <button type="submit" className={styles.button}>Sign Up</button>
      </form>
    </div>
  );
};

export default SignupForm;
