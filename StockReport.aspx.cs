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
    public partial class WebForm18 : System.Web.UI.Page
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

            SqlConnection con = new SqlConnection(strcon);
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open();

            }

            SqlCommand cmd = new SqlCommand("SELECT * FROM Mobile_tab", con);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            GridStock.DataSource = dt;
            GridStock.DataBind();
        }

        protected void DropSortTable_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open();

            }
            int index = DropSortTable.SelectedIndex;
            if (index == 1)
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Mobile_tab ORDER BY Brand", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                GridStock.DataSource = dt;
                GridStock.DataBind();
            }else if (index == 2)
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Mobile_tab ORDER BY Model", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                GridStock.DataSource = dt;
                GridStock.DataBind();
            }else if (index == 3)
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Mobile_tab ORDER BY Qty", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                GridStock.DataSource = dt;
                GridStock.DataBind();
            }else if (index == 4)
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Mobile_tab ORDER BY Date", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                GridStock.DataSource = dt;
                GridStock.DataBind();
            }
        }

        protected void txtEndDate_TextChanged(object sender, EventArgs e)
        {
            DateTime dateF = Convert.ToDateTime(txtStartDate.Text);
            DateTime dateE = Convert.ToDateTime(txtEndDate.Text);

            String dateFrom = dateF.ToString("yyyy-MM-dd");
            String dateEnd = dateE.ToString("yyyy-MM-dd");

            try
            {


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Mobile_tab where Date BETWEEN '" + dateFrom + "' and '" + dateEnd + "'", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                GridStock.DataSource = "";
                GridStock.DataSource = dt;
                GridStock.DataBind();
            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);

            }
        }
    }
}