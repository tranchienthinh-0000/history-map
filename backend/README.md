# History Map API (Backend)

### 1) Cấu hình
- Cài PostgreSQL + PostGIS và pgAdmin 4.
- Tạo database `history_map`.
- Trong pgAdmin, chạy lần lượt:
  - `sql/schema.sql`
  - `sql/sample_data.sql`
- Tạo file `.env` từ `.env.example` và chỉnh `DATABASE_URL` cho đúng mật khẩu.

### 2) Chạy API
```bash
npm install
npm run start  # hoặc: npm run dev (cần nodemon)
```
API chạy tại `http://localhost:4000`:
- `GET /` → health check
- `GET /places` → trả GeoJSON FeatureCollection 
- `GET /places/:id` → chi tiết điểm + media + events
- `GET /search?q=...` → tìm kiếm

### 3) Gợi ý bảo mật
- Khi deploy, thêm CORS whitelist theo domain frontend.
- Không commit `.env`.
