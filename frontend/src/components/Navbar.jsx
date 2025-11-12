// src/components/Navbar.jsx
import { Link } from "react-router-dom";
import { useState, useEffect } from "react";
import "../i18n";
import { useTranslation } from "react-i18next";
import logo from "../assets/images/logo.png";

export default function Navbar() {
  const { t, i18n } = useTranslation();
  const [darkMode, setDarkMode] = useState(false);

  // 🔄 Ghi nhớ theme người dùng
  useEffect(() => {
    const saved = localStorage.getItem("theme");
    if (saved === "dark") {
      document.body.classList.add("dark");
      setDarkMode(true);
    }
  }, []);

  // 🌙 Chuyển theme
  const toggleTheme = () => {
    const newMode = !darkMode;
    setDarkMode(newMode);
    if (newMode) {
      document.body.classList.add("dark");
      localStorage.setItem("theme", "dark");
    } else {
      document.body.classList.remove("dark");
      localStorage.setItem("theme", "light");
    }
  };

  // 🌐 Đổi ngôn ngữ giao diện
  const changeLang = (lang) => {
    i18n.changeLanguage(lang);
    localStorage.setItem("lang", lang);
  };

  return (
    <nav className="navbar">
      <div className="nav-left">
        <img src={logo} alt="Logo" className="logo" />
        <span>HistoryMap VN</span>
      </div>

      <div className="nav-links">
        <Link to="/">{t("home") || "Trang chủ"}</Link>
        <Link to="/about">{t("about") || "Giới thiệu"}</Link>

        <button
          onClick={toggleTheme}
          title={darkMode ? "Tắt chế độ tối" : "Bật chế độ tối"}
          style={{
            background: "none",
            border: "none",
            cursor: "pointer",
            color: "#fff",
            fontSize: "18px",
          }}
        >
          {darkMode ? "☀️" : "🌙"}
        </button>

        <select
          onChange={(e) => changeLang(e.target.value)}
          defaultValue={localStorage.getItem("lang") || "vi"}
          style={{
            background: "#374151",
            color: "white",
            border: "1px solid #6b7280",
            borderRadius: "6px",
            padding: "4px 6px",
            cursor: "pointer",
          }}
        >
          <option value="vi">🇻🇳</option>
          <option value="en">🇬🇧</option>
          <option value="fr">🇫🇷</option>
        </select>
      </div>
    </nav>
  );
}
