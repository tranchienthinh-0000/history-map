// backend/controllers/placesController.js
/**
 * Controller xử lý dữ liệu địa điểm lịch sử
 * -----------------------------------------
 * - getAllPlaces(): trả danh sách địa điểm dạng GeoJSON (cho bản đồ)
 * - getPlaceDetail(): trả chi tiết 1 địa điểm (ảnh, video, sự kiện liên quan)
 */

async function getAllPlaces(req, res) {
  const pool = req.app.locals.pool;
  try {
    const { period, q } = req.query;
    const where = [];
    const params = [];

    // 🧭 Bộ lọc thời kỳ
    if (period) {
      params.push(period);
      where.push(`p.period = $${params.length}`);
    }

    // 🔍 Tìm kiếm theo tên hoặc mô tả
    if (q) {
      params.push(`%${q}%`);
      where.push(`(p.name_vi ILIKE $${params.length} OR p.summary ILIKE $${params.length})`);
    }

    const whereSql = where.length ? `WHERE ${where.join(" AND ")}` : "";

    // ✅ Truy vấn danh sách địa điểm + ảnh đại diện
    const sql = `
      SELECT jsonb_build_object(
        'type', 'FeatureCollection',
        'features', jsonb_agg(
          jsonb_build_object(
            'type', 'Feature',
            'geometry', ST_AsGeoJSON(p.geom)::jsonb,
            'properties', jsonb_build_object(
              'id', p.id,
              'name_vi', p.name_vi,
              'period', p.period,
              'summary', p.summary,
              'address', p.address,
              'wikipedia_url', p.wikipedia_url,
              'image_url', (
                SELECT m.url
                FROM media m
                WHERE m.place_id = p.id AND m.kind = 'image'
                ORDER BY m.id ASC
                LIMIT 1
              ),
              'video_url', (
                SELECT m.url
                FROM media m
                WHERE m.place_id = p.id AND m.kind = 'video'
                ORDER BY m.id ASC
                LIMIT 1
              )
            )
          )
        )
      ) AS fc
      FROM places p
      ${whereSql}
      LIMIT 1000;
    `;

    const { rows } = await pool.query(sql, params);
    res.json(rows[0]?.fc || { type: "FeatureCollection", features: [] });
  } catch (err) {
    console.error("❌ getAllPlaces error:", err);
    res.status(500).json({ error: "Server error" });
  }
}

/**
 * 🏛️ Trả chi tiết 1 địa điểm (cho Sidebar)
 */
async function getPlaceDetail(req, res) {
  const pool = req.app.locals.pool;
  try {
    const { id } = req.params;

    // ✅ Lấy thông tin địa điểm
    const placeSql = `
      SELECT id, name_vi, name_en, period, summary, address, wikipedia_url,
             ST_AsGeoJSON(geom) AS geometry
      FROM places
      WHERE id=$1
    `;

    // ✅ Lấy toàn bộ ảnh & video liên quan
    const mediaSql = `
      SELECT id, kind, url, caption
      FROM media
      WHERE place_id=$1
      ORDER BY kind, id ASC
    `;

    // ✅ Lấy danh sách sự kiện liên quan
    const eventsSql = `
      SELECT e.id, e.title_vi, e.title_en, e.year_from, e.year_to
      FROM events e
      JOIN place_events pe ON pe.event_id = e.id
      WHERE pe.place_id=$1
      ORDER BY e.year_from NULLS LAST
    `;

    const [place, media, events] = await Promise.all([
      pool.query(placeSql, [id]),
      pool.query(mediaSql, [id]),
      pool.query(eventsSql, [id]),
    ]);

    if (!place.rows[0]) {
      return res.status(404).json({ error: "Place not found" });
    }

    // ✅ Trả dữ liệu chi tiết
    res.json({
      place: place.rows[0],
      media: media.rows || [],
      events: events.rows || [],
    });
  } catch (err) {
    console.error("❌ getPlaceDetail error:", err);
    res.status(500).json({ error: "Server error" });
  }
}

module.exports = { getAllPlaces, getPlaceDetail };
