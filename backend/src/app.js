import express from "express";
import authRoutes from "./routes/authRoutes.js";

const router = express.Router();
router.get("/", (req, res) => res.send("🔥 Fitness Backend Running…"));
router.use("/api/auth", authRoutes);

export default router;
