import React from 'react'
import styles from "./UserProfilePage.module.css";
import UserTopBanner from "../../Components/UserProfileComponents/UserTopBanner/UserTopBanner";
import UserSeting from '../../Components/UserProfileComponents/UserSetings/UserSeting';



function UserProfilePage() {
  return (
    <div className={styles.UserProfilePage}>
        <UserTopBanner/> <UserSeting/>
    </div>
  )
}

export default UserProfilePage
