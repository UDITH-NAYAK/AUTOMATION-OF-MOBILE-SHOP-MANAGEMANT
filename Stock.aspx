<%@ Page Title="" Language="C#" MasterPageFile="~/DashLayout.Master" AutoEventWireup="true" CodeBehind="Stock.aspx.cs"
    Inherits="MobileShop.WebForm14" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script>
            function myFunction2() {

                document.getElementById("DropColors").classList.toggle("show");

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
                margin-left: 40px;
                margin-right: 15px;
                width: 50%;
                outline: none;
                font-size: 16px;
                border-radius: 5px;
                padding-left: 15px;
                border: 1px solid #ccc;
                border-bottom-width: 2px;
                height:40px;
            }

            .input:focus {
                border-color: #6b9af2;
                box-shadow: rgba(255, 255, 255, 0.8);

            }

            .input:hover {
                border-color: #6b9af2;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            }

 

            .components {
                background-color: blueviolet;
                display: grid;
                grid-gap: 10px;
                padding: 20px;

            }



            .components1>.row1,
            .row2,
            .row3 {

                padding: 20px 0;
            }
 

            .content {
                background-color: white;
                justify-content: space-around;
                font-weight: 700;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.5);
                border-radius: 10px;
                width: 97%;
                top: 0;
                z-index: -99;

            }


            .input {
                width: 12%;
            }
        </style>
    </asp:Content>


    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <form runat="server" style="margin-top:-110%;">
            <nav id="navbar" class="navbar  navbar-expand-lg navbar-dark bg-dark"
                style="height:60px;width:100%; position:fixed; z-index:99;  transition:top 0.3s  ">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">

                        <img src="images/Croplogo.jpg" style="width:90px;height:50px;" /> </a>

                    <div class="collapse navbar-collapse" id="navbarsupportedcontent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">home</a>
                            </li>


                        </ul>

                        <div class="dropdown-content " style="margin-top:190px; background-color:#191111;"
                            id="myDropdown0">

                            <asp:Button ID=Button1 style="background-color:#191111; border:0px;" CssClass="nav-link"
                                runat="server" Text="Log Out" CausesValidation="False" OnClick="BtnLogOut_Click"
                                UseSubmitBehavior="False" />
                            <a class="nav-link" style="color:white;">My Profile </a>
                        </div>
                        <img src="Images/account-settings-icon.jpg" class=dropbtn onclick="myFunction(0)"
                            style="height:50px;width:50px;border-radius:10%;cursor:pointer;position:sticky;justify-content:flex-end">



                    </div>



                </div>
            </nav>



            <div id="Panel1" style="top:0;display:block;">
                <h1>Stock</h1>
                <hr />

                <div class="content" id="content" style="">

                    <div class="components1">
                        <div class="rows">

                            <div class="row1">


                                <span class="details">Item Number</span>
                                <asp:TextBox CssClass="input" ID="txtItemNum" placeholder="" required="required"
                                    runat="server" Enabled="False"></asp:TextBox>

                                <span class="details">Date</span>
                                <asp:TextBox CssClass="input" ID="txtDate" type="date" placeholder=""
                                    required="required" runat="server"></asp:TextBox>



                                <span class="details">Categorey</span>
                                <asp:DropDownList ID="DropCategory" CssClass="input" style="cursor:pointer"
                                    runat="server" Height="40px" Width="200px" AutoPostBack="True">
                                    <asp:ListItem Value="0">--select--</asp:ListItem>
                                    <asp:ListItem Value="1">Display</asp:ListItem>
                                    <asp:ListItem Value="2">Battrey</asp:ListItem>
                                    <asp:ListItem Value="2">Speaker</asp:ListItem>

                                </asp:DropDownList>



                            </div>



                        </div>
                        <div class="row2">
                            <span class="" style="margin-left:37px;">Qty</span>
                            <asp:TextBox CssClass="input" ID="txtQty" type="number" placeholder="Quantity"
                                required="required" runat="server"></asp:TextBox>


                                    <span class="details row31">Purchase Price</span>
                                    <asp:TextBox CssClass="input row31" TextMode="Number" ID="txtPurchase_Price"
                                        type="text" placeholder="" required="required" runat="server"></asp:TextBox>

                                    <span class="details row31">Unit Sale Price</span>
                                    <asp:TextBox CssClass="input row31" TextMode="Number" ID="txtUnitPrice" type="text"
                                        placeholder="" required="required" runat="server"></asp:TextBox>





                        </div>
                    </div>
                    <div>
                        <asp:Button ID="btnSubmit" style="margin-top:20px;margin-left:20px;"
                            CssClass="btn btn-outline-success col-1 " runat="server" Text="Submit"
                            OnClick="btnSubmit_Click" />
                    </div>
                    <div>
                        &nbsp;
                    </div>


                </div>
            </div>
            <div>
                <div style="margin-top:20px;">
                    <asp:Button ID="btnShowMobile" CssClass="input btn btn-primary" runat="server"
                        Text="Show Mobile List" OnClick="btnShowMobile_Click" UseSubmitBehavior="False" />
                    <asp:Button ID="btnShowAccess" runat="server" CssClass="input btn btn-primary col-6 "
                        Text="Show Service Accessories" OnClick="btnShowAccess_Click" UseSubmitBehavior="False" />
                </div>

                <asp:GridView ID="GridInventoryTable" style="width:98%; margin-top:20px;" runat="server"
                    CssClass="table table-stripped table-hover" AutoGenerateColumns="False" DataKeyNames="Item_Id"
                    DataSourceID="Mobile" BorderColor="#333333" BorderStyle="Groove">
                    <AlternatingRowStyle BackColor="Silver" />
                    <Columns>
                        <asp:BoundField DataField="Item_Id" HeaderText="Item_Id" ReadOnly="True"
                            SortExpression="Item_Id" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                        <asp:BoundField DataField="Categorey" HeaderText="Categorey" SortExpression="Categorey" />
                        <asp:BoundField DataField="Brand" HeaderText="Brand" SortExpression="Brand" />
                        <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                        <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
                        <asp:BoundField DataField="Unit_Price" HeaderText="Unit_Price" SortExpression="Unit_Price" />
                    </Columns>
                </asp:GridView>
                <asp:GridView ID="GridMobile" style="width:98%; margin-top:20px;"
                    CssClass="table table-stripped table-hover" runat="server">
                    <AlternatingRowStyle BackColor="Silver" />
                </asp:GridView>
                <asp:GridView ID="GridAccess" style="width:98%; margin-top:20px;"
                    CssClass="table table-stripped table-hover" runat="server">
                    <AlternatingRowStyle BackColor="Silver" />
                </asp:GridView>

                <asp:SqlDataSource ID="Mobile" runat="server"
                    ConnectionString="<%$ ConnectionStrings:MobileShopDBConnectionString %>"
                    SelectCommand="SELECT * FROM [Mobile_tab]"></asp:SqlDataSource>
            </div>





        </form>
    </asp:Content>