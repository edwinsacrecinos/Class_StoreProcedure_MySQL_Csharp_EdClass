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
    class Create_products
    {
        DAL.CONNECTION connect = new DAL.CONNECTION();

        public string insert_products(string name, string category, decimal price, string note)
        {
            string resultquery = "-";
            string message = "";
            try
            {
                var result = new MySqlParameter("?message", message)
                {
                    Direction = ParameterDirection.Output
                };
                resultquery = connect.Execute_Procedure("sp_createproducts",
                                            new object[] { new MySqlParameter("?name_p", name),
                                                           new MySqlParameter("?category_p",category),
                                                           new MySqlParameter("?price_p",price),
                                                           new MySqlParameter("?note_p",note),
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
