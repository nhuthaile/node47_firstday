import express from "express";
import {
  getVideoByType,
  getVideos,
  getVideoTypes,
  getVideoById,
} from "../controllers/videoController.js";

const videoRoutes = express.Router();

// Define API get list video
videoRoutes.get("/get-videos", getVideos);

// Define API get type video

videoRoutes.get("/get-types", getVideoTypes);

// Define API get list video by type (type_id)
videoRoutes.get("/get-videos/:typeId", getVideoByType);

// Define API get video detail
videoRoutes.get("/video-detail/:videoId", getVideoById);

export default videoRoutes;
