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
    public partial class WebForm14 : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        String AccessItemId = "";
        protected void BtnLogOut_Click(object sender, EventArgs e)
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

                GenerateAccCode();

            }
            catch (Exception ex)
            {
                MessageBoxButton btn = new MessageBoxButton();
                MessageBox.Show(ex.ToString(), "", btn, MessageBoxImage.Error);
            }
        

            

        }
                //Genrating Item Code for Accesories
                public void GenerateAccCode()
                {

                 
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == System.Data.ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    Random rdNum = new Random();
                    int RandNum = rdNum.Next(1, 1000);
                    int flag = 0;
                    String NewID = Convert.ToString(RandNum);

                    while (flag == 0)
                    {
                        SqlCommand cmd = new SqlCommand("Select COUNT(*) FROM  Access_tab  where Item_Id='" + NewID + "'", con);
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
                    AccessItemId = Convert.ToString(RandNum);
                    txtItemNum.Text = AccessItemId;
                
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
                //if (DropCategory.SelectedItem.Text == "Mobile")
                //{
                //SqlCommand cmd = new SqlCommand("INSERT INTO Mobile_tab(Item_Id,Date,Categorey,Brand,Model,Qty,Pur_Price,Unit_Price)" +
                //    "values(@item_id,@date,@cat,@brand,@model,@qty,@pur,@unit)", con);
                //cmd.Parameters.AddWithValue("@item_id", txtItemNum.Text.ToString());
                //cmd.Parameters.AddWithValue("@date", Convert.ToDateTime(txtDate.Text));
                //cmd.Parameters.AddWithValue("@cat", DropCategory.SelectedItem.Text.ToString());
                //cmd.Parameters.AddWithValue("@brand", txtBrand.Text);
                //cmd.Parameters.AddWithValue("@model", txtModelNum.Text);
                //cmd.Parameters.AddWithValue("@qty", Convert.ToDouble(txtQty.Text));
                //cmd.Parameters.AddWithValue("@pur", Convert.ToDouble(txtPurchase_Price.Text));
                //cmd.Parameters.AddWithValue("@unit", txtUnitPrice.Text);
                //cmd.ExecuteNonQuery();
                //MessageBoxButton btn = new MessageBoxButton();
                //MessageBox.Show("Record inserted Succesfuly", "", btn, MessageBoxImage.Information);
                //GridMobile.DataBind();
                //}

                String Item_Name = DropCategory.SelectedItem.Text.ToString();
                SqlCommand cmdUpdate = new SqlCommand("SELECT * FROM Access_tab where Item_Name='"+Item_Name+"'", con);
                SqlDataReader rd = cmdUpdate.ExecuteReader();
                if (rd.HasRows)
                {
                    rd.Close();
                    cmdUpdate = new SqlCommand("UPDATE Access_tab SET Qty=Qty+" + txtQty.Text, con);
                    cmdUpdate.ExecuteNonQuery();
                  
                }
                else
                {
                    rd.Close();
                    
                    SqlCommand cmd = new SqlCommand("INSERT INTO Access_tab(Item_Id,Date,Item_Name,Qty,Unit_Price)" +
                    "values(@item_id,@date,@itname,@qty,@unit)", con);
                    cmd.Parameters.AddWithValue("@item_id", txtItemNum.Text.ToString());
                    cmd.Parameters.AddWithValue("@date", Convert.ToDateTime(txtDate.Text));
                    cmd.Parameters.AddWithValue("@itname", Item_Name);
                    cmd.Parameters.AddWithValue("@qty", Convert.ToDouble(txtQty.Text));
                    cmd.Parameters.AddWithValue("@unit", txtUnitPrice.Text);
                    cmd.ExecuteNonQuery();
                }
                    MessageBox.Show("Record inserted to Accessories  Succesfuly", "");

                    txtItemNum.Text = "";
                    txtDate.Text = "";
                     
                    txtQty.Text = "";
                txtPurchase_Price.Text = "";

                    txtUnitPrice.Text = "";
                GenerateAccCode();

                
            }catch(Exception ex)
            {
                MessageBoxButton btn = new MessageBoxButton();
                MessageBox.Show(ex.ToString(), "", btn, MessageBoxImage.Error);
            }
        }
    



            
            
        

        protected void btnNewId_Click(object sender, EventArgs e)
        {
           
        }

        protected void btnShowMobile_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Select * from Mobile_tab", con);
                DataTable dt = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                GridMobile.Visible = true ;
                GridInventoryTable.Visible = false;
                GridAccess.Visible = false;
                adp.Fill(dt);
                GridMobile.DataSource = dt;
                GridMobile.DataBind();

            }
            catch (Exception ex)
            {
                MessageBoxButton btn = new MessageBoxButton();
                MessageBox.Show(ex.ToString(), "", btn, MessageBoxImage.Error);

            }
        }

        protected void btnShowAccess_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Select * from Access_tab", con);
                DataTable dt = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);

                GridMobile.Visible = false;
                GridInventoryTable.Visible = false;
                GridAccess.Visible = true;

                GridAccess.DataSource = dt;
                GridAccess.DataBind();

            }
            catch (Exception ex)
            {
                MessageBoxButton btn = new MessageBoxButton();
                MessageBox.Show(ex.ToString(), "", btn, MessageBoxImage.Error);

            }
        }
    }
}