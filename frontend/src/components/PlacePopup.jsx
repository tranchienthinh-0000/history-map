// src/components/PlacePopup.jsx
export default function PlacePopup({ name, period, summary }) {
  const shortSummary =
    summary && summary.length > 100
      ? summary.slice(0, 100) + "..."
      : summary || "Chưa có mô tả ngắn.";

  return (
    <div className="popup-content">
      <h4>{name}</h4>
      <p><b>Thời kỳ:</b> {period || "Không rõ"}</p>
      <p>{shortSummary}</p>
    </div>
  );
}
