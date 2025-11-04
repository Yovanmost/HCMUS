import { useState } from 'react';
import { useNavigate } from 'react-router-dom';

export default function Login() {
  const [email, setEmail] = useState('');
  const [pw, setPw] = useState('');
  const navigate = useNavigate();

  const onLogin = e => {
    e.preventDefault();
    if (!email) return;
    localStorage.setItem('reactfood_user', JSON.stringify({ email }));
    navigate('/');
  };

  return (
    <div className="max-w-md mx-auto">
      <h2 className="text-xl font-bold mb-4">Đăng nhập (giả)</h2>
      <form onSubmit={onLogin} className="space-y-3">
        <input value={email} onChange={e=>setEmail(e.target.value)} className="w-full border p-2 rounded" placeholder="Email" />
        <input value={pw} onChange={e=>setPw(e.target.value)} className="w-full border p-2 rounded" placeholder="Mật khẩu" type="password" />
        <button className="bg-blue-600 text-white px-4 py-2 rounded">Đăng nhập</button>
      </form>
    </div>
  );
}