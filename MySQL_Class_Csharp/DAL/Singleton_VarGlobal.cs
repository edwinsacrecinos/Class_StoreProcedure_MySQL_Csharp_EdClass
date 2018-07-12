using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySQL_Class_Csharp.DAL
{
    public class Singleton_VarGlobal
    {
        private static Singleton_VarGlobal data;
        private Singleton_VarGlobal(){}

        public static Singleton_VarGlobal Instance()
        {
            if (data == null)
            {
                data = new Singleton_VarGlobal();
            }
            return data;
        }

        #region Global var data
        public string Global_id_p { get; set; }
        public string Global_name_p { get; set; }
        public string Global_category_p { get; set; }
        public string Global_price_p { get; set; }
        public string Global_note_p { get; set; }
        #endregion



    }
}
