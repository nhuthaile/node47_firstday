import initModels from "../models/init-models.js";
import sequelize from "../models/connectOrm.js";
import { Op } from "sequelize";

// Tạo object model đại diện cho tất cả model trong orm
const model = initModels(sequelize);

const getVideos = async (req, res) => {
  try {
    let page = 2;
    let size = 4;
    let index = (page - 1) * size;
    let data = await model.video.findAll({
      // Phân trang (pagination)
      offset: index,
      limit: size,
    });

    return res.status(200).json(data);
  } catch (err) {
    console.log(err);
    return res
      .status(500)
      .json({ message: "đã có lỗi xảy ra, vui lòng thử lại!" });
  }
};

const getVideoTypes = async (req, res) => {
  try {
    const videoTypes = await model.video_type.findAll();
    return res.status(200).json(videoTypes);
  } catch (err) {
    console.log(err);
    return res.status(500).json({ message: "có lỗi xảy ra vui lòng thử lại" });
  }
};

const getVideoByType = async (req, res) => {
  try {
    let { typeId } = req.params;

    const videoByType = await model.video.findAll({
      where: {
        type_id: typeId,
      },
    });
    return res.status(200).json(videoByType);
  } catch (err) {
    console.log(err);
    return res
      .status(500)
      .json({ message: "có lỗi xảy ra với ID vui lòng thử lại!" });
  }
};

const getVideoById = async (req, res) => {
  try {
    let { videoId } = req.params;
    const videoById = await model.video.findOne({
      where: {
        video_id: videoId,
      },
      include: {
        model: model.users,
        as: "user",
      },
    });
    return res.status(200).json(videoById);
  } catch (err) {
    return res.status(500).json("có lỗi xảy ra vui lòng thử lại!");
  }
};

export { getVideos, getVideoTypes, getVideoByType, getVideoById };
