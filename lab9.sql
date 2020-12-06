use optovabaza;
select * from goods;
select * from selling;
select * from storage;
select * from delivery;


select storage.storage_id as store, SUM(selling.selling_countofgoods) as count_of_different_goods	
	from(goods inner join selling) inner join storage
    on goods.goods_id = selling.selling_goods_id
    and selling.selling_storage_id = storage.storage_id
    group by storage.storage_id;

select YEAR(selling.selling_dateofselling) as year, monthname(selling.selling_dateofselling) as month,
	count(selling.selling_id) as sellings
    from selling group by year,month with rollup;
    
    
select customer.customer_name as cust , avg(selling.selling_countofgoods) as avgCount
	from selling inner join customer 
    on selling.selling_customer_id = customer.customer_id
    group by cust;
    
