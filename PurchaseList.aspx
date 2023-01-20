<%@ Page Title="" Language="C#" MasterPageFile="~/DashLayout.Master" AutoEventWireup="true" CodeBehind="PurchaseList.aspx.cs" Inherits="MobileShop.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <form runat="server">
     <nav id="navbar" class="navbar  navbar-expand-lg navbar-dark bg-dark"style="height:60px;width:100%; position:fixed; z-index:99;  transition:top 0.3s  ">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">

        <img src="images/Croplogo.jpg"  style="width:90px;height:50px;"/> </a>
  
    <div class="collapse navbar-collapse" id="navbarsupportedcontent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active"   href="#">home</a>
        </li>
        
       
      </ul>
        
        <div class="dropdown-content " style="margin-top:190px; background-color:#191111;" id="myDropdown0">
            
            <asp:Button ID=Button1 style="background-color:#191111; border:0px;" CssClass="nav-link" runat="server"  Text="Log Out"  CausesValidation="False" OnClick="BtnLogOut_Click" UseSubmitBehavior="False" />
            <a class="nav-link" style="color:white;">My Profile </a>
        </div>
        <img src="Images/account-settings-icon.jpg" class=dropbtn onclick="myFunction(0)" style="height:50px;width:50px;border-radius:10%;cursor:pointer;position:sticky;justify-content:flex-end">
          
        
         
        </div>

            
      
    </div>
</nav>
    <link href="css/Purchase.css" rel="stylesheet" />
     <div id="Panel2" class="Panel2" style="">
         
    
        
    <div class="content" style="margin-top:-110%;background-color:white;justify-content:space-around;height:100%">
    <h1>Purchase Order list</h1>
    <hr />
        <%--<asp:Button runat="server" CssClass="button1" Style="height:40px; width:20%;" Text=" + Add Purchase " />
            <asp:Button runat="server" CssClass="button1"  style="margin-left:20px;height:40px; width:20%;" Text="Update"/> 
           <div style="margin-top:20px;">
             <input class="form-control" type="search" placeholder="search" style="width:25%;" aria-label="search"/>--%>

 </div>
             
        

    </div>
        <asp:GridView ID="GridView1" runat="server" Style="width: 97%; margin-top: -110%;" CssClass="table table-bordered table-stripped table-hover " AutoGenerateColumns="False" DataSourceID="PurchaseOrderLIst" FooterStyle-BackColor=Black>
            <AlternatingRowStyle BackColor="Silver" />
            <Columns>
                <asp:BoundField DataField="P_OrderID" HeaderText="P_OrderID" SortExpression="P_OrderID" />
                <asp:BoundField DataField="Order_Date" HeaderText="Order_Date" SortExpression="Order_Date" />
                <asp:BoundField DataField="Sup_Name" HeaderText="Sup_Name" SortExpression="Sup_Name" />
                <asp:BoundField DataField="Sup_Id" HeaderText="Sup_Id" SortExpression="Sup_Id" />
                <asp:BoundField DataField="Categorey" HeaderText="Categorey" SortExpression="Categorey" />
                <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty" />
                <asp:BoundField DataField="Brand" HeaderText="Brand" SortExpression="Brand" />
                <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                <asp:BoundField DataField="Variant" HeaderText="Variant" SortExpression="Variant" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
            </Columns>

            <FooterStyle BackColor="Black"></FooterStyle>

            <HeaderStyle BorderColor="Black" BorderStyle="Solid" BackColor="#666666" ForeColor="White" />
        </asp:GridView>



        <asp:SqlDataSource runat="server" ID="PurchaseOrderLIst" ConnectionString='<%$ ConnectionStrings:MobileShopDBConnectionString %>' SelectCommand="SELECT * FROM [Purchase_Order_tab] WHERE ([Status] = @Status)">
            <SelectParameters>
                <asp:Parameter DefaultValue="Ordered" Name="Status" Type="String"></asp:Parameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </form>

</asp:Content>
