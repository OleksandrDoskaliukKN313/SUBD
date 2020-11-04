use optovabaza;
show tables;
describe goods;

alter table goods
	drop foreign key goods_typeofgoods;

SHOW CREATE TABLE goods;

SHOW CREATE TABLE provider;

alter table provider
	drop column phone_number,
    modify column street char(30) not null;
	
SHOW CREATE TABLE customer;
alter table customer
	modify column customer_sex char(10) null;
SHOW CREATE TABLE customer;

SHOW CREATE TABLE storage;

set foreign_key_checks=1;
alter table goods
	modify goods_id int not null auto_increment;

alter table storage
	modify storage_area int(32) unsigned not null,
    add column storage_level_id tinyint(8) unsigned not null after storage_id,
    add constraint unique UQ_storage_id (storage_id);
describe storage;

alter table employmentagreement
	drop foreign key employmentagreement_employee,
    add CONSTRAINT employmentagreement_employee FOREIGN KEY
	(employmentagreement_employee_id)
	REFERENCES optovabaza.employee(employee_id) ON DELETE CASCADE;
show create table employmentagreement;