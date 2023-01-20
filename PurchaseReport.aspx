    <%@ Page Title="" Language="C#" MasterPageFile="~/DashLayout.Master" AutoEventWireup="true" CodeBehind="PurchaseReport.aspx.cs" Inherits="MobileShop.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div style="margin-top:-110%;">
        <h3>Purchase Report </h3>
        <hr>
        </div>

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
            
            <asp:Button ID=Button1 style="background-color:#191111; border:0px;" CssClass="nav-link" runat="server"  Text="Log Out"  CausesValidation="False" OnClick="Button1_Click" UseSubmitBehavior="False" />
            <a class="nav-link" style="color:white;">My Profile </a>
        </div>
        <img src="Images/account-settings-icon.jpg" class=dropbtn onclick="myFunction(0)" style="height:50px;width:50px;border-radius:10%;cursor:pointer;position:sticky;justify-content:flex-end">
          
        
         
        </div>

            
        <%--<input class="form-control-sm me-2 " type="search" placeholder="search" aria-label="search"/>--%>
        <%--<button class="btn btn-outline-success" type="submit">search</button>--%>
      
    </div>
</nav>


        <div>
            <span  style="margin-left:20px;">Sart </span>
            <span style="margin-left:140px;">End </span>
            </div>
    <div class="Dates" style="margin-top:10px;  display:flex;">
        
        


         <asp:TextBox CssClass="input" style="margin-left:20px; cursor:pointer;" ID="txtStartDate" type="date" placeholder="" required="required" runat="server"></asp:TextBox>
         
        <asp:TextBox CssClass="input" style="margin-left:40px;cursor:pointer;" ID="txtEndDate" type="date" placeholder="" required="required" runat="server" AutoPostBack="True" OnTextChanged="txtEndDate_TextChanged"></asp:TextBox>
        </div>


        <div>
             <span class="details row31">Sort By</span>
                                <asp:DropDownList ID="DropSortTable" CssClass="input row31" Style="cursor: pointer;" runat="server" Height="40px" Width="200px" OnSelectedIndexChanged="DropSortTable_SelectedIndexChanged"  AutoPostBack=True>
                                    <asp:ListItem Value="0">--select--</asp:ListItem>
                                    <asp:ListItem Value="1">Supplier Name</asp:ListItem>
                                    <asp:ListItem Value="2">Quantity</asp:ListItem>
                                    <asp:ListItem Value="3">Date</asp:ListItem>
                                </asp:DropDownList>

        </div>





         <asp:Panel runat="server" ID="pnlContents" BorderStyle="Solid" BorderColor="Black" BorderWidth="2"
                    Width="99%"   style="margin-top:20px;">

                    <div>



                        <table id="BillTable" border="1" class="table " style="width: 98%;">

                            <tr>
                                <td>
                                    <div style="height:20%;justify-content:center;display:flex;">
                                        <h3>DAY TO DAY DIGITAL</h3>
                                    </div>
                                    </>
                                    <div style="height:20%;justify-content:center;display:flex;">
                                        <h6>OPP SBI BANK SERVICE BUSSTAND UDUPI-576101</h6>


                                    </div>
                                    <hr style="border:1px solid black" />


                                </td>
                            </tr>

                            

                            <tr>
                                <td>
                                    <div class="2row" style="display:flex;justify-content:center; ">

                       

                                            <h2 style=" ">PURCHASE ORDER REPORT </h2>
                                           <%-- <span> Date:</span>
                                            <asp:TextBox ID="txtDate" placeholder="" required="required" runat="server"
                                                BorderWidth="0px"  type="text"></asp:TextBox>--%>


                                        </div>
                                    
                                </td>
                            </tr>

                


            <asp:GridView ID=GridPurchase runat="server" CssClass="table table-hover " Width=96% >

            </asp:GridView>
                       
                        </table>

                    </div>

                </asp:Panel>



        </form>
</asp:Content>
