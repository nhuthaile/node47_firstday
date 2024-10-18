import express from "express";
import connect from "./db.js";

// Tạo object tổng của expresss
const app = express();

// Thêm midleware để convert string về json với api post và put

app.use(express.json());

// Viết API hello world

app.get("/hello-world", (req, res) => {
  res.send("hello world!");
});

app.get("/health-check", (req, res) => {
  res.send("server is normal!");
});

// Lấy thông tin data từ pagrams, query string, headers, body
//  lấy thông tin id từ http://localhost:8080/get-user/1

app.get("/get-user/:id/:hoTen", (req, res) => {
  // lây thông tin id
  let { id, hoTen } = req.params;
  let { queryString } = req.query;
  let { key } = req.headers;
  res.send({ id, hoTen, queryString, key });
});

// lấy thông tin body từ API POST PUT

app.post("/create-user", (req, res) => {
  let body = req.body;
  res.send(body);
});

app.get("/get-user-db", async (req, res) => {
  const [data] = await connect.query(`
    SELECT * from users
    `);
  res.send(data);
});

app.post("/create-user-db", async (req, res) => {
  try {
    const query = `
    INSERT INTO users(full_name, email, age) VALUES
    (?,?,?)
  `;

    let body = req.body;
    let { full_name, email, age } = body;

    const [results] = await connect.execute(query, [full_name, email, age]);

    return res.send(results);
  } catch (err) {
    console.log(err);
    return res.send(err);
  }
});

// đặt port cho backend
app.listen(8080, () => {
  console.log("Backend start with port 8080");
});
