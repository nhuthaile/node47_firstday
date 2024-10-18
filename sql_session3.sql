
# Khi tạo database thì tạo những table có Primary Key và không có Foreign Key trước

# tạo database cho web app foood
# tạo trước 3 table: users, restaurant và food_type
# vì 3 table này không có FK

# tạo table users
CREATE TABLE users(
	users_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(100),
	email VARCHAR(100),
	pass_word VARCHAR(100)
)
ALTER TABLE users CHANGE users_id user_id INT

INSERT INTO users (full_name, email, pass_word) VALUES 
('Nguyen Van A', 'nguyenvana@example.com', 'password123'),
('Tran Thi B', 'tranthib@example.com', 'abc123'),
('Le Quang C', 'lequangc@example.com', 'securepass'),
('Pham Minh D', 'phamminhd@example.com', 'mypassword'),
('Hoang Thu E', 'hoangthue@example.com', 'easypass'),
('Dang Van F', 'dangvanf@example.com', 'hello123'),
('Ngo Thi G', 'ngothig@example.com', 'password456'),
('Vuong Quoc H', 'vuongquoch@example.com', 'hardpass'),
('Trinh Quoc I', 'trinhquoci@example.com', 'bestpassword'),
('Doan Thu J', 'doanthuj@example.com', 'test1234'),
('Nguyen Bao K', 'nguyenbaok@example.com', 'kpass789'),
('Vu Minh L', 'vuminhl@example.com', 'letmein'),
('Phan Hai M', 'phanhai@example.com', 'password789'),
('Dao Thi N', 'daothin@example.com', 'mypassword123'),
('Le Minh O', 'leminho@example.com', 'omypass'),
('Tran Bao P', 'tranbaop@example.com', 'supersecure'),
('Doan Van Q', 'doanvanq@example.com', 'password999'),
('Hoang Van R', 'hoangvanr@example.com', 'rsecure123'),
('Pham Thu S', 'phamthus@example.com', 'passwordabc'),
('Ngo Bao T', 'ngobaot@example.com', 'topsecret');

# tạo table nhà hàng
CREATE TABLE restaurant(
	res_id INT PRIMARY KEY auto_increment,
	res_name VARCHAR(100),
	image VARCHAR(255),
	descrb VARCHAR(255)
)

INSERT INTO restaurant (res_name, image, descrb) VALUES
('Pho 24', 'pho24.jpg', 'Famous for its traditional Vietnamese Pho'),
('Quan An Ngon', 'quananngon.jpg', 'Offers a variety of Vietnamese street food'),
('The Pizza Company', 'thepizzacompany.jpg', 'Popular pizza chain with a wide range of toppings'),
('KFC', 'kfc.jpg', 'Fast food chain specializing in fried chicken'),
('Highlands Coffee', 'highlandscoffee.jpg', 'Vietnamese coffee chain known for its iced coffee'),
('Starbucks', 'starbucks.jpg', 'Global coffeehouse chain offering specialty coffee and teas'),
('Jollibee', 'jollibee.jpg', 'Fast food chain known for its Chickenjoy and burgers'),
('BBQ Chicken', 'bbqchicken.jpg', 'Korean chicken chain famous for its crispy chicken'),
('McDonalds', 'mcdonalds.jpg', 'American fast food chain offering burgers and fries'),
('Lotteria', 'lotteria.jpg', 'Fast food chain with burgers and Korean fried chicken'),
('Cơm Tấm Ba Ghiền', 'comtam.jpg', 'Famous for its broken rice with grilled pork'),
('Banh Mi Huynh Hoa', 'banhmi.jpg', 'Popular for its traditional Vietnamese Banh Mi sandwiches'),
('GoGi House', 'gogi.jpg', 'Korean BBQ restaurant known for its grilled meat'),
('Sushi Bar', 'sushibar.jpg', 'Japanese restaurant serving fresh sushi and sashimi'),
('Pizza Hut', 'pizzahut.jpg', 'Popular pizza chain with a variety of pizzas and sides'),
('Don Chicken', 'donchicken.jpg', 'Korean fried chicken restaurant'),
('Haidilao', 'haidilao.jpg', 'Famous for its hotpot with a variety of broth options'),
('Wrap & Roll', 'wrapnroll.jpg', 'Vietnamese restaurant specializing in rolls and wraps'),
('Sizzler', 'sizzler.jpg', 'Western restaurant offering steak, salad, and seafood dishes'),
('Burger King', 'burgerking.jpg', 'Global fast food chain specializing in burgers');

# tạo table food_type

CREATE TABLE food_type(
	type_id INT PRIMARY key auto_increment,
	type_name VARCHAR(255)
)

