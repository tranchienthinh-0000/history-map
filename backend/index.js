// backend/index.js
const express = require("express");
const cors = require("cors");
const dotenv = require("dotenv");
const { Pool } = require("pg");

dotenv.config();

const app = express();

// ==================================
// 🌐 Cấu hình CORS & JSON middleware
// ==================================
app.use(
  cors({
    origin: "*", // Cho phép mọi nguồn truy cập (React frontend)
    methods: ["GET", "POST", "PUT", "DELETE"],
    allowedHeaders: ["Content-Type", "Authorization"],
  })
);
app.use(express.json());

// ==================================
// 🔌 Kết nối PostgreSQL / PostGIS
// ==================================
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl:
    process.env.DATABASE_SSL === "true"
      ? { rejectUnauthorized: false }
      : false,
});

// 🩺 Kiểm tra trạng thái kết nối
pool.on("connect", () => console.log("✅ Connected to PostgreSQL"));
pool.on("error", (err) => console.error("❌ PostgreSQL error:", err));

// Gắn pool vào app.locals để controller dùng chung
app.locals.pool = pool;

// ==================================
// 🩺 Health check
// ==================================
app.get("/", (_req, res) => {
  res.json({
    ok: true,
    message: "🇻🇳 Vietnam History Map API đang chạy ổn định 🚀",
  });
});

// ==================================
// 🧭 Import router (API endpoints)
// ==================================
const placeRoutes = require("./routes/places");
const eventRoutes = require("./routes/events");

app.use("/api/places", placeRoutes);
app.use("/api/events", eventRoutes);

// ==================================
// ⚙️ Khởi động server (port 8000)
// ==================================
const port = process.env.PORT || 8000;
app.listen(port, () => {
  console.log(`🚀 API running on http://localhost:${port}`);
  console.log("🌍 Ready to receive requests from React frontend\n");
});
