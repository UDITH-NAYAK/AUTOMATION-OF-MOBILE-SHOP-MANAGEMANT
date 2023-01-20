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
    public partial class WebForm10 : System.Web.UI.Page
    {
 
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
       
        SqlDataAdapter adapt;
        DataTable dt;
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
            GenerateSupID();

        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                double phno = Convert.ToDouble(txtPhno.Text);
                SqlCommand cmdp = new SqlCommand("SELECT * FROM Suppliers_tab where Phone=" + phno ,con);
                SqlDataReader rd = cmdp.ExecuteReader();
                if (rd.HasRows)
                {
                    MessageBoxButton butn = MessageBoxButton.OK;
                    MessageBox.Show("Phone number already Exists..", "Message", butn, MessageBoxImage.Exclamation);
                }
                else
                {
                    rd.Close();


                    SqlCommand cmd = new SqlCommand("INSERT INTO Suppliers_tab (Sup_Id,Phone,SupName,Email,Address,City,State,Company) values(@id,@pno,@sup,@email,@address,@city,@state,@company)", con);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt16( txtSupId.Text));
                    cmd.Parameters.AddWithValue("@pno",txtPhno.Text);
                    cmd.Parameters.AddWithValue("@sup", txtSupName.Text+"("+ txtCompany.Text+")");
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@city", txtCity.Text);
                    cmd.Parameters.AddWithValue("@state", txtState.Text);
                    cmd.Parameters.AddWithValue("@company", txtCompany.Text);
                    cmd.ExecuteNonQuery();
                    MessageBoxButton btn = MessageBoxButton.OK;
                    MessageBox.Show("Record Added Succesfully...", "Message", btn);

                    GridView2.DataBind();

                    txtSupName.Text = txtPhno.Text = txtEmail.Text = txtCompany.Text = txtCity.Text = txtAddress.Text=txtState.Text = "";
                    GenerateSupID();
                }

            }
            catch(Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(),"Message", btn);
            }
            
        }

        public void GenerateSupID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select Sup_Id from Suppliers_tab", con);
                DataTable dt = new DataTable();
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.HasRows)
                {
                    rd.Close();
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    adp.Fill(dt);
                int id = Convert.ToInt16(dt.Rows[dt.Rows.Count-1][0]);
                    id++;
                    txtSupId.Text = id.ToString();
                }

                else
                {
                txtSupId.Text = "101";

            
                }

            }
            catch (Exception ex)
            {
                MessageBoxButton btn = MessageBoxButton.OK;
                MessageBox.Show(ex.ToString(), "Message", btn);
            }
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
                dt = new DataTable();
                adapt = new SqlDataAdapter("select * from Suppliers_tab where Phone='" + txtPhoneSearch.Text + "'", con);
                adapt.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
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
                TextBox phone = GridView1.Rows[e.RowIndex].FindControl("txtPhone") as TextBox;
                TextBox name = GridView1.Rows[e.RowIndex].FindControl("txtName") as TextBox;
                TextBox email= GridView1.Rows[e.RowIndex].FindControl("txtEmail") as TextBox;
                TextBox Address= GridView1.Rows[e.RowIndex].FindControl("txtAddress") as TextBox;
                TextBox City= GridView1.Rows[e.RowIndex].FindControl("txtCity") as TextBox;
                TextBox State= GridView1.Rows[e.RowIndex].FindControl("txtState") as TextBox;
                TextBox Company= GridView1.Rows[e.RowIndex].FindControl("txtCompany") as TextBox;
                //updating the record  
                SqlCommand cmd = new SqlCommand("Update Suppliers_tab SET Phone='"+phone.Text+"',SupName='"+name.Text+"',Email='"+email.Text+"', Address='"+Address.Text+"',City='"+City.Text+"',State='"+State.Text+"',Company='"+Company.Text+ "' where Sup_Id='" + id.Text+"'", con);
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
         

        

        protected void btnUpdate_Click(object sender, EventArgs e)
        { 
            PanelUpdate.Visible = true;
            GridView1.Visible = true;
            GridView2.Visible = false;
            PanelAdd.Visible = false;

            
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            PanelUpdate.Visible = false;
            GridView1.Visible = false;
            GridView2.Visible = true;
            PanelAdd.Visible = true;
            GridView2.DataBind();

        }

 
        protected void btnGo_Click(object sender, EventArgs e)
        {
            ShowData();
        }
    }
}