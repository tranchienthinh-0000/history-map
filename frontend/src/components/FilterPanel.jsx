// src/components/FilterPanel.jsx
export default function FilterPanel({ period, setPeriod, q, setQ }) {
  return (
    <div className="filter-panel">
      <select value={period} onChange={(e) => setPeriod(e.target.value)}>
        <option value="">Tất cả thời kỳ</option>
        <option>Thời Hùng Vương</option>
        <option>Thời An Dương Vương</option>
        <option>Thời Lý – Trần – Lê</option>
        <option>Thời Nguyễn</option>
        <option>Kháng chiến chống Pháp</option>
        <option>Kháng chiến chống Mỹ</option>
      </select>
      <input
        type="text"
        value={q}
        placeholder="🔍 Tìm kiếm địa danh..."
        onChange={(e) => setQ(e.target.value)}
      />
    </div>
  );
}
