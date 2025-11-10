import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';

export default function Login() {
  const [email, setEmail] = useState('');
  const [pw, setPw] = useState('');
  const navigate = useNavigate();
  const { login } = useAuth();

  const onLogin = e => {
    e.preventDefault();
    if (!email || !pw) return;
    // fake login: persist and update auth context so UI updates immediately
    const user = { email, password: pw };
    login(user);
    navigate('/');
  };

  return (
    <div className="max-w-md mx-auto">
      <h2 className="text-xl font-bold mb-4">Đăng nhập (giả)</h2>
      <form onSubmit={onLogin} className="space-y-3">
        <input
          value={email}
          onChange={e => setEmail(e.target.value)}
          className="w-full border p-2 rounded"
          placeholder="Email"
          type="email"
          required
        />
        <input
          value={pw}
          onChange={e => setPw(e.target.value)}
          className="w-full border p-2 rounded"
          placeholder="Mật khẩu"
          type="password"
          required
        />
        <button type="submit" className="bg-blue-600 text-white px-4 py-2 rounded">Đăng nhập</button>
      </form>
    </div>
  );
}