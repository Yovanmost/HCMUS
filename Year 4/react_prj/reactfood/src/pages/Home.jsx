import { Link } from 'react-router-dom';

export default function Home() {
  return (
    <div className="text-center py-12">
      <h1 className="text-4xl font-bold mb-4">ReactFood</h1>
      <p className="mb-6">Chào mừng đến với quán ReactFood — đặt món nhanh, gọn, lẹ.</p>
      <Link to="/menu" className="bg-blue-600 text-white px-4 py-2 rounded">Xem Menu</Link>
    </div>
  );
}
