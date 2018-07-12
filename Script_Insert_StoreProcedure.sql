drop procedure if exists sp_createproducts;
DELIMITER //
create procedure sp_createproducts (
name_p varchar(45),category_p varchar(45),price_p decimal(10,2),note_p text, out message varchar (150) 
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
	insert into product values (null,name_p,category_p,price_p,note_p);
    
    /* Evaluamos los errores*/
    IF _rollback=1 or _rollback2=2
    THEN
    /*si existe error o warning deshacemos el store procedure*/
        ROLLBACK;
        set message='Error in the operation.';
    ELSE
    /*si no hay errores ejecutamos las operaciones realizadas en el store procedure  */
        COMMIT;
        set message='Inserted Successfully.';
    END IF;
end -- cierre del procedimiento 
//
DELIMITER ;