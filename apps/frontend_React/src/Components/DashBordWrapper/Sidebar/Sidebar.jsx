import React from 'react';
import { SiBuildkite } from 'react-icons/si';
import { sidebar } from '../../../Files/SidebarData.jsx';
import { FaTimes, FaArrowRight } from "react-icons/fa";
import { Link, useLocation, useNavigate } from 'react-router-dom';
import styles from './Sidebar.module.css'; // ✅ Import CSS module
import APP_CONFIG from "../../../Files/AppData.jsx";
import {userDefolt} from "../../../assets/image.js"
import ThemeToggle from "../../ThemeToggle/ThemeToggel.jsx";

function Sidebar({ show, onClose }) {

// const userTypeRoute = window.localStorage.getItem("userRole");
const userTypeRoute = "admin";
const location = useLocation();
const pathname = location.pathname; // ✅ Define pathname


  const handleBottomClick = () => {
    navigate('/settings'); // ✅ Fixed navigation issue
  };

  return (
    <>
       {show && <div className={styles.sidebarOverlay} onClick={onClose} />}
      
      <aside className={`${styles.sidebar} ${show ? styles.show : ''}`}>
        {/* Top Section */}
        <div className={`flex-center ${styles.top}`}>
          <div className={`flex-center ${styles.logo}`}>
            <div className={`flex-center ${styles.iconWrapper}`}>
              <SiBuildkite />
            </div>
            <span>
              <span className="gradient-text">{APP_CONFIG.APP_NAME}</span>
            </span>
          </div>
          <div className={`flex-center ${styles.iconWrapper} ${styles.cancleBtn}`} onClick={onClose}>
            <FaTimes />
          </div>
        </div>

        {/* Middle Section */}
        <div className={`${styles.middle} no-scrollbar`}>
          <div className={styles.tabContainer}>
            {sidebar.map((list, index) => {
              const isActive = list.activeRoutes?.includes(pathname);
              const updatedRoute = userTypeRoute ? `/${userTypeRoute}/${list.route}` : list.route;

              return (
                <Link
              
                to={updatedRoute}
                className={`flex-center ${styles.tab} ${isActive ? 'active' : ''}`}
                key={index}
              >
                {list.icon}
                <span className={`name  ${isActive ? 'gradient-text' : ''}`}>{list.name}</span>
              </Link>
              );
            })}
          </div>

          {/* Divider Section */}
          {/* <div className={styles.divider}>
            <div className={styles.infoContainer}>
              <div className={styles.top}>
                <h3>Explore Trending Program</h3>
                <div className={styles.divider}></div>
                <div className={styles.middle}>
                  <p className={styles.description}>
                    Discover a wide range of programs tailored for your needs. Stay updated with the latest trends and enhance your skills today!
                  </p>
                </div>
                <div className={styles.bottom}>
                  <button className={`flex-center ${styles.btnExplore} ${styles.exploreBtn}`}>
                    Explore <FaArrowRight />
                  </button>
                </div>
              </div>
            </div>
          </div>   */}
        </div>

        {/* Bottom Section */}
          
         <div className={styles.bottom} onClick={handleBottomClick}>
           <div className={`flex-center ${styles.userContainer}`}>
             <div className={styles.profileAdmin}>
               <img src={userDefolt} alt="User Profile" />
             </div>
             <div className={styles.details}>
               <h4> Swapnil</h4> 
               <small className="muted clamp-1">Frontend Developer</small>
             </div>
            <div className={`flex-center ${styles.toggleContainer}`}>
               <ThemeToggle />
             </div>
          </div>
          </div>
      </aside>
    </>
  );
}

export default Sidebar;



