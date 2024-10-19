import express from "express";

import rootRoutes from "./src/routes/rootRoutes.js";

// Tạo object tổng của expresss
const app = express();

// Thêm midleware để convert string về json với api post và put
app.use(express.json());

// import rootRoutes vao index.js
app.use(rootRoutes);

// đặt port cho backend
app.listen(8080, () => {
  console.log("Backend start with port 8080");
});