INSERT INTO food_type (type_name) VALUES
('Vietnamese'),
('Chinese'),
('Korean'),
('Japanese'),
('Italian'),
('Mexican'),
('American'),
('French'),
('Thai'),
('Indian'),
('Mediterranean'),
('Fast Food'),
('Seafood'),
('Vegetarian'),
('BBQ'),
('Dessert'),
('Coffee'),
('Pizza'),
('Hotpot'),
('Steakhouse');

# tạo table rate_res
CREATE TABLE rate_res(
	rate_res_id INT PRIMARY KEY auto_increment,
	
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	
	res_id INT,
	FOREIGN KEY(res_id) REFERENCES restaurant(res_id),
	
	amount INT,
	rate_date DATE
)

INSERT INTO rate_res (user_id, res_id, amount, rate_date) VALUES
(1, 1, 5, '2024-09-01'),
(2, 2, 4, '2024-09-02'),
(3, 3, 3, '2024-09-03'),
(4, 4, 5, '2024-09-04'),
(5, 5, 4, '2024-09-05'),
(6, 6, 2, '2024-09-06'),
(7, 7, 4, '2024-09-07'),
(8, 8, 5, '2024-09-08'),
(9, 9, 3, '2024-09-09'),
(10, 10, 5, '2024-09-10'),
(11, 11, 4, '2024-09-11'),
(12, 12, 5, '2024-09-12'),
(13, 13, 3, '2024-09-13'),
(14, 14, 5, '2024-09-14'),
(15, 15, 2, '2024-09-15'),
(16, 16, 4, '2024-09-16'),
(17, 17, 3, '2024-09-17'),
(18, 18, 5, '2024-09-18'),
(19, 19, 4, '2024-09-19'),
(20, 20, 5, '2024-09-20');

# tạo table like_res

CREATE TABLE like_res(
	like_res_id INT,
	
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	
	res_id INT,
	FOREIGN KEY(res_id) REFERENCES restaurant(res_id),
	
	like_date DATE
)

INSERT INTO like_res (like_res_id, user_id, res_id, like_date) VALUES
(1, 1, 1, '2024-09-01'),
(2, 2, 2, '2024-09-02'),
(3, 3, 3, '2024-09-03'),
(4, 4, 4, '2024-09-04'),
(5, 5, 5, '2024-09-05'),
(6, 6, 6, '2024-09-06'),
(7, 7, 7, '2024-09-07'),
(8, 8, 8, '2024-09-08'),
(9, 9, 9, '2024-09-09'),
(10, 10, 10, '2024-09-10'),
(11, 11, 11, '2024-09-11'),
(12, 12, 12, '2024-09-12'),
(13, 13, 13, '2024-09-13'),
(14, 14, 14, '2024-09-14'),
(15, 15, 15, '2024-09-15'),
(16, 16, 16, '2024-09-16'),
(17, 17, 17, '2024-09-17'),
(18, 18, 18, '2024-09-18'),
(19, 19, 19, '2024-09-19'),
(20, 20, 20, '2024-09-20');

# tạo table food
CREATE TABLE food(
	food_id INT PRIMARY KEY auto_increment,
	food_name VARCHAR(100),
	image VARCHAR(255),
	price FLOAT,
	descrb VARCHAR(255),
	
	type_id INT,
	FOREIGN key(type_id) REFERENCES food_type(type_id)
)

INSERT INTO food (food_name, image, price, descrb, type_id) VALUES
('Pho Bo', 'pho_bo.jpg', 50.0, 'Traditional Vietnamese beef noodle soup', 1),
('Banh Mi', 'banh_mi.jpg', 25.0, 'Vietnamese sandwich with various fillings', 1),
('Sushi', 'sushi.jpg', 120.0, 'Fresh Japanese sushi rolls', 4),
('Pizza Margherita', 'pizza_margherita.jpg', 200.0, 'Classic Italian pizza with tomato and cheese', 5),
('Tacos', 'tacos.jpg', 75.0, 'Mexican tortillas with various fillings', 6),
('Fried Chicken', 'fried_chicken.jpg', 150.0, 'Crispy fried chicken', 7),
('Kimchi', 'kimchi.jpg', 30.0, 'Spicy fermented Korean cabbage', 3),
('Pad Thai', 'pad_thai.jpg', 80.0, 'Traditional Thai stir-fried noodles', 9),
('Butter Chicken', 'butter_chicken.jpg', 100.0, 'Indian chicken in rich, creamy sauce', 10),
('Bulgogi', 'bulgogi.jpg', 130.0, 'Korean BBQ beef', 3),
('Spaghetti Bolognese', 'spaghetti_bolognese.jpg', 180.0, 'Italian pasta with meat sauce', 5),
('Hamburger', 'hamburger.jpg', 90.0, 'American-style beef burger with cheese and lettuce', 7),
('Dim Sum', 'dim_sum.jpg', 85.0, 'Traditional Chinese dumplings', 2),
('Seafood Paella', 'paella.jpg', 220.0, 'Spanish rice dish with seafood', 13),
('Falafel', 'falafel.jpg', 60.0, 'Deep-fried chickpea balls', 14),
('Chocolate Cake', 'chocolate_cake.jpg', 50.0, 'Rich and moist chocolate cake', 16),
('Cappuccino', 'cappuccino.jpg', 40.0, 'Italian coffee with steamed milk foam', 17),
('Pepperoni Pizza', 'pepperoni_pizza.jpg', 220.0, 'Pizza with pepperoni slices', 18),
('Hotpot', 'hotpot.jpg', 250.0, 'Chinese-style hotpot with broth and various ingredients', 19),
('Steak', 'steak.jpg', 300.0, 'Grilled beef steak with sides', 20);


