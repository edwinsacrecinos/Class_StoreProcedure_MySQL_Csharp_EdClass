CREATE DATABASE  IF NOT EXISTS `products` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `products`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_p` varchar(45) NOT NULL,
  `category_p` varchar(45) NOT NULL,
  `price_p` decimal(10,2) NOT NULL,
  `note_p` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'products'
--

--
-- Dumping routines for database 'products'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_createproducts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createproducts`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_deleteproducts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteproducts`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_simpleread` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_simpleread`(
	
)
begin -- apertura del procedimiento 
	SELECT * FROM products.product;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updateproducts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateproducts`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-12 15:38:00
