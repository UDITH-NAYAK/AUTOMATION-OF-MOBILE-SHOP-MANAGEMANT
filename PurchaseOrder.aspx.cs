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
    public partial class WebForm7 : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        String SupId = "";
        protected void BtnLogOut_Click(object sender, EventArgs e)
        {

            Session.RemoveAll();
            Response.Redirect("welcomePage.aspx");
        }

        public void GenerateId()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Select P_OrderID from Purchase_Order_tab", con);
                DataTable dt = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                DataTableReader rd = new DataTableReader(dt);
                if (rd.HasRows)
                {
                    String []id = Convert.ToString(dt.Rows[0][0]).Split('#');


                    //int n = id.Count();
                    //int newId = Convert.ToInt16(id.Substring(1, n - 1));


                    int NewId = Convert.ToInt32(id[1]);
                    NewId++;
                    String temp = Convert.ToString(NewId);
                    Response.Write("<script> console.log(" + temp + ") </script>");
                    txtOrderId.Text = Convert.ToString("P#" + NewId);
                }
                else
                {
                    txtOrderId.Text = "P#100";
                }




                con.Close();

            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);
            }
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

            if (!IsPostBack)
            {

            GenerateId();
            }

           







            if (!IsPostBack)
            {
                try
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
                        String row = Convert.ToString(dt.Rows[i - 1][0]);
                        DropSuplier.Items.Insert(i, row);
                    }

                    DropSuplier.DataBind();
                    con.Close();


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

           


                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    SqlCommand cmd = new SqlCommand("SELECT * from  Purchase_Order_tab where Status='Ordered'", con);
                    DataTable dt = new DataTable();
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    adp.Fill(dt);
                    GridViewOrders.DataSource = dt;
                    GridViewOrders.DataBind();

                }
                catch (Exception ex)
                {
                    MessageBoxButton btn = MessageBoxButton.OK;
                    MessageBox.Show(ex.ToString(), "", btn);
                }
            
            

        }

       

        protected void btnNewId_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Select P_OrderID from Purchase_Order_tab", con);
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
                    txtOrderId.Text = Convert.ToString("P" + temp);
                }
                else
                {
                    txtOrderId.Text = "P100";
                }




                con.Close();

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

                String test = DropSuplier.SelectedItem.Text.ToString();



                SqlCommand cmd = new SqlCommand("INSERT INTO Purchase_Order_tab(P_OrderID,Order_Date,Sup_Name,Sup_Id,Categorey,Qty,Brand,Model,Status) " +
                     "values(@porder,@date,@sname,@sup_id,@cat,@qty,@brand,@model,@Status)", con);
                cmd.Parameters.AddWithValue("@porder", Convert.ToString(txtOrderId.Text));
                cmd.Parameters.AddWithValue("@date", Convert.ToDateTime(txtDate.Text));
                cmd.Parameters.AddWithValue("@sname", DropSuplier.SelectedItem.Text.ToString());
                cmd.Parameters.AddWithValue("@sup_id", Convert.ToInt16(SupId));

                cmd.Parameters.AddWithValue("@cat", DropCategory.SelectedItem.Text.ToString());
                cmd.Parameters.AddWithValue("@qty", Convert.ToInt16(txtQty.Text));
                cmd.Parameters.AddWithValue("@brand", txtBrand.Text.ToString());
                cmd.Parameters.AddWithValue("@model", txtModelNum.Text.ToString());
                cmd.Parameters.AddWithValue("@status", "Ordered");
                cmd.ExecuteNonQuery();

                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show("Record Added Succesfully...", "Message", btn);
                GridViewOrders.DataBind();
                con.Close();
                txtBrand.Enabled = false;
                


            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);

            }
        }



        protected void btnUpdateSubmlit_Click(object sender, EventArgs e)

        { 
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //String orderNum = txtOrderNum.Text;
            //try
            //{
            //    SqlConnection con = new SqlConnection(strcon);
            //    if (con.State == System.Data.ConnectionState.Closed)
            //    {
            //        con.Open();
            //    }

            //    SqlCommand cmd = new SqlCommand("SELECT * FROM Purchase_Order_tab where P_OrderID='" + orderNum + "'", con);
            //    DataTable dt = new DataTable();
            //    SqlDataAdapter adp = new SqlDataAdapter(cmd);
            //    adp.Fill(dt);
            //    GridViewOrders.DataSource = dt;
            //    GridViewOrders.DataBind();
            //}
            //catch (Exception ex)
            //{
            //    MessageBoxButton btn = MessageBoxButton.OK;
            //    MessageBox.Show(ex.ToString(), "", btn);

            //}
        }


        protected void btnAddOrder_Click(object sender, EventArgs e)
        {

            
            btnSearch.Visible = false;
            txtOrderId.Enabled = false;

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            GenerateId();
            txtOrderId.Enabled = false;
             
            GridView1.Visible = false;
            GridViewOrders.Visible = true;
            GridViewOrders.DataBind();
            Panel1.Visible = true;
            PanelUpdate.Visible = false;
            GridView1.Visible = false;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {


            PanelUpdate.Visible = true;
            Panel1.Visible = false;
            GridViewOrders.Visible = false;
            GridView1.Visible = true;
        }
 



        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                String test = DropSuplier.SelectedItem.Text.ToString();
                Response.Write("<script> console.log(" + test + ") </script>");

                String SupName = DropSuplier.SelectedItem.Text.ToString();
                SqlCommand cmd = new SqlCommand("SELECT  Sup_Id FROM Suppliers_tab WHERE SupName='" + SupName + "'", con);
                DataTable dt = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                String supId = Convert.ToString(dt.Rows[0][0]);
                SupId = supId;

                cmd = new SqlCommand("INSERT INTO Purchase_Order_tab(P_OrderID,Order_Date,Sup_Name,Sup_Id,Categorey,Qty,Brand,Model,Variant,Status) " +
                     "values(@porder,@date,@sname,@sup_id,@cat,@qty,@brand,@model,@Vari,@Status)", con);
                cmd.Parameters.AddWithValue("@porder", Convert.ToString(txtOrderId.Text));
                cmd.Parameters.AddWithValue("@date", Convert.ToDateTime(txtDate.Text));
                cmd.Parameters.AddWithValue("@sname", DropSuplier.SelectedItem.Text.ToString());
                cmd.Parameters.AddWithValue("@sup_id", Convert.ToDouble(SupId));

                cmd.Parameters.AddWithValue("@cat", DropCategory.SelectedItem.Text.ToString());
                cmd.Parameters.AddWithValue("@qty", Convert.ToDouble(txtQty.Text));
                cmd.Parameters.AddWithValue("@brand", txtBrand.Text.ToString());
                cmd.Parameters.AddWithValue("@model", txtModelNum.Text.ToString());
                if (DropCategory.SelectedItem.Text == "Accessories")
                {
                    cmd.Parameters.AddWithValue("@Vari", "--");
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Vari", txtVariant.Text);
                }

                //cmd.Parameters.AddWithValue("@color", txtColorDis.Text.ToString());
                cmd.Parameters.AddWithValue("@status", "Ordered");
                cmd.ExecuteNonQuery();

                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show("Record Added Succesfully...", "Message", btn);
                if (btn == MessageBoxButton.OK)
                {
                    GridViewOrders.DataBind();


                }

                BtnOrderMoreModel.Enabled = true;
                BtnFinish.Enabled = true;


                con.Close();




            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);

            }
        }

        protected void DropCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
           
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
                SqlCommand cmd = new SqlCommand("SELECT  Sup_Id FROM Suppliers_tab WHERE SupName='" + SupName + "'", con);
                DataTable dt = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                String supId = Convert.ToString(dt.Rows[0][0]);
                SupId = supId;




            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);
            }
        }

        int temp = 0;
        protected void btnVariantAdd_Click(object sender, EventArgs e)

            {
             int varqty=Convert.ToInt32(txtVariQty.Text);
            int Totalqty = Convert.ToInt32(txtQty.Text);
            if (varqty > Totalqty||temp>Totalqty)
            {
                MessageBox.Show("Variant qty should not exceed Total number of qty.. ");
                
            }
            else
            {
            String var = DropDownVariant.SelectedItem.Text;
            String qty = txtVariQty.Text.ToString();
            txtVariant.Text += var + ":" + qty + "\n";

                
            temp+= Convert.ToInt32(txtVariQty.Text);
            }


        }

        protected void DropCategory_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (DropCategory.SelectedItem.Text == "Accessories")
            {
                //Response.Write("<script>   document.querySelectorAll('row31').style.visibility= 'hidden';</script>");
                row3.Visible = false;


            }
            else if (DropCategory.SelectedItem.Text == "Mobile")
            {
                //Response.Write("<script>   document.querySelectorAll('row31').style.display = 'block';</script>");
                row3.Visible = true;

            }
        }

        protected void btnSearch_Click1(object sender, EventArgs e)
        {


            SqlConnection con = new SqlConnection(strcon);
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open();
            }
            try
            {
                ShowData();

            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);
            }
        }

        protected void BtnSubmitUpdate_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open();
            }
            try
            {
                String orderId = txtOrderIdUpdate.Text;
                SqlCommand cmd = new SqlCommand("UPDATE Purchase_Order_tab " +
                    "SET Qty=@qty,Brand=@brand,Model=@model,Variant=@vari,where P_OrderID='" + orderId + "'", con);


                cmd.Parameters.AddWithValue("@qty", Convert.ToDouble(txtQty.Text));
                cmd.Parameters.AddWithValue("@brand", txtBrand.Text.ToString());
                cmd.Parameters.AddWithValue("@model", txtModelNum.Text.ToString());
                cmd.Parameters.AddWithValue("@vari", txtVariant.Text.ToString());

                cmd.ExecuteNonQuery();

                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show("Record Updated Succesfully...", "Message", btn);

            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "", btn);
            }   
        }

        protected void BtnOrderMoreModel_Click(object sender, EventArgs e)
        {
            txtQty.Text = txtModelNum.Text = txtVariQty.Text = txtVariant.Text = "";
            DropDownVariant.SelectedIndex = 0;
            



        }

        protected void BtnFinish_Click(object sender, EventArgs e)
        {
            txtQty.Text = txtModelNum.Text = txtVariQty.Text = txtVariant.Text= txtBrand.Text = "";
            DropDownVariant.SelectedIndex = 0;
            DropCategory.SelectedIndex = 0;
            DropSuplier.SelectedIndex = 0;
            GenerateId();

        }


        protected void ShowData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                DataTable dt = new DataTable();
                SqlDataAdapter adapt = new SqlDataAdapter("select * from Purchase_Order_tab where P_OrderID='" + txtOrderIdUpdate.Text + "'", con);
                adapt.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                else
                {
                    MessageBox.Show("No record found with ID= " + txtOrderIdUpdate.Text);
                }
                con.Close();
            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "Message", btn);
            }
        }

        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            GridView1.EditIndex = e.NewEditIndex;
            ShowData();
        }
        protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                //Finding the controls from Gridview for the row which is going to update  
                Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
                TextBox Date = GridView1.Rows[e.RowIndex].FindControl("txtDate") as TextBox;
                TextBox name = GridView1.Rows[e.RowIndex].FindControl("txtName") as TextBox;
                TextBox Qty = GridView1.Rows[e.RowIndex].FindControl("txtQty") as TextBox;
                TextBox Brand = GridView1.Rows[e.RowIndex].FindControl("txtBrand") as TextBox;
                TextBox Model= GridView1.Rows[e.RowIndex].FindControl("txtModel") as TextBox;
                TextBox Variant = GridView1.Rows[e.RowIndex].FindControl("txtVari") as TextBox;

                //updating the record  
                //SqlCommand cmd = new SqlCommand("Update Purchase_Order_tab SET Phone='" + phone.Text + "',SupName='" + name.Text + "',Email='" + email.Text + "', Address='" + Address.Text + "',City='" + City.Text + "',State='" + State.Text + "',Company='" + Company.Text + "' where Phone='" + id.Text + "'", con);
                SqlCommand cmd = new SqlCommand("UPDATE Purchase_Order_tab " +
                    "SET Order_Date=@date,Sup_Name=@name,Qty=@qty,Brand=@brand,Model=@model,Variant=@vari where P_OrderID='" + txtOrderIdUpdate.Text + "'", con);


                cmd.Parameters.AddWithValue("@date", Convert.ToDateTime(Date.Text));
                cmd.Parameters.AddWithValue("@name", name.Text);
                cmd.Parameters.AddWithValue("@qty", Convert.ToDouble(Qty.Text));
                cmd.Parameters.AddWithValue("@brand", Brand.Text.ToString());
                cmd.Parameters.AddWithValue("@model", Model.Text.ToString());
                cmd.Parameters.AddWithValue("@vari", Variant.Text.ToString());
                cmd.ExecuteNonQuery();
                con.Close();

                //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
                GridView1.EditIndex = -1;
                //Call ShowData method for displaying updated data  
                ShowData();
            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "Message", btn);
            }
        }
        protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            ShowData();
        }




        


        protected void btnGo_Click(object sender, EventArgs e)
        {
            ShowData();
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            txtDate.Text = txtBrand.Text = txtModelNum.Text = txtQty.Text = txtVariQty.Text = txtVariant.Text = "";
            DropCategory.SelectedIndex = 0;
            DropDownVariant.SelectedIndex = 0;
            DropSuplier.SelectedIndex = 0;

        }
    }
}