use optovabaza;

select * from selling;

select goods_id, goods_brand from goods where goods_brand like '%brand%'
	order by goods_brand asc;
    
    
    
select selling_countofgoods,selling_dateofselling from selling 
	order by selling_dateofselling desc limit 5;
    
select optovabaza.optovabaza_id, optovabaza.optovabaza_name, selling.selling_dateofselling, selling.selling_countofgoods,
	storage.storage_area, storage.storage_phonenumber
    from(optovabaza inner join selling)
    inner join storage
    on optovabaza.optovabaza_id = selling.selling_optovabaza_id 
    and selling.selling_storage_id = storage.storage_id
    group by optovabaza_name;