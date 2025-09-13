import React from 'react';
import styles from "./UserTopBanner.module.css";
import { users } from "../../../Files/User"; // Make sure the correct path is used
import {TbEdit} from "../../../assets/Icons";


function UserTopBanner() {
  const user = users[0]; // Assuming you want to display the first user

  return (
    <div className={styles.UserTopBanner}>
      <div className={styles.banner}>
        <button className={styles.editButton}><TbEdit/></button>
        <img src={user.profileBanner} alt="Profile Banner" className={styles.bannerImage} />
      </div>
      <img src={user.profilePhoto} alt="Profile" className={styles.profilePhoto} />
      <div className={styles.profileInfo}>
        <h1>{user.name}</h1>
        <p>{user.description}</p>
        <p><strong>Email:</strong> {user.email}</p>
        <p><strong>Gender:</strong> {user.gender}</p>
        <p><strong>Date of Birth:</strong> {user.dateOfBirth}</p>
        <p><strong>Phone:</strong> {user.phone}</p>
        
      </div>
      {/*
      <div className={styles.orders}>
        <h2>Orders</h2>
        {user.orders.map(order => (
          <div key={order.orderId} className={styles.orderCard}>
            <p><strong>Order ID:</strong> {order.orderId}</p>
            <p><strong>Date:</strong> {order.date}</p>
            <p><strong>Total Amount:</strong> ₹{order.totalAmount}</p>
            <p><strong>Status:</strong> {order.status}</p>
          </div>
        ))}
      </div> */}
    </div>
  );
}

export default UserTopBanner;
