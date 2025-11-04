import { useState, useMemo } from 'react';
import { menu } from '../data/menu';
import ProductCard from '../components/ProductCard';
import { useCart } from '../context/CartContext';

export default function MenuPage() {
  const [q, setQ] = useState('');
  const [category, setCategory] = useState('All');
  const { addToCart } = useCart();

  const categories = useMemo(() => ['All', ...new Set(menu.map(m => m.category))], []);

  const filtered = menu.filter(item => {
    if (category !== 'All' && item.category !== category) return false;
    if (!q) return true;
    return item.name.toLowerCase().includes(q.toLowerCase());
  });

  return (
    <div>
      <h1 className="text-2xl font-bold mb-4">Menu</h1>
      <div className="flex gap-3 mb-4">
        <input value={q} onChange={e => setQ(e.target.value)} placeholder="Tìm kiếm..." className="border p-2 rounded flex-1" />
        <select value={category} onChange={e => setCategory(e.target.value)} className="border p-2 rounded">
          {categories.map(c => <option key={c} value={c}>{c}</option>)}
        </select>
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4">
        {filtered.map(item => (
          <ProductCard key={item.id} item={item} onAdd={(it) => addToCart(it, 1)} />
        ))}
      </div>
    </div>
  );
}