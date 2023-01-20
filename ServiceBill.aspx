<%@ Page Title="" Language="C#" MasterPageFile="~/DashLayout.Master" AutoEventWireup="true" CodeBehind="ServiceBill.aspx.cs" Inherits="MobileShop.WebForm20" %>

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
            height: 45px;
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


        .input:focus {
            border-color: #6b9af2;
            box-shadow: rgba(255,255,255,0.8);
        }

        .input:hover {
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

            .components > .details, .input {
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

        .Calculations {
            display: table-row;
            display: flex;
            width: 100%;
            justify-content: space-around;
        }

        #lblTotal, #lblDiscount, #lblGTotal, #lblTax {
            display: table-row;
            display: flex;
            width: 100%;
            margin-left: 15%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server" style="margin-top: -110%;">
        <nav id="navbar" class="navbar  navbar-expand-lg navbar-dark bg-dark" style="height: 60px; width: 100%; position: fixed; z-index: 99; transition: top 0.3s">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">

                    <img src="images/Croplogo.jpg" style="width: 90px; height: 50px;" />
                </a>

                <div class="collapse navbar-collapse" id="navbarsupportedcontent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">home</a>
                        </li>


                    </ul>

                    <div class="dropdown-content " style="margin-top: 190px; background-color: #191111;" id="myDropdown0">

                        <asp:Button ID=Button1 Style="background-color: #191111; border: 0px;" CssClass="nav-link" runat="server" Text="Log Out" CausesValidation="False" OnClick="BtnLogOut_Click" UseSubmitBehavior="False" />
                        <a class="nav-link" style="color: white;">My Profile </a>
                    </div>
                    <img src="Images/account-settings-icon.jpg" class=dropbtn onclick="myFunction(0)" style="height: 50px; width: 50px; border-radius: 10%; cursor: pointer; position: sticky; justify-content: flex-end">
                </div>



            </div>
        </nav>


        <div id="Panel1" style="width: 99%;">
            <h1>Service Bill</h1>
            <hr />
            <div style="display: flex; justify-content: center;">
            </div>

            <div class="content" id="content" style="">

                <div class="components1">
                    <div class="rows">

                        <div class="row1">

                            <span class="details">Enter Cust Phno.</span>
                            <asp:TextBox CssClass="input" ID="txtPhnoSearch" AutoCompleteType="Disabled" runat="server" OnTextChanged="txtPhnoSearch_TextChanged" AutoPostBack=True> </asp:TextBox>


                        </div>




                        <div class=row3>



                            <span class="details" style="">Tax in %</span>
                            <asp:TextBox CssClass="input" ID="txtTax" type="number" placeholder="Tax" Min="0"
                                required="required" runat="server"></asp:TextBox>

                            <span class="details">Discount</span>
                            <asp:TextBox CssClass="input" ID="txtDisCount" type="number" placeholder="0.0" Min="0"
                                required="required" runat="server" AutoPostBack="True"></asp:TextBox>

                            <br>
                        </div>




                    </div>
                </div>




            </div>








            <asp:Panel runat="server" ID="pnlContents" BorderStyle="Solid" BorderColor="Black" BorderWidth="2"
                Width="99%" Style="margin-top: 20px;">





                <table id="BillTable" border="0" class="table " style="width: 98%;">

                    <tr>
                        <td>
                            <div style="height: 20%; justify-content: center; display: flex;">
                                <h3>DAY TO DAY DIGITAL</h3>
                            </div>
                            </>
                                    <div style="height: 20%; justify-content: center; display: flex;">
                                        <h6>OPP SBI BANK SERVICE BUSSTAND UDUPI-576101</h6>


                                    </div>
                            <hr style="border: 1px solid black" />


                        </td>
                    </tr>

                    <tr>
                        <td rowspan="1">

                            <div class="cust-info">
                                Customer:
                                        <asp:TextBox ID="txtCustomerName" runat="server" BorderWidth="0px"
                                            placeholder="Enter name" required="required" TextMode=SingleLine></asp:TextBox>
                                <asp:Button ID=btnExistCustomer runat="server" CssClass="btn btn-light col-0" Text="..." UseSubmitBehavior="False" />
                                <asp:DropDownList ID=DropCustomer runat="server" Visible="False" AutoPostBack="True"></asp:DropDownList>
                                <br />
                                <span style="margin-top: 16px; display: inline-flex">Phone number: </span>
                                <asp:TextBox ID="txtCustphone" runat="server" BorderWidth="0px"
                                    MaxLength="10" MinLength="10" placeholder="Enter Phno" required="required" TextMode="Number" CausesValidation="True"></asp:TextBox>

                                <span style="margin-top: 10px; display: inline-flex">Address:</span>
                                <asp:TextBox ID="txtCustAddress" placeholder="Address" required="required" runat="server"
                                    Style="margin-top: 16px; display: inline-flex" BorderWidth="0px"
                                    TextMode="MultiLine"></asp:TextBox>

                            </div>

                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div class="2row" style="display: flex; justify-content: flex-start;">

                                <div class="invoice-date">

                                    <span>Invoice:</span>
                                    <asp:TextBox ID="txtInvoiceNo" placeholder="" required="required"
                                        runat="server" BorderWidth="0px" Enabled=False></asp:TextBox>

                                    <span>Date:</span>
                                    <asp:TextBox ID="txtDate" placeholder="" required="required" runat="server"
                                        BorderWidth="0px" type="text"></asp:TextBox>

                                </div>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="3">


                            <asp:GridView ID=GridBillTable CssClass="table table-stripped" runat="server" Width="100%">
                                <HeaderStyle BorderColor="Black" BorderStyle="Solid" Font-Bold=True />
                                <Columns>
                                   <%-- <asp:TemplateField HeaderText="Email">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("IMEI") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Discription">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Brand") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Email">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Discription") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>




                                    <asp:TemplateField HeaderText="Price">

                                        <ItemTemplate>
                                            <asp:TextBox ID="txtTotalPrice" placeholder="0.0" required="required" runat="server" BorderWidth="0px" type="text"></asp:TextBox>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>

                    </tr>
                    <tr>

                        <td class="Calculations">
                            <asp:Label runat="server" Style="margin-left: 80%; margin-bottom: -8px;" Text="Total" />
                            <asp:Label ID="lblTotal" runat="server" Style="" Text="0.0" />

                        </td>




                    </tr>

                    <tr>
                        <td class="Calculations">
                            <span style="margin-left: 80%; margin-bottom: -8px;">Tax</span>
                            <asp:Label runat="server" ID="lblTax" Style="margin-bottom: -8px;" Text="0.0" />
                        </td>
                    </tr>


                    <tr>
                        <td class="Calculations">
                            <span style="margin-left: 80%; margin-bottom: -8px;">Discount</span>
                            <asp:Label runat="server" ID="lblDiscount" Style="margin-bottom: -8px;" Text="0.0" />
                        </td>
                    </tr>

                    <tr>
                        <td class="Calculations">
                            <span style="margin-left: 80%; margin-bottom: -8px;">Grand Total</span>


                            <asp:Label runat="server" ID="lblGTotal" Style="margin-bottom: -8px;" Text="0.0" />
                        </td>


                    </tr>



                </table>



            </asp:Panel>
            <div style="margin-top: 20px; justify-content: space-around; padding: 30px,30px,30px,30px; display: flex;">

                <asp:Button ID=btnClear runat="server" CssClass="btn btn-warning col-1" Text="Clear" UseSubmitBehavior="False" OnClick="btnClear_Click" />


                <asp:Button ID=btnCalculate runat="server" CssClass="btn btn-info col-2" Text="Calculate" UseSubmitBehavior="False" OnClick="btnCalculate_Click1" />
                <asp:Button ID=btnUpdateStock runat="server" CssClass="btn btn-info col-2" Text="Print" UseSubmitBehavior="True" OnClick="btnUpdateStock_Click1" />
            </div>








        </div>




    </form>
</asp:Content>
