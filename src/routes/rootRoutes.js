import express from "express";
import userRoutes from "./userRoutes.js";

// defined object routes
const rootRoutes = express.Router();

// import userRoutes vao rootRoutes

rootRoutes.use("/user", userRoutes);

export default rootRoutes;
