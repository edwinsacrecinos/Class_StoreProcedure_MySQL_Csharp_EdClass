drop procedure if exists sp_updateproducts;
DELIMITER //
create procedure sp_updateproducts (
id2 int,name_p2 varchar(45),category_p2 varchar(45),price_p2 decimal(10,2),note_p2 text, out message varchar (150) 
)
begin -- apertura del procedimiento 

-- //////////////////////////////////////////////////////////////////////////////////////////
    DECLARE `_rollback` INT DEFAULT 0;
    DECLARE `_rollback2` INT DEFAULT 0;
    /*Detectamos error de SQL al realizar el store procedure*/ 
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
    /*Detectamos Warning de SQL al realizar el store procedure*/ 
    DECLARE CONTINUE HANDLER FOR SQLWARNING SET `_rollback2` = 2;
-- //////////////////////////////////////////////////////////////////////////////////////////

    START TRANSACTION; /*Iniciamos la operación*/ 
	 update product
     set name_p= name_p2, category_p= category_p2, price_p= price_p2,note_p=note_p2
     where id=id2;
    
    /* Evaluamos los errores*/
    IF _rollback=1 or _rollback2=2
    THEN
    /*si existe error o warning deshacemos el store procedure*/
        ROLLBACK;
        set message='Error in the operation.';
    ELSE
    /*si no hay errores ejecutamos las operaciones realizadas en el store procedure  */
        COMMIT;
        set message='Successfully Updated.';
    END IF;
end -- cierre del procedimiento 
//
DELIMITER ;