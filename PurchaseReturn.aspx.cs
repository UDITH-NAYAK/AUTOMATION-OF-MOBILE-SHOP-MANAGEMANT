using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Windows;

namespace MobileShop
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void BtnLogOut_Click(object sender, EventArgs e)
        {

            Session.RemoveAll();
            Response.Redirect("welcomePage.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack || !IsPostBack)
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


                if (!IsPostBack )
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == System.Data.ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    //String cmd = "SELECT SupName from Supplier_tab";
                    SqlCommand cmd = new SqlCommand("SELECT SupName from Suppliers_tab", con);
                    DataTable dt = new DataTable();
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    adp.Fill(dt);
                    DataTableReader rd = new DataTableReader(dt);
                    for (int i = 1; i <= dt.Rows.Count; i++)
                    {
                        Response.Write("<script> console.log(" + dt.Rows.Count + ") </script>");
                        String row = Convert.ToString(dt.Rows[i - 1][0]);
                        DropSuplier.Items.Insert(i, row);
                    }

                    DropSuplier.DataBind();
                    con.Close();
                }

                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == System.Data.ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("Select Ret_Id from Purchase_Return_tab", con);
                    DataTable dt = new DataTable();
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    adp.Fill(dt);
                    DataTableReader rd = new DataTableReader(dt);
                    if (rd.HasRows)
                    {
                        String id = Convert.ToString(dt.Rows[dt.Rows.Count - 1][0]);
                        int n = id.Count();
                        int newId = Convert.ToInt16(id.Substring(1, n - 1));


                        String temp = Convert.ToString(newId + 1);
                        Response.Write("<script> console.log(" + temp + ") </script>");
                        txtReturnId.Text = Convert.ToString("R" + temp);
                    }
                    else
                    {
                        txtReturnId.Text = "R100";
                    }




                    con.Close();

                }
                catch (Exception ex)
                {
                    MessageBoxButton btn = MessageBoxButton.OK;
                    MessageBox.Show(ex.ToString(), "", btn);
                }

                //DropSuplier.Items.Insert(0, "<--select-->");
                //DropSuplier.DataSource = cmd.ExecuteReader();
                //DropSuplier.DataTextField = "SupName";
                //DropSuplier.DataValueField = "";

            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);
            }

        }


       

        protected void DropSuplier_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
             
                String SupName = DropSuplier.SelectedItem.Text.ToString();
                SqlCommand cmd = new SqlCommand("SELECT  Sup_Id FROM Suppliers_tab WHERE SupName='"+SupName+"'", con);
                DataTable dt = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                String supId =Convert.ToString( dt.Rows[0][0]);
                txtSupId.Text = supId;

                   
                

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
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                String SupName = DropSuplier.SelectedItem.Text.ToString();
                SqlCommand cmd = new SqlCommand("INSERT INTO  Purchase_Return_tab(Bill_No,Ret_Id,Sup_Name,Sup_id,IMEI,Dis) " +
                    "values(@bno,@rid,@sname,@sid,@imei,@dis)", con);
                cmd.Parameters.AddWithValue("@bno",txtBillno.Text);
                cmd.Parameters.AddWithValue("@rid", txtReturnId.Text);
                cmd.Parameters.AddWithValue("@sname", SupName);
                cmd.Parameters.AddWithValue("@sid", txtSupId.Text);
                cmd.Parameters.AddWithValue("@imei", txtIMEI.Text);
                cmd.Parameters.AddWithValue("@dis", txtDiscription.Text);
                cmd.ExecuteNonQuery();
                MessageBoxButton btn = MessageBoxButton.OK;

                cmd = new SqlCommand("UPDATE Purchase_Order_tab SET Qty=Qty-1  where Brand='"+txtBrand.Text+"' and Model='"+txtModel.Text+"'",con);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Record inserted and Order Updated successfully..", "", btn);

                if (btn == MessageBoxButton.OK)
                {
                    txtBillno.Text = "";
                    txtSupId.Text = "";
                    txtReturnId.Text = "";
                    txtIMEI.Text = "";
                    txtDiscription.Text = "";

                }




            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "",btn, MessageBoxImage.Information);
            }

        }
    }
}