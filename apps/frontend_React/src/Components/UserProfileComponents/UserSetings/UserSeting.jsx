import React from "react";
import { useNavigate } from "react-router-dom";
import styles from "./UserSeting.module.css";
import {
  FaSignInAlt,
  FaUser,
  FaBell,
  FaCreditCard,
  FaShieldAlt,
  FaSignOutAlt,
  FaCog,
} from "react-icons/fa";

function UserSeting() {
  const navigate = useNavigate();

  const handleLogout = () => {
    navigate("/");
  };

  const handleAdminLogin = () => {
    navigate("/login");
  };

  const Seting = [
    {
      id: 1,
      name: "Settings",
      icon: <FaCog />,
    },
    {
      id: 2,
      name: "Profile",
      icon: <FaUser />,
    },
    {
      id: 3,
      name: "Notifications",
      icon: <FaBell />,
    },
    {
      id: 4,
      name: "Payment Methods",
      icon: <FaCreditCard />,
    },
    {
      id: 5,
      name: "Security",
      icon: <FaShieldAlt />,
    },
    {   
        id: 6,
        name: "Logout",
        icon: <FaSignOutAlt />,
        action: handleLogout, 
    },
    {
      id: 7,
      name: "Login As Admin",
      icon: <FaSignInAlt />,
      action: handleAdminLogin,
    },
  ];

  return (
    <div className={styles.UserSeting}>
      {Seting.map((item) => (
        <div key={item.id} className={styles.settingItem}
         onClick={item.action ? item.action : undefined}
        >
          {item.icon} <span>{item.name}</span>
        </div>
      ))}
    </div>
  );
}

export default UserSeting;
