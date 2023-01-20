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
    public partial class WebForm15 : System.Web.UI.Page
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
        }

        protected void BtnSerch_Click(object sender, EventArgs e)
        {
            try
            {
                String invoiceNum = txtInvoiceNo.Text;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmdItemName = new SqlCommand("Select  Item_Name from Sales_tab where Invoice_No='" + invoiceNum + "'", con);
                DataTable dtName = new DataTable();
                SqlDataAdapter adpName = new SqlDataAdapter(cmdItemName);
                if (dtName.Rows.Count > 0)
                {


                    adpName.Fill(dtName);
                    DropItemName.Items.Insert(0, "--select--");
                    for (int i = 1; i <= dtName.Rows.Count; i++)
                    {
                        String row = Convert.ToString(dtName.Rows[i - 1][0]);
                        DropItemName.Items.Insert(i, row);
                    }

                    //Displaying Searched item id and displaying it in the GridView
                    SqlCommand cmd = new SqlCommand("Select  * from Sales_tab where Invoice_No='" + invoiceNum + "'", con);
                    DataTable dt = new DataTable();
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    adp.Fill(dt);
                    GridPurchased.DataSource = dt;
                    GridPurchased.DataBind();
                }
                else
                {
                    MessageBox.Show("No record found with Invoice Number : " + invoiceNum);
                }



            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);

            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            try
            {
                String invoiceNum = txtInvoiceNo.Text;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO SalesReturn_tab(Invoice_No,R_Date,Item_Name,IMEI,Dmg_Dis)" +
                    "values(@ino,@date,@itname,@IMEI,@dis)", con);
                cmd.Parameters.AddWithValue("@ino", txtInvoiceNo.Text);
                cmd.Parameters.AddWithValue("@date", Convert.ToDateTime(txtReturnDate.Text));
                cmd.Parameters.AddWithValue("@itname", DropItemName.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@IMEI", txtIMEI.Text);
                cmd.Parameters.AddWithValue("@dis", txtDiscription.Text);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Return Item info Added Succesfully..");

            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);

            }
        }
    }
}