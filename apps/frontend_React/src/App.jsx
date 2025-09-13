import React from 'react'
import './App.css';
import { BrowserRouter , Routes, Route, Link,useLocation } from 'react-router-dom';
import HomePage from "./Pages/HomePage/HomePage";
import Error from './Pages/ErrorPage/Error';
import Navbar from "./Components/Navbar/Navbar";
import Footer from "./Components/Footer/Footer";
import ProductDetailPage from './Pages/ProductDetailPage/ProductDetailPage';
import CartPage from './Pages/CartPage/CartPage';
import { CartProvider } from "./Context/CartContext.jsx"; // Import the CartProvider
import AllProductPage from './Pages/AllProductsPage/AllProductPage.jsx';
import LoginPage from './Pages/LoginPage/LoginPage.jsx';
import SignUPPage from './Pages/SignUPPage/SignUPPage.jsx';
import UserProfilePage from './Pages/UserProfilePage/UserProfilePage.jsx';
import AdminPannel from './Pages/AdminPannel/AdminPannel.jsx';


// const ProtectedRoute = ({ children, allowedRoles }) => {
//   const isLoggedIn = localStorage.getItem("loggedIn") === "true";
//   const userType = localStorage.getItem("userRole");

//   console.log("ProtectedRoute - LoggedIn:", isLoggedIn);
//   console.log("ProtectedRoute - UserType:", userType);
//   console.log("Allowed Roles:", allowedRoles); // Check allowedRoles array

//   // Check if user is logged in
//   if (!isLoggedIn) {
//     return <Navigate to="/login" replace />;
//   }
//   return children;
// };

const Layout = ({ children }) => {
  const location = useLocation();
  const hideNavFooter = location.pathname.startsWith('/admin'); // Hide on "/admin"

  return (
    <div className='App'>
      <CartProvider>
        {!hideNavFooter && <Navbar />}
        {children}
        {!hideNavFooter && <Footer />}
      </CartProvider>
    </div>
  );
};


function App() {
  return (
    <div className='App'>
     
      <CartProvider>
      <Layout>
       <Routes>        
          <Route path='/' element={<HomePage/>}/>
          <Route path='*' element={<Error/>}/>
          <Route path="/product/:id" element={<ProductDetailPage />} />
          <Route path='/cart' element={<CartPage/>}/>
          <Route path="/all-products" element={<AllProductPage/>} />
          <Route path='/login' element={<LoginPage/>}/>
          <Route path='/signUp' element={<SignUPPage/>}/>
          <Route path="/profile" element={<UserProfilePage/>}/>
          <Route path='/admin' element={<AdminPannel/>}/>
         </Routes>
        </Layout>
       </CartProvider>
    </div>
  )
}

export default App

 {/*        
             <Route
          path="/exam"
          element={
            <ProtectedRoute allowedRoles={["User"]}>
              <ExamDashbord/>
            </ProtectedRoute>
          }
        >
          <Route index element={<ExamPanel />} />
          <Route path='dashboard' element={<ExamPanel />} />

          <Route path="/exam/:section/:page" element={<Homepage />} />
          <Route path='settings' element={<Setting/>}/>

           </Route> */}

