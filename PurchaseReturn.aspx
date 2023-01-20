
 <%@ Page Title="" Language="C#" MasterPageFile="~/DashLayout.Master" AutoEventWireup="true" CodeBehind="PurchaseReturn.aspx.cs" Inherits="MobileShop.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Purchase.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .content{
    background-color:white;justify-content:space-around; font-weight: 700; box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.5);
    border-radius:15px;
    width:97%;
    /*margin-top:60px;*/
    top:0;
    z-index:-99;
    height:20%;
}
        .input{
            width:140px;
             height: 45px;
  outline: none;
  font-size: 16px;
  border-radius: 5px;
  padding-left: 15px;
  border: 1px solid #ccc;
  border-bottom-width: 2px;
        }

        .input:focus{
  border-color: #6b9af2;
    box-shadow:rgba(255,255,255,0.8);

}

.input:hover{
    border-color: #6b9af2;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}
        
    </style>

 


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





    <div id="Panel3" style="margin-top:-110%;" >
    
        <div style="margin-top:-110%; display:flex;">
    <h1 style="margin-left:20px;" >Purchase Returns</h1>
        <div>
    <hr  />
            </div>
            </div>
    <div class="content"style=" ">
            <div>
        <span class="details">Bill no</span>
                <asp:TextBox CssClass="input" ID="txtBillno" placeholder="" required="required"  runat="server"></asp:TextBox>
         
        <span class="details">Return Id</span>
                <asp:TextBox CssClass="input" ID="txtReturnId" placeholder="" required="required" style="margin-left:90px;"   runat="server"></asp:TextBox>

          <span class="details">Suplier Name</span>
            <asp:DropDownList  ID="DropSuplier" CssClass="input" runat="server" Height="40px" Width="200px" OnSelectedIndexChanged="DropSuplier_SelectedIndexChanged" ClientIDMode="Static" AutoPostBack="True" >
                      <asp:ListItem  Value="0">---select--</asp:ListItem>
                       
                </asp:DropDownList>
                </div>

            <div>
         <span class="details">Suplier Id</span>
                <asp:TextBox CssClass="input" ID="txtSupId" style="margin-left:20px;"  placeholder="" required="required"  runat="server" Enabled="False"></asp:TextBox>

       
         <span class="details">IMEI number</span>
                <asp:TextBox CssClass="input" ID="txtIMEI" placeholder="" required="required" style="margin-left:60px;"   runat="server"></asp:TextBox>

         <span class="details">Brand</span>
                <asp:TextBox CssClass="input" ID="txtBrand" placeholder=""  required="required"  runat="server" Style="margin-left:94px;"></asp:TextBox>
        
            </div>
             <span class="details">Model</span>
                <asp:TextBox CssClass="input" ID="txtModel" placeholder=""   required="required"  runat="server" Style="margin-bottom:-24px;"></asp:TextBox>
        
         <span class="details">Damage Discription</span>
                <asp:TextBox CssClass="input" ID="txtDiscription" style="margin-left:10px;" placeholder="" TextMode="MultiLine" required="required"  runat="server" ></asp:TextBox>
        




        <div style="margin-left:10px; margin-top:20px;">
        <asp:Button runat="server" CssClass="button1 btn " Text=" + Add Return" ID="btnReturn" OnClick="btnReturn_Click" Height="37px" Width="148px"/>
            </div>
           
    </div>
        </div>


            <asp:GridView ID=GridPurchaseReturn CssClass="table table-stripped" runat="server" Width="100%" style="margin-top:20px;" AutoGenerateColumns="False" DataKeyNames="Ret_Id" DataSourceID="PurchaseReturnList">

                <Columns>
                    <asp:BoundField DataField="Bill_No" HeaderText="Bill_No" SortExpression="Bill_No"></asp:BoundField>
                    <asp:BoundField DataField="Ret_Id" HeaderText="Ret_Id" ReadOnly="True" SortExpression="Ret_Id"></asp:BoundField>
                    <asp:BoundField DataField="Sup_Name" HeaderText="Sup_Name" SortExpression="Sup_Name"></asp:BoundField>
                    <asp:BoundField DataField="Sup_id" HeaderText="Sup_id" SortExpression="Sup_id"></asp:BoundField>
                    <asp:BoundField DataField="IMEI" HeaderText="IMEI" SortExpression="IMEI"></asp:BoundField>
                    <asp:BoundField DataField="Dis" HeaderText="Dis" SortExpression="Dis"></asp:BoundField>
                </Columns>

                <HeaderStyle BorderColor="Black" BorderStyle="Solid" Font-Bold=True />
            </asp:GridView>


            <asp:SqlDataSource runat="server" ID="PurchaseReturnList" ConnectionString='<%$ ConnectionStrings:MobileShopDBConnectionString %>' SelectCommand="SELECT * FROM [Purchase_Return_tab]"></asp:SqlDataSource>
        </form>
          

   




</asp:Content>
