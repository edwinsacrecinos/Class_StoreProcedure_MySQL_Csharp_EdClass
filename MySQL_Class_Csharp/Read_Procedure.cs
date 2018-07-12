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
    public partial class Read_Procedure : Form
    {
        public Read_Procedure()
        {
            InitializeComponent();
        }
        
        private void Select_Products()
        {
            BLL.Read_products query = new BLL.Read_products();
            try
            {
                this.dataGridView1.DataSource = query.products_list();
                this.dataGridView1.DefaultCellStyle.Font = new Font("Microsoft Sans Serif", 10);
                this.dataGridView1.Refresh();
            }
            catch (Exception)
            {
                this.dataGridView1.DataSource = null;
                MessageBox.Show("Error in connection");
            }
        }
        private void Read_Procedure_Load(object sender, EventArgs e)
        {
            Select_Products();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DAL.Singleton_VarGlobal Var_Global = DAL.Singleton_VarGlobal.Instance();
            Var_Global.Global_id_p = this.dataGridView1.CurrentRow.Cells[0].EditedFormattedValue.ToString();
            Var_Global.Global_name_p = this.dataGridView1.CurrentRow.Cells[1].EditedFormattedValue.ToString();
            Var_Global.Global_category_p = this.dataGridView1.CurrentRow.Cells[2].EditedFormattedValue.ToString();
            Var_Global.Global_price_p = this.dataGridView1.CurrentRow.Cells[3].EditedFormattedValue.ToString();
            Var_Global.Global_note_p = this.dataGridView1.CurrentRow.Cells[4].EditedFormattedValue.ToString();
            Update newform = new Update();
            newform.ShowDialog();
            Select_Products();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            Create newform = new Create();
            newform.ShowDialog();
            Select_Products();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            BLL.Delete_products delete_product = new BLL.Delete_products();
            int id = Convert.ToInt32(this.dataGridView1.CurrentRow.Cells[0].EditedFormattedValue);
            string MyProduct = this.dataGridView1.CurrentRow.Cells[1].EditedFormattedValue.ToString();
            string message;
            if (MessageBox.Show("Do you want to delete? " + MyProduct ,"Product",
              MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                message = delete_product.delete_products(id);
                MessageBox.Show(message);
                Select_Products();
            }

            
            
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Simple_Read newform = new Simple_Read();
            newform.ShowDialog();
        }
    }
}
