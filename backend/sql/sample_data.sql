-- sample_data.sql
-- Dọn sạch dữ liệu cũ trước khi nạp mới
TRUNCATE TABLE place_events, media, events, places RESTART IDENTITY CASCADE;

BEGIN;

-- =========================
-- 1) PLACES (Miền Bắc)
-- =========================
-- (GIỮ NGUYÊN NỘI DUNG BẠN GỬI)
INSERT INTO places (name_vi, period, summary, address, wikipedia_url, geom) VALUES
('Đền Hùng', 'Thời Hùng Vương', 'Khu di tích thờ các Vua Hùng – nguồn cội dân tộc.', 'Phú Thọ',
 'https://vi.wikipedia.org/wiki/Di_t%C3%ADch_l%E1%BB%8Bch_s%E1%BB%AD_%C4%90%E1%BB%81n_H%C3%B9ng',
 ST_SetSRID(ST_MakePoint(105.2210, 21.3850), 4326)),
('Phong Châu (thành cổ)', 'Thời Hùng Vương', 'Trung tâm nước Văn Lang thời Hùng Vương.', 'Phú Thọ',
 'https://vi.wikipedia.org/wiki/Phong_Ch%C3%A2u',
 ST_SetSRID(ST_MakePoint(105.2330, 21.4000), 4326)),
('Núi Nghĩa Lĩnh', 'Thời Hùng Vương', 'Ngọn núi linh thiêng trong quần thể Đền Hùng.', 'Phú Thọ',
 'https://vi.wikipedia.org/wiki/Ngh%C4%A9a_L%C4%A9nh',
 ST_SetSRID(ST_MakePoint(105.2245, 21.3865), 4326)),
('Đền Mẫu Âu Cơ', 'Thời Hùng Vương', 'Đền thờ Quốc Mẫu Âu Cơ.', 'Phú Thọ',
 'https://vi.wikipedia.org/wiki/%C3%82u_C%C6%A1',
 ST_SetSRID(ST_MakePoint(105.2080, 21.4070), 4326));

-- Hà Nội – Âu Lạc, Lý–Trần–Lê, cận-hiện đại
INSERT INTO places (name_vi, period, summary, address, wikipedia_url, geom) VALUES
('Kinh đô Cổ Loa', 'Thời An Dương Vương', 'Kinh đô Âu Lạc với thành ốc xoáy, truyền thuyết nỏ thần.', 'Đông Anh, Hà Nội',
 'https://vi.wikipedia.org/wiki/C%E1%BB%95_Loa',
 ST_SetSRID(ST_MakePoint(105.8400, 21.1400), 4326)),
('Đền Thục Phán', 'Thời An Dương Vương', 'Đền thờ An Dương Vương tại Cổ Loa.', 'Đông Anh, Hà Nội',
 'https://vi.wikipedia.org/wiki/An_D%C6%B0%C6%A1ng_V%C6%B0%C6%A1ng',
 ST_SetSRID(ST_MakePoint(105.8330, 21.1500), 4326)),
('Hoàng thành Thăng Long', 'Thời Lý – Trần – Lê', 'Trung tâm chính trị qua nhiều triều đại, Di sản thế giới.', 'Ba Đình, Hà Nội',
 'https://vi.wikipedia.org/wiki/Ho%C3%A0ng_th%C3%A0nh_Th%C4%83ng_Long',
 ST_SetSRID(ST_MakePoint(105.841, 21.035), 4326)),
('Văn Miếu – Quốc Tử Giám', 'Thời Lý', 'Trung tâm giáo dục Nho học đầu tiên của Đại Việt.', 'Đống Đa, Hà Nội',
 'https://vi.wikipedia.org/wiki/V%C4%83n_Mi%E1%BA%BFu_-_Qu%E1%BB%91c_T%E1%BB%AD_Gi%C3%A1m',
 ST_SetSRID(ST_MakePoint(105.835, 21.027), 4326)),
('Chùa Một Cột', 'Thời Lý', 'Biểu tượng kiến trúc Phật giáo thời Lý.', 'Ba Đình, Hà Nội',
 'https://vi.wikipedia.org/wiki/Ch%C3%B9a_M%E1%BB%99t_C%E1%BB%99t',
 ST_SetSRID(ST_MakePoint(105.833, 21.035), 4326)),
('Chùa Trấn Quốc', 'Thời Lý – Trần', 'Ngôi chùa cổ bên Hồ Tây.', 'Tây Hồ, Hà Nội',
 'https://vi.wikipedia.org/wiki/Ch%C3%B9a_Tr%E1%BA%A5n_Qu%E1%BB%91c',
 ST_SetSRID(ST_MakePoint(105.832, 21.050), 4326)),
('Đông Bộ Đầu (khu bến cổ)', 'Thời Trần', 'Bến Đông Bộ Đầu – gắn với chiến công thời Trần.', 'Ven sông Hồng, Hà Nội',
 'https://vi.wikipedia.org/wiki/%C4%90%C3%B4ng_B%E1%BB%99_%C4%90%E1%BA%A7u',
 ST_SetSRID(ST_MakePoint(105.867, 21.033), 4326)),
('Hồ Hoàn Kiếm', 'Cận – Hiện đại', 'Trung tâm lịch sử – văn hóa của Thủ đô.', 'Hoàn Kiếm, Hà Nội',
 'https://vi.wikipedia.org/wiki/H%E1%BB%93_Ho%C3%A0n_Ki%E1%BA%BFm',
 ST_SetSRID(ST_MakePoint(105.852, 21.028), 4326)),
('Đền Ngọc Sơn', 'Cận – Hiện đại', 'Đền trên hồ Hoàn Kiếm – biểu tượng văn hóa Hà Nội.', 'Hoàn Kiếm, Hà Nội',
 'https://vi.wikipedia.org/wiki/%C4%90%E1%BB%81n_Ng%E1%BB%8Dc_S%C6%A1n',
 ST_SetSRID(ST_MakePoint(105.8525, 21.0290), 4326)),
('Nhà tù Hỏa Lò', 'Thời Pháp thuộc', 'Di tích về phong trào yêu nước thời thuộc địa.', 'Hoàn Kiếm, Hà Nội',
 'https://vi.wikipedia.org/wiki/Nh%C3%A0_t%C3%B9_H%E1%BB%8Fa_L%C3%B2',
 ST_SetSRID(ST_MakePoint(105.846, 21.025), 4326)),
('Quảng trường Ba Đình', 'Hiện đại', 'Nơi đọc Tuyên ngôn Độc lập 2/9/1945.', 'Ba Đình, Hà Nội',
 'https://vi.wikipedia.org/wiki/Qu%E1%BA%A3ng_tr%C6%B0%E1%BB%9Dng_Ba_%C4%90%C3%ACnh',
 ST_SetSRID(ST_MakePoint(105.835, 21.037), 4326)),
('Lăng Chủ tịch Hồ Chí Minh', 'Hiện đại', 'Công trình tưởng niệm Chủ tịch Hồ Chí Minh.', 'Ba Đình, Hà Nội',
 'https://vi.wikipedia.org/wiki/L%C4%83ng_Ch%E1%BB%A7_t%E1%BB%8Bch_H%E1%BB%93_Ch%C3%AD_Minh',
 ST_SetSRID(ST_MakePoint(105.834, 21.037), 4326));

-- Bắc Ninh – Kinh Bắc
INSERT INTO places (name_vi, period, summary, address, wikipedia_url, geom) VALUES
('Luy Lâu', 'Thời Bắc thuộc', 'Trung tâm hành chính – văn hóa lớn thời Bắc thuộc.', 'Thuận Thành, Bắc Ninh',
 'https://vi.wikipedia.org/wiki/Luy_L%C3%A2u',
 ST_SetSRID(ST_MakePoint(106.0700, 21.0630), 4326)),
('Chùa Dâu (Diên Ứng)', 'Thời Bắc thuộc', 'Ngôi chùa lâu đời gắn với Phật giáo thời Bắc thuộc.', 'Bắc Ninh',
 'https://vi.wikipedia.org/wiki/Ch%C3%B9a_D%C3%A2u',
 ST_SetSRID(ST_MakePoint(106.070, 21.061), 4326)),
('Chùa Bút Tháp', 'Thời Lê', 'Nổi tiếng với tượng Quan Âm nghìn mắt nghìn tay.', 'Thuận Thành, Bắc Ninh',
 'https://vi.wikipedia.org/wiki/Ch%C3%B9a_B%C3%BAt_Th%C3%A1p',
 ST_SetSRID(ST_MakePoint(106.063, 21.077), 4326)),
('Đền Đô', 'Thời Lý', 'Đền thờ 8 vị vua nhà Lý.', 'Từ Sơn, Bắc Ninh',
 'https://vi.wikipedia.org/wiki/%C4%90%E1%BB%81n_%C4%90%C3%B4',
 ST_SetSRID(ST_MakePoint(105.965, 21.137), 4326));

