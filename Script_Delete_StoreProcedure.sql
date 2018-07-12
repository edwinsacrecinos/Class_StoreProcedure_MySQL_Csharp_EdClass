drop procedure if exists sp_deleteproducts ;
DELIMITER //
create procedure sp_deleteproducts (
id2 int, out message varchar (150)
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
		delete from product where id = id2;
    /* Evaluamos los errores*/
    IF _rollback=1 or _rollback2=2
    THEN
    /*si existe error o warning deshacemos el store procedure*/
        ROLLBACK;
	set message='Error in the operation.';

    ELSE
    /*si no hay errores ejecutamos las operaciones realizadas en el store procedure  */
        COMMIT;
	set message='Successfully Removed.';
    END IF;
end -- cierre del procedimiento 
//