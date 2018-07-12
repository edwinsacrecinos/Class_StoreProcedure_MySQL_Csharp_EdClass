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

namespace MySQL_Class_Csharp.DAL
{
    class CONNECTION
    {

        /* ---------------------- Connection DB Area ---------------------- */
        /* ---------------------- Área de conexión a BD ---------------------- */

        #region Variables
        private MySqlConnection connections;
        private MySqlCommand Command;
        private MySqlDataAdapter Data_Adapter;
        private DataTable Data_Table;
        #endregion

        #region ConnectionDB/ConectarBD
        // Conecction with StringConnection / Conexión con cadena de conexión
        private MySqlConnection Establish_Connection()
        {
            string stringconnection = "server=localhost;user id=youruser;password=yourpassword;persistsecurityinfo=True;database=products";
            return connections = new MySqlConnection(stringconnection);
        }
        #endregion

        #region Open and close connection / Abrir y Cerrar Conexion 
        private void Open_Connection()
        {
            if (connections.State != ConnectionState.Open)
            {
                connections.Open();
            }
        }
        private void Close_Connection()
        {
            if (connections.State != ConnectionState.Closed)
            {
                connections.Close();
            }
        }
        #endregion

        /* ---------------------- Query Building Area ---------------------- */
        /* ---------------------- Área de construcción de consultas ---------------------- */

        #region Execute Procedure / Ejecutar procedimiento Insert, update, delete
        public string Execute_Procedure(string storeprocedure, object[] parametros)
        {
            try
            {
                Command = new MySqlCommand(storeprocedure, Establish_Connection());
                Command.CommandType = CommandType.StoredProcedure;
                foreach (object parametro in parametros)
                {
                    var param = Command.Parameters.Add((MySqlParameter)parametro);
                }
                Open_Connection();
                string result = Command.ExecuteNonQuery().ToString();
                Close_Connection();
                return result;
            }
            catch (Exception ex)
            {
                Close_Connection();
                return ex.Message;
            }
        }
        #endregion

        #region Simple Query (select) / Consulta simple (select)
        public void simple_query(string sql, DataGridView Grid)
        {
            try
            {
                Command = new MySqlCommand(sql, Establish_Connection());
                Open_Connection();
                Data_Adapter = new MySqlDataAdapter();
                Data_Table = new DataTable();
                Data_Adapter.SelectCommand = Command;
                Data_Adapter.Fill(Data_Table);
                Grid.DataSource = Data_Table;
                Close_Connection();
            }
            catch (Exception)
            {
                Close_Connection();
                Grid.DataSource = null;
            }
        }
        #endregion

        #region Store Procedure Query / Procedimiento almacenado de consulta
        /* parameters or not parameters /  con o sin parámetros */
        public DataTable Query_Procedure(string storeprocedure, object[] parameters)
        {
        try
        {
            Data_Table = new DataTable();
            Data_Adapter = new MySqlDataAdapter();
            Command = new MySqlCommand(storeprocedure, Establish_Connection());
            foreach (MySqlParameter parameter in parameters)
            {
                Command.Parameters.Add((MySqlParameter)parameter);
            }
            Command.CommandType = CommandType.StoredProcedure;
            Data_Adapter.SelectCommand = Command;
            Data_Adapter.Fill(Data_Table);
            Close_Connection();
            return Data_Table;
        }
        catch
        {
            Close_Connection();
            return null;
        }
        }
        #endregion

}
}