-- Quảng Ninh – Hải Phòng – Bạch Đằng
INSERT INTO places (name_vi, period, summary, address, wikipedia_url, geom) VALUES
('Bạch Đằng (cửa sông, 938)', 'Thời Ngô', 'Ngô Quyền phá quân Nam Hán năm 938.', 'Quảng Ninh – Hải Phòng',
 'https://vi.wikipedia.org/wiki/Tr%E1%BA%ADn_B%E1%BA%A1ch_%C4%90%E1%BA%B1ng_(938)',
 ST_SetSRID(ST_MakePoint(106.8160, 20.9130), 4326)),
('Bạch Đằng (1288)', 'Thời Trần', 'Trần Hưng Đạo đánh bại quân Nguyên Mông (1288).', 'Quảng Ninh – Hải Phòng',
 'https://vi.wikipedia.org/wiki/Tr%E1%BA%ADn_B%E1%BA%A1ch_%C4%90%E1%BA%B1ng_(1288)',
 ST_SetSRID(ST_MakePoint(106.800, 20.930), 4326));

-- Lạng Sơn – Ải Chi Lăng
INSERT INTO places (name_vi, period, summary, address, wikipedia_url, geom) VALUES
('Ải Chi Lăng', 'Thời Lê sơ', 'Nơi tiêu diệt Liễu Thăng (1427).', 'Lạng Sơn',
 'https://vi.wikipedia.org/wiki/%E1%BA%A2i_Chi_L%C4%83ng',
 ST_SetSRID(ST_MakePoint(106.5625, 21.7585), 4326));

-- Ninh Bình – Hoa Lư
INSERT INTO places (name_vi, period, summary, address, wikipedia_url, geom) VALUES
('Hoa Lư', 'Thời Đinh – Tiền Lê', 'Kinh đô đầu tiên của nhà nước phong kiến tập quyền.', 'Ninh Bình',
 'https://vi.wikipedia.org/wiki/Hoa_L%C6%B0',
 ST_SetSRID(ST_MakePoint(105.9440, 20.2540), 4326)),
('Đền Lê Hoàn', 'Thời Tiền Lê', 'Đền thờ Lê Đại Hành – vua mở cõi, chống Tống.', 'Ninh Bình',
 'https://vi.wikipedia.org/wiki/L%C3%AA_%C4%90%E1%BA%A1i_H%C3%A0nh',
 ST_SetSRID(ST_MakePoint(105.9500, 20.2550), 4326));

-- Thanh Hóa – Lam Kinh, Thành nhà Hồ
INSERT INTO places (name_vi, period, summary, address, wikipedia_url, geom) VALUES
('Lam Kinh', 'Thời Lê sơ', 'Kinh đô nhà Hậu Lê – lăng tẩm các vua Lê.', 'Thanh Hóa',
 'https://vi.wikipedia.org/wiki/Lam_Kinh',
 ST_SetSRID(ST_MakePoint(105.350, 19.933), 4326)),
('Thành nhà Hồ', 'Thời Hồ', 'Di sản thế giới với kiến trúc đá độc đáo.', 'Thanh Hóa',
 'https://vi.wikipedia.org/wiki/Th%C3%A0nh_nh%C3%A0_H%E1%BB%93',
 ST_SetSRID(ST_MakePoint(105.612, 19.822), 4326));

-- Thái Nguyên – Tuyên Quang – Cao Bằng – ATK
INSERT INTO places (name_vi, period, summary, address, wikipedia_url, geom) VALUES
('ATK Định Hóa', 'Kháng chiến chống Pháp', 'Khu căn cứ an toàn kháng chiến Việt Bắc.', 'Thái Nguyên',
 'https://vi.wikipedia.org/wiki/ATK_%C4%90%E1%BB%8Bnh_H%C3%B3a',
 ST_SetSRID(ST_MakePoint(105.650, 21.780), 4326)),
('Tân Trào', 'Kháng chiến chống Pháp', 'Thủ đô khu giải phóng, nơi họp Quốc dân Đại hội (1945).', 'Tuyên Quang',
 'https://vi.wikipedia.org/wiki/T%C3%A2n_Tr%C3%A0o',
 ST_SetSRID(ST_MakePoint(105.228, 21.961), 4326)),
('Pác Bó', 'Cận – Hiện đại', 'Nơi Bác Hồ sống và hoạt động đầu 1941.', 'Cao Bằng',
 'https://vi.wikipedia.org/wiki/P%C3%A1c_B%C3%B3',
 ST_SetSRID(ST_MakePoint(105.873, 22.833), 4326));

-- Điện Biên – Chiến dịch 1954
INSERT INTO places (name_vi, period, summary, address, wikipedia_url, geom) VALUES
('Điện Biên Phủ – Đồi A1', 'Kháng chiến chống Pháp', 'Cứ điểm quan trọng của tập đoàn cứ điểm Điện Biên Phủ.', 'Điện Biên',
 'https://vi.wikipedia.org/wiki/Chi%E1%BA%BFn_d%E1%BB%8Bch_%C4%90i%E1%BB%87n_Bi%C3%AAn_Ph%E1%BB%A7',
 ST_SetSRID(ST_MakePoint(103.023, 21.386), 4326)),
('Sở chỉ huy Mường Phăng', 'Kháng chiến chống Pháp', 'Sở chỉ huy chiến dịch của Đại tướng Võ Nguyên Giáp.', 'Điện Biên',
 'https://vi.wikipedia.org/wiki/M%C6%B0%E1%BB%9Dng_Ph%C4%83ng',
 ST_SetSRID(ST_MakePoint(103.210, 21.408), 4326));

-- =========================
-- 2) EVENTS (Miền Bắc + quốc gia)
-- =========================
-- (GIỮ NGUYÊN)
INSERT INTO events (title_vi, title_en, year_from, year_to, description) VALUES
('Ngô Quyền phá quân Nam Hán trên sông Bạch Đằng', 'Battle of Bach Dang (938)', 938, 938,
 'Chiến thắng chấm dứt ách đô hộ phương Bắc, mở đầu thời kỳ độc lập.'),
('Lý Công Uẩn dời đô về Thăng Long', 'Capital moved to Thang Long (1010)', 1010, 1010,
 'Mở ra thời kỳ phát triển rực rỡ của Đại Việt.'),
('Chiến thắng Bạch Đằng (1288)', 'Battle of Bach Dang (1288)', 1288, 1288,
 'Trần Hưng Đạo đánh bại quân Nguyên Mông lần thứ ba.'),
('Quốc dân Đại hội Tân Trào', 'Tan Trao National Congress', 1945, 1945,
 'Sự kiện quyết định Tổng khởi nghĩa Tháng Tám 1945.'),
('Chiến dịch Điện Biên Phủ', 'Battle of Dien Bien Phu', 1954, 1954,
 'Chiến thắng quyết định, chấm dứt chiến tranh Đông Dương.'),
('Quốc khánh 2/9 tại Ba Đình', 'Proclamation of Independence', 1945, 1945,
 'Chủ tịch Hồ Chí Minh đọc Tuyên ngôn Độc lập, khai sinh nước Việt Nam Dân chủ Cộng hòa.');

-- =========================
-- 3) PLACE_EVENTS (liên kết tiêu biểu)
-- =========================
-- (GIỮ NGUYÊN)
INSERT INTO place_events (place_id, event_id)
SELECT p.id, e.id FROM places p
JOIN events e ON (
  (p.name_vi LIKE 'Bạch Đằng (cửa sông, 938)%' AND e.title_vi LIKE 'Ngô Quyền phá%')
  OR (p.name_vi = 'Hoàng thành Thăng Long' AND e.title_vi LIKE 'Lý Công Uẩn dời đô%')
  OR (p.name_vi = 'Bạch Đằng (1288)' AND e.title_vi LIKE 'Chiến thắng Bạch Đằng (1288)%')
  OR (p.name_vi = 'Tân Trào' AND e.title_vi LIKE 'Quốc dân Đại hội Tân Trào%')
  OR (p.name_vi LIKE 'Điện Biên Phủ – Đồi A1' AND e.title_vi LIKE 'Chiến dịch Điện Biên Phủ%')
  OR (p.name_vi = 'Quảng trường Ba Đình' AND e.title_vi LIKE 'Quốc khánh 2/9%')
);

