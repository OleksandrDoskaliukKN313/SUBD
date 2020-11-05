use optovabaza;

show tables;
show create table customer;
select * from customer;
alter table customer
	modify column customer_phonenumber char(11) not null;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer.tbl' into table customer 
	lines terminated by '\r\n';
    
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/provider.tbl' into table provider 
	lines terminated by '\r\n';
    
select * from goods;
insert into goods(goods_id, typeofgoods_id,goods_name,goods_brand,goods_cost,goods_producingCountry,goods_description)
	values(6,2,'6goods','newbrand',100,'UK','very beautiful'),
		(7,2,'7goods','Molokia',25,'UA','milk'),
		(8,3,'8goods','Prostokvashino',135,'UA','milk from movie');
        
create table goods1
	as select goods_id, typeofgoods_id,goods_name,goods_brand,goods_cost,goods_producingCountry,goods_description
		from goods
        where goods_cost < 40;
        
select*from goods1;

create table goods2
	as select goods_id, typeofgoods_id,goods_name,goods_brand,goods_cost,goods_producingCountry,goods_description
		from goods
        where goods_cost > 30;
        
select *from goods2;

select * from goods1
	union select * from goods2;
    
select * from goods1
	where typeofgoods_id in(select typeofgoods_id from goods2);
    
select * from goods1
	where typeofgoods_id not in(select typeofgoods_id from goods2);
    
select * from goods1,goods2;