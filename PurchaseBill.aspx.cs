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
    public partial class WebForm12 : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        String ItemId = "";
        protected void BtnLogOut_Click(object sender, EventArgs e)
        {

            Session.RemoveAll();
            Response.Redirect("welcomePage.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            
                SqlConnection cons = new SqlConnection(strcon);
                DropCategory.Items.Insert(0,"--select--");
                 
                SqlCommand cmdDrop = new SqlCommand("SELECT DISTINCT([Brand]) FROM[Purchase_Order_tab] WHERE Status ='Ordered'",cons);
                SqlDataAdapter adp1 = new SqlDataAdapter(cmdDrop);
                DataTable dt1 = new DataTable();
                adp1.Fill(dt1);


            DropCategory.DataSource = dt1;
            DropCategory.DataValueField = "Brand";
            DropCategory.DataTextField = "Brand";

                DropCategory.DataBind();
            
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

            if (!IsPostBack) {
                DropCategory.Items.Insert(0, "--select--");
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Select  Bill_No from Purchase_Bill_tab", con);
                DataTable dt = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                DataTableReader rd = new DataTableReader(dt);
                String year = Convert.ToString(DateTime.Now.Year);
                if (rd.HasRows)
                {
                    String id = Convert.ToString(dt.Rows[dt.Rows.Count - 1][0]);
                    int n = id.Count();
                    string[] oldIdStack = (id.Split('/'));
                    int BillNumb = Convert.ToInt32(oldIdStack[2]);
                    BillNumb++;
                    String newID = Convert.ToString(BillNumb);
                    String newIDString = "B/" + year + "/" + newID;
                    txtBill_No.Text = newIDString;


                }
                else
                {
                    txtBill_No.Text = "B/" + year + "/" + 101;
                }




                con.Close();





            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);
            }





              
 


         
        }

        public void GenerateItemCode()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                

                Random rdNum = new Random();
                int RandNum = rdNum.Next(1, 1000);
                String First2Chars = DropCategory.SelectedItem.Text.Substring(0, 3);
                int flag = 0;
                String NewID = First2Chars + Convert.ToString(RandNum);

                while (flag == 0)
                {
                    SqlCommand cmd = new SqlCommand("Select COUNT(*) FROM  Mobile_tab where Item_Id='" + NewID + "'", con);
                    int IdExists = (int)cmd.ExecuteScalar();
                    if (IdExists > 0)
                    {
                        RandNum = rdNum.Next(1, 1000);

                    }
                    else
                    {
                        flag = 1;
                    }
                }
                ItemId = First2Chars + "-" + Convert.ToString(RandNum);




            }
            catch (Exception ex)
            {
                MessageBoxButton btn = new MessageBoxButton();
                MessageBox.Show(ex.ToString(), "", btn, MessageBoxImage.Error);
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

                String brand = DropCategory.SelectedItem.Text.ToString();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Purchase_Order_tab where Brand='" + brand + "' and Status='Ordered'", con);
                SqlDataReader rd = cmd.ExecuteReader();

                if(!rd.HasRows){
                    MessageBox.Show("No Purchase Orders with Brand:"+brand);

                }
                
                
                    rd.Close();

                
                DataTable dt = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                dt.Clear();
                adp.Fill(dt);
                GridOrdered.DataSource = dt;
                GridOrdered.DataBind();


                String SupName = "";
                 
                    cmd = new SqlCommand("SELECT Sup_Name FROM Purchase_Order_tab where Brand='" + brand + "' and Status='Ordered' ", con);
                    SupName = Convert.ToString(cmd.ExecuteScalar());
                    txtSuppName.Text = SupName;
                

            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                

                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("INSERT INTO Purchase_Bill_tab(Bill_No,Bill_Date,Sup_Name,qty,Disc,Tax,Total,Paid_Amt,Payment_Status) " +
                    "values(@bill,@date,@sname,@qty,@disc,@tax,@total,@paid,@p_status)", con);
               
                cmd.Parameters.AddWithValue("@bill", txtBill_No.Text);
                cmd.Parameters.AddWithValue("@date", Convert.ToDateTime(txtDate.Text));
                cmd.Parameters.AddWithValue("@sname", txtSuppName.Text);
                cmd.Parameters.AddWithValue("@qty", Convert.ToInt16(txtqty.Text));
                cmd.Parameters.AddWithValue("@disc", Convert.ToDouble(txtDis.Text));
                cmd.Parameters.AddWithValue("@tax", Convert.ToInt16(txtTax.Text));
                cmd.Parameters.AddWithValue("@total", Convert.ToDouble(txtTotal.Text));
                cmd.Parameters.AddWithValue("@paid", Convert.ToDouble(txtPaid.Text));
                cmd.Parameters.AddWithValue("@p_status", "Arrived");
                cmd.ExecuteNonQuery();
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show("Record inserted successfully..", "Message", btn);

            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);
            }
        }

    

        protected void GridOrdered_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GetSelectedRecords(object sender, EventArgs e)
        {
            string name = "";
            Dictionary<int, string> ModelQty = new Dictionary<int, string>();
            foreach (GridViewRow row in GridOrdered.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("checkStat") as CheckBox);
                    if (chkRow.Checked)
                    {
                        

                        try
                        {
                            SqlConnection con = new SqlConnection(strcon);
                            if (con.State == System.Data.ConnectionState.Closed)
                            {
                                con.Open();
                            }

                            SqlCommand cmdqty = new SqlCommand("SELECT qty from Purchase_Order_tab where Model='"+row.Cells[11].Text.ToString()+"'", con);
                            int DBqty = Convert.ToInt32(cmdqty.ExecuteScalar());
 
                            TextBox txtArrived = (row.Cells[3].FindControl("txtArrivedQty") as TextBox);

                            int ArrivedQty =Convert.ToInt32( txtArrived.Text);
                            if (DBqty != ArrivedQty)
                            {
                                int diff = DBqty - ArrivedQty;
                                MessageBox.Show(diff.ToString());
                                SqlCommand cmdUpdatePurQty = new SqlCommand("UPDATE Purchase_Order_tab SET Status='Ordered',qty=" + diff + " where Model='" + row.Cells[11].Text.ToString() + "'", con);
                                cmdUpdatePurQty.ExecuteNonQuery();
                                MessageBox.Show("Order Updated");
                            }
                            else
                            {

                                SqlCommand cmdUpdatestatus = new SqlCommand("UPDATE Purchase_Order_tab set Status='Arrived' where Model='" + row.Cells[11].Text.ToString() + "'", con);
                                cmdUpdatestatus.ExecuteNonQuery();

                                SqlCommand cmd = new SqlCommand("Select  * from Mobile_tab where Model='" + row.Cells[11].Text + "'", con);
                                SqlDataReader rd = cmd.ExecuteReader();
                                if (rd.HasRows)
                                {
                                    SqlCommand cmdUpdate = new SqlCommand("UPDATE Mobile_tab set Qty= Qty+" + row.Cells[9].Text + " where Model='" + row.Cells[11].Text.ToString() + "'", con);
                                    rd.Close();
                                    cmdUpdate.ExecuteNonQuery();
                                    MessageBox.Show("Stock Updated..");

                                }
                                else
                                {

                                    rd.Close();
                                    TextBox txtPur = (row.Cells[1].FindControl("txtPurchaseAmt") as TextBox);
                                    TextBox txtSel = (row.Cells[2].FindControl("txtSellAmt") as TextBox);
                                    cmd = new SqlCommand("INSERT INTO Mobile_tab(Item_Id,Date,Categorey,Brand,Model,Qty,Pur_Price,Unit_Price)" +
                                   "values(@item_id,@date,@cat,@brand,@model,@qty,@pur,@unit)", con);
                                    GenerateItemCode();
                                    cmd.Parameters.AddWithValue("@item_id", ItemId);
                                    cmd.Parameters.AddWithValue("@date", Convert.ToDateTime(txtDate.Text));
                                    cmd.Parameters.AddWithValue("@cat", DropCatType.SelectedItem.Text.ToString());
                                    cmd.Parameters.AddWithValue("@brand", row.Cells[10].Text);
                                    cmd.Parameters.AddWithValue("@model", row.Cells[11].Text);
                                    cmd.Parameters.AddWithValue("@qty", Convert.ToDouble(row.Cells[9].Text.ToString()));
                                    cmd.Parameters.AddWithValue("@pur", Convert.ToDouble(txtPur.Text));
                                    cmd.Parameters.AddWithValue("@unit", Convert.ToDouble(txtSel.Text));
                                    cmd.ExecuteNonQuery();
                                    MessageBoxButton btn = new MessageBoxButton();
                                    MessageBox.Show("Record inserted to Stock Successfuly", "", btn, MessageBoxImage.Information);
                                }
                            }
                            con.Close();




                        }
                        catch (Exception ex)
                        {
                            MessageBoxButton btn = MessageBoxButton.OK;
                            MessageBox.Show(ex.ToString(), "", btn);
                        }

                         



                    }








                    //foreach(KeyValuePair<int,string>ele in ModelQty)
                    //{
                    //    MessageBox.Show(ele.Key+":"+ele.Value);

                    //}

                }
            }

            String[] NameArr = name.Split(' ');

            for (int i = 0; i < NameArr.Length - 1; i++)
            {
               



            }
        }
    }
}