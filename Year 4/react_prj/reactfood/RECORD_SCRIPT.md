# Kịch bản quay video (10 phút)

File này gồm 2 phần:

- Phần A — Thông tin chi tiết từng file (bullet points): chức năng, cách component được dùng, cấu trúc và công nghệ/kiến thức áp dụng.
- Phần B — Kịch bản đọc cho video 10 phút: từng phân đoạn với thời lượng, hành động màn hình và câu nói mẫu để đọc khi quay.

---

## Phần A — Thông tin chi tiết các file

Ghi chú: mở file nhanh trong VS Code bằng `Ctrl+P` và gõ tên file.

### `src/main.jsx`
- Chức năng: Entry point của ứng dụng React. Khởi tạo app, mount vào DOM, cấu hình global providers và third-party (Toaster, AOS).
- Cách dùng/component: import `App` và render bằng `createRoot`, khởi `Toaster` (react-hot-toast) để dùng toàn cục, khởi AOS nếu dự án dùng animation on scroll.
- Cấu trúc: khởi tạo root -> wrap `App` trong provider cần thiết -> render.
- Công nghệ/kiến thức: React 18 `createRoot`, React Context provider pattern, tích hợp lib thông báo.

### `src/App.jsx`
- Chức năng: Cấu hình routing (react-router), layout chung (Header/Footer nếu có), bọc app bằng `CartProvider`.
- Cách dùng/component: định nghĩa `<Routes>` và `<Route>`; một số Links tới `/menu`, `/cart`, `/login`...; `CartProvider` (từ `CartContext.jsx`) bọc toàn app để chia sẻ state giỏ hàng.
- Cấu trúc: Provider -> BrowserRouter -> Routes -> Route components.
- Công nghệ/kiến thức: react-router, provider pattern, component composition.

### `src/context/CartContext.jsx`
- Chức năng: Quản lý toàn bộ trạng thái giỏ hàng và API thao tác (add, update, remove, clear, total price/items).
- Cách dùng/component: export `CartProvider` và hook `useCart()` để component con gọi `const { cart, addToCart, updateQty, removeFromCart, totalPrice } = useCart()`.
- Cấu trúc: internal state `cart` (mảng item), effect để sync `localStorage`, các hàm thao tác cart.
- Công nghệ/kiến thức: React Context API, state management (setState), localStorage persistence, memoization/derived state (reduce để tính tổng).

### `src/context/AuthContext.jsx` (nếu có)
- Chức năng: Quản lý trạng thái đăng nhập (ở project này có thể đơn giản: lưu user/email vào localStorage).
- Cách dùng/component: export provider/hook (ví dụ `useAuth`) để component khác check auth, lưu/đăng xuất.
- Cấu trúc: state user, login/logout, persist localStorage.
- Công nghệ/kiến thức: Context, localStorage, navigation sau login.

### `src/components/ProductCard.jsx`
- Chức năng: Component tái sử dụng để hiển thị một món ăn (thumbnail, tên, giá, nút Thêm, link tới chi tiết).
- Cách dùng/component: được gọi từ `MenuPage.jsx` như `<ProductCard item={item} onAdd={() => addToCart(item,1)} />`.
- Cấu trúc: props {item, onAdd}, hiển thị hình (img), tên, giá (`toLocaleString`), `Link` tới `/dish/:id`.
- Công nghệ/kiến thức: Composition, props, số hoá định dạng tiền, client-side routing.

### `src/data/menu.js`
- Chức năng: Dữ liệu mẫu (array of objects) chứa các món: id, name, price, image, category, description.
- Cách dùng: import `menu` vào `MenuPage.jsx` hoặc `DishDetail.jsx` để render.
- Cấu trúc: mảng JS thuần.
- Công nghệ/kiến thức: tách data khỏi UI cho dễ test/dev.

### `src/pages/MenuPage.jsx`
- Chức năng: Hiển thị danh sách món ăn, có tìm kiếm/lọc theo category, và nút thêm vào giỏ.
- Cách dùng/component: import `menu` -> filter/map -> render `ProductCard`; lấy `addToCart` từ `useCart`.
- Cấu trúc: controls (search input, category filter) -> results list -> pagination (nếu có).
- Công nghệ/kiến thức: array filtering, state (useState), lifting state, performance (useMemo nếu cần).

### `src/pages/DishDetail.jsx`
- Chức năng: Trang chi tiết của một món. Hiển thị ảnh lớn, mô tả, input chọn số lượng và nút thêm vào giỏ.
- Cách dùng/component: dùng `useParams()` để lấy `id`, tìm item trong `menu`, dùng `useRef` hoặc `useState` cho số lượng, gọi `addToCart(item, qty)` và thường `navigate('/cart')` sau khi thêm.
- Cấu trúc: tìm item -> render thông tin -> form nhỏ cho số lượng -> button add.
- Công nghệ/kiến thức: react-router params, controlled/uncontrolled inputs, programmatic navigation.