-- =========================
-- 4) MEDIA (Miền Bắc) — BỔ SUNG ẢNH CHO TẤT CẢ CÁC ĐIỂM TRONG VÙNG NÀY
-- =========================
WITH m(name_vi, url, caption) AS (
  VALUES
  ('Đền Hùng','https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Den_Hung_-_Phu_Tho.jpg/640px-Den_Hung_-_Phu_Tho.jpg','Đền Hùng (Wikimedia)'),
  ('Phong Châu (thành cổ)','https://via.placeholder.com/640x400?text=Phong+Ch%C3%A2u','Phong Châu (placeholder)'),
  ('Núi Nghĩa Lĩnh','https://via.placeholder.com/640x400?text=Nghia+Linh','Nghĩa Lĩnh (placeholder)'),
  ('Đền Mẫu Âu Cơ','https://via.placeholder.com/640x400?text=%C4%90%E1%BB%81n+M%E1%BA%ABu+%C3%82u+C%C6%A1','Đền Mẫu Âu Cơ (placeholder)'),

  ('Kinh đô Cổ Loa','https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Co_Loa_Citadel.jpg/640px-Co_Loa_Citadel.jpg','Kinh đô Cổ Loa (Wikimedia)'),
  ('Đền Thục Phán','https://via.placeholder.com/640x400?text=%C4%90%E1%BB%81n+Th%E1%BB%A5c+Ph%C3%A1n','Đền Thục Phán (placeholder)'),
  ('Hoàng thành Thăng Long','https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Hoang_thanh_Thang_Long.jpg/640px-Hoang_thanh_Thang_Long.jpg','Hoàng thành Thăng Long (Wikimedia)'),
  ('Văn Miếu – Quốc Tử Giám','https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Temple_of_Literature_Hanoi.jpg/640px-Temple_of_Literature_Hanoi.jpg','Văn Miếu – Quốc Tử Giám (Wikimedia)'),
  ('Chùa Một Cột','https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/One_Pillar_Pagoda.jpg/640px-One_Pillar_Pagoda.jpg','Chùa Một Cột (Wikimedia)'),
  ('Chùa Trấn Quốc','https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Tran_Quoc_Pagoda%2C_Hanoi.jpg/640px-Tran_Quoc_Pagoda%2C_Hanoi.jpg','Chùa Trấn Quốc (Wikimedia)'),
  ('Đông Bộ Đầu (khu bến cổ)','https://via.placeholder.com/640x400?text=%C4%90%C3%B4ng+B%E1%BB%99+%C4%90%E1%BA%A7u','Đông Bộ Đầu (placeholder)'),
  ('Hồ Hoàn Kiếm','https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Hoan_Kiem_Lake%2C_Hanoi.jpg/640px-Hoan_Kiem_Lake%2C_Hanoi.jpg','Hồ Hoàn Kiếm (Wikimedia)'),
  ('Đền Ngọc Sơn','https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Ngoc_Son_Temple%2C_Hanoi.jpg/640px-Ngoc_Son_Temple%2C_Hanoi.jpg','Đền Ngọc Sơn (Wikimedia)'),
  ('Nhà tù Hỏa Lò','https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Hoa_Lo_Prison.jpg/640px-Hoa_Lo_Prison.jpg','Nhà tù Hỏa Lò (Wikimedia)'),
  ('Quảng trường Ba Đình','https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Quangtruongbadinh.jpg/640px-Quangtruongbadinh.jpg','Quảng trường Ba Đình (Wikimedia)'),
  ('Lăng Chủ tịch Hồ Chí Minh','https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Ho_Chi_Minh_Mausoleum.jpg/640px-Ho_Chi_Minh_Mausoleum.jpg','Lăng Chủ tịch Hồ Chí Minh (Wikimedia)'),

  ('Luy Lâu','https://via.placeholder.com/640x400?text=Luy+L%C3%A2u','Luy Lâu (placeholder)'),
  ('Chùa Dâu (Diên Ứng)','https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Chua_Dau_Bac_Ninh.jpg/640px-Chua_Dau_Bac_Ninh.jpg','Chùa Dâu (Wikimedia)'),
  ('Chùa Bút Tháp','https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/But_Thap_Pagoda.jpg/640px-But_Thap_Pagoda.jpg','Chùa Bút Tháp (Wikimedia)'),
  ('Đền Đô','https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Den_Do_Bac_Ninh.jpg/640px-Den_Do_Bac_Ninh.jpg','Đền Đô (Wikimedia)'),

  ('Bạch Đằng (cửa sông, 938)','https://via.placeholder.com/640x400?text=B%E1%BA%A1ch+%C4%90%E1%BA%B1ng+938','Bạch Đằng 938 (placeholder)'),
  ('Bạch Đằng (1288)','https://via.placeholder.com/640x400?text=B%E1%BA%A1ch+%C4%90%E1%BA%B1ng+1288','Bạch Đằng 1288 (placeholder)'),

  ('Ải Chi Lăng','https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Chi_Lang_Pass.jpg/640px-Chi_Lang_Pass.jpg','Ải Chi Lăng (Wikimedia)'),

  ('Hoa Lư','https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Hoa_Lu_Entrance.jpg/640px-Hoa_Lu_Entrance.jpg','Cố đô Hoa Lư (Wikimedia)'),
  ('Đền Lê Hoàn','https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Le_Dai_Hanh_Temple.jpg/640px-Le_Dai_Hanh_Temple.jpg','Đền Lê Hoàn (Wikimedia)'),

  ('Lam Kinh','https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Lam_Kinh_Temple.jpg/640px-Lam_Kinh_Temple.jpg','Khu di tích Lam Kinh (Wikimedia)'),
  ('Thành nhà Hồ','https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Ho_Citadel_Gate.jpg/640px-Ho_Citadel_Gate.jpg','Thành nhà Hồ (Wikimedia)'),

  ('ATK Định Hóa','https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/ATK_Dinh_Hoa.jpg/640px-ATK_Dinh_Hoa.jpg','ATK Định Hóa (Wikimedia)'),
  ('Tân Trào','https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Tan_Trao_Temple.jpg/640px-Tan_Trao_Temple.jpg','Tân Trào (Wikimedia)'),
  ('Pác Bó','https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Pac_Bo_Cave.jpg/640px-Pac_Bo_Cave.jpg','Pác Bó (Wikimedia)'),

  ('Điện Biên Phủ – Đồi A1','https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Dien_Bien_Phu_A1_hill.jpg/640px-Dien_Bien_Phu_A1_hill.jpg','Đồi A1 – Điện Biên (Wikimedia)'),
  ('Sở chỉ huy Mường Phăng','https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Muong_Phang_Command.jpg/640px-Muong_Phang_Command.jpg','Sở chỉ huy Mường Phăng (Wikimedia)')
)
INSERT INTO media (place_id, kind, url, caption)
SELECT p.id, 'image', m.url, m.caption
FROM m
JOIN places p ON p.name_vi = m.name_vi;

COMMIT;

BEGIN;

-- =========================
-- 1) MIỀN TRUNG (39 địa điểm)
-- =========================
-- (GIỮ NGUYÊN NỘI DUNG BẠN GỬI)
INSERT INTO places (name_vi, period, summary, address, wikipedia_url, geom) VALUES
('Kinh thành Huế', 'Thời Nguyễn', 'Trung tâm chính trị – văn hoá triều Nguyễn, Di sản thế giới.', 'Thừa Thiên Huế',
 'https://vi.wikipedia.org/wiki/Qu%E1%BA%A7n_th%E1%BB%83_di_t%C3%ADch_c%E1%BB%91_%C4%91%E1%BB%93_Hu%E1%BA%BF',
 ST_SetSRID(ST_MakePoint(107.574, 16.469), 4326)),
('Hoàng thành Huế', 'Thời Nguyễn', 'Khu vực trọng yếu bên trong Kinh thành Huế.', 'Thừa Thiên Huế',
 'https://vi.wikipedia.org/wiki/Ho%C3%A0ng_th%C3%A0nh_Hu%E1%BA%BF',
 ST_SetSRID(ST_MakePoint(107.579, 16.471), 4326)),
('Chùa Thiên Mụ', 'Thời Nguyễn', 'Ngôi chùa cổ bên sông Hương, biểu tượng xứ Huế.', 'Thừa Thiên Huế',
 'https://vi.wikipedia.org/wiki/Ch%C3%B9a_Thi%C3%AAn_M%E1%BB%A5',
 ST_SetSRID(ST_MakePoint(107.563, 16.457), 4326)),
('Lăng Minh Mạng', 'Thời Nguyễn', 'Quần thể lăng tẩm bề thế giữa hồ nước, rừng cây.', 'Thừa Thiên Huế',
 'https://vi.wikipedia.org/wiki/L%C4%83ng_Minh_M%E1%BA%A1ng',
 ST_SetSRID(ST_MakePoint(107.586, 16.391), 4326)),
('Lăng Tự Đức', 'Thời Nguyễn', 'Lăng tẩm nên thơ giữa rừng thông.', 'Thừa Thiên Huế',
 'https://vi.wikipedia.org/wiki/L%C4%83ng_T%E1%BB%B1_%C4%90%E1%BB%A9c',
 ST_SetSRID(ST_MakePoint(107.584, 16.432), 4326)),
('Lăng Khải Định', 'Thời Nguyễn', 'Kiến trúc giao thoa Đông – Tây độc đáo.', 'Thừa Thiên Huế',
 'https://vi.wikipedia.org/wiki/L%C4%83ng_Kh%E1%BA%A3i_%C4%90%E1%BB%8Bnh',
 ST_SetSRID(ST_MakePoint(107.584, 16.398), 4326)),
('Phố cổ Hội An', 'Thời Lê – Nguyễn', 'Đô thị thương cảng cổ, Di sản thế giới.', 'Quảng Nam',
 'https://vi.wikipedia.org/wiki/H%E1%BB%99i_An',
 ST_SetSRID(ST_MakePoint(108.327, 15.880), 4326)),
('Khu đền tháp Mỹ Sơn', 'Thời Chăm Pa', 'Thánh địa của vương quốc Chăm Pa, Di sản thế giới.', 'Quảng Nam',
 'https://vi.wikipedia.org/wiki/M%E1%BB%B9_S%C6%A1n',
 ST_SetSRID(ST_MakePoint(108.123, 15.774), 4326)),
