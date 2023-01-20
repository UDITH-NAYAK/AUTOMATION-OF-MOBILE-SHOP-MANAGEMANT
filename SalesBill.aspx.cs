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
using System.Text;

namespace MobileShop
{
    public partial class WebForm16 : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Button1_Click(object sender, EventArgs e)
        {

            Session.RemoveAll();
            Response.Redirect("welcomePage.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack||!IsPostBack)
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



            if (!IsPostBack)
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == System.Data.ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    GridBillTable.DataSource = null;
                    GridBillTable.DataBind();
                    SqlCommand cmd = new SqlCommand("DELETE  from Temp_Bill", con);
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    MessageBoxButton btn = MessageBoxButton.OK;
                    MessageBox.Show(ex.ToString(), "", btn);

                }







            //Follwing is Generating Invoice number
            try
            {


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("Select  Invoice_No from Sales_tab", con);
                DataTable dt = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                DataTableReader rd = new DataTableReader(dt);
                String year = Convert.ToString(DateTime.Now.Date.ToString("MM"));
                if (rd.HasRows)
                {
                    String id = Convert.ToString(dt.Rows[dt.Rows.Count - 1][0]);
                    int n = id.Count();
                    string[] oldIdStack = (id.Split('/'));
                    int BillNumb = Convert.ToInt32(oldIdStack[2]);
                    BillNumb++;
                    String newID = Convert.ToString(BillNumb);
                    String newIDString = "S/" + year + "/" + newID;
                    txtInvoiceNo.Text = newIDString;


                }
                else
                {
                    txtInvoiceNo.Text = "S/" + year + "/" + 101;
                }

                //Displaying current date in Bill
                txtDate.Text = Convert.ToString(DateTime.Now.ToString("dd-MM-yyyy"));


            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);

            }



           

        }


       



        protected void DropModel_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void DropBrand_SelectedIndexChanged(object sender, EventArgs e)
        {
            String brand = DropBrand.SelectedItem.Text;
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select Model from Mobile_tab where Brand='" + brand + "'", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                con.Close();
                DropModel.Items.Clear();
                DropModel.Items.Insert(0, "--select--");
                for (int i = 1; i <= dt.Rows.Count; i++)
                {
                    String row = Convert.ToString(dt.Rows[i - 1][0]);
                    DropModel.Items.Insert(i, row);
                }

                DropModel.DataBind();

            }
            catch (Exception ex)

            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT Sl_No from Temp_Bill", con);
                DataTable dt = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                DataTableReader rd = new DataTableReader(dt);
                int newId = 1;
                if (rd.HasRows)
                {
                    int Id = Convert.ToInt32(dt.Rows[dt.Rows.Count - 1][0]);
                    Id += 1;
                    newId = Id;

                }



                String Brand = DropBrand.SelectedItem.Text;
                String Model = DropModel.SelectedItem.Text;

                SqlCommand cmdNO = new SqlCommand("SELECT Item_Id from Mobile_tab where Brand='" + Brand + "' and Model='" + Model + "'", con);
                String Item_Id = Convert.ToString(cmdNO.ExecuteScalar());

                cmd = new SqlCommand("INSERT  INTO Temp_Bill(Sl_No,Item_Name,Item_No,Rate,QTY,Amount,Warrenty,IMEI) " +
                    "values(@slno,@itName,@itno,@rate,@qty,@amt,@war,@IMEI)", con);
                cmd.Parameters.AddWithValue("@slno", newId);
                String itemName = Brand + "\t(" + Model + ") \n"+ txt_IMEI_Num.Text;
                cmd.Parameters.AddWithValue("@itName", itemName);
                cmd.Parameters.AddWithValue("@itno", Item_Id);
                cmd.Parameters.AddWithValue("@rate", Convert.ToDouble(txtUnitPrice.Text));
                cmd.Parameters.AddWithValue("@qty", Convert.ToDouble(txtQty.Text));
                double amt = Convert.ToDouble(txtQty.Text) * Convert.ToDouble(txtUnitPrice.Text);
                cmd.Parameters.AddWithValue("@amt", amt);
                cmd.Parameters.AddWithValue("@war",txtWarTo.Text );
                cmd.Parameters.AddWithValue("@IMEI",txt_IMEI_Num.Text );
                cmd.ExecuteNonQuery();

                SqlCommand cmd2 = new SqlCommand("SELECT Sl_No,Item_Name,Rate,QTY,Amount FROM Temp_Bill", con);


                adp = new SqlDataAdapter(cmd2);

                dt = new DataTable();

                adp.Fill(dt);
                GridBillTable.DataSource = dt;
                GridBillTable.DataBind();

                btnExistCustomer.Visible = true;


            



                //Excracting amount from tem_bill table to calculate  total

                SqlCommand cmd3 = new SqlCommand("SELECT Amount FROM Temp_Bill", con);
                SqlDataAdapter adp2 = new SqlDataAdapter(cmd3);

                DataTable dt2 = new DataTable();

                adp2.Fill(dt2);
                double GTotal = 0.0;
                for (int i = 0; i < dt2.Rows.Count; i++)
                {
                    GTotal += Convert.ToDouble(dt2.Rows[i][0]);

                }
                lblTotal.Text = Convert.ToString(GTotal);

                // Follwing is Calculating tax amount

                double tax = Convert.ToDouble(lblTotal.Text) * Convert.ToDouble(txtTax.Text) / 100;
                lblTax.Text = Convert.ToString(tax);


                //Calulating Discount amt
                double Discount = Convert.ToDouble(lblTotal.Text) - Convert.ToDouble(txtDiscount.Text);

                lblDiscount.Text = "-" + txtDiscount.Text;
                lblGTotal.Text = Convert.ToString(Discount);

                //Calculating Grand total
                double Grand = Convert.ToDouble(lblTotal.Text) + Convert.ToDouble(lblTax.Text);
                lblGTotal.Text = Convert.ToString(Grand);


                txt_IMEI_Num.Text = txtUnitPrice.Text = txtQty.Text = txtDiscount.Text = txtTax.Text = "";

                txtTotalQty.Text = txtWarFrom.Text = txtWarTo.Text = "";



            }
            catch (Exception ex)

            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);
            }

        }



        protected void btnClear_Click1(object sender, EventArgs e)
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
                SqlCommand cmd = new SqlCommand("DELETE  from Temp_Bill", con);
                cmd.ExecuteNonQuery();





                txtCustomerName.Text = txtCustphone.Text = txtCustAddress.Text = "";
                lblTotal.Text = "0.0";
                lblTax.Text = "0.0";
                lblGTotal.Text = "0.0";

                txt_IMEI_Num.Text = txtUnitPrice.Text = txtQty.Text = txtDiscount.Text = txtTax.Text = "";


            }
            catch (Exception ex)

            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);
            }

        }



        protected void btnUpdateStock_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("SELECT Item_No, QTY,Item_Name,Warrenty,IMEI from Temp_Bill", con);
                DataTable dt = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                DataTableReader rd = new DataTableReader(dt);

                if (rd.HasRows)
                {

                    for (int i = 0; i <= dt.Rows.Count - 1; i++)
                    {
                        try
                        {
                            String itemID = Convert.ToString(dt.Rows[i][0]);
                            int Qty = Convert.ToInt32(dt.Rows[i][1]);
                            String[] Item_Name = Convert.ToString(dt.Rows[i][2]).Split(' ');

                            String WarDate= Convert.ToString(dt.Rows[i][3]);
                            String IMEI = Convert.ToString(dt.Rows[i][4]);
                            
                            SqlCommand cmdUpdate = new SqlCommand("UPDATE Mobile_tab set QTY=QTY-" + Qty + "where Item_Id='" + itemID + "'", con);
                            cmdUpdate.ExecuteNonQuery();

                            cmd = new SqlCommand("INSERT INTO Sales_tab(Invoice_No,Date,Item_Id,Item_Name,Customer,Customer_Phno,Discount,Total,Warrenty,IMEI)" +
                           "values(@invoice_no,@date,@item_id,@item_name,@cust,@pno,@disc,@total,@war,@IMEI)", con);

                            cmd.Parameters.AddWithValue("@invoice_no", txtInvoiceNo.Text);
                            cmd.Parameters.AddWithValue("@date", Convert.ToDateTime(txtDate.Text));
                            cmd.Parameters.AddWithValue("@item_id", itemID.ToString());
                            cmd.Parameters.AddWithValue("@item_name", Item_Name[0]);
                            cmd.Parameters.AddWithValue("@cust", txtCustomerName.Text);
                            cmd.Parameters.AddWithValue("@pno", txtCustphone.Text);
                            cmd.Parameters.AddWithValue("@disc", Convert.ToDouble(lblDiscount.Text));
                            cmd.Parameters.AddWithValue("@total", Convert.ToDouble(lblGTotal.Text));
                            cmd.Parameters.AddWithValue("@war", WarDate);
                            cmd.Parameters.AddWithValue("@IMEI", IMEI);
                            cmd.ExecuteNonQuery();


                            cmd = new SqlCommand("SELECT count(*) FROM Customer_tab where Phno="+txtCustphone.Text ,con);
                            int count = (int)cmd.ExecuteScalar();
                            if (count == 0)
                            {
 
                                cmd = new SqlCommand("INSERT INTO Customer_tab(Phno,Name,Address) values(@pno,@name,@address)", con);
                                cmd.Parameters.AddWithValue("@pno", Convert.ToDecimal(txtCustphone.Text));
                                cmd.Parameters.AddWithValue("@name", txtCustomerName.Text);
                                cmd.Parameters.AddWithValue("@address", txtCustAddress.Text);
                                cmd.ExecuteNonQuery();
                            }
                        }


                        catch (Exception ex)

                        {
                            MessageBoxButton btn = MessageBoxButton.OK;
                            MessageBox.Show(ex.ToString(), "", btn);
                        }
                    }
                    MessageBox.Show("Stock and Sales Updated..");
                }
 


            }
            catch (Exception ex)

            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);
            }

            btnExistCustomer.Visible = false;
            DropCustomer.Visible = false;
            Page.ClientScript.RegisterStartupScript(GetType(),"","PrintPanel()",true);

        }

        protected void btnExistCustomer_Click(object sender, EventArgs e)
        {
            DropCustomer.Visible = true;

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from Customer_tab ", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                DropCustomer.Items.Clear();
                DropCustomer.Items.Insert(0, "--select--");
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    String row = Convert.ToString(dt.Rows[i][0]) + "  " + Convert.ToString(dt.Rows[i][1]) + "  " + Convert.ToString(dt.Rows[i][2]) + " ";
                    DropCustomer.Items.Insert(i + 1, row);
                }

                DropCustomer.DataBind();

            }
            catch (Exception ex)

            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);
            }
        }

        protected void DropCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            String[] CustDetails = DropCustomer.SelectedItem.Text.Split(' ');
            txtCustomerName.Text = CustDetails[2];
            txtCustphone.Text = CustDetails[0];
            txtCustAddress.Text = CustDetails[4];
            DropCustomer.Visible = false;
        }

        protected void DropModel_SelectedIndexChanged1(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                String brand = DropBrand.SelectedItem.Text;
                String model = DropModel.SelectedItem.Text;
                SqlCommand cmd = new SqlCommand("select Qty,Unit_Price from Mobile_tab where Brand='"+brand+"' and Model='" + model+ "'", con);
                //string qty = (string)cmd.ExecuteScalar();
                // txtTotalQty.Text = qty;

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                txtUnitPrice.Text=Convert.ToString(dt.Rows[0][1]);
                int Count = Convert.ToInt32(dt.Rows[0][0]);
                if (Count == 0)
                {
                    MessageBox.Show("No stock Left of Model :" + DropBrand.SelectedItem.Text + "Order Immediately", "Message", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                }
                txtTotalQty.Text = Convert.ToString(dt.Rows[0][0]);

                //cmd = new SqlCommand("SELECT Unit_Price FROM Mobile_tab where Model='"+DropBrand.SelectedItem.Text+"'", con);
                //String UnitPrice = Convert.ToString(cmd.ExecuteScalar());
                //txtUnitPrice.Text = UnitPrice;

            }
            catch (Exception ex)

            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);
            }
        }

        protected void DropCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT Brand FROM Mobile_tab where Categorey='" + DropCategory.SelectedItem.Text + "'", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);

                DropModel.Items.Insert(0, "--select---");
                DropBrand.Items.Clear();
                DropBrand.Items.Insert(0, "--select---"); 
                for (int i = 0; i <dt.Rows.Count; i++)
                {
                     
                }

                for (int i = 1; i <= dt.Rows.Count; i++)
                {
                    String row = Convert.ToString(dt.Rows[i - 1][0]);
                    DropBrand.Items.Insert(i, row);
                }

                if (DropCategory.SelectedIndex == 2)
                {
                    lblIMEI.Visible = false;
                    txt_IMEI_Num.Visible = false;
                }
                else if (DropCategory.SelectedIndex == 1)
                {
                    lblIMEI.Visible = true;
                    txt_IMEI_Num.Visible = true;
                }
            }
            catch (Exception ex)

            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);
            }
        }

        protected void txtWarFrom_TextChanged(object sender, EventArgs e)
        {
            //Calculting warenty
            int WarTime = Convert.ToInt16(txtWarFrom.Text);
            txtWarTo.Text = Convert.ToString(DateTime.Now.AddYears(WarTime).ToString("dd-MM-yyyy"));

        }

        protected void txtQty_TextChanged(object sender, EventArgs e)
        {
            int qty = Convert.ToInt32(txtQty.Text);
            int Totalqty = Convert.ToInt32(txtTotalQty.Text);
            if (qty > Totalqty)
            {
                MessageBox.Show("Qty must be less than Total Stock..!!");
                txtQty.Text = "";
            }
        }
    }
}