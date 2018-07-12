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
    public partial class Create : Form
    {
        public Create()
        {
            InitializeComponent();
        }
        BLL.Create_products create_p = new BLL.Create_products();
        private void button1_Click(object sender, EventArgs e)
        {
            string message;
            message = create_p.insert_products(textBox1.Text,textBox2.Text,Convert.ToDecimal(textBox3.Text),textBox4.Text);
            MessageBox.Show(message);
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox1.Focus();
        }
    }
}