('Cù Lao Chàm', 'Cận – Hiện đại', 'Khu dự trữ sinh quyển, cảnh quan biển đảo đẹp.', 'Quảng Nam',
 'https://vi.wikipedia.org/wiki/C%C3%B9_Lao_Ch%C3%A0m',
 ST_SetSRID(ST_MakePoint(108.510, 15.912), 4326)),
('Bảo tàng Điêu khắc Chăm', 'Cận – Hiện đại', 'Sưu tập hiện vật Chăm Pa lớn nhất.', 'Đà Nẵng',
 'https://vi.wikipedia.org/wiki/B%E1%BA%A3o_t%C3%A0ng_%C4%90i%E1%BB%81u_kh%E1%BA%AFc_Ch%C4%83m_%C4%90%C3%A0_N%E1%BA%B5ng',
 ST_SetSRID(ST_MakePoint(108.223, 16.061), 4326)),
('Ngũ Hành Sơn', 'Tự nhiên – Văn hoá', 'Cụm núi đá vôi và hệ thống chùa hang nổi tiếng.', 'Đà Nẵng',
 'https://vi.wikipedia.org/wiki/Ng%C5%A9_H%C3%A0nh_S%C6%A1n',
 ST_SetSRID(ST_MakePoint(108.258, 16.003), 4326)),
('Bán đảo Sơn Trà', 'Tự nhiên', 'Khu bảo tồn thiên nhiên ven biển của Đà Nẵng.', 'Đà Nẵng',
 'https://vi.wikipedia.org/wiki/B%C3%A1n_%C4%91%E1%BA%A3o_S%C6%A1n_Tr%C3%A0',
 ST_SetSRID(ST_MakePoint(108.269, 16.120), 4326)),
('Phong Nha – Kẻ Bàng', 'Tự nhiên', 'Di sản thiên nhiên thế giới với hệ thống hang động.', 'Quảng Bình',
 'https://vi.wikipedia.org/wiki/V%C6%B0%E1%BB%9Dn_qu%E1%BB%91c_gia_Phong_Nha_-_K%E1%BA%BB_B%C3%A0ng',
 ST_SetSRID(ST_MakePoint(106.274, 17.536), 4326)),
('Hang Sơn Đoòng (vùng Phong Nha)', 'Tự nhiên', 'Hang động lớn hàng đầu thế giới.', 'Quảng Bình',
 'https://vi.wikipedia.org/wiki/Hang_S%C6%A1n_%C4%90o%C3%B2ng',
 ST_SetSRID(ST_MakePoint(106.287, 17.456), 4326)),
('Thành cổ Quảng Trị', 'Cận – Hiện đại', 'Trận chiến ác liệt năm 1972, di tích tưởng niệm.', 'Quảng Trị',
 'https://vi.wikipedia.org/wiki/Th%C3%A0nh_c%E1%BB%95_Qu%E1%BA%A3ng_Tr%E1%BB%8B',
 ST_SetSRID(ST_MakePoint(107.185, 16.751), 4326)),
('Cầu Hiền Lương – Sông Bến Hải', 'Cận – Hiện đại', 'Ranh giới phi quân sự vĩ tuyến 17 trước 1975.', 'Quảng Trị',
 'https://vi.wikipedia.org/wiki/C%E1%BA%A7u_Hi%E1%BB%81n_L%C6%B0%C6%A1ng',
 ST_SetSRID(ST_MakePoint(107.091, 17.002), 4326)),
('Kim Liên – Quê Bác', 'Cận – Hiện đại', 'Khu di tích quê hương Chủ tịch Hồ Chí Minh.', 'Nghệ An',
 'https://vi.wikipedia.org/wiki/Kim_Li%C3%AAn_(x%C3%A3)',
 ST_SetSRID(ST_MakePoint(105.536, 18.688), 4326)),
('Làng Sen – Làng Hoàng Trù', 'Cận – Hiện đại', 'Quần thể di tích gắn với tuổi thơ Bác Hồ.', 'Nghệ An',
 'https://vi.wikipedia.org/wiki/Ho%C3%A0ng_Tr%C3%B9',
 ST_SetSRID(ST_MakePoint(105.598, 18.686), 4326)),
('Khu chứng tích Sơn Mỹ', 'Cận – Hiện đại', 'Tưởng niệm vụ thảm sát Mỹ Lai 1968.', 'Quảng Ngãi',
 'https://vi.wikipedia.org/wiki/Th%E1%BA%A3m_s%C3%A1t_M%E1%BB%B9_Lai',
 ST_SetSRID(ST_MakePoint(108.899, 15.275), 4326)),
('Đảo Lý Sơn', 'Tự nhiên – Văn hoá', 'Huyện đảo núi lửa, văn hoá Hoàng Sa.', 'Quảng Ngãi',
 'https://vi.wikipedia.org/wiki/L%C3%BD_S%C6%A1n',
 ST_SetSRID(ST_MakePoint(109.095, 15.383), 4326)),
('Tháp Bánh Ít', 'Thời Chăm Pa', 'Cụm tháp Chăm nổi tiếng Bình Định.', 'Bình Định',
 'https://vi.wikipedia.org/wiki/Th%C3%A1p_B%C3%A1nh_%C3%8Dt',
 ST_SetSRID(ST_MakePoint(109.104, 13.807), 4326)),
('Tháp Đôi Quy Nhơn', 'Thời Chăm Pa', 'Di tích tháp Chăm giữa lòng thành phố.', 'Bình Định',
 'https://vi.wikipedia.org/wiki/Th%C3%A1p_%C4%90%C3%B4i_(B%C3%ACnh_%C4%90%E1%BB%8Bnh)',
 ST_SetSRID(ST_MakePoint(109.224, 13.776), 4326)),
('Bảo tàng Quang Trung – Tây Sơn', 'Thời Tây Sơn', 'Khu tưởng niệm và trưng bày về nhà Tây Sơn.', 'Bình Định',
 'https://vi.wikipedia.org/wiki/B%E1%BA%A3o_t%C3%A0ng_Quang_Trung',
 ST_SetSRID(ST_MakePoint(108.900, 13.955), 4326)),
('Gành Đá Đĩa', 'Tự nhiên', 'Kỳ quan địa chất với cột đá bazan xếp lớp.', 'Phú Yên',
 'https://vi.wikipedia.org/wiki/G%E1%BB%81nh_%C4%90%C3%A1_%C4%90%C4%A9a',
 ST_SetSRID(ST_MakePoint(109.286, 13.426), 4326)),
('Tháp Bà Po Nagar', 'Thời Chăm Pa', 'Đền tháp linh thiêng của người Chăm.', 'Khánh Hòa',
 'https://vi.wikipedia.org/wiki/Th%C3%A1p_B%C3%A0_Po_Nagar',
 ST_SetSRID(ST_MakePoint(109.196, 12.265), 4326)),
('Thành Diên Khánh', 'Thời Nguyễn', 'Thành đất kiểu Vauban hiếm ở Việt Nam.', 'Khánh Hòa',
 'https://vi.wikipedia.org/wiki/Th%C3%A0nh_Di%C3%AAn_Kh%C3%A1nh',
 ST_SetSRID(ST_MakePoint(109.111, 12.245), 4326)),
('Hòn Chồng – Nha Trang', 'Tự nhiên', 'Cụm đá granit và danh thắng biển.', 'Khánh Hòa',
 'https://vi.wikipedia.org/wiki/H%C3%B2n_Ch%E1%BB%93ng',
 ST_SetSRID(ST_MakePoint(109.208, 12.279), 4326)),
('Tháp Po Klong Garai', 'Thời Chăm Pa', 'Cụm tháp Chăm lớn ở Phan Rang.', 'Ninh Thuận',
 'https://vi.wikipedia.org/wiki/Po_Klong_Garai',
 ST_SetSRID(ST_MakePoint(108.980, 11.580), 4326)),
('Vịnh Vĩnh Hy', 'Tự nhiên', 'Vịnh nhỏ đẹp, rạn san hô, biển xanh.', 'Ninh Thuận',
 'https://vi.wikipedia.org/wiki/V%E1%BB%8Bnh_V%C4%A9nh_Hy',
 ST_SetSRID(ST_MakePoint(109.235, 11.757), 4326)),
('Tháp Po Sah Inu', 'Thời Chăm Pa', 'Cụm tháp trên đồi Bà Nài gần Phan Thiết.', 'Bình Thuận',
 'https://vi.wikipedia.org/wiki/Th%C3%A1p_Po_Sah_Inu',
 ST_SetSRID(ST_MakePoint(108.091, 10.923), 4326)),
('Trường Dục Thanh', 'Cận – Hiện đại', 'Nơi Bác Hồ từng dạy học năm 1910–1911.', 'Bình Thuận',
 'https://vi.wikipedia.org/wiki/Tr%C6%B0%E1%BB%9Dng_D%E1%BB%A5c_Thanh',
 ST_SetSRID(ST_MakePoint(108.101, 10.937), 4326)),
