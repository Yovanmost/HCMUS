import { Link } from 'react-router-dom';

export default function ProductCard({ item, onAdd }) {
  return (
    <div className="bg-white rounded shadow p-6 text-center h-full flex flex-col">
      <Link to={`/menu/${item.id}`} className="block">
        <img src={item.image} alt={item.name} className="w-full h-40 object-cover rounded mb-3" />
        <h3 className="font-semibold">{item.name}</h3>
      </Link>
      <div className="mt-4 flex flex-col items-center gap-3 mt-auto">
        <span className="text-lg font-bold">{item.price.toLocaleString()} ₫</span>
        <button onClick={() => onAdd && onAdd(item)} className="bg-green-500 text-white px-4 py-2 rounded">Thêm</button>
      </div>
    </div>
  );
}