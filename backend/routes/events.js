// backend/routes/events.js
const express = require("express");
const router = express.Router();
const { getAllEvents, getEventDetail } = require("../controllers/eventsController");

router.get("/", getAllEvents);
router.get("/:id", getEventDetail);

module.exports = router;