('Nhà thờ gỗ Kon Tum', 'Cận – Hiện đại', 'Nhà thờ gỗ trăm năm, phong cách Roman – bản địa.', 'Kon Tum',
 'https://vi.wikipedia.org/wiki/Nh%C3%A0_th%E1%BB%9D_g%E1%BB%97_Kon_Tum',
 ST_SetSRID(ST_MakePoint(107.989, 14.354), 4326)),
('Làng văn hoá Kon Klor – Nhà rông', 'Văn hoá Tây Nguyên', 'Không gian nhà rông, cồng chiêng, cầu treo Kon Klor.', 'Kon Tum',
 'https://vi.wikipedia.org/wiki/Kon_Tum',
 ST_SetSRID(ST_MakePoint(107.987, 14.364), 4326)),
('Biển Hồ (T''Nưng)', 'Tự nhiên', 'Hồ núi lửa huyền thoại của phố núi Pleiku.', 'Gia Lai',
 'https://vi.wikipedia.org/wiki/Bi%E1%BB%83n_H%E1%BB%93_Pleiku',
 ST_SetSRID(ST_MakePoint(108.017, 13.993), 4326)),
('Thuỷ điện Yaly', 'Cận – Hiện đại', 'Công trình thuỷ điện lớn trên sông Sê San.', 'Gia Lai – Kon Tum',
 'https://vi.wikipedia.org/wiki/Th%E1%BB%A7y_%C4%91i%E1%BB%87n_Yaly',
 ST_SetSRID(ST_MakePoint(107.950, 14.248), 4326)),
('Buôn Đôn', 'Văn hoá Tây Nguyên', 'Không gian văn hoá săn voi, nhà dài Êđê – M''Nông.', 'Đắk Lắk',
 'https://vi.wikipedia.org/wiki/Bu%C3%B4n_%C4%90%C3%B4n',
 ST_SetSRID(ST_MakePoint(107.792, 12.792), 4326)),
('Thác Dray Nur', 'Tự nhiên', 'Thác lớn hùng vĩ trên sông Sêrêpốk.', 'Đắk Lắk',
 'https://vi.wikipedia.org/wiki/Th%C3%A1c_Dray_Nur',
 ST_SetSRID(ST_MakePoint(107.827, 12.524), 4326)),
('Cố đô Trà Kiệu', 'Thời Chăm Pa', 'Di chỉ Chăm Pa và giáo phận cổ.', 'Quảng Nam',
 'https://vi.wikipedia.org/wiki/Tr%C3%A0_Ki%E1%BB%87u',
 ST_SetSRID(ST_MakePoint(108.145, 15.745), 4326)),
('Cửa Tùng – Cửa Việt', 'Tự nhiên – Lịch sử', 'Cửa biển gắn với tuyến hậu cần thời chiến.', 'Quảng Trị',
 'https://vi.wikipedia.org/wiki/C%E1%BB%ADa_T%C3%B9ng',
 ST_SetSRID(ST_MakePoint(107.100, 17.057), 4326));

-- =========================
-- 2) MIỀN NAM (29 địa điểm)
-- =========================
-- (GIỮ NGUYÊN NỘI DUNG BẠN GỬI)
INSERT INTO places (name_vi, period, summary, address, wikipedia_url, geom) VALUES
('Dinh Độc Lập', 'Cận – Hiện đại', 'Dinh Thống Nhất – chứng tích lịch sử 30/4/1975.', 'TP.HCM',
 'https://vi.wikipedia.org/wiki/Dinh_%C4%90%E1%BB%99c_L%E1%BA%ADp',
 ST_SetSRID(ST_MakePoint(106.695, 10.777), 4326)),
('Bưu điện Trung tâm Sài Gòn', 'Thời Pháp thuộc', 'Công trình kiến trúc Pháp tiêu biểu.', 'TP.HCM',
 'https://vi.wikipedia.org/wiki/B%C6%B0u_%C4%91i%E1%BB%87n_Trung_t%C3%A2m_S%C3%A0i_G%C3%B2n',
 ST_SetSRID(ST_MakePoint(106.700, 10.780), 4326)),
('Nhà thờ Đức Bà Sài Gòn', 'Thời Pháp thuộc', 'Vương cung Thánh đường – biểu tượng Sài Gòn.', 'TP.HCM',
 'https://vi.wikipedia.org/wiki/Nh%C3%A0_th%E1%BB%9D_%C4%90%E1%BB%A9c_B%C3%A0_S%C3%A0i_G%C3%B2n',
 ST_SetSRID(ST_MakePoint(106.700, 10.779), 4326)),
('Bảo tàng Chứng tích Chiến tranh', 'Cận – Hiện đại', 'Trưng bày về chiến tranh Việt Nam.', 'TP.HCM',
 'https://vi.wikipedia.org/wiki/B%E1%BA%A3o_t%C3%A0ng_Ch%E1%BB%A9ng_t%C3%ADch_chi%E1%BA%BFn_tranh',
 ST_SetSRID(ST_MakePoint(106.695, 10.779), 4326)),
('Chợ Bến Thành', 'Cận – Hiện đại', 'Ngôi chợ lịch sử – biểu tượng thương mại.', 'TP.HCM',
 'https://vi.wikipedia.org/wiki/Ch%E1%BB%A3_B%E1%BA%BFn_Th%C3%A0nh',
 ST_SetSRID(ST_MakePoint(106.698, 10.772), 4326)),
('Địa đạo Củ Chi', 'Kháng chiến chống Mỹ', 'Hệ thống địa đạo chiến tranh nổi tiếng.', 'TP.HCM',
 'https://vi.wikipedia.org/wiki/%C4%90%E1%BB%8Ba_%C4%91%E1%BA%A1o_C%E1%BB%A7_Chi',
 ST_SetSRID(ST_MakePoint(106.496, 11.146), 4326)),
('Bến Nhà Rồng', 'Cận – Hiện đại', 'Nơi Bác Hồ ra đi tìm đường cứu nước (1911).', 'TP.HCM',
 'https://vi.wikipedia.org/wiki/B%E1%BA%BFn_Nh%C3%A0_R%E1%BB%93ng',
 ST_SetSRID(ST_MakePoint(106.707, 10.769), 4326)),
('Hầm Thủ Thiêm (khu vực)', 'Hiện đại', 'Hầm vượt sông Sài Gòn – điểm nhấn đô thị.', 'TP.HCM',
 'https://vi.wikipedia.org/wiki/H%E1%BA%A7m_Th%E1%BB%A7_Thi%C3%AAm',
 ST_SetSRID(ST_MakePoint(106.713, 10.767), 4326)),
('Tòa Thánh Cao Đài Tây Ninh', 'Tôn giáo – Tín ngưỡng', 'Trung tâm đạo Cao Đài.', 'Tây Ninh',
 'https://vi.wikipedia.org/wiki/T%C3%B2a_Th%C3%A1nh_Cao_%C4%90%C3%A0i_T%C3%A2y_Ninh',
 ST_SetSRID(ST_MakePoint(106.223, 11.354), 4326)),
('Núi Bà Đen', 'Tự nhiên – Tín ngưỡng', 'Nóc nhà Nam Bộ, quần thể tâm linh.', 'Tây Ninh',
 'https://vi.wikipedia.org/wiki/N%C3%BAi_B%C3%A0_%C4%90en',
 ST_SetSRID(ST_MakePoint(106.230, 11.362), 4326)),
('Chiến khu D', 'Kháng chiến chống Mỹ', 'Căn cứ cách mạng trên địa bàn Đồng Nai – Bình Dương.', 'Đồng Nai',
 'https://vi.wikipedia.org/wiki/Chi%E1%BA%BFn_khu_D',
 ST_SetSRID(ST_MakePoint(106.991, 11.213), 4326)),
('Khu di tích Đá Ba Chồng', 'Văn hoá – Địa chất', 'Cụm đá tự nhiên kỳ thú ở Xuân Lộc.', 'Đồng Nai',
 'https://vi.wikipedia.org/wiki/%C4%90%C3%A1_Ba_Ch%E1%BB%93ng',
 ST_SetSRID(ST_MakePoint(107.181, 11.165), 4326)),
('Sóc Bom Bo', 'Kháng chiến chống Mỹ', 'Biểu tượng tinh thần kháng chiến S’tiêng.', 'Bình Phước',
 'https://vi.wikipedia.org/wiki/S%C3%B3c_Bom_Bo',
 ST_SetSRID(ST_MakePoint(106.849, 11.728), 4326)),
('Vàm Nhựt Tảo', 'Cận – Hiện đại', 'Di tích gắn với nghĩa quân Nguyễn Trung Trực.', 'Long An',
 'https://vi.wikipedia.org/wiki/V%C3%A0m_Nh%E1%BB%B1t_T%E1%BA%A3o',
 ST_SetSRID(ST_MakePoint(106.495, 10.589), 4326)),
('Chợ nổi Cái Bè', 'Văn hoá sông nước', 'Chợ nổi đặc trưng miền Tây.', 'Tiền Giang',
 'https://vi.wikipedia.org/wiki/C%E1%BA%A3i_B%C3%A8',
 ST_SetSRID(ST_MakePoint(106.058, 10.336), 4326)),
