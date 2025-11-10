import React from 'react';
import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import Home from './pages/Home';
import MenuPage from './pages/MenuPage';
import DishDetail from './pages/DishDetail';
import CartPage from './pages/CartPage';
import Checkout from './pages/Checkout';
import Login from './pages/Login';
import { CartProvider } from './context/CartContext';
import { AuthProvider, useAuth } from './context/AuthContext';

export default function App() {
  function Header() {
    const { user, logout } = useAuth();
    return (
      <header className="bg-white dark:bg-gray-800 shadow">
        <div className="container mx-auto p-4 flex justify-between items-center">
          <Link to="/" className="font-bold text-xl">ReactFood</Link>
          <nav className="space-x-4">
            <Link to="/menu">Menu</Link>
            <Link to="/cart">Giỏ hàng</Link>
            {user ? (
              <span className="ml-4 inline-flex items-center space-x-3">
                <span className="text-sm">{user.email}</span>
                <button onClick={logout} className="text-sm text-red-600">Đăng xuất</button>
              </span>
            ) : (
              <Link to="/login">Đăng nhập</Link>
            )}
          </nav>
        </div>
      </header>
    );
  }

  return (
    <BrowserRouter>
      <AuthProvider>
        <CartProvider>
          <Header />

          <main className="container mx-auto p-4">
            <Routes>
              <Route path="/" element={<Home />} />
              <Route path="/menu" element={<MenuPage />} />
              <Route path="/menu/:id" element={<DishDetail />} />
              <Route path="/cart" element={<CartPage />} />
              <Route path="/checkout" element={<Checkout />} />
              <Route path="/login" element={<Login />} />
            </Routes>
          </main>
        </CartProvider>
      </AuthProvider>
    </BrowserRouter>
  );
}