### `src/pages/CartPage.jsx`
- Chức năng: Hiển thị các item trong giỏ, chỉnh số lượng, xóa item, hiển thị tổng tiền, nút Checkout.
- Cách dùng/component: sử dụng `useCart()` để lấy `cart`, `updateQty`, `removeFromCart`, `totalPrice`; render mỗi dòng với controls.
- Cấu trúc: table/list các item -> controls thay đổi qty -> hành động xóa -> tổng tiền và CTA checkout.
- Công nghệ/kiến thức: derived state, event handling, UX (xác nhận xóa, toast thông báo).

### `src/pages/Checkout.jsx`
- Chức năng: Form thu thập thông tin giao hàng & thanh toán (demo), gửi đơn (giả lập), clear cart sau khi successful.
- Cách dùng/component: lấy `cart` và `totalPrice` từ `useCart`, validate form, fake async submit (setTimeout), show toast và `clearCart()` khi thành công.
- Cấu trúc: form inputs -> submit handler -> success flow.
- Công nghệ/kiến thức: form handling, client-side validation, async flow simulation.

### `src/pages/Login.jsx`
- Chức năng: Form login demo (lưu email/user vào localStorage hoặc Context), redirect sau khi login.
- Cách dùng/component: lưu session tạm để demo tính năng cần auth (nếu có).
- Cấu trúc: input email/password (có thể chỉ email), submit -> save -> navigate.
- Công nghệ/kiến thức: localStorage, navigation, UX minimal.

### `src/pages/Home.jsx`
- Chức năng: Landing page / welcome. Link/CTA tới Menu.
- Cách dùng/component: UI đơn giản, có thể show hero banner và nút CTA.
- Cấu trúc: section hero -> CTA button.
- Công nghệ/kiến thức: static UI, routing link.

### Cấu hình dự án (root)
- `package.json` — liệt kê dependencies (React, react-router, tailwindcss, vite, react-hot-toast, AOS...).
- `vite.config.js`, `tailwind.config.js`, `postcss.config.js` — cấu hình build và style.
- `index.html` — entry HTML template (meta, root div).

---

## Phần B — Kịch bản đọc cho video 10 phút

Tổng thời lượng: 10:00 (600 giây). Giữ tốc độ nói vừa phải (khoảng 120–150 từ/phút). Dưới đây là phân đoạn, hành động màn hình và câu nói mẫu (bạn có thể đọc y nguyên hoặc paraphrase).

00:00 — 00:30 — Opening (0:30)
- Hành động: show app running trên trình duyệt (home), sau đó chuyển sang VS Code explorer.
- Câu nói mẫu: 
  "Xin chào — mình là [Tên], và trong 10 phút tới mình sẽ giới thiệu nhanh project ReactFood. Mình sẽ vừa show giao diện vừa mở code trong VS Code để giải thích cấu trúc, cách các component liên kết và công nghệ chính đã dùng. Bắt đầu nhé."

00:30 — 02:00 — App & main (1:30)
- Hành động: mở `src/main.jsx`, highlight phần `createRoot` và `Toaster`. Sau đó mở `src/App.jsx` và highlight `<CartProvider>` và `<Routes>`.
- Câu nói mẫu:
  "File `main.jsx` là entry point: ở đây chúng ta khởi ứng dụng React, đăng ký `Toaster` để hiển thị thông báo global, và khởi AOS cho animation (nếu có). Mở `App.jsx` — đây là chỗ cấu hình routing bằng `react-router` và bọc toàn app bằng `CartProvider`. Nhờ `CartProvider`, mọi component con có thể truy cập giỏ hàng qua hook `useCart()`, nên ta không cần truyền props sâu."

02:00 — 03:30 — Cart Context (1:30)
- Hành động: mở `src/context/CartContext.jsx`, kéo tới hàm `addToCart`, `updateQty`, phần sync `localStorage`.
- Câu nói mẫu:
  "`CartContext.jsx` quản lý mọi thứ liên quan đến giỏ hàng: state `cart`, hàm `addToCart`, `removeFromCart`, `updateQty`, `clearCart`, và các giá trị phụ như `totalItems` và `totalPrice`. Cart được lưu vào `localStorage` để persist khi refresh. Kiến thức chính: Context API và state derived (dùng `reduce` để tính tổng tiền)."

