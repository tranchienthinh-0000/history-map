import { useEffect, useMemo, useState } from "react";
import defaultImg from "../assets/images/default.jpg";

/**
 * 🧭 Hàm trích toạ độ từ dữ liệu địa điểm
 */
function extractLatLng(place) {
  if (!place) return null;
  if (place.latitude && place.longitude)
    return { lat: place.latitude, lng: place.longitude };

  try {
    const g =
      typeof place.geom === "string" ? JSON.parse(place.geom) : place.geom;
    if (g?.type === "Point" && Array.isArray(g.coordinates)) {
      const [lng, lat] = g.coordinates;
      return { lat, lng };
    }
  } catch (err) {
    console.warn("⚠️ Không trích được toạ độ từ geom:", err);
  }
  return null;
}

/**
 * 🏛️ Sidebar hiển thị chi tiết địa điểm
 */
export default function Sidebar({ place, onClose }) {
  const [tab, setTab] = useState("info");
  const [autoSpeak, setAutoSpeak] = useState(false);
  const [lang, setLang] = useState("vi-VN");
  const [voices, setVoices] = useState([]);

  // ✅ Ảnh nền (ưu tiên ảnh đầu tiên trong media)
  const cover =
    place?.media?.find((m) => m.kind === "image")?.url ||
    place?.image_url ||
    defaultImg;

  // ✅ URL Wikipedia fallback
  const wikiUrl = useMemo(() => {
    if (!place) return "#";
    return (
      place.wikipedia_url ||
      `https://vi.wikipedia.org/w/index.php?search=${encodeURIComponent(
        place.name_vi || ""
      )}`
    );
  }, [place]);

  // ✅ Tọa độ (để mở Google Maps)
  const latlng = useMemo(() => extractLatLng(place), [place]);

  /**
   * 🔊 Khởi tạo danh sách giọng đọc (Text-to-Speech)
   */
  useEffect(() => {
    const loadVoices = () =>
      setVoices(window.speechSynthesis?.getVoices?.() || []);
    loadVoices();
    window.speechSynthesis?.addEventListener?.("voiceschanged", loadVoices);
    return () =>
      window.speechSynthesis?.removeEventListener?.("voiceschanged", loadVoices);
  }, []);

  /**
   * 🗣️ Hàm đọc văn bản
   */
  const speak = (text) => {
    const synth = window.speechSynthesis;
    if (!synth) return alert("Trình duyệt không hỗ trợ Text-to-Speech.");
    synth.cancel();
    const u = new SpeechSynthesisUtterance(text);
    u.lang = lang;
    u.voice = voices.find((v) => v.lang === lang) || null;
    synth.speak(u);
  };

  /**
   * 🔁 Tự động đọc khi đổi địa điểm
   */
  useEffect(() => {
    if (!place || !autoSpeak) return;
    const vi = `${place.name_vi || ""}. Thời kỳ: ${
      place.period || "Không rõ"
    }. ${place.summary || ""}`;
    const en = `${place.name_en || place.name_vi || ""}. Period: ${
      place.period || "Unknown"
    }. ${place.summary || ""}`;
    const fr = `${place.name_fr || place.name_vi || ""}. Période: ${
      place.period || "Inconnue"
    }. ${place.summary || ""}`;
    speak(lang === "en-US" ? en : lang === "fr-FR" ? fr : vi);
  }, [place, lang, autoSpeak]);

  /**
   * 📍 Mở vị trí trong Google Maps
   */
  const handleOpenGoogleMaps = () => {
    if (latlng?.lat && latlng?.lng) {
      window.open(
        `https://www.google.com/maps?q=${latlng.lat},${latlng.lng}`,
        "_blank"
      );
    } else if (place.name_vi) {
      window.open(
        `https://www.google.com/maps/search/${encodeURIComponent(
          place.name_vi
        )}`,
        "_blank"
      );
    } else {
      alert("Không có toạ độ hoặc tên để mở Google Maps.");
    }
  };

  /**
   * 🧱 Giao diện Sidebar
   */
  if (!place) {
    return (
      <aside className="sidebar sidebar--empty">
        <p>🏛️ Chọn một điểm trên bản đồ để xem chi tiết.</p>
      </aside>
    );
  }

  return (
    <aside
      className="sidebar"
      style={{
        backgroundImage: `url(${cover})`,
        backgroundSize: "cover",
        backgroundPosition: "center",
      }}
    >
      <div className="sidebar__overlay">
        {/* Nút đóng */}
        <button className="sidebar__close" onClick={onClose} aria-label="Đóng">
          ×
        </button>

        {/* Tabs */}
        <div className="tabs">
          {[
            { key: "info", label: "ℹ️ Giới thiệu" },
            { key: "images", label: "🖼️ Hình ảnh" },
            { key: "video", label: "🎬 Video" },
            { key: "stats", label: "📊 Thống kê" },
          ].map((t) => (
            <button
              key={t.key}
              className={`tabs__item ${tab === t.key ? "is-active" : ""}`}
              onClick={() => setTab(t.key)}
            >
              {t.label}
            </button>
          ))}
        </div>

        {/* TAB: Giới thiệu */}
        {tab === "info" && (
          <div className="panel">
            <h2 className="panel__title">{place.name_vi}</h2>
            <p>
              <b>Thời kỳ:</b> {place.period || "Không rõ"}
            </p>
            <p>{place.summary || "Chưa có mô tả chi tiết cho địa điểm này."}</p>

            {/* Điều khiển đọc */}
            <div className="tts">
              <select
                className="tts__select"
                value={lang}
                onChange={(e) => setLang(e.target.value)}
              >
                <option value="vi-VN"> Tiếng Việt</option>
                <option value="en-US"> English</option>
                <option value="fr-FR"> Français</option>
              </select>

              <button
                className="btn btn--primary"
                onClick={() =>
                  speak(place.summary || place.name_vi || "Không có nội dung.")
                }
              >
                🔊 Nghe mô tả
              </button>

              <button
                className={`btn ${
                  autoSpeak ? "btn--danger" : "btn--success"
                }`}
                onClick={() => setAutoSpeak((v) => !v)}
              >
                {autoSpeak ? "⏹️ Tắt tự đọc" : "▶️ Bật tự đọc"}
              </button>
            </div>

            {/* Liên kết */}
            <div className="actions">
              <a
                className="link"
                href={wikiUrl}
                target="_blank"
                rel="noreferrer"
              >
                <button className="btn btn--map">📖 Mở Wikipedia</button>
              </a>
              <button className="btn btn--map" onClick={handleOpenGoogleMaps}>
                📍 Xem đường đi
              </button>
            </div>
          </div>
        )}

        {/* TAB: Hình ảnh */}
        {tab === "images" && (
          <div className="panel">
            <h3 className="panel__subtitle">🖼️ Bộ sưu tập hình ảnh</h3>
            {!place.media ? (
              <p>⏳ Đang tải hình ảnh...</p>
            ) : place.media.filter((m) => m.kind === "image").length === 0 ? (
              <p>❌ Không có ảnh cho địa điểm này.</p>
            ) : (
              <div className="gallery">
                {place.media
                  .filter((m) => m.kind === "image")
                  .map((m) => (
                    <img
                      key={m.id}
                      className="gallery__img"
                      src={m.url}
                      alt={m.caption || place.name_vi}
                      loading="lazy"
                    />
                  ))}
              </div>
            )}
          </div>
        )}

        {/* TAB: Video */}
        {tab === "video" && (
          <div className="panel">
            <h3 className="panel__subtitle">🎬 Video tư liệu</h3>
            {place.media?.some((m) => m.kind === "video") ? (
              place.media
                .filter((m) => m.kind === "video")
                .map((m) => (
                  <video
                    key={m.id}
                    className="video"
                    src={m.url}
                    controls
                    poster={place.image_url || defaultImg}
                  />
                ))
            ) : (
              <p>🎥 Chưa có video cho địa điểm này.</p>
            )}
          </div>
        )}

        {/* TAB: Thống kê */}
        {tab === "stats" && (
          <div className="panel">
            <h3 className="panel__subtitle">📊 Thống kê nhanh</h3>
            <ul className="stats">
              <li>
                <b>Thời kỳ:</b> {place.period || "Không rõ"}
              </li>
              <li>
                <b>Số ảnh:</b>{" "}
                {place.media?.filter((m) => m.kind === "image").length || 0}
              </li>
              <li>
                <b>Video:</b>{" "}
                {place.media?.filter((m) => m.kind === "video").length || 0}
              </li>
              <li>
                <b>Wiki:</b> {place.wikipedia_url ? "Có liên kết" : "Chưa có"}
              </li>
            </ul>
            <p className="hint">
              Có thể mở rộng thêm biểu đồ thống kê bằng Chart.js hoặc dữ liệu
              thực (lượt xem, yêu thích...).
            </p>
          </div>
        )}
      </div>
    </aside>
  );
}
