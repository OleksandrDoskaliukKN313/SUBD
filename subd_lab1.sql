CREATE DATABASE subd
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Ukrainian_Ukraine.1251'
    LC_CTYPE = 'Ukrainian_Ukraine.1251'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

CREATE SCHEMA optovabaza
    AUTHORIZATION postgres;

CREATE TABLE optovabaza.provider (
provider_id INTEGER NOT NULL, 
provider_surname CHAR(20) NOT NULL, 
provider_name CHAR(16) NOT NULL, 
provider_fathername CHAR(20) NOT NULL, 
sex CHAR(10) NOT NULL, 
phone_number INTEGER NOT NULL, 
city CHAR(20) NOT NULL, 
street CHAR(20) NOT NULL, 
house_number CHAR(6) NOT NULL,
PRIMARY KEY(provider_id));



CREATE TABLE optovabaza.optovabaza(
	optovabaza_id INTEGER NOT NULL, 
optovabaza_name CHAR(20) NOT NULL, 
optovabaza_phone_number INTEGER NOT NULL, 
director_name CHAR(20) NOT NULL, 
director_surname CHAR(16) NOT NULL, 
director_fathername CHAR(20) NOT NULL, 
optovabaza_city CHAR(20) NOT NULL, 
optovabaza_street CHAR(20) NOT NULL, 
optovabaza_housenum CHAR(6) NOT NULL,
PRIMARY KEY(optovabaza_id));

CREATE TABLE optovabaza.customer (
customer_id INTEGER NOT NULL, 
customer_surname CHAR(20) NOT NULL, 
customer_name CHAR(16) NOT NULL, 
customer_fathername CHAR(20) NOT NULL, 
customer_sex CHAR(10) NOT NULL, 
customer_phonenumber INTEGER NOT NULL, 
customer_city CHAR(20) NOT NULL, 
customer_street CHAR(20) NOT NULL, 
customer_housenumber CHAR(6) NOT NULL,
PRIMARY KEY(customer_id));

CREATE TABLE optovabaza.typeOfGoods(
	typeOfGoods_id INTEGER NOT NULL, 
typeOfGoods_name CHAR(20) NOT NULL, 
typeOfGoods_characteristic VARCHAR NOT NULL,
PRIMARY KEY(typeOfGoods_id));


CREATE TABLE optovabaza.goods(
	goods_id INTEGER NOT NULL, 
goods_typeofgoods INTEGER NOT NULL, 
goods_name CHAR(20) NOT NULL, 
goods_brand CHAR(20) NOT NULL, 
goods_cost MONEY NOT NULL, 
goods_producingCountry CHAR(20) NOT NULL,
goods_description VARCHAR NOT NULL,
PRIMARY KEY(goods_id),
CONSTRAINT FKtypeofgoods FOREIGN KEY
(goods_typeofgoods)
REFERENCES optovabaza.typeofgoods ON DELETE CASCADE ON UPDATE CASCADE);


CREATE TABLE optovabaza.employee(
	employee_id INTEGER NOT NULL, 
employee_surname CHAR(20) NOT NULL, 
employee_name CHAR(16) NOT NULL, 
employee_fathername CHAR(20) NOT NULL, 
employee_sex CHAR(10) NOT NULL, 
employee_dateofbirthday Date NOT NULL,
employee_phonenumber INTEGER NOT NULL, 
employee_city CHAR(20) NOT NULL, 
employee_street CHAR(20) NOT NULL, 
employee_housenumber CHAR(6) NOT NULL, 
employee_position CHAR(20) NOT NULL,
PRIMARY KEY(employee_id));


CREATE TABLE optovabaza.storage(
	storage_id INTEGER NOT NULL, 
storage_area INTEGER NOT NULL, 
storage_phonenumber INTEGER NOT NULL, 
storage_directorsurname CHAR(20) NOT NULL, 
storage_directorname CHAR(16) NOT NULL, 
storage_directorfathername CHAR(20) NOT NULL, 
storage_directorsex CHAR(10) NOT NULL, 
storage_characterisric VARCHAR NOT NULL,
PRIMARY KEY(storage_id));

CREATE TABLE optovabaza.delivery (
	delivery_id INTEGER NOT NULL, 
delivery_provider_id INTEGER NOT NULL, 
delivery_optovabaza_id INTEGER NOT NULL, 
delivery_storage_id INTEGER NOT NULL, 
delivery_goods_id INTEGER NOT NULL, 
delivery_dateofdelivery Date NOT NULL, 
delivery_countofgoods INTEGER NOT NULL, 
delivery_cost MONEY NOT NULL,
PRIMARY KEY(delivery_id),
CONSTRAINT FKprovider FOREIGN KEY
(delivery_provider_id)
REFERENCES optovabaza.provider ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FKoptovabaza FOREIGN KEY
(delivery_optovabaza_id)
REFERENCES optovabaza.optovabaza ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FKstorage FOREIGN KEY
(delivery_storage_id)
REFERENCES optovabaza.storage ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FKgoods FOREIGN KEY
(delivery_goods_id)
REFERENCES optovabaza.goods ON DELETE CASCADE ON UPDATE CASCADE);


CREATE TABLE optovabaza.selling (
	selling_id INTEGER NOT NULL, 
selling_customer_id INTEGER NOT NULL, 
selling_employee_id INTEGER NOT NULL, 
selling_optovabaza_id INTEGER NOT NULL, 
selling_storage_id INTEGER NOT NULL, 
selling_goods_id INTEGER NOT NULL, 
selling_dateofselling Date NOT NULL, 
selling_countofgoods INTEGER NOT NULL, 
PRIMARY KEY(selling_id),
CONSTRAINT FKcustomer FOREIGN KEY
(selling_customer_id)
REFERENCES optovabaza.customer ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FKoptovabaza FOREIGN KEY
(selling_optovabaza_id)
REFERENCES optovabaza.optovabaza ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FKstorage FOREIGN KEY
(selling_storage_id)
REFERENCES optovabaza.storage ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FKemployee FOREIGN KEY
(selling_employee_id)
REFERENCES optovabaza.employee ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FKgoods FOREIGN KEY
(selling_goods_id)
REFERENCES optovabaza.goods ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE optovabaza.employmentagreement(
	employmentagreement_id INTEGER NOT NULL, 
employmentagreement_employee_id INTEGER NOT NULL, 
employmentagreement_optovabaza_id INTEGER NOT NULL, 
employmentagreement_dateofagreement Date NOT NULL,
PRIMARY KEY(employmentagreement_id),
CONSTRAINT FKemployee FOREIGN KEY
(employmentagreement_employee_id)
REFERENCES optovabaza.employee ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FKoptovabaza FOREIGN KEY
(employmentagreement_optovabaza_id)
REFERENCES optovabaza.optovabaza ON DELETE CASCADE ON UPDATE CASCADE);
# SUBD
# SUBD
