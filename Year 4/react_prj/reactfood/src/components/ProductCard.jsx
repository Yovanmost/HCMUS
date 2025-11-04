import { Link } from 'react-router-dom';

export default function ProductCard({ item, onAdd }) {
  return (
    <div className="bg-white rounded shadow p-4">
      <Link to={`/menu/${item.id}`}>
        <img src={item.image} alt={item.name} className="w-full h-40 object-cover rounded" />
        <h3 className="mt-2 font-semibold">{item.name}</h3>
      </Link>
      <div className="mt-2 flex justify-between items-center">
        <span className="text-lg font-bold">{item.price.toLocaleString()} ₫</span>
        <button onClick={() => onAdd && onAdd(item)} className="bg-green-500 text-white px-3 py-1 rounded">Thêm</button>
      </div>
    </div>
  );
}