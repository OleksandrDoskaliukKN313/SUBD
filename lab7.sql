use optovabaza;

select * from goods;
select * from employee;
select * from selling
group by selling_goods_id;

insert into selling 
	values
			(7,4,3,2,2,7,'2020-11-11',5),
            (8,2,1,4,1,8,'2020-11-10',40);

select goods_cost
	from goods 
    where goods_id = 6;
    
select goods.goods_id, goods.goods_name, goods.goods_brand, goods.goods_cost,
	selling.selling_dateofselling,selling.selling_countofgoods
    from goods left join selling on 
    goods.goods_id = selling.selling_goods_id;
    
select selling.selling_employee_id, employee.employee_surname,employee.employee_name,employee.employee_fathername
	from selling inner join employee on selling.selling_employee_id = employee.employee_id
	where selling.selling_countofgoods > 15;
    
select * from storage;

select optovabaza.optovabaza_id, optovabaza.optovabaza_name, selling.selling_dateofselling, selling.selling_countofgoods,
	storage.storage_area, storage.storage_phonenumber
    from(optovabaza inner join selling) inner join storage
    on optovabaza.optovabaza_id = selling.selling_optovabaza_id 
    and selling.selling_storage_id = storage.storage_id
    where selling.selling_dateofselling between '2020-10-9' and '2020-10-13';
		
    
select goods.goods_name, goods.goods_producingCountry, selling.selling_dateofselling, selling.selling_countofgoods
	from goods inner join selling
    on goods.goods_id = selling.selling_goods_id
    where goods.goods_id               in (select goods.goods_id from goods
    where goods.goods_producingCountry in('UK','UA') )
    order by selling.selling_id desc limit 3;
    
select goods.goods_id,goods.goods_name,goods.goods_brand from goods
	where not exists
    (select * from selling where selling.selling_goods_id = goods.goods_id);

SELECT * FROM employee WHERE employee.employee_phonenumber NOT REGEXP '[0-9]{3}-[0-9]{3}-[0-9]{4}';