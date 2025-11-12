// backend/routes/places.js
const express = require("express");
const router = express.Router();
const { getAllPlaces, getPlaceDetail } = require("../controllers/placesController");

/**
 * 📍 GET /api/places
 * Trả danh sách địa điểm (GeoJSON)
 * Hỗ trợ filter ?period=...&q=...
 */
router.get("/", getAllPlaces);

/**
 * 📍 GET /api/places/:id
 * Trả chi tiết 1 địa điểm (ảnh, video, sự kiện)
 */
router.get("/:id", getPlaceDetail);

module.exports = router;
