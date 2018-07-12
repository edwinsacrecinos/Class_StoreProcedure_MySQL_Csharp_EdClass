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
    class Delete_products
    {
        DAL.CONNECTION connect = new DAL.CONNECTION();

        public string delete_products(int id)
        {
            string resultquery = "-";
            string message = "";
            try
            {
                var result = new MySqlParameter("?message", message)
                {
                    Direction = ParameterDirection.Output
                };
                resultquery = connect.Execute_Procedure("sp_deleteproducts",
                                            new object[] { new MySqlParameter("?id2", id),
                                                           result});
                message = result.Value.ToString();
            }
            catch (Exception ex)
            {
                message = ex.Message;
            }
            return message;
        }


    }
}
