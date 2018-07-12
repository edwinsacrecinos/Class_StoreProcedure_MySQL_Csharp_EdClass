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
    class Update_products
    {
        DAL.CONNECTION connect = new DAL.CONNECTION();

        public string update_products(int id,string name, string category, decimal price, string note)
        {
            string resultquery = "-";
            string message = "";
            try
            {
                var result = new MySqlParameter("?message", message)
                {
                    Direction = ParameterDirection.Output
                };
                resultquery = connect.Execute_Procedure("sp_updateproducts",
                                            new object[] { new MySqlParameter("?id2", id),
                                                           new MySqlParameter("?name_p2", name),
                                                           new MySqlParameter("?category_p2",category),
                                                           new MySqlParameter("?price_p2",price),
                                                           new MySqlParameter("?note_p2",note),
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
