use optovabaza;
 SET SQL_SAFE_UPDATES = 0;
show create table typeofgoods;
insert into typeofgoods values(1,'type1','characteristic1');
insert into typeofgoods
 values(2,'type2','characteristic2'),
		(3,'type3','characteristic3'),
        (4,'type4','characteristic4'),
        (5,'type5','characteristic5');
select * from typeofgoods;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/goods.tbl' into table goods 
	lines terminated by '\r\n';
select * from goods;

update goods set goods_brand = 'updatebrand'
	where goods_name ='4goods';
update goods set typeofgoods_id=typeofgoods_id+1
	order by goods_id desc;
select * from goods;


delete from typeofgoods where(
	typeofgoods_name = 'type1');
select * from typeofgoods;

delete from goods where(goods_id>0);


delete from typeofgoods where(typeofgoods_id>0);