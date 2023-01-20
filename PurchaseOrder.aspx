<%@ Page Title="" Language="C#" MasterPageFile="~/DashLayout.Master" AutoEventWireup="true" CodeBehind="PurchaseOrder.aspx.cs" Inherits="MobileShop.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="Bootstrap/js/bootstrap.min.js"></script>
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
              width: 12%;
                height:30px;
                padding:12px,12px,12px;
                 height: 45px;
  outline: none;
  font-size: 16px;
  border-radius: 5px;
  padding-left: 15px;
  border: 1px solid #ccc;
  border-bottom-width: 2px;
        }



      

        /*#content {
            animation: form-load 90ms ease-in 500ms;
            animation-fill-mode: forwards;
            transform: translateY(-0px);
            opacity: 0;
            
        }

        @keyframes form-load {
            0% {
                transform: translateX(-20%);
                opacity: 0;
            }

            100% {
                transform: translateX(0%);
                opacity: 1;
            }
        }*/

  

          

        

        .content {
            background-color: white;
            justify-content: space-around;
            font-weight: 700;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.1);
            border-radius: 15px;
            width: 97%;

            margin-top:20px;
        }

       

        .components {
            background-color: blueviolet;
            display: grid;
            grid-gap: 10px;
            padding: 20px;
        }



            .components > .row1, .row2, .row3 {
                padding: 20px 0;
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
    <%--<link href="css/Purchase.css" rel="stylesheet" />--%>
    <form runat="server" style="margin-top:-110%;">
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
            
            <asp:Button ID=Button2 style="background-color:#191111; border:0px;" CssClass="nav-link" runat="server"  Text="Log Out"  CausesValidation="False" OnClick="BtnLogOut_Click" UseSubmitBehavior="False" />
            <a class="nav-link" style="color:white;">My Profile </a>
        </div>
        <img src="Images/account-settings-icon.jpg" class=dropbtn onclick="myFunction(0)" style="height:50px;width:50px;border-radius:10%;cursor:pointer;position:sticky;justify-content:flex-end">
          
        
         
        </div>

            
      
    </div>
</nav>

            <h1>Add Purchase</h1>
            <hr />

            <asp:Button runat="server" CssClass=" btn btn-group-sm btn-primary col-1" Style="margin-top: 20px;" Text="Add" ID="btnAdd" UseSubmitBehavior="False" OnClick="btnAdd_Click" />
            <asp:Button runat="server" type="button" CssClass="btn btn-group-sm btn-primary col-1" Style="margin-left: 20px; margin-top: 20px;" Text="Update" ID="btnUpdate" UseSubmitBehavior="False" OnClick="btnUpdate_Click" />
            
            <asp:Panel ID=PanelUpdate runat="server" Visible="False">
            <span>Enter pPurchase ID to search </span>
            <asp:TextBox ID="txtOrderIdUpdate" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" Enabled="True"  UseSubmitBehavior="True" OnClick="btnSearch_Click1" Visible=True />


            </asp:Panel>
        <asp:Panel runat="server" ID="Panel1" style="">
            <div class="content" id="content" style="">

                <div class="components1">
                    <div class="rows">

                        <div class="row1">
                            <span class="details">Porder no.</span>
                            <asp:TextBox CssClass="input" ID="txtOrderId" placeholder="" required="required" runat="server" Enabled="False"></asp:TextBox>
                            

                            <span class="details">Date</span>
                            <asp:TextBox CssClass="input" ID="txtDate" style="margin-left:40px;" type="date" placeholder="" required="required" runat="server"></asp:TextBox>

                            <span class="details" style="margin-left:150px;">Categorey</span>
                            <asp:DropDownList ID="DropCategory" CssClass="input" runat="server" Height="40px" Width="200px" style="cursor:pointer;" OnSelectedIndexChanged="DropCategory_SelectedIndexChanged1" AutoPostBack="True">
                                <asp:ListItem Value="0">--select--</asp:ListItem>
                                <asp:ListItem Value="1">Mobile</asp:ListItem>
                                <asp:ListItem Value="2">Accessories</asp:ListItem>

                            </asp:DropDownList>




                        </div>
                        <div class="row2">

                            <span class="details" style="margin-left:48px;">Brand</span>
                            <asp:TextBox CssClass="input" ID="txtBrand" style="margin-left:70px;"    type="text" placeholder="Brand" required="required" runat="server"></asp:TextBox>

                            <span class="details" style="margin-left:60px;">Model Number</span>
                            <asp:TextBox CssClass="input" ID="txtModelNum" style="margin-left:5px;" type="text" placeholder="" required="required" runat="server"></asp:TextBox>

                            <span class="details"  style="margin-left:120px;" >Qty</span>
                            <asp:TextBox CssClass="input" Min="1" style="margin-left:90px;" ID="txtQty" type="number" placeholder="Quantity" required="required" runat="server"></asp:TextBox>
                        </div>

                        <asp:Panel ID="row3" runat="server">
                            <div style="margin-top: -20px;">
                                <span class="details row31">Ram and Rom</span>
                                <asp:DropDownList ID="DropDownVariant" CssClass="input row31" required="required" Style="cursor:pointer;margin-left:10px" runat="server" Height="40px" Width="200px">
                                    <asp:ListItem Value="0">--select--</asp:ListItem>
                                    <asp:ListItem Value="1">Ram+rom(4+120)</asp:ListItem>
                                    <asp:ListItem Value="2">Ram+rom(6+120)</asp:ListItem>
                                    <asp:ListItem Value="2">Ram+rom(8+120)</asp:ListItem>   
                                </asp:DropDownList>

                                <span class="details row31" style="margin-left:5px">Variant qty</span>
                                <asp:TextBox CssClass="input row31" TextMode="Number" ID="txtVariQty" style="margin-left:1px" type="text" placeholder="" required="required" runat="server" Min="1"></asp:TextBox>

                                <asp:Button runat="server" CssClass="btn btn-group-sm btn-primary" style="margin-left:-10px" Text="Add" ID="btnVariantAdd" UseSubmitBehavior="False" OnClick="btnVariantAdd_Click" />


                                <span class="details" style="margin-left:100px;">Variant</span>
                                <asp:TextBox CssClass="input" TextMode="MultiLine" ID="txtVariant" style="margin-left:90px;" type="text" placeholder="" runat="server" Width="190px"></asp:TextBox>


                            </div>

                   </asp:Panel>
                     

                        <div class="row5">
                            <span class="details">Supplier Name</span>
                            <asp:DropDownList ID="DropSuplier" Style="cursor: pointer;margin-left:10px" CssClass="input" runat="server" required="required"  OnSelectedIndexChanged="DropSuplier_SelectedIndexChanged">
                                <asp:ListItem Value="0">--select--</asp:ListItem>

                            </asp:DropDownList>

                           

                           

                        </div>

                    </div>
                </div>
                <div>
                    <asp:Button ID="Button1" Style="margin-top: 20px; margin-left: 20px;" CssClass="btn btn-outline-success col-1 " runat="server" Text="Submit" OnClick="BtnSubmit_Click" />
                    
                    <asp:Button ID="BtnOrderMoreModel" Style="margin-top: 20px; margin-left: 20px;" CssClass="btn btn-primary col-2 " runat="server" Text="Add more Model" OnClick="BtnOrderMoreModel_Click"  Enabled=False />
                    <asp:Button ID="BtnFinish" Style="margin-top: 20px; margin-left: 20px;" CssClass="btn btn-success col-2 " runat="server" Text="Finish" OnClick="BtnFinish_Click"   Enabled=False />
                    <asp:Button ID="BtnClear" Style="margin-top: 20px; margin-left: 20px;" CssClass="btn btn-warning col-2 " runat="server" Text="Clear" OnClick="BtnClear_Click"/>
                    
                </div>
                <div>
                    &nbsp;
                </div>


            </div>
        </asp:Panel>

                                                                            
 


        <asp:GridView Width="100%" Style="margin-top: 40px;" CssClass="table table-bordered table-stripped table-hover" ID="GridViewOrders" runat="server" ></asp:GridView>
        <%--<asp:GridView Width="100%" Style="" CssClass="table table-bordered table-stripped table-hover" ID="GridViewUpdate" runat="server" Visible="False" ></asp:GridView>--%>
         <asp:GridView ID="GridView1" runat="server" style="width:100%;margin-top: 40px;" CssClass="table table-bordered table-stripped table-hover" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="GridView1_RowCancelingEdit"   
  
OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">  
            <Columns>  
                <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" />  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update"/>  
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel"/>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="ID">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("P_OrderID") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Phone">  
                    <ItemTemplate>  
                        <asp:Label ID="lblPhone" runat="server" Text='<%#Eval("Order_Date") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txtDate" CssClass="col-12" runat="server" Text='<%#Eval("Order_Date") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="SupName">  
                    <ItemTemplate>  
                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("Sup_Name") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txtName"  runat="server" Text='<%#Eval("Sup_Name") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

                
                <asp:TemplateField HeaderText="Address">  
                    <ItemTemplate>  
                        <asp:Label ID="lblAddress" CssClass="col-12" runat="server" Text='<%#Eval("Qty") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txtQty" runat="server" Text='<%#Eval("Qty") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

                 <asp:TemplateField HeaderText="City">  
                    <ItemTemplate>  
                        <asp:Label ID="lblCity" runat="server" Text='<%#Eval("Brand") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txtBrand" CssClass="col-12" runat="server" Text='<%#Eval("Brand") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 
                
                <asp:TemplateField HeaderText="State">  
                    <ItemTemplate>  
                        <asp:Label ID="lblState" runat="server" Text='<%#Eval("Model") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txtModel" CssClass="col-12"  runat="server" Text='<%#Eval("Model") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 
                
              
                <asp:TemplateField HeaderText="Company">  
                    <ItemTemplate>  
                        <asp:Label ID="lblCompany" runat="server" Text='<%#Eval("Variant") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txtVari" CssClass="col-12" runat="server" Text='<%#Eval("Variant") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
               
            

            </Columns>  
            <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
            <RowStyle BackColor="#e7ceb6"/>  
        </asp:GridView> 
    </form>
</asp:Content>
