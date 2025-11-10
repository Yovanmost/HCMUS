import { Link } from 'react-router-dom';
import ProductCard from '../components/ProductCard';
import { menu } from '../data/menu';
import { useCart } from '../context/CartContext';

export default function Home() {
  const featured = menu.slice(0, 3);
  const { addToCart } = useCart();

  return (
    <div>
      <section className="bg-gradient-to-r from-yellow-100 to-white py-12">
        <div className="container mx-auto flex flex-col md:flex-row items-center gap-8">
          <div className="flex-1 text-center md:text-left">
            <h1 className="text-4xl font-bold mb-4">ReactFood — Món ngon mỗi ngày</h1>
            <p className="mb-6 text-gray-700">Đặt món nhanh, nhận ngay, chất lượng đảm bảo. Khuyến mãi mỗi ngày cho khách hàng mới.</p>
            <div className="space-x-3">
              <Link to="/menu" className="bg-blue-600 text-white px-4 py-2 rounded">Xem Menu</Link>
              <Link to="/login" className="text-blue-600 px-4 py-2">Đăng nhập</Link>
            </div>
          </div>
          <div className="flex-1">
            <img src="/images/pho-bo.jpg" alt="hero" className="w-full rounded shadow-md object-cover" />
          </div>
        </div>
      </section>

      <section className="container mx-auto py-10">
        <h2 className="text-2xl font-semibold mb-6">Món nổi bật</h2>
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
          {featured.map(item => (
            <ProductCard key={item.id} item={item} onAdd={() => addToCart(item)} />
          ))}
        </div>
      </section>
    </div>
  );
}
