using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace MobileShop
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtpass.Text == txtCPass.Text)
            {


                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == System.Data.ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("SELECT COUNT(*) from Regist_tab where User_name='"+txtfname.Text+"'",con);
                    int count =Convert.ToInt32(cmd.ExecuteScalar());
                    if (count > 0)
                    {
                        MessageBox.Show("User name already registered..!!");
                    }
                    else
                    {


                        String ans = DropDownList1.SelectedItem.Text;
                        cmd = new SqlCommand("INSERT INTO Regist_tab (User_name,Phone,Pass,security,Secu_answer) values(@fname,@pno,@pass,@secu,@ans) ", con);
                        cmd.Parameters.AddWithValue("@fname", txtfname.Text);
                        cmd.Parameters.AddWithValue("@pno", Convert.ToString(txtphno.Text));
                        cmd.Parameters.AddWithValue("@pass", txtpass.Text);
                        cmd.Parameters.AddWithValue("@secu", ans);
                        cmd.Parameters.AddWithValue("@ans", txtAns.Text);

                        cmd.ExecuteNonQuery();
                        con.Close();
                        MessageBox.Show("Registration Successful");
                        Response.Redirect("./Home.aspx");
                    }
                }

                catch (Exception ex)
                {
                    MessageBox.Show(Convert.ToString(ex));
                }
            }
            else
            {
                MessageBox.Show("confirm password is not same as original!!");
            }

        }
    }
}
