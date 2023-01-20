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
    public partial class WebForm21 : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void BtnLogOut_Click(object sender, EventArgs e)
        {

            Session.RemoveAll();
            Response.Redirect("welcomePage.aspx");
        }

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

            try
            {


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();

                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Service_Bill_tab", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                GridService.DataSource = dt;
                GridService.DataBind();

            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);

            }
        }

        protected void DropSortTable_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtEndDate_TextChanged(object sender, EventArgs e)
        {
            DateTime dateF = Convert.ToDateTime(txtStartDate.Text);
            DateTime dateE = Convert.ToDateTime(txtEndDate.Text);

            String dateFrom = dateF.ToString("yyyy-MM-dd");
            String dateEnd = dateE.ToString("yyyy-MM-dd");
            try { 


            SqlConnection con = new SqlConnection(strcon);
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open();

            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM Service_Bill_tab where Date BETWEEN '" + dateFrom + "' and '" + dateEnd + "'", con);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            GridService.DataSource = "";
            GridService.DataSource = dt;
            GridService.DataBind();
        }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
        MessageBox.Show(ex.ToString(), "", btn);

            }

}
    }
}