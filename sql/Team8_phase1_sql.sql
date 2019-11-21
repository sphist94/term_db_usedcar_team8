DROP TABLE ACCOUNT CASCADE CONSTRAINT;
DROP TABLE CUSTOMER CASCADE CONSTRAINT;
DROP TABLE DEALER CASCADE CONSTRAINT;
DROP TABLE ADMINISTRATOR CASCADE CONSTRAINT;
DROP TABLE MAKER CASCADE CONSTRAINT;
DROP TABLE MODEL CASCADE CONSTRAINT;
DROP TABLE DETAILED_MODEL CASCADE CONSTRAINT;
DROP TABLE FUEL_TYPE CASCADE CONSTRAINT;
DROP TABLE COLOR_TYPE CASCADE CONSTRAINT;
DROP TABLE ENGINE_DISPLACEMENT CASCADE CONSTRAINT;
DROP TABLE TRANSMISSION CASCADE CONSTRAINT;
DROP TABLE ORDERS CASCADE CONSTRAINT;
DROP TABLE CONTROL CASCADE CONSTRAINT;
DROP TABLE VEHICLE CASCADE CONSTRAINT;
DROP TABLE CATEGORY CASCADE CONSTRAINT;
DROP TABLE COLORED CASCADE CONSTRAINT;
DROP TABLE FUELED CASCADE CONSTRAINT;

CREATE TABLE ACCOUNT(
Id VARCHAR(30) NOT NULL,
Password VARCHAR(15) NOT NULL,
Lname VARCHAR(15) NOT NULL,
Fname VARCHAR(15) NOT NULL,
Phone_no VARCHAR(15) NOT NULL,
Birth_date VARCHAR(15),
Gender CHAR,
Email VARCHAR(100),
Address VARCHAR(100),
Occupation VARCHAR(30),
Account_type INTEGER NOT NULL,
PRIMARY KEY(Id)
);

CREATE TABLE CUSTOMER(
Cuid VARCHAR(30) NOT NULL,
PRIMARY KEY(Cuid),
FOREIGN KEY(Cuid) REFERENCES ACCOUNT(Id)
);

CREATE TABLE DEALER(
Deid VARCHAR(30) NOT NULL,
PRIMARY KEY(Deid),
FOREIGN KEY(Deid) REFERENCES ACCOUNT(Id)
);

CREATE TABLE ADMINISTRATOR(
Adid VARCHAR(30) NOT NULL,
PRIMARY KEY(Adid),
FOREIGN KEY(Adid) REFERENCES ACCOUNT(Id)
);

CREATE TABLE MAKER(
Maname VARCHAR(30) NOT NULL,
National_no INTEGER NOT NULL,
PRIMARY KEY(Maname)
);

CREATE TABLE MODEL(
Maname VARCHAR(30) NOT NULL,
Moname VARCHAR(30) NOT NULL UNIQUE,
PRIMARY KEY(Maname, Moname),
FOREIGN KEY(Maname) REFERENCES MAKER(Maname)
);

CREATE TABLE DETAILED_MODEL(
Moname VARCHAR(30) NOT NULL,
Dename VARCHAR(30) NOT NULL,
PRIMARY KEY(Dename, Moname),
FOREIGN KEY(Moname) REFERENCES MODEL(Moname)
);


CREATE TABLE COLOR_TYPE(
Coid INT NOT NULL,
Coname VARCHAR(15) NOT NULL,
PRIMARY KEY(Coid)
);

CREATE TABLE ENGINE_DISPLACEMENT(
Enname VARCHAR(15) NOT NULL,
PRIMARY KEY(Enname)
);

CREATE TABLE TRANSMISSION(
Trname VARCHAR(15) NOT NULL,
PRIMARY KEY(Trname)
);

CREATE TABLE FUEL_TYPE(
Fuid INT NOT NULL,
Funame VARCHAR(15) NOT NULL,
PRIMARY KEY(Fuid)
);

CREATE TABLE CATEGORY(
Caname VARCHAR(15) NOT NULL,
PRIMARY KEY(Caname)
);

CREATE TABLE VEHICLE(
Poid INTEGER NOT NULL,
Deid VARCHAR(30) NOT NULL,
Age VARCHAR(10) NOT NULL,
Veid VARCHAR(30) NOT NULL,
Mileage INTEGER NOT NULL,
Price INTEGER NOT NULL,
Maname VARCHAR(30) NOT NULL,
Moname VARCHAR(30) NOT NULL,
Dename VARCHAR(30) NOT NULL,
Enname VARCHAR(15) NOT NULL,
Trname VARCHAR(15) NOT NULL,
Caname VARCHAR(15) NOT NULL,
PRIMARY KEY(Poid),
FOREIGN KEY(Deid) REFERENCES DEALER(Deid),
FOREIGN KEY(Maname) REFERENCES MAKER(Maname),
FOREIGN KEY(Trname) REFERENCES TRANSMISSION(Trname),
FOREIGN KEY(Enname) REFERENCES ENGINE_DISPLACEMENT(Enname),
FOREIGN KEY(Caname) REFERENCES CATEGORY(Caname)
);

CREATE TABLE COLORED(
Poid INTEGER NOT NULL,
Coid INTEGER NOT NULL,
PRIMARY KEY(Poid, Coid),
FOREIGN KEY(Poid) REFERENCES VEHICLE(Poid),
FOREIGN KEY(Coid) REFERENCES COLOR_TYPE(Coid)
);

CREATE TABLE FUELED(
Poid INTEGER NOT NULL,
Fuid INTEGER NOT NULL,
PRIMARY KEY(Poid, Fuid),
FOREIGN KEY(Poid) REFERENCES VEHICLE(Poid),
FOREIGN KEY(Fuid) REFERENCES FUEL_TYPE(Fuid)
);

CREATE TABLE ORDERS(
Sold_date VARCHAR(15) NOT NULL,
Poid INTEGER NOT NULL,
Cuid VARCHAR(30) NOT NULL,
PRIMARY KEY(Poid, Cuid),
FOREIGN KEY(Poid) REFERENCES VEHICLE(Poid),
FOREIGN KEY(Cuid) REFERENCES CUSTOMER(Cuid)
);

CREATE TABLE CONTROL(
Adid VARCHAR(30) NOT NULL,
Poid INTEGER NOT NULL,
PRIMARY KEY(Adid, Poid),
FOREIGN KEY(Adid) REFERENCES ADMINISTRATOR(Adid),
FOREIGN KEY(Poid) REFERENCES VEHICLE(poid)
);
