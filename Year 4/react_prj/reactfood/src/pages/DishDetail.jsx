import { useParams, useNavigate } from 'react-router-dom';
import { menu } from '../data/menu';
import { useCart } from '../context/CartContext';
import { useRef, useEffect } from 'react';

export default function DishDetail() {
  const { id } = useParams();
  const dish = menu.find(m => m.id === id);
  const { addToCart } = useCart();
  const qtyRef = useRef(1);
  const navigate = useNavigate();

  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);

  if (!dish) return <div>Không tìm thấy món</div>;

  return (
    <div className="max-w-3xl mx-auto">
      <img src={dish.image} alt={dish.name} className="w-full h-64 object-cover rounded" />
      <h1 className="text-2xl font-bold mt-4">{dish.name}</h1>
      <p className="mt-2">{dish.description}</p>
      <div className="mt-4 flex items-center gap-3">
        <input type="number" defaultValue={1} ref={qtyRef} min={1} className="w-20 border p-2 rounded" />
        <button onClick={() => { addToCart(dish, Number(qtyRef.current.value)); navigate('/cart'); }} className="bg-green-600 text-white px-4 py-2 rounded">
          Thêm vào giỏ
        </button>
      </div>
    </div>
  );
}