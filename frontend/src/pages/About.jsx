// src/pages/About.jsx
import logo from "../assets/images/logo.jpg";

export default function About() {
  return (
    <div className="about-page">
      <img src={logo} alt="HistoryMap VN" width="80" />
      <h2>Ứng dụng bản đồ số các sự kiện lịch sử Việt Nam</h2>
      <p>
        Dự án giúp người dùng khám phá các địa điểm, nhân vật và sự kiện lịch sử
        thông qua bản đồ tương tác. Khi nhấn vào từng địa điểm, bạn có thể xem
        mô tả chi tiết, hình ảnh, video và các sự kiện liên quan.
      </p>
      <p>
        Mục tiêu: <b>Số hoá dữ liệu lịch sử – Bảo tồn và lan toả giá trị văn hoá dân tộc 🇻🇳</b>
      </p>
    </div>
  );
}
