import { MdSpaceDashboard, MdOutlineReport } from "react-icons/md";
import { FiUsers } from "react-icons/fi";
import { BsBuildings, BsChatSquareQuote } from "react-icons/bs";
import { TbBrandGoogleAnalytics } from "react-icons/tb";
import { VscGitPullRequestNewChanges } from "react-icons/vsc";
import { IoMdNotificationsOutline } from "react-icons/io";
import { IoSettingsOutline } from "react-icons/io5";



export const sidebar = [
    {
      name: "Dashboard",
      route: "dashboard",
      activeRoutes: ["/admin/dashboard", "/user/dashboard"],
      icon: <MdSpaceDashboard />,
    },
    {
      name: "Users",
      route: "profile",
      activeRoutes: ["/profile"],
      icon: <FiUsers />,
    },
    {
      name: "Products",
      route: "Products",
      activeRoutes: ["/admin/products", "/user/products"],
      icon: <BsBuildings />,
    },
    {
      name: "Analytics",
      route: "analytics",
      activeRoutes: ["/admin/analytics"],
      icon: <TbBrandGoogleAnalytics />,
    },
    {
      name: "Inbox",
      route: "inbox",
      activeRoutes: ["/admin/inbox", "/user/inbox"],
      icon: <BsChatSquareQuote />,
    },
    {
      name: "Reports",
      route: "reports",
      activeRoutes: ["/admin/reports"],
      icon: <MdOutlineReport />,
    },
    {
      name: "Requests",
      route: "requests",
      activeRoutes: ["/admin/requests"],
      icon: <VscGitPullRequestNewChanges />,
    },
    {
      name: "Notifications",
      route: "notifications",
      activeRoutes: ["/admin/notifications", "/user/notifications"],
      icon: <IoMdNotificationsOutline />,
    },
    {
      name: "Settings",
      route: "settings",
      activeRoutes: ["/admin/settings"],
      icon: <IoSettingsOutline />,
    },
  ];
  
  export const navTabs = [
      {name:"Overview", route:"/",activeRoutes:['/'],},
      {name:"Profile", route:"profile",activeRoutes:['/Home/profile'],},
      {name:"Settings", route:"settings",activeRoutes:['/Home/settings'],},
      {name:"Productes", route:"properties",activeRoutes:['/Home/properties'],},
  ]