using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using MySql;
using MySql.Data;
using MySql.Data.MySqlClient;
using MySQL_Class_Csharp.Properties;
using System.Configuration;
using System.Windows.Forms;

namespace MySQL_Class_Csharp.BLL
{
    class Read_products
    {
        DAL.CONNECTION connect = new DAL.CONNECTION();

        /* Store Procedure without parameters / Procedimiento almacenado sin parámetros */
        public DataTable products_list()
        {
            DataTable search = new DataTable();
            search = connect.Query_Procedure("sp_simpleread", new object[] { new MySqlParameter() });
            return search;
        }

        public void simple_products_list(DataGridView grid)
        {
            connect.simple_query("select  name_p as Name, price_p as Price from product;", grid);
        }

    }
}
