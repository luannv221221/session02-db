-- tạo database

CREATE DATABASE session02_java06;
USE session02_java06;

-- tạo bảng
CREATE TABLE student
(
    student_code varchar(11),
    full_name    varchar(100),
    email        varchar(50),
    phone        varchar(15),
    address      varchar(255),
    age          int,
    sex          bit(1)
);

-- thêm 1 cột vào bảng student
ALTER TABLE student
    ADD birthday DATE;

-- xóa 1 cột trong bảng
ALTER TABLE student
    DROP COLUMN age;

-- thay đổi kiểu dữ liệu của 1 cột trong bảng
ALTER TABLE student
    MODIFY address text;

-- THêm mới 1 bản ghi

INSERT INTO student(student_code, full_name, email, phone, address, birthday, sex)
    value ('B001', 'Nguyễn Duy Quang', 'uangnd@gmail,com', '0338976990', 'Đông Mỹ Thanh Trì', '1984-12-22', true);

INSERT INTO student(student_code, full_name, email, phone, address, birthday, sex)
VALUES ('B002', 'Trần Minh Cường', 'cuongtm@gmail,com', '0338976990', 'Bồ Đề Long Biên', '1995-01-01', true),
       ('B003', 'Nguyễn Thị Ngọc Ánh', 'anhtm@gmail,com', '0338976990', 'Không nhớ', '2001-12-22', true);

INSERT INTO student(student_code, email, phone, address, birthday, sex)
    value ('B007', 'uangnd@gmail,com', '0338976990', 'Đông Mỹ Thanh Trì', '2025-12-22', true);

-- xóa bảng
DROP TABLE student;
-- tạo bảng
CREATE TABLE student
(
    student_code varchar(11) primary key, -- ràng buộc khóa chỉnh
    full_name    varchar(100),
    email        varchar(50),
    phone        varchar(15),
    address      varchar(255),
    age          int,
    sex          bit(1)
);

INSERT INTO student(student_code, full_name, email, phone, address, sex)
    value ('B001', 'Nguyễn Duy Quang 2', 'uangnd@gmail,com', '0338976990', 'Đông Mỹ Thanh Trì', true);
INSERT INTO student(full_name, email, phone, address, sex)
    value ('Nguyễn Duy Quang 2', 'uangnd@gmail,com', '0338976990', 'Đông Mỹ Thanh Trì', true);

INSERT INTO student(student_code, full_name, email, phone, address, sex)
    value ('B002', 'Nguyễn Duy Quang 2', 'uangnd@gmail,com', '0338976990', 'Đông Mỹ Thanh Trì', true);

INSERT INTO student(student_code, email, phone, address, sex)
    value ('B003', 'uangnd@gmail,com', '0338976990', 'Đông Mỹ Thanh Trì', true);

-- Rang buộc không rỗng

-- tạo bảng lớp học
CREATE TABLE classes
(
    id         int primary key auto_increment,
    class_name varchar(50) NOT NULL,
    status     bit(1) default 1
);

INSERT INTO classes (class_name) VALUE ('JAVA2406');

INSERT INTO classes (class_name, status) VALUE ('JAVA2406', 0);

-- xóa bảng
DROP TABLE classes;
-- Ràng buộc duy nhất
CREATE TABLE classes
(
    id         int primary key auto_increment,
    class_name varchar(50) NOT NULL unique ,
    status     bit(1) default 1
);

INSERT INTO classes (class_name) VALUE ('JAVA2407');

DROP TABLE product;

CREATE TABLE product(
    id int primary key auto_increment,
    name varchar(200) NOT NULL UNIQUE ,
    price double NOT NULL check ( price > 0 ),
    sale_price double NOT NULL check ( price > product.sale_price AND sale_price>0)
);

INSERT INTO product(name, price, sale_price) VALUE ('ÁO BÀ BA',200,110);

DROP TABLE product;
-- TẠO BẢNG DANH MỤC

CREATE TABLE category(
    id int primary key auto_increment,
    category_name varchar(50) unique NOT NULL ,
    status bit(1) default 1
);

CREATE TABLE product(
    id int primary key auto_increment,
    product_name varchar(100) NOT NULL unique ,
    price DOUBLE check ( price>0 ),
    category_id int not null ,
    foreign key (category_id) references category(id)
);

INSERT INTO category(category_name) VALUES
    ('ÁO'),('Quần'),('Dép');

INSERT INTO product(product_name,price,category_id) VALUE ('Ao Sơn Tùng',100,1);
INSERT INTO product(product_name,price,category_id) VALUE ('Dép Nam Thư',1000,3);

SELECT * FROM category;

UPDATE category SET  status = false WHERE id = 2;
UPDATE category SET category_name = 'Tông' where id = 3;

SELECT * FROM product;

-- update gias của tat ca san pham so gia nho hon 1000 giảm 10%

UPDATE product SET `price` = (price - (price * 0.1)) WHERE price <1000;

DELETE FROM  product; -- xoas het ban ghi trong bang product

DELETE FROM  category WHERE  id = 3;

-- SELECT
SELECT id,category_name FROM category;

SELECT  * FROM category;

-- SELECT keets hop menh de where
SELECT  * FROM  category WHERE status = true;
