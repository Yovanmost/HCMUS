import { useState } from 'react';
import { useCart } from '../context/CartContext';
import toast from 'react-hot-toast';

export default function Checkout() {
  const { cart, totalPrice, clearCart } = useCart();
  const [form, setForm] = useState({ name: '', address: '', phone: '' });
  const [loading, setLoading] = useState(false);

  function onSubmit(e) {
    e.preventDefault();
    if (!form.name || !form.address || !form.phone) {
      toast.error('Vui lòng điền đủ thông tin');
      return;
    }
    setLoading(true);
    setTimeout(() => {
      setLoading(false);
      toast.success('Đặt hàng thành công!');
      clearCart();
    }, 1200);
  }

  return (
    <div className="max-w-lg mx-auto">
      <h1 className="text-2xl font-bold mb-4">Đặt hàng</h1>
      <form onSubmit={onSubmit} className="space-y-4">
        <input value={form.name} onChange={e => setForm({...form, name: e.target.value})} placeholder="Tên" className="w-full border p-2 rounded" />
        <input value={form.address} onChange={e => setForm({...form, address: e.target.value})} placeholder="Địa chỉ" className="w-full border p-2 rounded" />
        <input value={form.phone} onChange={e => setForm({...form, phone: e.target.value})} placeholder="Số điện thoại" className="w-full border p-2 rounded" />
        <div>Tổng: <span className="font-bold">{totalPrice.toLocaleString()} ₫</span></div>
        <button type="submit" disabled={loading} className="bg-green-600 text-white px-4 py-2 rounded">
          {loading ? 'Đang gửi...' : 'Xác nhận đơn'}
        </button>
      </form>
    </div>
  );
}