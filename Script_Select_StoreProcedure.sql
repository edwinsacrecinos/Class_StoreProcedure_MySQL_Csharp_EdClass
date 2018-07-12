drop procedure if exists sp_simpleread;
DELIMITER //
create procedure sp_simpleread (
	
)
begin -- apertura del procedimiento 
	SELECT * FROM products.product;
end -- cierre del procedimiento 
//
DELIMITER ;