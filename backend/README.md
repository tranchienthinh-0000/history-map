# History Map VN 

Dự án mẫu đầy đủ: **Backend (Node.js + PostgreSQL/PostGIS)** + **Frontend (Vite + React)**.

## 1) Cài đặt CSDL bằng pgAdmin 4
- Tạo database `history_map` (UTF8).
- Mở Query Tool, chạy:
  - `backend/sql/schema.sql`
  - `backend/sql/sample_data.sql`

## 2) Chạy Backend
```bash
cd backend
cp .env.example .env   # sửa DATABASE_URL cho đúng mật khẩu
npm install
npm run start
```
Kiểm tra: `http://localhost:4000/places`

## 3) Chạy Frontend
```bash
cd ../frontend
cp .env.example .env   # điền VITE_MAPBOX_TOKEN và VITE_API
npm install
npm run dev
```
Mở: `http://localhost:5173`