('Trại rắn Đồng Tâm', 'Văn hoá – Khoa học', 'Cơ sở nuôi – nghiên cứu rắn lớn.', 'Tiền Giang',
 'https://vi.wikipedia.org/wiki/Tr%E1%BA%A1i_r%E1%BA%AFn_%C4%90%E1%BB%93ng_T%C3%A2m',
 ST_SetSRID(ST_MakePoint(106.358, 10.315), 4326)),
('Cồn Phụng', 'Văn hoá – Du lịch', 'Cồn trên sông Tiền, di tích Đạo Dừa.', 'Bến Tre',
 'https://vi.wikipedia.org/wiki/C%E1%BB%93n_Ph%E1%BB%A5ng',
 ST_SetSRID(ST_MakePoint(106.373, 10.340), 4326)),
('Văn Thánh Miếu Vĩnh Long', 'Văn hoá', 'Di tích Nho học ở miền Tây Nam Bộ.', 'Vĩnh Long',
 'https://vi.wikipedia.org/wiki/V%C4%83n_Th%C3%A1nh_Mi%E1%BA%BFu_V%C4%A9nh_Long',
 ST_SetSRID(ST_MakePoint(105.972, 10.249), 4326)),
('Bến Ninh Kiều', 'Văn hoá sông nước', 'Bến thuyền, biểu tượng Cần Thơ.', 'Cần Thơ',
 'https://vi.wikipedia.org/wiki/B%E1%BA%BFn_Ninh_Ki%E1%BB%81u',
 ST_SetSRID(ST_MakePoint(105.785, 10.034), 4326)),
('Chợ nổi Cái Răng', 'Văn hoá sông nước', 'Chợ nổi sầm uất trên sông Cần Thơ.', 'Cần Thơ',
 'https://vi.wikipedia.org/wiki/Ch%E1%BB%A3_n%E1%BB%95i_C%C3%A1i_R%C4%83ng',
 ST_SetSRID(ST_MakePoint(105.756, 9.996), 4326)),
('Lung Ngọc Hoàng', 'Tự nhiên', 'Khu bảo tồn đất ngập nước quý hiếm.', 'Hậu Giang',
 'https://vi.wikipedia.org/wiki/Khu_b%E1%BA%A3o_t%E1%BB%93n_thi%C3%AAn_nhi%C3%AAn_Lung_Ng%E1%BB%8Dc_Ho%C3%A0ng',
 ST_SetSRID(ST_MakePoint(105.565, 9.627), 4326)),
('Chùa Dơi (Mã Tộc)', 'Tôn giáo – Tín ngưỡng', 'Ngôi chùa Khmer cổ với đàn dơi lớn.', 'Sóc Trăng',
 'https://vi.wikipedia.org/wiki/Ch%C3%B9a_D%C6%A1i',
 ST_SetSRID(ST_MakePoint(105.980, 9.588), 4326)),
('Chùa Khleang', 'Tôn giáo – Tín ngưỡng', 'Chùa Khmer cổ ở Sóc Trăng.', 'Sóc Trăng',
 'https://vi.wikipedia.org/wiki/Ch%C3%B9a_Khleang',
 ST_SetSRID(ST_MakePoint(105.970, 9.606), 4326)),
('Ao Bà Om', 'Văn hoá – Tự nhiên', 'Danh thắng gắn lễ Ok Om Bok của người Khmer.', 'Trà Vinh',
 'https://vi.wikipedia.org/wiki/Ao_B%C3%A0_Om',
 ST_SetSRID(ST_MakePoint(106.336, 9.933), 4326)),
('Chùa Âng', 'Tôn giáo – Tín ngưỡng', 'Chùa Khmer cạnh Ao Bà Om.', 'Trà Vinh',
 'https://vi.wikipedia.org/wiki/Ch%C3%B9a_%C3%82ng',
 ST_SetSRID(ST_MakePoint(106.335, 9.933), 4326)),
('Nhà công tử Bạc Liêu', 'Cận – Hiện đại', 'Biệt thự nổi tiếng đầu thế kỷ XX.', 'Bạc Liêu',
 'https://vi.wikipedia.org/wiki/Nh%C3%A0_c%C3%B4ng_t%E1%BB%B1_B%E1%BA%A1c_Li%C3%AAu',
 ST_SetSRID(ST_MakePoint(105.727, 9.284), 4326)),
('Điện gió Bạc Liêu', 'Hiện đại', 'Cánh đồng tua-bin gió ven biển.', 'Bạc Liêu',
 'https://vi.wikipedia.org/wiki/N%C4%83ng_l%C6%B0%E1%BB%A3ng_gi%C3%B3_%E1%BB%9F_Vi%E1%BB%87t_Nam',
 ST_SetSRID(ST_MakePoint(105.741, 9.200), 4326)),
('Mũi Cà Mau', 'Tự nhiên', 'Cực Nam đất liền Việt Nam.', 'Cà Mau',
 'https://vi.wikipedia.org/wiki/M%C5%A9i_C%C3%A0_Mau',
 ST_SetSRID(ST_MakePoint(104.834, 8.624), 4326)),
('Rừng U Minh Hạ', 'Tự nhiên', 'Hệ sinh thái rừng tràm ngập nước.', 'Cà Mau',
 'https://vi.wikipedia.org/wiki/V%C6%B0%E1%BB%9Dn_qu%E1%BB%91c_gia_U_Minh_H%E1%BA%A1',
 ST_SetSRID(ST_MakePoint(104.953, 9.327), 4326));

-- =========================
-- 3) BỔ SUNG RẢI RÁC MIỀN BẮC để tròn 100 (12 địa điểm)
-- =========================
-- (GIỮ NGUYÊN NỘI DUNG BẠN GỬI)
INSERT INTO places (name_vi, period, summary, address, wikipedia_url, geom) VALUES
('Đền Trần Thái Bình', 'Thời Trần', 'Quần thể đền thờ các vua Trần ở Long Hưng.', 'Thái Bình',
 'https://vi.wikipedia.org/wiki/%C4%90%E1%BB%81n_Tr%E1%BA%A7n_(Th%C3%A1i_B%C3%ACnh)',
 ST_SetSRID(ST_MakePoint(106.467, 20.554), 4326)),
('Nhà thờ đá Phát Diệm', 'Cận – Hiện đại', 'Quần thể nhà thờ kết hợp kiến trúc Á – Âu.', 'Ninh Bình',
 'https://vi.wikipedia.org/wiki/Nh%C3%A0_th%E1%BB%9D_%C4%91%C3%A1_Ph%C3%A1t_Di%E1%BB%87m',
 ST_SetSRID(ST_MakePoint(106.086, 19.905), 4326)),
('Tràng An', 'Tự nhiên – Văn hoá', 'Quần thể danh thắng Tràng An, Di sản thế giới.', 'Ninh Bình',
 'https://vi.wikipedia.org/wiki/Qu%E1%BA%A7n_th%E1%BB%83_danh_th%E1%BA%AFng_Tr%C3%A0ng_An',
 ST_SetSRID(ST_MakePoint(105.935, 20.251), 4326)),
('Tam Cốc – Bích Động', 'Tự nhiên – Văn hoá', 'Hạ Long trên cạn với hang động – sông nước.', 'Ninh Bình',
 'https://vi.wikipedia.org/wiki/Tam_C%E1%BB%91c_-_B%C3%ADch_%C4%90%E1%BB%99ng',
 ST_SetSRID(ST_MakePoint(105.923, 20.240), 4326)),
('Chùa Bái Đính', 'Hiện đại – Tôn giáo', 'Quần thể chùa lớn với tượng Phật kỷ lục.', 'Ninh Bình',
 'https://vi.wikipedia.org/wiki/Ch%C3%B9a_B%C3%A1i_%C4%90%C3%ADnh',
 ST_SetSRID(ST_MakePoint(105.894, 20.260), 4326)),
('Khu di tích Côn Sơn – Kiếp Bạc', 'Thời Trần – Lê', 'Gắn với Trần Hưng Đạo và Nguyễn Trãi.', 'Hải Dương',
 'https://vi.wikipedia.org/wiki/C%C3%B4n_S%C6%A1n_-_Ki%E1%BA%BFp_B%E1%BA%A1c',
 ST_SetSRID(ST_MakePoint(106.595, 21.243), 4326)),
('Đền Trần Nam Định', 'Thời Trần', 'Nơi triều Trần mở tiệc Khai ấn.', 'Nam Định',
 'https://vi.wikipedia.org/wiki/%C4%90%E1%BB%81n_Tr%E1%BA%A7n_(Nam_%C4%90%E1%BB%8Bnh)',
 ST_SetSRID(ST_MakePoint(106.183, 20.427), 4326)),
('Chùa Keo Thái Bình', 'Thời Lê', 'Chùa cổ nổi tiếng với tháp chuông gỗ.', 'Thái Bình',
 'https://vi.wikipedia.org/wiki/Ch%C3%B9a_Keo_(Th%C3%A1i_B%C3%ACnh)',
 ST_SetSRID(ST_MakePoint(106.445, 20.510), 4326)),
