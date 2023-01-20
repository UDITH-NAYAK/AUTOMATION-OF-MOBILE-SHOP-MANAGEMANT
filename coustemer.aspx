<%@ Page Title="" Language="C#" MasterPageFile="~/DashLayout.Master" AutoEventWireup="true" CodeBehind="coustemer.aspx.cs" Inherits="MobileShop.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .button1 {
    width: 8%;
    height: 20%;
    background-color: cornflowerblue;
    border-radius: 25px;
    border: none;
    color: #fff;
    font-size: 18px;
    letter-spacing: 1px;
    cursor: pointer;
    margin-top:20px;
    margin-left:20px;
}

.input, .details {
    margin-top: 20px;
    margin-left: 30px;
  
    font-family: Arial;
}

.label {
    margin-left: 7px;
}

.tb {
     
}
.content{
    background-color:white;
     box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.1);
    justify-content:space-around;
    height:100%;
    border-radius:25px;
    width:95%;


}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<link href="css/People.css" rel="stylesheet" />--%>
    <%-- Customer Page --%>
        <div id="Cust" onload="" >
            <form runat="server">
      <nav id="navbar" class="navbar  navbar-expand-lg navbar-dark bg-dark"style="height:60px;width:100%; position:fixed; z-index:99;  transition:top 0.3s  ">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">

        <img src="images/Croplogo.jpg"  style="width:90px;height:50px;"/> </a>
  
    <div class="collapse navbar-collapse" id="navbarsupportedcontent">
 
        
        <div class="dropdown-content " style="margin-top:190px; background-color:#191111;" id="myDropdown0">
            
            <asp:Button ID=Button2 style="background-color:#191111; border:0px;" CssClass="nav-link" runat="server"  Text="Log Out"  CausesValidation="False" OnClick="BtnLogOut_Click" UseSubmitBehavior="False" />
            <a class="nav-link" style="color:white;">My Profile </a>
        </div>
        <img src="Images/account-settings-icon.jpg" class=dropbtn onclick="myFunction(0)" style="height:50px;width:50px;border-radius:10%;cursor:pointer;position:sticky;justify-content:flex-end">
          
        
         
        </div>

            
      
    </div>
</nav>



<div style="margin-top:-110%;">

    <h1>Customer Details</h1>
    <hr />
   

                <asp:GridView ID=GridCustomer runat="server" Width="100%" Style="margin-top: 40px;" CssClass="table table-bordered table-stripped table-hover" AutoGenerateColumns="False" DataKeyNames="Phno" DataSourceID="CustomerDeatailsDB">

                    <Columns>
                        <asp:BoundField DataField="Phno" HeaderText="Phno" ReadOnly="True" SortExpression="Phno"></asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address"></asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="CustomerDeatailsDB" ConnectionString='<%$ ConnectionStrings:MobileShopDBConnectionString %>' SelectCommand="SELECT * FROM [Customer_tab]"></asp:SqlDataSource>
    </div>        
    </form>
</div> 
</asp:Content>
