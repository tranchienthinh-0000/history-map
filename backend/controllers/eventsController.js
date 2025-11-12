// backend/controllers/eventsController.js
const pool = require("../db");

exports.getAllEvents = async (req, res, next) => {
  try {
    const { year, q } = req.query;
    const where = [];
    const params = [];

    if (year) {
      params.push(year);
      where.push(`(year_from <= $${params.length} AND year_to >= $${params.length})`);
    }
    if (q) {
      params.push(`%${q}%`);
      where.push(`(title_vi ILIKE $${params.length} OR description ILIKE $${params.length})`);
    }

    const whereSql = where.length ? `WHERE ${where.join(" AND ")}` : "";
    const sql = `
      SELECT id, title_vi, title_en, year_from, year_to, description
      FROM events
      ${whereSql}
      ORDER BY year_from ASC;
    `;

    const { rows } = await pool.query(sql, params);
    res.json(rows);
  } catch (err) {
    next(err);
  }
};

exports.getEventDetail = async (req, res, next) => {
  try {
    const { id } = req.params;
    const eventSql = `SELECT * FROM events WHERE id=$1`;
    const placesSql = `
      SELECT p.id, p.name_vi, p.period, ST_AsGeoJSON(p.geom) AS geometry
      FROM places p
      JOIN place_events pe ON pe.place_id = p.id
      WHERE pe.event_id=$1
    `;

    const [event, places] = await Promise.all([
      pool.query(eventSql, [id]),
      pool.query(placesSql, [id]),
    ]);

    if (!event.rows[0]) return res.status(404).json({ error: "Event not found" });

    res.json({ event: event.rows[0], places: places.rows });
  } catch (err) {
    next(err);
  }
};
