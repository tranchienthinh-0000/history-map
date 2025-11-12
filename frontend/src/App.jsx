import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";
import Home from "./pages/Home";
import About from "./pages/About";
import logo from "./assets/images/logo.jpg";
import "./index.css";

export default function App() {
  return (
    <Router>
      {/* 🧭 Thanh điều hướng */}
      <header className="navbar">
        <div className="nav-left">
          <img src={logo} alt="HistoryMap VN" className="logo" />
          <h1 className="title">HistoryMap Việt Nam – Bản đồ số các sự kiện lịch sử</h1>
        </div>
        <nav className="nav-links">
          <Link to="/">🏠 Trang chủ</Link>
          <Link to="/about">ℹ️ Giới thiệu</Link>
        </nav>
      </header>

      {/* 📍 Nội dung trang */}
      <main>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/about" element={<About />} />
        </Routes>
      </main>

      {/* 📌 Footer nhỏ gọn */}
      <footer className="footer">
        © {new Date().getFullYear()} HistoryMap VN — Số hoá lịch sử Việt Nam 🇻🇳
      </footer>
    </Router>
  );
}