03:30 — 05:00 — Menu Page + ProductCard (1:30)
- Hành động: mở `src/pages/MenuPage.jsx`, show trình duyệt trang Menu; mở `src/components/ProductCard.jsx` và highlight props.
- Câu nói mẫu:
  "`MenuPage.jsx` lấy dữ liệu từ `src/data/menu.js`, có search/filter và map qua `menu` để render `ProductCard`. `ProductCard` là component tái sử dụng: nhận `item` và `onAdd` làm prop, hiển thị ảnh, tên, giá và nút thêm. Khi user click thêm, component gọi `addToCart(item, qty)` từ context. Việc tách nhỏ như này giúp component test và tái sử dụng dễ dàng."

05:00 — 06:00 — Dish Detail (1:00)
- Hành động: click 1 item trên Menu để mở detail trong trình duyệt; mở `src/pages/DishDetail.jsx`.
- Câu nói mẫu:
  "Trang `DishDetail.jsx` dùng `useParams()` để lấy `id` từ URL, tìm món tương ứng trong `menu` và render đầy đủ thông tin: ảnh, mô tả, input số lượng và nút thêm vào giỏ. Sau khi thêm, code thường gọi `navigate('/cart')` để đưa user sang giỏ hàng. Để an toàn nên validate số lượng > 0 trước khi add."

06:00 — 07:00 — Cart Page (1:00)
- Hành động: mở `src/pages/CartPage.jsx` và show thay đổi số lượng, xóa item.
- Câu nói mẫu:
  "`CartPage.jsx` cho phép chỉnh qty, xóa item và xem tổng tiền. Ở đây ta dùng `updateQty(itemId, newQty)` và `removeFromCart`. Thao tác thành công được phản hồi bằng `react-hot-toast` để cải thiện trải nghiệm người dùng."

07:00 — 08:00 — Checkout (1:00)
- Hành động: mở `src/pages/Checkout.jsx`, show form điền tên, địa chỉ.
- Câu nói mẫu:
  "`Checkout.jsx` là form nhập thông tin giao hàng. Ở bản demo này submit sẽ giả lập async (ví dụ `setTimeout`) rồi clear cart. Ở môi trường production, bạn sẽ gọi API backend, validate server-side và xử lý thanh toán."

08:00 — 08:40 — Login (0:40)
- Hành động: mở `src/pages/Login.jsx`.
- Câu nói mẫu:
  "`Login.jsx` hiện là login demo: lưu user/email vào `localStorage` và redirect. Đây chỉ để minh họa; nâng cấp thực tế cần tích hợp auth server, token và bảo mật."

08:40 — 09:10 — Home (0:30)
- Hành động: mở `src/pages/Home.jsx` và show hero/CTA trên trình duyệt.
- Câu nói mẫu:
  "Trang Home là landing đơn giản, chứa CTA dẫn tới Menu. Thường ít logic, chủ yếu UI."

09:10 — 09:40 — Data & Config (0:30)
- Hành động: mở `src/data/menu.js`, sau đó `package.json` và `tailwind.config.js`.
- Câu nói mẫu:
  "Dữ liệu mẫu ở `src/data/menu.js`. Dự án sử dụng Vite (dev server nhanh), Tailwind CSS cho styling tiện lợi, `react-hot-toast` cho notification, và AOS cho animation. Cấu hình nằm ở `vite.config.js` và `tailwind.config.js`."

09:40 — 10:00 — Kết thúc (0:20)
- Hành động: demo ngắn: add 1 món -> vào cart -> checkout success (clear cart). Quay lại VS Code tắt highlight.
- Câu nói mẫu:
  "Tổng kết: hôm nay mình đã giới thiệu luồng chính của app — routing → menu → detail → cart → checkout — cùng kiến trúc code: component tái sử dụng (`ProductCard`), context cho giỏ hàng, và các công nghệ: React + Vite + Tailwind. Nếu bạn muốn bản chi tiết hơn (nâng cấp auth, tách modal, viết tests), mình có thể tiếp tục. Cám ơn các bạn đã xem!"

---

## Ghi chú kỹ thuật & mẹo quay
- VS Code tips: `Ctrl+P` (open file), `Ctrl+` (mở terminal), `Ctrl+K Z` (Zen Mode), kéo thả để highlight đoạn code.
- Khi hiển thị code: tăng font size, collapse panel không cần thiết, chừa đủ khoảng trắng để dễ đọc trong video.
- Nếu muốn bản in (.md -> pdf), mình có thể tạo file `RECORD_SCRIPT.md` (đã tạo) hoặc export sang PDF.

---

File này đã được sinh tự động. Nếu bạn muốn:
- điều chỉnh thời lượng từng đoạn (ví dụ rút gọn hoặc kéo dài),
- thêm chi tiết đọc (ví dụ đọc từng hàm trong `CartContext.jsx`),
- hoặc muốn file chuyển thành `RECORD_SCRIPT.pdf`, cho mình biết để mình làm tiếp.
