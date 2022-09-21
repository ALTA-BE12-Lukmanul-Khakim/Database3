CREATE DATABASE database3;

USE database3;

CREATE TABLE `product_type`(
    id_type INT (11) auto_increment primary key,
    name_type VARCHAR (255)  not NULL,
    create_at TIMESTAMP default current_timestamp(),
    updated_at TIMESTAMP default current_timestamp on update current_timestamp()
);

CREATE TABLE `merk`(
    id_merk INT (11) auto_increment primary key,
    name_merk VARCHAR (255)  not NULL,
    create_at TIMESTAMP default current_timestamp(),
    updated_at TIMESTAMP default current_timestamp on update current_timestamp()
);

CREATE TABLE `product`(
    id_product INT (11) auto_increment primary key,
    type_product INT (11),
    merk INT (11),
    code VARCHAR (50) not NULL,
    name VARCHAR (100) not NULL,
    status smallint,
    create_at TIMESTAMP default current_timestamp(),
    update_at TIMESTAMP default current_timestamp on update current_timestamp(),
    constraint fk_product_type foreign key (type_product) references product_type(id_type) on delete cascade,
    constraint fk_product_merk foreign key (merk) references merk(id_merk) on delete cascade
);

CREATE TABLE `product_description`(
    id INT (11),
    descrision TEXT not NULL ,
    create_at TIMESTAMP default current_timestamp(),
    update_at TIMESTAMP default current_timestamp on update current_timestamp(),
    constraint fk_product_description_product foreign key (id) references product(id_product) on delete cascade,
    primary key (id)
);

CREATE TABLE `user`(
    id_user INT (11) auto_increment primary key,
    status smallint not NULL,
    dob datetime not NULL,
    gender char (1),
    create_at TIMESTAMP default current_timestamp(),
    update_at TIMESTAMP default current_timestamp on update current_timestamp()
    --name
);

CREATE TABLE `payment_method`(
    id_payment INT (11) auto_increment primary key,
    name VARCHAR (255) not NULL,
    status smallint not NULL,
    create_at TIMESTAMP default current_timestamp(),
    update_at TIMESTAMP default current_timestamp on update current_timestamp()
);

CREATE TABLE `transaction`(
    id_transaction INT (11) auto_increment primary key,
    user INT (11),
    payment INT (11),
    status VARCHAR (10) not NULL,
    total_qty INT (11) not NULL,
    total_price bigint not NULL,
    create_at TIMESTAMP default current_timestamp(),
    update_at TIMESTAMP default current_timestamp on update current_timestamp(),
    constraint fk_transaction_user foreign key (user) references user(id_user) on delete cascade,
    constraint fk_transaction_payment foreign key (payment) references payment_method(id_payment) on delete cascade
);

CREATE TABLE `detail_transaction`(
    transaction INT (11),
    product INT (11),
    status VARCHAR (10) not NULL,
    qty INT (11) not NULL,
    price bigint not NULL,
    create_at TIMESTAMP default current_timestamp(),
    update_at TIMESTAMP default current_timestamp on update current_timestamp(),
    constraint fk_detail_transaction foreign key (transaction) references transaction(id_transaction) on delete cascade,
    constraint fk_detail_transaction_product foreign key (product) references product(id_product) on delete cascade,
    primary key (transaction,product)
   -- primary key (product)
);




ALTER TABLE `user` add column name VARCHAR (50) not NULL

INSERT INTO product_type (name_type) VALUES ('CARGER')
INSERT INTO product_type (name_type) VALUES ('HEADSET')
INSERT INTO product_type (name_type) VALUES ('POWER BANK')

INSERT INTO merk (name_merk) VALUES ('ROBOT')
INSERT INTO merk (name_merk) VALUES ('SAMSUNG')
INSERT INTO merk (name_merk) VALUES ('XIAOMI')
INSERT INTO merk (name_merk) VALUES ('HIPPO')
INSERT INTO merk (name_merk) VALUES ('VIVO')



INSERT INTO product (type_product,merk,code,name,status) VALUES 
(1,3,'ACC01','Carger xiaomi fast',50),
(1,3,'ACC02','Carger xiaomi',30)

INSERT INTO product (type_product,merk,code,name,status) VALUES 
(2,1,'ACC03','Headset ROBOT gaming',150),
(2,1,'ACC04','Headset ROBOT Full bass',70),
(2,1,'ACC05','Headset ROBOT',40)

INSERT INTO product (type_product,merk,code,name,status) VALUES 
(3,4,'ACC06','Power Bank HIPPO 30000mAh',150),
(3,4,'ACC07','Power Bank HIPPO 20000mAh',100),
(3,4,'ACC08','Power Bank HIPPO 10000mAh',75)

INSERT INTO product_description(id,descrision) VALUES
(1,'carger xiaomi fast charging'),
(2,'carger xiaomi biasa'),
(3,'Headset ROBOT cocok untuk gammers'),
(4,'Headset ROBOT Full bass cocok untuk dj'),
(5,'Headset ROBOT biasa'),
(6,'Power Bank HIPPO dengan kapasitas 30000mAh'),
(7,'Power Bank HIPPO dengan kapasitas 20000mAh'),
(8,'Power Bank HIPPO dengan kapasitas 10000mAh')

INSERT INTO payment_method (name,status) VALUES 
('Cash-Uang Tunai',1),
('Transfer Bank',1),
('Dompet Digital (OVO dkk)',1)

INSERT INTO user (status,dob,gender,name) VALUES 
(1,1999-12-31,'L','Lukman'),
(2,2005-11-22,'L','Ferdi'),
(1,1996-09-28,'P','Ani'),
(2,2000-09-28,'P','Ucik'),
(3,1966-01-01,'L','Jarwo')

INSERT INTO transaction(user,payment,status,total_qty,total_price) VALUES
(1,1,1,3,230000),
(4,3,1,3,265000),
(5,1,1,3,325000),
(1,1,1,3,120000),
(5,1,1,3,290000),
(4,3,1,4,260000),
(1,3,1,4,205000),
(4,3,1,3,180000),
(5,1,1,3,325000)

INSERT INTO detail_transaction(transaction,product,status,qty,price) VALUES
(10,1,1,1,50000),
(10,2,1,1,30000),
(10,3,1,1,150000),
(11,3,1,1,150000),
(11,5,1,1,40000),
(11,8,1,1,75000),
(12,7,1,1,100000),
(12,8,1,1,75000),
(12,6,1,1,150000),
(13,5,1,1,40000),
(13,2,1,1,30000),
(13,1,1,1,50000),
(14,7,1,1,100000),
(14,3,1,1,150000),
(14,5,1,1,40000),
(15,4,1,1,70000),
(15,5,1,1,40000),
(15,6,1,1,150000),
(16,8,1,1,75000),
(16,2,1,1,30000),
(16,7,1,1,100000),
(17,1,1,1,50000),
(17,2,1,1,30000),
(17,7,1,1,100000),
(18,6,1,1,150000),
(18,7,1,1,100000),
(18,8,1,1,75000)



select name from user where gender = 'L' 

select name from product where id_product = 3

select * from user where create_at between '2022-09-14' and '2022-09-22'  and name like '%a%'

select  count (1) from user where gender = 'P'

select * from user order by name ASC

select * from detail_transaction where product = 3 limit 5




update product set name ='product dummy' where id_product = 1

update detail_transaction set product = 1 where qty =3



delete from product where id_product = 1 

delete from product where type_product = 1














