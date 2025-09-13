import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { BiMessageSquareDetail, BiPlus } from 'react-icons/bi';
import { IoNotificationsCircleOutline, IoSearch } from 'react-icons/io5';
import { LuSettings } from 'react-icons/lu';
import { SiBuildkite } from 'react-icons/si';
import { TiThMenu } from 'react-icons/ti';
import { navTabs } from '../../../Files/SidebarData.jsx';
import { Link, useLocation } from 'react-router-dom';
import styles from './Navbar.module.css'; // ✅ Import CSS module

function Navbar({ onMenuClick, userTypeRoute }) {
  const [searchInputForce, setSearchInputForce] = useState(false);
  const { pathname } = useLocation();
  const navigate = useNavigate();

  return (
    <nav className={styles.navbar}>
      <div className={styles.navRow}>
        <div className={` ${styles.column}`}>
          <div className={`${styles.searchContainer} ${searchInputForce ? styles.active : ''}`}>
            <IoSearch className={styles.icon} />
            <input
              type="text"
              placeholder="Search item..."
              onFocus={() => setSearchInputForce(true)}
              onBlur={() => setSearchInputForce(false)}
            />
          </div>
          <div className="iconWrapper">
            <LuSettings />
          </div>
        </div>
        <div className={` ${styles.column}`}>
          <div  className="iconWrapper" >
            <BiMessageSquareDetail />
          </div>
          <div className="iconWrapper">
            <IoNotificationsCircleOutline />
          </div>
          <div className={styles.addBtn} onClick={() => navigate(`/${userTypeRoute}/add-property`)}>
            <BiPlus />
            Add Product
          </div>
          <div className="iconWrapper" onClick={onMenuClick}>
            <TiThMenu />
          </div>
        </div>
      </div>
      <div className={styles.navRow}>
        <div className={styles.tabsContainer}>
          {navTabs.map((tab, index) => {
            const updatedRoute = userTypeRoute ? `/${userTypeRoute}/${tab.route}` : tab.route;
            return (
              <Link
                to={updatedRoute}
                className={`${styles.tab} ${tab.activeRoutes.includes(pathname) ? styles.active : ''}`}
                key={index}
              >
                {tab.name}
              </Link>
            );
          })}
        </div>
      </div>
    </nav>
  );
}

export default Navbar;
