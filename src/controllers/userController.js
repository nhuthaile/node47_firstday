import { response } from "express";
import connect from "../../db.js";

import initModels from "../models/init-models.js";
import sequelize from "../models/connectOrm.js";
import { Op } from "sequelize";

// Tạo object model đại diện cho tất cả model trong orm
const model = initModels(sequelize);

const getUsers = (req, res) => {
  res.status(200).json({ message: "successfully get users!" });
};

const createUser = (req, res) => {
  let body = req.body;
  res.send(body);
};

const getUserDb = async (req, res) => {
  const [data] = await connect.query(`
          SELECT * from users
          `);
  res.send(data);
};

const createUserOrm = async (req, res) => {
  try {
    let { full_name, email } = req.body;
    const user = await model.users.create({
      full_name,
      email,
    });
    return res.status(201).json({ message: "successfully create users", user });
  } catch (err) {
    return res.status(500).json({ message: "có lỗi xảy ra!" });
  }
};

const getUserOrmById = async (req, res) => {
  try {
    let { id } = req.params;
    let data = await model.users.findOne({
      where: {
        user_id: id,
      },
    });
    return res.status(200).json(data);
  } catch (err) {
    return res.status(500).json({ message: "có lỗi xảy ra!" });
  }
};

const getUserOrm = async (req, res) => {
  try {
    // SELECT * from users
    // where full_name like '%john%'
    let data = await model.users.findAll({
      where: {
        full_name: {
          [Op.like]: "%john%",
        },
      },
      attributes: ["user_id", "full_name", "email"],
      include: [
        {
          model: model.video, // join với table video
          as: "videos",
          required: true, // inner join = true (by default left join)
          // attributes: ["video_name"],
        },
      ],
    });
    return res.status(200).json(data);
  } catch (err) {
    console.log(err);
    return response.status(500).json({ message: "có lỗi ORM xảy ra!" });
  }
};

export {
  getUsers,
  createUser,
  getUserDb,
  getUserOrm,
  getUserOrmById,
  createUserOrm,
};
