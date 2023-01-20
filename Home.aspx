    <%@ Page Title="" Language="C#" MasterPageFile="~/DashLayout.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MobileShop.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #ContentPlaceHolder1{

            background-color:lightgray;
        }
        /*.dashboard_Page{
            margin-left:20px;
            
            border-top-left-radius:50px;
            background-color:ghostwhite;
            max-height:1500px;
            height:1000px;
        }*/


        .btn-primary btn-primary img-thumbnail{
            padding-bottom:25px;

        }
        .btn1{
            margin-left:20px;
            margin-bottom:-10px;
            justify-content:center; 
            font-variant: small-caps; 
            font-style: oblique; 
            font-size: medium; 
            text-indent: 6px;
            word-spacing: 5em;
            margin-top:32px;


        }

          </style>
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
            
            <asp:Button ID=Button1 style="background-color:#191111; border:0px;" CssClass="nav-link" runat="server"  Text="Log Out"  CausesValidation="False" OnClick="Button1_Click" />
            <a class="nav-link" style="color:white;">My Profile </a>
        </div>
        <img src="Images/account-settings-icon.jpg" class=dropbtn onclick="myFunction(0)" style="height:50px;width:50px;border-radius:10%;cursor:pointer;position:sticky;justify-content:flex-end">
          
        
         
        </div>

            
           
    </div>
</nav>


        <img src="Images/NEW_HOME_PAGE.jpg" style="width:101.2%;height:100%; margin-top:-42.5%;margin-left:-15px" />

    <asp:Panel ID="Panel1" runat="server"  CssClass="right_Panel">
            <%-- <div class="row" style="width:100%;display:flex;justify-content:space-around;">
                            
                 <div class="col-lg-3 col-md-3">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Total Sales &nbsp <asp:Label runat="server" ID="lblSale">10000rs</asp:Label></div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Purchase 15000rs</div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Total revenue 50000rs</div>
                                </div>
                            </div>
                        </div>--%>

        </asp:Panel>
        </form>
</asp:Content>
