use optovabaza;

select * from selling;	
select* from goods;
show create table selling;
show create table goods;
show create table sellingView;

create view sellingView as select distinct selling_id, selling_goods_id,selling_dateofselling, selling_countofgoods
	from selling;
select*from sellingView;

select * from sellingView
	where selling_dateofselling < '2020-10-13'
    
SELECT goods.goods_id, goods.goods_name, goods.goods_cost, goods.goods_brand, goods.goods_description,
		sellingView.selling_dateofselling, sellingView.selling_countofgoods
    from goods,sellingView
    where goods.goods_id = sellingView.selling_id and sellingView.selling_countofgoods <=16