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
    public partial class Update : Form
    {
        public Update()
        {
            InitializeComponent();
        }
        BLL.Update_products update_p = new BLL.Update_products();
        private void button1_Click(object sender, EventArgs e)
        {
            string message;
            message = update_p.update_products(Convert.ToInt32(textBox1.Text), textBox2.Text, textBox3.Text ,Convert.ToDecimal(textBox4.Text), textBox5.Text);
            MessageBox.Show(message);
            this.Close();
            
        }
        DAL.Singleton_VarGlobal Var_Global = DAL.Singleton_VarGlobal.Instance();
        private void Update_Load(object sender, EventArgs e)
        {
            textBox1.Text = Var_Global.Global_id_p;
            textBox2.Text = Var_Global.Global_name_p;
            textBox3.Text = Var_Global.Global_category_p;
            textBox4.Text = Var_Global.Global_price_p;
            textBox5.Text = Var_Global.Global_note_p;
                
        }
    }
}
