import express from "express";
import userRoutes from "./userRoutes.js";
import videoRoutes from "./videoRoutes.js";

// defined object routes
const rootRoutes = express.Router();

// import userRoutes vao rootRoutes

rootRoutes.use("/user", userRoutes);

// import videoRoutes vao rootRoutes
rootRoutes.use("/video", videoRoutes);

export default rootRoutes;