('Thành nhà Mạc (Hải Phòng)', 'Thời Mạc', 'Di tích thành luỹ thời nhà Mạc.', 'Hải Phòng',
 'https://vi.wikipedia.org/wiki/Th%C3%A0nh_nh%C3%A0_M%E1%BA%A1c',
 ST_SetSRID(ST_MakePoint(106.618, 20.949), 4326)),
('Vịnh Hạ Long', 'Tự nhiên', 'Di sản thiên nhiên thế giới nổi tiếng.', 'Quảng Ninh',
 'https://vi.wikipedia.org/wiki/V%E1%BB%8Bnh_H%E1%BA%A1_Long',
 ST_SetSRID(ST_MakePoint(107.058, 20.910), 4326)),
('Yên Tử', 'Phật giáo Trúc Lâm', 'Đất tổ Thiền phái Trúc Lâm Yên Tử.', 'Quảng Ninh',
 'https://vi.wikipedia.org/wiki/Y%C3%AAn_T%E1%BB%AD',
 ST_SetSRID(ST_MakePoint(107.082, 21.132), 4326)),
('Pù Luông (vùng Thanh Hóa)', 'Tự nhiên', 'Khu bảo tồn thiên nhiên núi đá vôi.', 'Thanh Hóa',
 'https://vi.wikipedia.org/wiki/Khu_b%E1%BA%A3o_t%E1%BB%93n_thi%C3%AAn_nhi%C3%AAn_P%C3%B9_Lu%C3%B4ng',
 ST_SetSRID(ST_MakePoint(105.220, 20.465), 4326));

