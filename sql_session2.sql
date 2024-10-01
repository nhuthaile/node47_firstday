# Tạo cơ sở dữ liệu
CREATE DATABASE node47
USE node47

# Tạo table, data 
# Tạo table users
# Có 3 kiểu dữ liệu chính:
# - Number: integer, float ...
# - String: VACHAR, TEXT ...
# - datetime: timestamp, day...
CREATE TABLE users(
	full_name VARCHAR(100),
	email VARCHAR(255),
	age INT,
	pass_word VARCHAR(255)
)
# Query, insert, update, delete
INSERT INTO users (full_name, email, age, pass_word) VALUES 
('Nguyen Van A', 'nguyenvana@example.com', 25, 'password123'),
('Tran Thi B', 'tranthib@example.com', 30, 'abc123'),
('Le Quang C', 'lequangc@example.com', 28, 'securepass'),
('Pham Minh D', 'phamminhd@example.com', 22, 'mypassword'),
('Hoang Thu E', 'hoangthue@example.com', 35, 'easypass'),
('Dang Van F', 'dangvanf@example.com', 29, 'hello123'),
('Ngo Thi G', 'ngothig@example.com', 27, 'password456'),
('Vuong Quoc H', 'vuongquoch@example.com', 40, 'hardpass'),
('Trinh Quoc I', 'trinhquoci@example.com', 26, 'bestpassword'),
('Doan Thu J', 'doanthuj@example.com', 32, 'test1234'),
('Nguyen Bao K', 'nguyenbaok@example.com', 33, 'kpass789'),
('Vu Minh L', 'vuminhl@example.com', 31, 'letmein'),
('Phan Hai M', 'phanhai@example.com', 21, 'password789'),
('Dao Thi N', 'daothin@example.com', 37, 'mypassword123'),
('Le Minh O', 'leminho@example.com', 36, 'omypass'),
('Tran Bao P', 'tranbaop@example.com', 24, 'supersecure'),
('Doan Van Q', 'doanvanq@example.com', 23, 'password999'),
('Hoang Van R', 'hoangvanr@example.com', 38, 'rsecure123'),
('Pham Thu S', 'phamthus@example.com', 20, 'passwordabc'),
('Ngo Bao T', 'ngobaot@example.com', 34, 'topsecret');

# Viết câu query để get dữ liệu data 
# * = tất cả column
SELECT * from users

# lấy từng column theo chỉ định
SELECT email AS 'Email', full_name AS 'Họ Tên' from users

# Lấy những người có tuổi từ 20 đến 30 tuổi và sắp xếp tăng (giảm) dần:
# cách 1
SELECT * FROM users
WHERE age BETWEEN 20 and 30
ORDER BY age ASC
LIMIT 10

# Cách 2
SELECT * FROM users
WHERE age >= 20 and age <=30
ORDER BY age DESC
LIMIT 5

# Thêm address và phone cho table users
ALTER TABLE users # thêm, đổi tên, đổi datatype column
#=> thêm column mới
ADD COLUMN address VARCHAR(255),
ADD COLUMN phone VARCHAR(15)

# thay đổi kiểu dữ liệu cho column
ALTER TABLE users
MODIFY address VARCHAR(100)

# thêm ràng buộc (constrain) cho column
ALTER TABLE users
MODIFY COLUMN email VARCHAR(100) NOT NULL

INSERT INTO users (full_name,  age, pass_word) VALUES 
('nguyen van ce', 30, 123456)

# liệt kê những người có tuổi lớn nhất
SELECT * FROM users
WHERE age = (
	SELECT age from users
	ORDER BY age DESC
	LIMIT 1
)

# cách 2: dùng MAX hoặc MIN để tìm dữ liệu
SELECT * from users
where age = (SELECT MIN(age) from users)

# tìm những người có họ 'Lê' trong danh sách
# => dùng keyword LIKE (tìm tương đối)
SELECT * from users
WHERE full_name LIKE '%le%'

# le% => tìm chuỗi có 'le' ở đầu
# %le => tìm chuỗi có 'le' ở cuối
# %le% => tìm chuỗi có 'le'

# lấy unique value
SELECT DISTINCT age from users
# => lấy các giá trị age, lấy đúng 1 giá trị nếu có nhiều giá trị trùng nhau

# Đếm có bao nhiêu users trong table
# => COUNT
SELECT COUNT(*) from users

# khoá chính (primary key)
# column trong table nhưng dùng để xác định data đó là duy nhất, và dùng để query phần tử
# thêm id cho table users
alter TABLE users
ADD COLUMN users_id INT PRIMARY KEY auto_increment 

INSERT INTO users(email, full_name, age) VALUES
('acsd@gmail.com', 'baba',30 )








