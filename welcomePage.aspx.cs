using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace MobileShop
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

      

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                String user = username.Text.Trim();
                String pass = password.Text.Trim();

                SqlCommand cmd = new SqlCommand("SELECT * from Regist_tab where User_name='" + user + "'" + "and pass='" + pass + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    Session["user"] = user;
                    
                        //Response.Write("<script>alert('hello " + dr.GetValue(0).ToString() + "');</script>");
                        Response.Redirect("~/Home.aspx");
                    
                }
                else
                {
                    MessageBox.Show("Username and password doesnot match!!");
                }
                



            }
            catch (Exception ex)
            {
                errmsg.Text = Convert.ToString(ex);
            }





        }

        
    }
}