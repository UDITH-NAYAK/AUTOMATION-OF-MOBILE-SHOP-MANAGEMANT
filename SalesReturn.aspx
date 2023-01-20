<%@ Page Title="" Language="C#" MasterPageFile="~/DashLayout.Master" AutoEventWireup="true" CodeBehind="SalesReturn.aspx.cs" Inherits="MobileShop.WebForm15" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link href="css/Purchase.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .content{
    background-color:white;justify-content:space-around; font-weight: 700; box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    border-radius:10px;
    width:97%;
    top:0;
    z-index:-99;
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




    <div id="Panel3" style="margin-top:-110%; " >
    
        <div >
    <h1 style="margin-left:20px;" >Sales Returns</h1>
        <div>
    <hr  />
            </div>
            </div>
    <div class="content"style=" ">
            <div>
        <span class="details">Invoice no</span>
                <asp:TextBox CssClass="input " ID="txtInvoiceNo" placeholder="" required="required"  runat="server"></asp:TextBox>
                <asp:Button ID=BtnSerch runat="server" Text="Search" OnClick="BtnSerch_Click" />
        
        <span class="details">Return Date</span>
                <asp:TextBox CssClass="input" ID="txtReturnDate" placeholder=""   runat="server" TextMode=Date></asp:TextBox>

          <span class="details">Item Name</span>
            <asp:DropDownList  ID="DropItemName" CssClass="input" runat="server" Height="40px" Width="200px"  ClientIDMode="Static" AutoPostBack="True" >
                       
                </asp:DropDownList>
                </div>

            <div>
       
            <span class="details">IMEI No.</span>
                <asp:TextBox CssClass="input" ID="txtIMEI" placeholder=""   runat="server" TextMode=Number></asp:TextBox>

       
         <span class="details">Damage Discription</span>
                <asp:TextBox CssClass="input" ID="txtDiscription" placeholder="" TextMode="MultiLine"   runat="server" Style="margin-bottom:-24px;"></asp:TextBox>
            </div>

 

        <div style="margin-left:10px; margin-top:20px;">
        <asp:Button runat="server" CssClass="button1 btn " Text=" + Add Return" ID="btnReturn" Height="37px" Width="148px" OnClick="btnReturn_Click"/>
         
            </div>
          


            <asp:GridView ID=GridPurchased runat="server" Width="95%" style="margin-left:20px;margin-top:20px;"></asp:GridView>
            <div style="margin-bottom:10px;">
                &nbsp
                </div>
    </div>
        </div>
   </form>
</asp:Content>
