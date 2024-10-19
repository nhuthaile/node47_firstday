import express from "express";
import {
  createUser,
  getUserDb,
  getUsers,
  getUserOrm,
  getUserOrmById,
  createUserOrm,
} from "../controllers/userController.js";
import connect from "../../db.js";

const userRoutes = express.Router();

// define API get listing  users:
userRoutes.get("/get-users", getUsers);

userRoutes.get("/get-users-orm", getUserOrm);

userRoutes.get("/get-users-orm/:id", getUserOrmById);

userRoutes.post("/create-user-orm", createUserOrm);

// Viết API hello world

userRoutes.get("/hello-world", (req, res) => {
  res.send("hello world!");
});

userRoutes.get("/health-check", (req, res) => {
  res.send("server is normal!");
});

// Lấy thông tin data từ pagrams, query string, headers, body
//  lấy thông tin id từ http://localhost:8080/get-user/1

userRoutes.get("/get-user/:id/:hoTen", (req, res) => {
  // lây thông tin id
  let { id, hoTen } = req.params;
  let { queryString } = req.query;
  let { key } = req.headers;
  res.send({ id, hoTen, queryString, key });
});

// lấy thông tin body từ API POST PUT
userRoutes.post("/create-user", createUser);

userRoutes.get("/get-user-db", getUserDb);

userRoutes.post("/create-user-db", async (req, res) => {
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

export default userRoutes;
