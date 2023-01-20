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
    public partial class WebForm20 : System.Web.UI.Page
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

                SqlCommand cmd = new SqlCommand("Select  Invoice_No from Service_Bill_tab", con);
                DataTable dt = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                DataTableReader rd = new DataTableReader(dt);
                String year = Convert.ToString(DateTime.Now.Date.ToString("dd"));
                if (rd.HasRows)
                {
                    String id = Convert.ToString(dt.Rows[dt.Rows.Count - 1][0]);
                    int n = id.Count();
                    string[] oldIdStack = (id.Split('/'));
                    int BillNumb = Convert.ToInt32(oldIdStack[1]);
                    BillNumb++;
                    String newID = Convert.ToString(BillNumb);
                    String newIDString = "SR/" + newID;
                    txtInvoiceNo.Text = newIDString;


                }
                else
                {
                    txtInvoiceNo.Text = "SR/" + 101;
                }
                txtDate.Text = Convert.ToString(DateTime.Now.ToString("dd-MM-yyyy"));
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Error Message");
            }

        }

        protected void txtPhnoSearch_TextChanged(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                String phno = txtPhnoSearch.Text;



                SqlCommand cmd = new SqlCommand("SELECT Cust_Name,Phno,Address from Req_Service_tab WHERE Phno='" + phno + "'", con);
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    txtCustomerName.Text = rd["Cust_Name"].ToString();
                    txtCustphone.Text = rd["Phno"].ToString();
                    txtCustAddress.Text = rd["Address"].ToString();
                }
                rd.Close();

                cmd = new SqlCommand("SELECT IMEI,Brand,Discription from Req_Service_tab WHERE Phno='" + phno + "'", con);
 

                SqlDataReader reader = cmd.ExecuteReader();
                GridBillTable.DataSource = reader;
                GridBillTable.DataBind();
                





            }
            catch (Exception ex)
            {
               MessageBox.Show(ex.ToString(), "Error Message");
            }
        }

        protected void btnCalculate_Click1(object sender, EventArgs e)
        {
            Double Total = 0.0;
            foreach (GridViewRow row in GridBillTable.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    TextBox txtbox = (row.Cells[0].FindControl("txtTotalPrice") as TextBox);


                    Total += Convert.ToDouble(txtbox.Text);


                    try
                    {
                        SqlConnection con = new SqlConnection(strcon);
                        if (con.State == System.Data.ConnectionState.Closed)
                        {
                            con.Open();
                        }

                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.ToString(), "Error Message");
                    }

                }
            }

            if (txtTax.Text == "" || txtDisCount.Text == "")
            {
                MessageBox.Show("Fill all the required field");
            }
            else
            {

                Double Tax = Total * (Convert.ToInt16(txtTax.Text)) / 100;
                Double Dis = Convert.ToDouble(txtDisCount.Text);
                Double Grand = (Total + Tax) - Dis;

                lblTotal.Text = Total.ToString();
                lblTax.Text = Convert.ToString(Tax);
                lblDiscount.Text = "-" + txtDisCount.Text;
                lblGTotal.Text = Convert.ToString(Grand);
            }



        }

        protected void btnUpdateStock_Click(object sender, EventArgs e)
        {
        }

        protected void btnUpdateStock_Click1(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }


                foreach (GridViewRow row in GridBillTable.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        TextBox txtbox = (row.Cells[0].FindControl("txtTotalPrice") as TextBox);
                        if (txtbox.Text != "")
                        {
                            MessageBox.Show(row.Cells[2].Text.ToString());
                            MessageBox.Show(row.Cells[1].Text.ToString());

                            SqlCommand cmd = new SqlCommand("INSERT INTO Service_Bill_tab (Invoice_No,Date,Component,Tax,Total,IMEI,Cust_Phno)" +
                                "values(@invoice,@date,@comp,@tax,@total,@IMEIno,@phno)", con);
                            cmd.Parameters.AddWithValue("@invoice", txtInvoiceNo.Text);
                            cmd.Parameters.AddWithValue("@date", Convert.ToDateTime(txtDate.Text));
                            cmd.Parameters.AddWithValue("@comp", row.Cells[2].Text.ToString());
                            cmd.Parameters.AddWithValue("@tax", Convert.ToDouble(lblTax.Text));
                            cmd.Parameters.AddWithValue("@IMEIno", row.Cells[1].Text.ToString());
                            cmd.Parameters.AddWithValue("@phno", txtCustphone.Text);
                            cmd.Parameters.AddWithValue("@total", Convert.ToDouble(lblGTotal.Text));


                            cmd.ExecuteNonQuery();
                        }
                    }
                }
                MessageBox.Show("Record inserted Successfully....", "INFO", MessageBoxButton.OK, MessageBoxImage.Information);
                Page.ClientScript.RegisterStartupScript(GetType(), "", "PrintPanel()", true);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Error Message");
            }

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                GridBillTable.DataSource = null;
                GridBillTable.DataBind();
                SqlCommand cmd = new SqlCommand("DELETE  from Req_Service_tab where Phno='" + txtPhnoSearch.Text + "'", con);
                cmd.ExecuteNonQuery();

                txtPhnoSearch.Text = txtTax.Text = txtDisCount.Text = "";
                txtCustomerName.Text = txtCustphone.Text = txtCustAddress.Text = "";
                lblTotal.Text = lblTax.Text = lblDiscount.Text = lblGTotal.Text;


            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Error Message");
            }
        }
    }
}