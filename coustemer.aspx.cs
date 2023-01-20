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
    public partial class WebForm11 : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack || !IsPostBack)
            {
                if (Session["user"] == null)
                {
                    Response.Redirect("welcomePage.aspx");
                }
                else
                {
                    Response.Write(Session["user"]);
                }
            }


        }
        protected void BtnLogOut_Click(object sender, EventArgs e)
        {

            Session.RemoveAll();
            Response.Redirect("welcomePage.aspx");
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    SqlConnection con = new SqlConnection(strcon);
            //    if (con.State == System.Data.ConnectionState.Closed)
            //    {
            //        con.Open();
            //    }
            //    SqlCommand cmd = new SqlCommand("INSERT INTO Customer_tab(Phno,Name,Address) values(@pno,@name,@address)", con);
            //    cmd.Parameters.AddWithValue("@pno", Convert.ToDecimal(txtPhone.Text));
            //    cmd.Parameters.AddWithValue("@name", txtname.Text);
            //    cmd.Parameters.AddWithValue("@address", txtAddress.Text);
            //    cmd.ExecuteNonQuery();
            //    MessageBoxButton btn = MessageBoxButton.OK;
            //    MessageBox.Show("Record Added Succesfully...", "Message", btn);
            //    con.Close();
            //}
            //catch (Exception ex)
            //{
            //    MessageBoxButton btn = MessageBoxButton.OK;
            //    MessageBox.Show(ex.ToString(), "", btn);
            //}

        }
    }
}