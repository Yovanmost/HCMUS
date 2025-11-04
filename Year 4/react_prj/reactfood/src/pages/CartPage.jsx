import { useCart } from '../context/CartContext';
import { Link } from 'react-router-dom';
import { useState } from 'react';
import toast from 'react-hot-toast';

export default function CartPage() {
  const { cart, updateQty, removeFromCart, totalPrice } = useCart();
  const [confirmId, setConfirmId] = useState(null);

  if (cart.length === 0) return <div>Giỏ hàng trống. <Link to="/menu" className="text-blue-500">Xem menu</Link></div>;

  return (
    <div>
      <h1 className="text-2xl font-bold mb-4">Giỏ hàng</h1>
      <div className="space-y-4">
        {cart.map(item => (
          <div key={item.id} className="flex items-center gap-4 p-4 bg-white rounded shadow">
            <img src={item.image} alt={item.name} className="w-20 h-20 object-cover rounded" />
            <div className="flex-1">
              <div className="font-semibold">{item.name}</div>
              <div>{(item.price).toLocaleString()} ₫</div>
            </div>
            <div>
              <input type="number" value={item.qty} onChange={(e)=> updateQty(item.id, Math.max(1, Number(e.target.value)))} className="w-20 border p-1 rounded"/>
            </div>
            <div className="font-bold">{(item.price * item.qty).toLocaleString()} ₫</div>
            <button onClick={() => setConfirmId(item.id)} className="text-red-600">Xóa</button>
          </div>
        ))}
      </div>

      <div className="mt-4 p-4 bg-gray-50 rounded">
        <div className="flex justify-between">
          <div>Tổng:</div>
          <div className="font-bold">{totalPrice.toLocaleString()} ₫</div>
        </div>
        <div className="mt-4 flex gap-2">
          <Link to="/checkout" className="bg-blue-600 text-white px-4 py-2 rounded">Đặt hàng</Link>
        </div>
      </div>

      {confirmId && (
        <div className="fixed inset-0 flex items-center justify-center bg-black/40">
          <div className="bg-white p-6 rounded">
            <p>Bạn có chắc muốn xóa món này?</p>
            <div className="mt-4 flex gap-2">
              <button onClick={() => { removeFromCart(confirmId); setConfirmId(null); toast.success('Đã xóa'); }} className="bg-red-600 text-white px-3 py-1 rounded">Xóa</button>
              <button onClick={() => setConfirmId(null)} className="px-3 py-1 border rounded">Hủy</button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}