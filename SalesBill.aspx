<%@ Page Title="" Language="C#" MasterPageFile="~/DashLayout.Master" AutoEventWireup="true"
    CodeBehind="SalesBill.aspx.cs" Inherits="MobileShop.WebForm16" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script>
            function myFunction2() {

                document.getElementById("DropColors").classList.toggle("show");


            }

            function PrintPanel() {
                var panel = document.getElementById("<%=pnlContents.ClientID %>");
                var printWindow = window.open('', '', 'height=400,width=800');
                printWindow.document.write('<html><head><title>Bill overview</title>');
                printWindow.document.write('</head><body>');
                printWindow.document.write(panel.innerHTML);
                printWindow.document.write('</body></html>');
                printWindow.document.close();
                setTimeout(function () {
                    printWindow.print();
                }, 500);
                return false;
            }

            
        </script>

        <style>
            

            .details {
                margin-top: 20px;
                margin-left: 55px;
                margin-right: 10px;
            }

            .input {
                margin-top: 20px;
                margin-left: 30px;
                margin-right: 15px;
                width: 14%;
                height:45px;
                 height: 45px;
  outline: none;
  font-size: 16px;
  border-radius: 5px;
  padding-left: 15px;
  border: 1px solid #ccc;
  border-bottom-width: 2px;
            }



            .show {
                display: block;
            }

            .hide {
                display: none;
            }

        
            .input:focus{
  border-color: #6b9af2;
    box-shadow:rgba(255,255,255,0.8);

}

.input:hover{
    border-color: #6b9af2;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

 
            .components {
                background-color: blueviolet;
                display: grid;
                grid-gap: 10px;

            }



            /*.components>.row1,
            .row2,
            .row3 {

                padding: 10px 0;
                display: inline-flex;
            }*/

            .components> .details,.input{
                padding: 10px 0;
            }
 

            .content {
                background-color: white;
                justify-content: space-around;
                font-weight: 700;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                width: 99%;




            }

            

            

            table.table tbody tr td,
            table.table thead tr th,
            table.table thead {
                border-left: 0px solid black;
                border-right: 0px solid black;
            }
            

            
            .Calculations{
                display:table-row;
                display:flex;
                width:100%;
                justify-content:space-around;
            }

            #lblTotal,#lblDiscount,#lblGTotal,#lblTax{
               display:table-row;
                display:flex;
                width:100%;
                margin-left:15%;
                
            }
        </style>
    </asp:Content>


    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <form runat="server" style="margin-top:-110%;"  >
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
            
            <asp:Button ID=Button1 style="background-color:#191111; border:0px;" CssClass="nav-link" runat="server"  Text="Log Out"   OnClick="Button1_Click" ValidateRequestMode="Disabled" UseSubmitBehavior="False" />
            <a class="nav-link" style="color:white;">My Profile </a>
        </div>
        <img src="Images/account-settings-icon.jpg" class=dropbtn onclick="myFunction(0)" style="height:50px;width:50px;border-radius:10%;cursor:pointer;position:sticky;justify-content:flex-end">
          
        
         
        </div>

            
        <%--<input class="form-control-sm me-2 " type="search" placeholder="search" aria-label="search"/>--%>
        <%--<button class="btn btn-outline-success" type="submit">search</button>--%>
      
    </div>
</nav>


            <div id="Panel1" style=" width:99%;" >
                <h1>Sales Bill</h1>
                <hr />
                <div style="display:flex;justify-content:center;">

                </div>

                <div class="content" id="content" style="">

                    <div class="components1">
                        <div class="rows">

                            <div class="row1">
                                <span class="details" style="margin-left:10px;">Categorey </span>
                                <asp:DropDownList ID="DropCategory" CssClass="input" style="cursor:pointer"
                                    runat="server" Height="40px" Width="150px" OnSelectedIndexChanged="DropCategory_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem Value="0">--select--</asp:ListItem>
                                    <asp:ListItem Value="1">Mobile</asp:ListItem>
                                    <asp:ListItem Value="2">Accessories</asp:ListItem>

                                </asp:DropDownList>

                                
                                <span class="details">Brand</span><asp:DropDownList ID="DropBrand" CssClass="input" runat="server" style="cursor:pointer" AppendDataBoundItems="True" AutoPostBack="True"  OnSelectedIndexChanged="DropBrand_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="Brand_Names" runat="server" ConnectionString="<%$ ConnectionStrings:MobileShopDBConnectionString %>" SelectCommand="SELECT [Brand] FROM [Mobile_tab]"></asp:SqlDataSource>
