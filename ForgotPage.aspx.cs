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
    public partial class WebForm5 : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            String userName = txtUserName.Text;
            String secQues = DropDownList1.SelectedItem.Text.ToString();
            String SecAns = txtAns.Text;
            String newpass = txtnewPass.Text;
            String Cpass = txtCpass.Text;
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
 
                    SqlCommand cmd = new SqlCommand("UPDATE Regist_tab set pass='" + newpass + "' where User_name='" + userName + "'",con);
                    Response.Write("<script> alert('Password changed succesfully...') </script>");
                    Response.Redirect("~/Home.aspx");
                    
                
                

            }
            catch (Exception ex)
            {
                errormsg.Text = ex.ToString();

            }
        }

        protected void txtAns_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void txtCpass_TextChanged(object sender, EventArgs e)
        {
            if (txtCpass.Text != txtnewPass.Text)
            {
                MessageBox.Show("Password does not match..");
            }
        }
        protected void btnAnswerSub_Click(object sender, EventArgs e)
        {
            String userName = txtUserName.Text;
            String secQues = DropDownList1.SelectedItem.Text.ToString();
            String SecAns = txtAns.Text;

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Regist_tab where User_name='" + userName + "' and security='" + secQues + "' and Secu_answer='" + SecAns + "'", con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.HasRows)
                {
                    PanelNewPass.Visible = true;
                    btnAnwerSub.Visible = false;
                    btnSubmit.Visible = true;
                    lblErrUserName.Visible = false;
                }
                else
                {
                    lblErrUserName.Visible = true;
                }
            }
            catch (Exception ex)
            {
                errormsg.Text = ex.ToString();

            }
        }
    }
}