-- =========================
-- 4) MEDIA (Miền Trung + Miền Nam + Bổ sung rải rác) — thêm ảnh cho TẤT CẢ điểm còn lại
-- =========================
WITH m(name_vi, url, caption) AS (
  VALUES
  -- Miền Trung (chọn ảnh thật cho các điểm nổi bật)
  ('Kinh thành Huế','https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Imperial_City_Hue.jpg/640px-Imperial_City_Hue.jpg','Kinh thành Huế (Wikimedia)'),
  ('Hoàng thành Huế','https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Hue_Citadel_Ngo_Mon_Gate.jpg/640px-Hue_Citadel_Ngo_Mon_Gate.jpg','Hoàng thành Huế (Wikimedia)'),
  ('Chùa Thiên Mụ','https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Thien_Mu_Pagoda.jpg/640px-Thien_Mu_Pagoda.jpg','Chùa Thiên Mụ (Wikimedia)'),
  ('Lăng Minh Mạng','https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Minh_Mang_Tomb.jpg/640px-Minh_Mang_Tomb.jpg','Lăng Minh Mạng (Wikimedia)'),
  ('Lăng Tự Đức','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Tu_Duc_Tomb.jpg/640px-Tu_Duc_Tomb.jpg','Lăng Tự Đức (Wikimedia)'),
  ('Lăng Khải Định','https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Khai_Dinh_Tomb.jpg/640px-Khai_Dinh_Tomb.jpg','Lăng Khải Định (Wikimedia)'),
  ('Phố cổ Hội An','https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Hoi_An_old_town.jpg/640px-Hoi_An_old_town.jpg','Phố cổ Hội An (Wikimedia)'),
  ('Khu đền tháp Mỹ Sơn','https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/My_Son_Temple_Complex.jpg/640px-My_Son_Temple_Complex.jpg','Thánh địa Mỹ Sơn (Wikimedia)'),
  ('Cù Lao Chàm','https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cu_Lao_Cham.jpg/640px-Cu_Lao_Cham.jpg','Cù Lao Chàm (Wikimedia)'),
  ('Bảo tàng Điêu khắc Chăm','https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Da_Nang_Museum_of_Cham_Sculpture.jpg/640px-Da_Nang_Museum_of_Cham_Sculpture.jpg','Bảo tàng Điêu khắc Chăm (Wikimedia)'),
  ('Ngũ Hành Sơn','https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Marble_Mountains_Da_Nang.jpg/640px-Marble_Mountains_Da_Nang.jpg','Ngũ Hành Sơn (Wikimedia)'),
  ('Bán đảo Sơn Trà','https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Son_Tra_Peninsula.jpg/640px-Son_Tra_Peninsula.jpg','Bán đảo Sơn Trà (Wikimedia)'),
  ('Phong Nha – Kẻ Bàng','https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Phong_Nha-Ke_Bang_National_Park_3.jpg/640px-Phong_Nha-Ke_Bang_National_Park_3.jpg','Phong Nha – Kẻ Bàng (Wikimedia)'),
  ('Hang Sơn Đoòng (vùng Phong Nha)','https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Son_Doong_Cave.jpg/640px-Son_Doong_Cave.jpg','Hang Sơn Đoòng (Wikimedia)'),
  ('Thành cổ Quảng Trị','https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Quang_Tri_Citadel.jpg/640px-Quang_Tri_Citadel.jpg','Thành cổ Quảng Trị (Wikimedia)'),
  ('Cầu Hiền Lương – Sông Bến Hải','https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Hien_Luong_Bridge.jpg/640px-Hien_Luong_Bridge.jpg','Cầu Hiền Lương (Wikimedia)'),
  ('Kim Liên – Quê Bác','https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Kim_Lien_Village.jpg/640px-Kim_Lien_Village.jpg','Kim Liên (Wikimedia)'),
  ('Làng Sen – Làng Hoàng Trù','https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Hoang_Tru_Village.jpg/640px-Hoang_Tru_Village.jpg','Làng Hoàng Trù (Wikimedia)'),
  ('Khu chứng tích Sơn Mỹ','https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/My_Lai_Memorial.jpg/640px-My_Lai_Memorial.jpg','Sơn Mỹ (Wikimedia)'),
  ('Đảo Lý Sơn','https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Ly_Son_Island.jpg/640px-Ly_Son_Island.jpg','Lý Sơn (Wikimedia)'),
  ('Tháp Bánh Ít','https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Banh_It_towers.jpg/640px-Banh_It_towers.jpg','Tháp Bánh Ít (Wikimedia)'),
  ('Tháp Đôi Quy Nhơn','https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Thap_Doi_Quy_Nhon.jpg/640px-Thap_Doi_Quy_Nhon.jpg','Tháp Đôi Quy Nhơn (Wikimedia)'),
  ('Bảo tàng Quang Trung – Tây Sơn','https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Quang_Trung_Museum.jpg/640px-Quang_Trung_Museum.jpg','Bảo tàng Quang Trung (Wikimedia)'),
  ('Gành Đá Đĩa','https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Ganh_Da_Dia.jpg/640px-Ganh_Da_Dia.jpg','Gành Đá Đĩa (Wikimedia)'),
  ('Tháp Bà Po Nagar','https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Po_Nagar_Chan_Tower.jpg/640px-Po_Nagar_Chan_Tower.jpg','Tháp Bà Po Nagar (Wikimedia)'),
  ('Thành Diên Khánh','https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Dien_Khanh_Citadel_Gate.jpg/640px-Dien_Khanh_Citadel_Gate.jpg','Thành Diên Khánh (Wikimedia)'),
  ('Hòn Chồng – Nha Trang','https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Hon_Chong.jpg/640px-Hon_Chong.jpg','Hòn Chồng (Wikimedia)'),
  ('Tháp Po Klong Garai','https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Po_Klong_Garai_Towers.jpg/640px-Po_Klong_Garai_Towers.jpg','Po Klong Garai (Wikimedia)'),
  ('Vịnh Vĩnh Hy','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Vinh_Hy_Bay.jpg/640px-Vinh_Hy_Bay.jpg','Vịnh Vĩnh Hy (Wikimedia)'),
  ('Tháp Po Sah Inu','https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Po_Sah_Inu_towers.jpg/640px-Po_Sah_Inu_towers.jpg','Po Sah Inu (Wikimedia)'),
  ('Trường Dục Thanh','https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Duc_Thanh_School.jpg/640px-Duc_Thanh_School.jpg','Trường Dục Thanh (Wikimedia)'),
  ('Nhà thờ gỗ Kon Tum','https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Kon_Tum_Wooden_Cathedral.jpg/640px-Kon_Tum_Wooden_Cathedral.jpg','Nhà thờ gỗ Kon Tum (Wikimedia)'),
  ('Làng văn hoá Kon Klor – Nhà rông','https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Kon_Klor_Bridge.jpg/640px-Kon_Klor_Bridge.jpg','Kon Klor (Wikimedia)'),
  ('Biển Hồ (T''Nưng)','https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Lake_TNung.jpg/640px-Lake_TNung.jpg','Biển Hồ Pleiku (Wikimedia)'),
  ('Thuỷ điện Yaly','https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Yaly_Hydropower_Plant.jpg/640px-Yaly_Hydropower_Plant.jpg','Thuỷ điện Yaly (Wikimedia)'),
  ('Buôn Đôn','https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Don_village.jpg/640px-Don_village.jpg','Buôn Đôn (Wikimedia)'),
  ('Thác Dray Nur','https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Dray_Nur_Waterfall.jpg/640px-Dray_Nur_Waterfall.jpg','Thác Dray Nur (Wikimedia)'),
  ('Cố đô Trà Kiệu','https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Tra_Kieu.jpg/640px-Tra_Kieu.jpg','Trà Kiệu (Wikimedia)'),
  ('Cửa Tùng – Cửa Việt','https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Cua_Tung_Beach.jpg/640px-Cua_Tung_Beach.jpg','Cửa Tùng (Wikimedia)'),

  -- Miền Nam (nổi bật dùng ảnh thật)
  ('Dinh Độc Lập','https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Reunification_Palace_HCMC.jpg/640px-Reunification_Palace_HCMC.jpg','Dinh Độc Lập (Wikimedia)'),
  ('Bưu điện Trung tâm Sài Gòn','https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Saigon_Central_Post_Office.jpg/640px-Saigon_Central_Post_Office.jpg','Bưu điện Sài Gòn (Wikimedia)'),
  ('Nhà thờ Đức Bà Sài Gòn','https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Saigon_Notre-Dame_Basilica.jpg/640px-Saigon_Notre-Dame_Basilica.jpg','Nhà thờ Đức Bà (Wikimedia)'),
  ('Bảo tàng Chứng tích Chiến tranh','https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/War_Remnants_Museum.jpg/640px-War_Remnants_Museum.jpg','Bảo tàng Chứng tích (Wikimedia)'),
  ('Chợ Bến Thành','https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Ben_Thanh_Market.jpg/640px-Ben_Thanh_Market.jpg','Chợ Bến Thành (Wikimedia)'),
  ('Địa đạo Củ Chi','https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Cu_Chi_Tunnels.jpg/640px-Cu_Chi_Tunnels.jpg','Địa đạo Củ Chi (Wikimedia)'),
  ('Bến Nhà Rồng','https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Nha_Rong_Wharf.jpg/640px-Nha_Rong_Wharf.jpg','Bến Nhà Rồng (Wikimedia)'),
  ('Hầm Thủ Thiêm (khu vực)','https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Thu_Thiem_Tunnel_Entrance.jpg/640px-Thu_Thiem_Tunnel_Entrance.jpg','Hầm Thủ Thiêm (Wikimedia)'),
  ('Tòa Thánh Cao Đài Tây Ninh','https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Cao_Dai_Temple_Tay_Ninh.jpg/640px-Cao_Dai_Temple_Tay_Ninh.jpg','Tòa Thánh Cao Đài (Wikimedia)'),
  ('Núi Bà Đen','https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Ba_Den_Mountain.jpg/640px-Ba_Den_Mountain.jpg','Núi Bà Đen (Wikimedia)'),
  ('Chiến khu D','https://via.placeholder.com/640x400?text=Chi%E1%BA%BFn+khu+D','Chiến khu D (placeholder)'),
  ('Khu di tích Đá Ba Chồng','https://via.placeholder.com/640x400?text=%C4%90%C3%A1+Ba+Ch%E1%BB%93ng','Đá Ba Chồng (placeholder)'),
  ('Sóc Bom Bo','https://via.placeholder.com/640x400?text=S%C3%B3c+Bom+Bo','Sóc Bom Bo (placeholder)'),
  ('Vàm Nhựt Tảo','https://via.placeholder.com/640x400?text=V%C3%A0m+Nh%E1%BB%B1t+T%E1%BA%A3o','Vàm Nhựt Tảo (placeholder)'),
  ('Chợ nổi Cái Bè','https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Cai_Be_Floating_Market.jpg/640px-Cai_Be_Floating_Market.jpg','Chợ nổi Cái Bè (Wikimedia)'),
  ('Trại rắn Đồng Tâm','https://via.placeholder.com/640x400?text=Tr%E1%BA%A1i+r%E1%BA%AFn+%C4%90%E1%BB%93ng+T%C3%A2m','Trại rắn Đồng Tâm (placeholder)'),
  ('Cồn Phụng','https://via.placeholder.com/640x400?text=C%E1%BB%93n+Ph%E1%BB%A5ng','Cồn Phụng (placeholder)'),
  ('Văn Thánh Miếu Vĩnh Long','https://via.placeholder.com/640x400?text=V%C4%83n+Th%C3%A1nh+Mi%E1%BA%BFu+V%C4%A9nh+Long','Văn Thánh Miếu (placeholder)'),
  ('Bến Ninh Kiều','https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Ninh_Kieu_Quay.jpg/640px-Ninh_Kieu_Quay.jpg','Bến Ninh Kiều (Wikimedia)'),
  ('Chợ nổi Cái Răng','https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Cai_Rang_Floating_Market.jpg/640px-Cai_Rang_Floating_Market.jpg','Chợ nổi Cái Răng (Wikimedia)'),
  ('Lung Ngọc Hoàng','https://via.placeholder.com/640x400?text=Lung+Ng%E1%BB%8Dc+Ho%C3%A0ng','Lung Ngọc Hoàng (placeholder)'),
  ('Chùa Dơi (Mã Tộc)','https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Chua_Doi_Soc_Trang.jpg/640px-Chua_Doi_Soc_Trang.jpg','Chùa Dơi (Wikimedia)'),
  ('Chùa Khleang','https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Chua_Khleang.jpg/640px-Chua_Khleang.jpg','Chùa Khleang (Wikimedia)'),
  ('Ao Bà Om','https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Ao_Ba_Om_Tra_Vinh.jpg/640px-Ao_Ba_Om_Tra_Vinh.jpg','Ao Bà Om (Wikimedia)'),
  ('Chùa Âng','https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Chua_Ang_Tra_Vinh.jpg/640px-Chua_Ang_Tra_Vinh.jpg','Chùa Âng (Wikimedia)'),
  ('Nhà công tử Bạc Liêu','https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Nha_Cong_Tu_Bac_Lieu.jpg/640px-Nha_Cong_Tu_Bac_Lieu.jpg','Nhà công tử Bạc Liêu (Wikimedia)'),
  ('Điện gió Bạc Liêu','https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Bac_Lieu_Wind_Power.jpg/640px-Bac_Lieu_Wind_Power.jpg','Điện gió Bạc Liêu (Wikimedia)'),
  ('Mũi Cà Mau','https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Ca_Mau_Cape.jpg/640px-Ca_Mau_Cape.jpg','Mũi Cà Mau (Wikimedia)'),
  ('Rừng U Minh Hạ','https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/U_Minh_Ha_National_Park.jpg/640px-U_Minh_Ha_National_Park.jpg','U Minh Hạ (Wikimedia)'),

  -- Bổ sung rải rác miền Bắc (12 điểm)
  ('Đền Trần Thái Bình','https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Den_Tran_Thai_Binh.jpg/640px-Den_Tran_Thai_Binh.jpg','Đền Trần Thái Bình (Wikimedia)'),
  ('Nhà thờ đá Phát Diệm','https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Phat_Diem_Cathedral.jpg/640px-Phat_Diem_Cathedral.jpg','Nhà thờ đá Phát Diệm (Wikimedia)'),
  ('Tràng An','https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Trang_An_Boats.jpg/640px-Trang_An_Boats.jpg','Tràng An (Wikimedia)'),
  ('Tam Cốc – Bích Động','https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Tam_Coc_Bich_Dong.jpg/640px-Tam_Coc_Bich_Dong.jpg','Tam Cốc – Bích Động (Wikimedia)'),
  ('Chùa Bái Đính','https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Bai_Dinh_Pagoda.jpg/640px-Bai_Dinh_Pagoda.jpg','Chùa Bái Đính (Wikimedia)'),
  ('Khu di tích Côn Sơn – Kiếp Bạc','https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Con_Son_Kiep_Bac.jpg/640px-Con_Son_Kiep_Bac.jpg','Côn Sơn – Kiếp Bạc (Wikimedia)'),
  ('Đền Trần Nam Định','https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Den_Tran_Nam_Dinh.jpg/640px-Den_Tran_Nam_Dinh.jpg','Đền Trần Nam Định (Wikimedia)'),
  ('Chùa Keo Thái Bình','https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Chua_Keo_Thai_Binh.jpg/640px-Chua_Keo_Thai_Binh.jpg','Chùa Keo (Wikimedia)'),
  ('Thành nhà Mạc (Hải Phòng)','https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Mac_Dynasty_Citadel_Hai_Phong.jpg/640px-Mac_Dynasty_Citadel_Hai_Phong.jpg','Thành nhà Mạc (Wikimedia)'),
  ('Vịnh Hạ Long','https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Ha_Long_Bay_in_2019.jpg/640px-Ha_Long_Bay_in_2019.jpg','Vịnh Hạ Long (Wikimedia)'),
  ('Yên Tử','https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Yen_Tu_Pagoda.jpg/640px-Yen_Tu_Pagoda.jpg','Yên Tử (Wikimedia)'),
  ('Pù Luông (vùng Thanh Hóa)','https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Pu_Luong_Nature_Reserve.jpg/640px-Pu_Luong_Nature_Reserve.jpg','Pù Luông (Wikimedia)')
)
INSERT INTO media (place_id, kind, url, caption)
SELECT p.id, 'image', m.url, m.caption
FROM m
JOIN places p ON p.name_vi = m.name_vi;

COMMIT;
