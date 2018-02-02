drop database if exists parking;
create database parking default character set 'utf8';
use parking;
CREATE TABLE roles(
	id INTEGER NOT NULL PRIMARY KEY,
	name VARCHAR(10) NOT NULL UNIQUE
);
INSERT INTO roles VALUES(0, 'admin');
INSERT INTO roles VALUES(1, 'manager');
INSERT INTO roles VALUES(2, 'user');
INSERT INTO roles VALUES(3, 'unknown');
CREATE TABLE users(
	id INTEGER NOT NULL auto_increment PRIMARY KEY,
	login VARCHAR(20) NOT NULL UNIQUE,
	password VARCHAR(20) NOT NULL,
	name VARCHAR(20) NOT NULL,
	surname VARCHAR(20) NOT NULL,
	city VARCHAR(20) NOT NULL,
	number VARCHAR(12) NOT NULL,
	roleId INTEGER NOT NULL, 
	foreign key(roleId) REFERENCES roles(id) 
		ON DELETE CASCADE 
		ON UPDATE CASCADE
);
CREATE table cars (
id INTEGER NOT NULL auto_increment PRIMARY KEY,
mark VARCHAR(40) NOT NULL,
model VARCHAR(40) NOT NULL,
autoClass VARCHAR(40) NOT NULL,
price INTEGER NOT NULL,
body VARCHAR(40) NOT NULL,
engine DOUBLE NOT NULL,
transmission VARCHAR(40) NOT NULL,
fuel VARCHAR(40) NOT NULL,
imageURL VARCHAR(100) NOT NULL DEFAULT 'default_image.jpg'

);
create table status(
	id INTEGER NOT NULL PRIMARY KEY,
	name VARCHAR(40) NOT NULL UNIQUE
);
INSERT INTO status VALUES(0,'waiting_pay');
INSERT INTO status VALUES(1,'payed');
INSERT INTO status VALUES(2,'confirmed');
INSERT INTO status VALUES(3,'rejected');
INSERT INTO status VALUES(4,'returned');

create table locked_users(
userId INTEGER NOT NULL,
foreign key (userId) REFERENCES users(id)
ON DELETE CASCADE 
ON UPDATE CASCADE
);

create table orders( 
id INTEGER NOT NULL auto_increment PRIMARY KEY,
userId INTEGER NOT NULL ,
statusId INTEGER NOT NULL ,
days INTEGER NOT NULL,
price INTEGER NOT NULL,
withDriver boolean NOT NULL,
dateStart date NOT NULL,
dateEnd date NOT NULL,
name varchar(40) NOT NULL,
surname varchar(40) not NULL,
patronymic varchar(40),
sex varchar(10) not NULL,
city varchar(40) not NULL,
borningDate date not NULL,
reason varchar(200),
foreign key (userId) REFERENCES users(id) 
ON DELETE CASCADE 
ON UPDATE CASCADE,
foreign key (statusId) REFERENCES status(id) 
ON DELETE CASCADE 
ON UPDATE CASCADE
);
create table accounts(
id INTEGER NOT NULL auto_increment PRIMARY KEY,
userId INTEGER NOT NULL,
statusId INTEGER NOT NULL ,
price INTEGER NOT NULL,
dateCreate date not NULL,
message VARCHAR(200),
foreign key (statusId) REFERENCES status(id)  
ON DELETE CASCADE
ON UPDATE CASCADE
);
create table orders_cars(
orderId INTEGER NOT NULL,
carId INTEGER NOT NULL,
PRIMARY KEY(orderId,carId) ,
foreign key (orderId) REFERENCES orders(id) 
on delete cascade
on update cascade

);
INSERT INTO users(login,password,name,surname,city,number,roleId) VALUES('monolit9951','monolit','ruslan','bay','kharkov','380990091048',0);
INSERT INTO users(login,password,name,surname,city,number,roleId) VALUES('1','1','ruslan','bay','kharkov','380990091048',0);

INSERT INTO cars (mark,model,autoClass,price,body,engine,transmission,fuel,imageURL) VALUES('Ford', 'Mondeo', '�',80 ,'�����', 2.3,'�������','������','ford_mondeo.jpg'); 
INSERT INTO cars (mark,model,autoClass,price,body,engine,transmission,fuel,imageURL) VALUES('Toyota', 'Land Cruiser Prado', 'J',180,'�������', 4.2,'�������','������','toyota_landcruiser.jpg');
INSERT INTO cars (mark,model,autoClass,price,body,engine,transmission,fuel,imageURL) VALUES('Toyota', 'Camry 40', 'D',80,'�����', 2.4,'�������','������','toyota_camry.jpg');
INSERT INTO cars (mark,model,autoClass,price,body,engine,transmission,fuel,imageURL) VALUES('Volkswagen', 'Polo', 'A',38,'�������', 1.4,'�������','������','volkswagen_polo.jpg');
INSERT INTO cars (mark,model,autoClass,price,body,engine,transmission,fuel,imageURL) VALUES('Volkswagen', 'Touareg', 'J',180,'�������', 3.0,'�������','������','volkswagen_touareg.jpg');
INSERT INTO cars (mark,model,autoClass,price,body,engine,transmission,fuel,imageURL) VALUES('Skoda', 'Rapid Spaceback', 'B',35 ,'�������', 1.6,'�������','������','skoda_rapid.jpg');
INSERT INTO cars (mark,model,autoClass,price,body,engine,transmission,fuel,imageURL) VALUES('Peugeot', 'Traveller', 'V',275,'�������', 2.0,'�������','������','peugeot_traveller.jpg');
INSERT INTO cars (mark,model,autoClass,price,body,engine,transmission,fuel,imageURL) VALUES('Lexus', 'RX350', 'J',269,'�������', 3.5,'�������','������','lexus_rx350.jpg');
INSERT INTO cars (mark,model,autoClass,price,body,engine,transmission,fuel,imageURL) VALUES('Citroen', 'C-Elysee', 'B',58,'�����', 1.6,'�������','������','citroen_c-elysee.jpg');
INSERT INTO cars (mark,model,autoClass,price,body,engine,transmission,fuel,imageURL) VALUES('Nissan', 'Sentra', 'C',119,'�����', 1.6,'�������','������','nissan_sentra.jpg');
INSERT INTO cars (mark,model,autoClass,price,body,engine,transmission,fuel,imageURL) VALUES('Audi', 'Q7', 'J',196,'���������', 3.0,'�������','������','audi_q7.png');
INSERT INTO cars (mark,model,autoClass,price,body,engine,transmission,fuel,imageURL) VALUES('Audi', 'A3', 'C',160,'�����', 1.6,'�������','������','audi_a3.jpg');
INSERT INTO cars (mark,model,autoClass,price,body,engine,transmission,fuel,imageURL) VALUES('Mitsubishi', 'Pajero Wagon', 'J',160,'���������', 3.0,'�������','������','mitsubishi_pajero.jpg');
INSERT INTO cars (mark,model,autoClass,price,body,engine,transmission,fuel) VALUES('Mitsubishi', 'Lancer X', 'C',48,'�����', 2.0,'�������','������');
