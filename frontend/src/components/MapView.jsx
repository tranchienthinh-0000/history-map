import { useEffect } from "react";
import L from "leaflet";
import "leaflet/dist/leaflet.css";

const API = import.meta.env.VITE_API || "http://localhost:8000";

export default function MapView({ data, onSelect }) {
  useEffect(() => {
    if (!data) return;

    const map = L.map("map", {
      center: [16.3, 107.6],
      zoom: 6,
      zoomControl: true,
    });

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      attribution: '&copy; OpenStreetMap contributors',
      maxZoom: 18,
    }).addTo(map);

    if (data.features?.length) {
      const geoLayer = L.geoJSON(data, {
        onEachFeature: (feature, layer) => {
          const p = feature.properties;

          layer.on("click", async () => {
            const html = `
              <div style="max-width:250px;">
                <h3 style="margin:0;color:#1e3a8a;">${p.name_vi}</h3>
                <p><b>Thời kỳ:</b> ${p.period || "Không rõ"}</p>
                <p>${p.summary || ""}</p>
              </div>
            `;
            layer.bindPopup(html).openPopup();

            // Hiển thị nhanh dữ liệu cơ bản
            onSelect?.(p);

            try {
              // Tải chi tiết địa điểm (ảnh, video...)
              const res = await fetch(`${API}/api/places/${p.id}`);
              if (!res.ok) throw new Error("Fetch error");
              const detail = await res.json();
              onSelect?.({
                ...detail.place,
                media: detail.media || [],
                events: detail.events || [],
              });
            } catch (err) {
              console.error("❌ Lỗi tải chi tiết:", err);
            }
          });
        },
        pointToLayer: (_, latlng) =>
          L.circleMarker(latlng, {
            radius: 6,
            fillColor: "#4f46e5",
            color: "#1e1b4b",
            weight: 1,
            fillOpacity: 0.9,
          }),
      }).addTo(map);

      try {
        map.fitBounds(geoLayer.getBounds(), { padding: [30, 30] });
      } catch {}
    } else {
      console.warn("⚠️ Không có dữ liệu hiển thị trên bản đồ");
    }

    return () => map.remove();
  }, [data]);

  return (
    <div
      id="map"
      className="map-container"
      style={{ width: "100%", height: "calc(100vh - 60px)" }}
    ></div>
  );
}
