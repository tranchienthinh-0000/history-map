import { useEffect, useState } from "react";
import axios from "axios";

// ✅ Dùng biến môi trường hoặc fallback port 8000
const API = import.meta.env.VITE_API || "http://localhost:8000";

/**
 * Hook tải danh sách địa điểm (GeoJSON)
 */
export default function usePlaces(period, q) {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    let cancelled = false;
    const cacheKey = `places_${period || "all"}_${q || ""}`;
    const cached = sessionStorage.getItem(cacheKey);

    // 🔁 Nếu đã cache, hiển thị tạm ngay (tránh chờ)
    if (cached) {
      try {
        setData(JSON.parse(cached));
      } catch {}
    }

    async function load() {
      setLoading(true);
      try {
        const params = {};
        if (period) params.period = period;
        if (q) params.q = q;

        const res = await axios.get(`${API}/api/places`, { params });
        const geojson = res.data;

        if (!geojson || geojson.type !== "FeatureCollection") {
          console.warn("⚠️ Dữ liệu không hợp lệ:", geojson);
          if (!cancelled)
            setData({ type: "FeatureCollection", features: [] });
          return;
        }

        // ✅ Lưu vào state + cache
        if (!cancelled) {
          setData(geojson);
          sessionStorage.setItem(cacheKey, JSON.stringify(geojson));
        }
      } catch (err) {
        console.error("❌ Lỗi tải dữ liệu:", err);
        if (!cancelled)
          setData({ type: "FeatureCollection", features: [] });
      } finally {
        setLoading(false);
      }
    }

    load();
    return () => {
      cancelled = true;
    };
  }, [period, q]);

  return { data, loading };
}
