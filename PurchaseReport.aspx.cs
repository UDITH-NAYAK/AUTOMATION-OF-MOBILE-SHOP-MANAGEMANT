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
    public partial class WebForm13 : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Button1_Click(object sender, EventArgs e)
        {

            Session.RemoveAll();
            Response.Redirect("welcomePage.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
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

                SqlCommand cmd = new SqlCommand("SELECT [Bill_No], [Bill_Date], [Sup_Name], [qty], [Disc], [Tax], [Total], [Paid_Amt] FROM Purchase_Bill_tab", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                GridPurchase.DataSource = dt;
                GridPurchase.DataBind();
            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);

            }
        }



        protected void DropSortTable_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();

                }

                int index = DropSortTable.SelectedIndex;
                SqlCommand cmd;

                if (index == 1)
                {
                    cmd = new SqlCommand("SELECT [Bill_No], [Bill_Date], [Sup_Name], [qty], [Disc], [Tax], [Total], [Paid_Amt] FROM [Purchase_Bill_tab] ORDER BY Sup_Name", con);
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    GridPurchase.DataSource = dt;
                    GridPurchase.DataBind();
                }else if (index == 2)
                {
                    cmd = new SqlCommand("SELECT [Bill_No], [Bill_Date], [Sup_Name], [qty], [Disc], [Tax], [Total], [Paid_Amt] FROM [Purchase_Bill_tab] ORDER BY qty", con);
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    GridPurchase.DataSource = dt;
                    GridPurchase.DataBind();
                }
                else if (index == 3)
                {
                    cmd = new SqlCommand("SELECT [Bill_No], [Bill_Date], [Sup_Name], [qty], [Disc], [Tax], [Total], [Paid_Amt] FROM [Purchase_Bill_tab] ORDER BY Bill_Date", con);
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    GridPurchase.DataSource = dt;
                    GridPurchase.DataBind();
                }



            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);

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
                SqlCommand cmd = new SqlCommand("SELECT * FROM Purchase_Bill_tab where Bill_Date BETWEEN '" + dateFrom + "' and '" + dateEnd + "'", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                GridPurchase.DataSource = "";
                GridPurchase.DataSource = dt;
                GridPurchase.DataBind();
            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);

            }


        }

        
    }
}