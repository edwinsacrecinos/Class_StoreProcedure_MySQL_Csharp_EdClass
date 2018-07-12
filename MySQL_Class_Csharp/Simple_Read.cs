using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MySQL_Class_Csharp
{
    public partial class Simple_Read : Form
    {
        public Simple_Read()
        {
            InitializeComponent();
        }

        private void Simple_Read_Load(object sender, EventArgs e)
        {
            BLL.Read_products query = new BLL.Read_products();
            query.simple_products_list(this.dataGridView1);
        }
    }
}
