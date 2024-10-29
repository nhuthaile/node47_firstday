import express from "express";
import connect from "./db.js";
import rootRoutes from "./src/routes/rootRoutes.js";
import cors from "cors";

// Tạo object tổng của expresss
const app = express();

// Thêm middleware cors để nhận request từ FE
app.use(cors());

// Thêm midleware để convert string về json với api post và put
app.use(express.json());

// import rootRoutes vao index.js
app.use(rootRoutes);

// đặt port cho backend
app.listen(8080, () => {
  console.log("Backend start with port 8080");
});
