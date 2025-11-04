import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import Home from './pages/Home';
import MenuPage from './pages/MenuPage';
import DishDetail from './pages/DishDetail';
import CartPage from './pages/CartPage';
import Checkout from './pages/Checkout';
import Login from './pages/Login';
import { CartProvider } from './context/CartContext';

export default function App() {
  return (
    <BrowserRouter>
      <CartProvider>
        <header className="bg-white dark:bg-gray-800 shadow">
          <div className="container mx-auto p-4 flex justify-between">
            <Link to="/" className="font-bold text-xl">ReactFood</Link>
            <nav className="space-x-4">
              <Link to="/menu">Menu</Link>
              <Link to="/cart">Giỏ hàng</Link>
            </nav>
          </div>
        </header>

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
    </BrowserRouter>
  );
}