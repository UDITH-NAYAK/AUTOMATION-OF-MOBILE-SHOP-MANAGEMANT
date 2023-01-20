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
    public partial class WebForm19 : System.Web.UI.Page
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            PanelExisting.Visible = true;
            PanelNewCustService.Visible = false;
            txtCustname.Visible = false;
            txtphno.Visible = false;
            txtAddress.Visible = false;

            txtCustname2.Visible = true;
            txtphno2.Visible = true;
            txtAddress2.Visible = true;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
          
        }

       


        protected void DropitemName_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                String invoiceNO = txtinvoice.Text;
                String itemName = DropitemName.SelectedItem.Text;

               
                SqlCommand cmd = new SqlCommand("SELECT Warrenty,Customer,IMEI FROM Sales_tab where Invoice_No='" + invoiceNO + "' and Item_Name='" + itemName + "'", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                DropIMEI.Items.Clear();
                DropIMEI.Items.Insert(0, "--select--");
                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    DropIMEI.Items.Insert(i+1, Convert.ToString(dt.Rows[i][2]));


                }
                txtCustname.Text = Convert.ToString(dt.Rows[0][1]);

            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);

            }
        }



        protected void btnNewCust_Click(object sender, EventArgs e)
        {
            PanelExisting.Visible = false;
            PanelNewCustService.Visible = true;

            txtCustname.Visible = true;
            txtphno.Visible = true;
            txtAddress.Visible = true;

            txtCustname2.Visible = false;
            txtphno2.Visible = false;
            txtAddress2.Visible = false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }

        protected void btnNewServiceSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO Req_Service_tab(IMEI,Brand,Cust_Name,Phno,Address,Discription)" +
                    "values(@IMEI,@brand,@cust,@phno,@add,@dis)", con);
                cmd.Parameters.AddWithValue("@IMEI", txtIMEI.Text);
                cmd.Parameters.AddWithValue("@brand", txtBrand.Text+"("+ txtModel.Text+")");
                cmd.Parameters.AddWithValue("@cust", txtCustname.Text);
                cmd.Parameters.AddWithValue("@phno", txtphno.Text);
                cmd.Parameters.AddWithValue("@add", txtAddress.Text);
                cmd.Parameters.AddWithValue("@dis", txtDis.Text);


                cmd.ExecuteNonQuery();
                MessageBox.Show("Record inserted successfuly..", "INFO", MessageBoxButton.OK, MessageBoxImage.Information);


                
                
                cmd = new SqlCommand("UPDATE Access_tab set Qty=Qty-1 where Item_Name='"+DropCategory.SelectedItem.Text+"'", con);
                cmd.ExecuteNonQuery();
                
                
            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);

            }

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtIMEI.Text = "";
            txtBrand.Text = "";
            txtModel.Text = "";
            txtCustname.Text = "";
            txtphno.Text = "";
            txtAddress.Text = "";

        }

        protected void DropIMEI_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                String IMEI_NO = DropIMEI.SelectedItem.Text;
                SqlCommand cmd = new SqlCommand("SELECT Warrenty FROM Sales_tab where IMEI='" + IMEI_NO + "'", con);
                DateTime result = Convert.ToDateTime(cmd.ExecuteScalar());
                String ExpDate = result.ToString("dd-MM-yyyy");
                txtWarEXP.Text = ExpDate;
            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);

            }
        }

     

        protected void btnExistingSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO Req_Service_tab(IMEI,Brand,Cust_Name,Phno,Address,Discription)" +
                    "values(@IMEI,@brand,@cust,@phno,@add,@dis)", con);
                cmd.Parameters.AddWithValue("@IMEI", DropIMEI.Text);
                cmd.Parameters.AddWithValue("@brand", DropitemName.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@cust", txtCustname2.Text);
                cmd.Parameters.AddWithValue("@phno", txtphno2.Text);
                cmd.Parameters.AddWithValue("@add", txtAddress2.Text);
                cmd.Parameters.AddWithValue("@dis", txtExistDiscription.Text);


                cmd.ExecuteNonQuery();
                MessageBox.Show("Record inserted successfuly..", "INFO", MessageBoxButton.OK, MessageBoxImage.Information);




                cmd = new SqlCommand("UPDATE Access_tab set Qty=Qty-1 where Item_Name='" + DropExistComp.SelectedItem.Text + "'", con);
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);

            }
        }

        protected void txtinvoice_TextChanged(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                String invoiceNO = txtinvoice.Text;
                SqlCommand cmd = new SqlCommand("SELECT Item_Name,IMEI,Customer,Customer_Phno,Warrenty FROM Sales_tab where Invoice_No='" + invoiceNO + "'", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                GridSerive.DataSource = dt;
                GridSerive.DataBind();

                DropitemName.Items.Clear();
                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    DropitemName.Items.Insert(i, Convert.ToString(dt.Rows[i][0]));
                }

                DropIMEI.Items.Insert(0, "--select--");
                for (int i = 1; i <= dt.Rows.Count; i++)
                {
                    String row = Convert.ToString(dt.Rows[i - 1][1]);
                    DropIMEI.Items.Insert(i, row);
                }

                txtCustname2.Text = dt.Rows[0][2].ToString();
                txtphno2.Text = dt.Rows[0][3].ToString();







                cmd = new SqlCommand("SELECT  Address from Req_Service_tab WHERE Phno='" + txtphno.Text + "'", con);
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {

                    txtAddress2.Text = rd["Address"].ToString();
                }
                rd.Close();

                DropitemName.SelectedIndex = 0;
                DropIMEI.ClearSelection();

            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);

            }
        }
    }
}