# tạo table ORDER
CREATE TABLE orders(
	order_id INT PRIMARY KEY auto_increment,
	
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	
	food_id INT,
	FOREIGN KEY(food_id) REFERENCES food(food_id),
	
	amount INT,
	order_code VARCHAR(100),
	
	arr_sub_id VARCHAR(255)
)

INSERT INTO orders (user_id, food_id, amount, order_code, arr_sub_id) VALUES
(1, 1, 2, 'ORD001', 'SUB001'),
(2, 2, 1, 'ORD002', 'SUB002'),
(3, 3, 3, 'ORD003', 'SUB003'),
(4, 4, 1, 'ORD004', 'SUB004'),
(5, 5, 4, 'ORD005', 'SUB005'),
(6, 6, 2, 'ORD006', 'SUB006'),
(7, 7, 5, 'ORD007', 'SUB007'),
(8, 8, 3, 'ORD008', 'SUB008'),
(9, 9, 1, 'ORD009', 'SUB009'),
(10, 10, 2, 'ORD010', 'SUB010'),
(11, 11, 4, 'ORD011', 'SUB011'),
(12, 12, 3, 'ORD012', 'SUB012'),
(13, 13, 2, 'ORD013', 'SUB013'),
(14, 14, 5, 'ORD014', 'SUB014'),
(15, 15, 1, 'ORD015', 'SUB015'),
(16, 16, 3, 'ORD016', 'SUB016'),
(17, 17, 4, 'ORD017', 'SUB017'),
(18, 18, 2, 'ORD018', 'SUB018'),
(19, 19, 1, 'ORD019', 'SUB019'),
(20, 20, 5, 'ORD020', 'SUB020');


# hiển thị username, tên món ăn của order với user_id=5

SELECT users.full_name, food.food_name from orders
INNER JOIN users on users.user_id = orders.user_id
INNER join food on orders.food_id = food.food_id
where orders.user_id = 5 

#inner join: lấy tất cả data có liên kết
#left join lấy tất cả data có liên kết và tất cả data của table bên trái
#right join thì ngược lại với left join
#outjoin là lấy phần không giao nhau

# table sau keyword FROM là table bên trái
# table sau keyword JOIN là table bên phải


# count, max, min, sum, avg => group by
# Tìm 5 người like nhà hàng nhiều nhất 
	SELECT COUNT(u.user_id) as 'Tổng like', u.user_id as 'Số ID', u.full_name from users u
	INNER JOIN like_res lr on u.user_id = lr.user_id
	# WHERE u.user_id=1
	GROUP by  u.user_id, u.full_name
	ORDER BY COUNT(u.user_id) DESC
	LIMIT 5 
	HAVING COUNT(u.user_id)=1
	
	
# trên những hàm tổng hợp thì filter bằng HAVING


# tìm người dùng không có hoạt động => connect table left join => user_id các table khác == null


# tìm 2 nhà hàng có lượt like nhiều nhất
select COUNT(restaurant.res_id), restaurant.res_name, restaurant.res_id from restaurant
INNER join like_res on like_res.res_id = restaurant.res_id
GROUP by restaurant.res_name, restaurant.res_id
ORDER by COUNT(restaurant.res_id) DESC
LIMIT 2 

# tìm người đã đặt hàng nhiều nhất
select COUNT(u.user_id), u.user_id, u.full_name from users u 
INNER join orders o on o.user_id = u.user_id
GROUP BY u.user_id, u.full_name
ORDER BY COUNT(u.user_id) DESC
limit 1

# tìm người dùng không hoạt động trong hệ thống u.user_id, u.full_name
SELECT * from users u 
LEFT join like_res lr on lr.user_id = u.user_id
LEFT join rate_res rr on rr.user_id = u.user_id
LEFT join orders o on o.user_id = u.user_id
where lr.user_id IS null and rr.user_id is null and o.user_id is null






