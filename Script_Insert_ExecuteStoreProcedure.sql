set @message = '';
call sp_createproducts('Milk','fresh food',10.5,'none', @message);
select @message;