&nbsp;<span class="details" style="margin-left:5px;">Model Number</span>
                               <%-- <asp:TextBox CssClass="input" ID="txtModelNum" type="text" placeholder=""
                                    required="required" runat="server"></asp:TextBox>--%>
                                <asp:DropDownList CssClass="input" ID=DropModel runat="server" style="cursor:pointer"   Width="100px" AutoPostBack="True" OnSelectedIndexChanged="DropModel_SelectedIndexChanged1">
                                </asp:DropDownList>


                            </div>

                            <asp:Panel ID="row2" runat="server">
                                <asp:Label ID="lblIMEI" CssClass="details" style="margin-left:5px;"  runat="server" Text="IMEI Num."></asp:Label>
                                <asp:TextBox CssClass="input" type="number" MaxLength=15 ID="txt_IMEI_Num"   title="Enter proper IMEI number"    placeholder="" required="required" runat="server" CausesValidation="True"  ></asp:TextBox>
                                 
                               


                                    <span class="details row31" style="margin-left:0px;">Unit Price</span>
                                    <asp:TextBox CssClass="input"    ID="txtUnitPrice" type="text"
                                        placeholder="" required="required" runat="server"></asp:TextBox>


                                <span class="details" >Qty</span>
                                <asp:TextBox CssClass="input" Min="1" ID="txtQty" type="number" placeholder="Quantity"
                                    required="required" runat="server" OnTextChanged="txtQty_TextChanged"></asp:TextBox>
                               
                                <span> In Stock qty:</span>
                                  <asp:TextBox  ID="txtTotalQty"  style=" margin-left:3px; width:70px;" placeholder=""
                                    required="required" runat="server" Enabled="False"></asp:TextBox>


                                <div class=row3 >
                                
                                     <span class="details" style="margin-left:5px;">Discount</span>
                                <asp:TextBox CssClass="input" ID="txtDiscount" style="margin-left:40px;" type="number" placeholder="Quantity"
                                    required="required" runat="server"></asp:TextBox>
                              
                                     <span class="details" style="margin-left:5px;" >Tax in %</span>
                                <asp:TextBox CssClass="input" ID="txtTax" style="margin-left:38px;" type="number" placeholder="Quantity"
                                    required="required" runat="server"></asp:TextBox>
                              
                                    Warrenty  period:
                                      <asp:TextBox CssClass="input" ID="txtWarFrom" style="margin-left:2px;" type="number" placeholder="Quantity"
                                    required="required" runat="server" AutoPostBack="True" OnTextChanged="txtWarFrom_TextChanged"></asp:TextBox>
                                    
                                    Warrenty To
                                      <asp:TextBox CssClass="input" ID="txtWarTo" style="margin-left:5px;"  placeholder="Quantity"
                                    required="required" runat="server"></asp:TextBox>
                                </div>

                            </asp:Panel>


                        </div>
                    </div>
                    <div>
                        <asp:Button ID="btnAdd" style="margin-top:20px;margin-left:20px;"
                            CssClass="btn btn-outline-success col-1 " runat="server" Text="Add" OnClick="btnAdd_Click" UseSubmitBehavior="True" />
                    </div>
                    <div>
                        &nbsp;
                    </div>


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
                                <td rowspan="1">

                                    <div class="cust-info">
                                        Customer:
                                        <asp:TextBox ID="txtCustomerName"  runat="server" BorderWidth="0px"
                                            placeholder="Enter name" required="required" TextMode=SingleLine></asp:TextBox>
                                             <asp:Button ID=btnExistCustomer runat="server" CssClass="btn btn-light col-0" Text="..."  UseSubmitBehavior="False" OnClick="btnExistCustomer_Click" />
                                        <asp:DropDownList ID=DropCustomer runat="server"  Visible="False" AutoPostBack="True" OnSelectedIndexChanged="DropCustomer_SelectedIndexChanged"></asp:DropDownList>
                                        <br />
                                        <span style="margin-top:16px; display:inline-flex ">Phone number: </span>
                                        <asp:TextBox ID="txtCustphone" runat="server" BorderWidth="0px"
                                           MaxLength="10" MinLength="10" pattern="[0-9]{10}"  placeholder="Enter Phno" required="required" TextMode="Number" CausesValidation="True"></asp:TextBox>
                                    
                                        <span style="margin-top:10px; display:inline-flex "> Address:</span>
                                    <asp:TextBox ID="txtCustAddress" placeholder="Address" required="required" runat="server"
                                        style="margin-top:16px; display:inline-flex " BorderWidth="0px"
                                        TextMode="MultiLine"></asp:TextBox>

                                    </div>

                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="2row" style="display:flex; justify-content:flex-start;  ">

                                        <div class="invoice-date">

                                            <span> Invoice:</span>
                                            <asp:TextBox ID="txtInvoiceNo" placeholder="" required="required"
                                                runat="server" BorderWidth="0px"></asp:TextBox>

                                            <span> Date:</span>
                                            <asp:TextBox ID="txtDate" placeholder="" required="required" runat="server"
                                                BorderWidth="0px"  type="text"></asp:TextBox>

                                        </div>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="3">
                                    <asp:GridView ID=GridBillTable CssClass="table table-stripped" runat="server" Width="100%">

                                         <HeaderStyle  BorderColor="Black" BorderStyle="Solid"   Font-Bold=True />
                                    </asp:GridView>
                                </td>
                                
                            </tr>
                           
                                   <tr>
                                 
                                <td  class="Calculations" >
                                    <asp:Label runat="server" style=" margin-left:80%; margin-bottom:-8px;" Text="Total"/>
                                        <asp:Label ID="lblTotal" runat="server" style="  " Text="0.0"/>
                                         
                               </td>
                               
                                
                                 
                                
                            </tr>

                            <tr  >
                                <td class="Calculations" >
                                        <span style=" margin-left:80%; margin-bottom:-8px;"> Tax</span>
                                    <asp:Label runat="server" ID="lblTax" style="  margin-bottom:-8px;" Text="0.0"/>
                               </td>
                                    </tr>


                            <tr  >
                                <td class="Calculations">
                                        <span style=" margin-left:80%; margin-bottom:-8px;"> Discount</span>
                                      <asp:Label runat="server" ID="lblDiscount" style="  margin-bottom:-8px;" Text="0.0"/>
                                    </td>
                                </tr>
                           
                            <tr >
                                <td class="Calculations">
                                        <span style=" margin-left:80%; margin-bottom:-8px;"> Grand Total</span>
                                    
                                     
                                    <asp:Label runat="server" ID="lblGTotal" style=" margin-bottom:-8px;" Text="0.0"/>
                                </td>
                                    

                                </tr>


                       
                        </table>

                    </div>

                </asp:Panel>
                <div style="margin-top:20px;justify-content:space-around;padding:30px,30px,30px,30px;display:flex;">

                    <asp:Button ID=btnSubmit runat="server"  CssClass="btn btn-warning col-1" Text="Clear" OnClick="btnClear_Click1" UseSubmitBehavior="False" />

                    
                   
                    <asp:Button ID=btnUpdateStock runat="server" CssClass="btn btn-info col-2" Text="Print"  UseSubmitBehavior="False" OnClick="btnUpdateStock_Click" />
                </div>
              



                <asp:SqlDataSource ID="Brand_Model" runat="server" ConnectionString="<%$ ConnectionStrings:MobileShopDBConnectionString %>" SelectCommand="SELECT * FROM [Temp_Bill]"></asp:SqlDataSource>




            </div>




        </form>
    </asp:Content>