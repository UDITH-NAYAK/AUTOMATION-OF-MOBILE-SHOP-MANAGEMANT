<%@ Page Title="" Language="C#" MasterPageFile="~/DashLayout.Master" AutoEventWireup="true" CodeBehind="Supplier.aspx.cs" Inherits="MobileShop.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

.row1,.row2,.row3{
     margin-top:15px;
 }

.input:focus{
  border-color: #6b9af2;
    box-shadow:rgba(255,255,255,0.8);

}

.input:hover{
    border-color: #6b9af2;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

#txtPhone,#txtName,#txtEmail,#txtAddress,#txtCity,#txtState,#txtCompany{
    width:30px;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server" >


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

      <div id="Sup" style="margin-top:-110%;" >
    <%--<asp:Panel  runat="server" >--%>
          
    <h1>Add Supplier</h1>
           <hr />
            
    
    
        <asp:Button runat="server" CssClass="btn col-1  btn-primary" Text="Add" ID="btnAdd" OnClick="btnAdd_Click" UseSubmitBehavior="False"/>
            <asp:Button runat="server" CssClass="btn col-1  btn-primary"  style="margin-left:20px;" Text="Update" ID="btnUpdate" CausesValidation="False" OnClick="btnUpdate_Click" UseSubmitBehavior="False" /> 
        <asp:Panel ID=PanelUpdate runat="server" Visible="False">
            <span>Type  only phno search:  </span>
            <asp:TextBox runat="server" placeholder="Type Phone or Name here" CssClass="input"  Style="width:25%; height:40px; border-radius:10px; margin-top:20px;border:groove"  ID="txtPhoneSearch" ></asp:TextBox>
        <asp:Button runat="server" Text="Go" ID="btnGo" OnClick="btnGo_Click" Width="102px"/>

        </asp:Panel>
   <asp:Panel ID=PanelAdd runat="server">
         <div class="content"style="background-color:white;justify-content:space-around;  ">
        <div ">
           <div class="row1">
    
           <div class="input-box"></div>
                <span class="details lable">Suplier ID</span>
                <asp:TextBox CssClass="input tb" ID="txtSupId" placeholder=""  runat="server" Enabled="False" ></asp:TextBox>
            
            <span class="details lable">Phone</span>
                <asp:TextBox CssClass="input tb" Minlength="10" ID="txtPhno" placeholder="" required="required"  runat="server"  pattern="[0-9]{10}"  MaxLength=10  title="Only 10 digit numbers"></asp:TextBox>
            
               <span class="details lable">Name</span> 
                <asp:TextBox CssClass="input tb" ID="txtSupName" type="text" placeholder="" required="required"  runat="server"  title="Only characters" pattern="[A-Za-z\s]+"></asp:TextBox>
             
        
</div>
        <div class="row2" style="margin-top:15px;margin-bottom:15px;">
            <span class="details lable">Email</span> 
                    <asp:TextBox CssClass="input tb" ID="txtEmail" type="email" placeholder="" required="required"  runat="server" ></asp:TextBox>
               <span class="details lable">Address</span> 
                <asp:TextBox CssClass="input tb" Style="margin-bottom:-10px;margin-top:0px; display:inline-flex;" ID="txtAddress" type="text" placeholder="" required="required"  runat="server" TextMode="MultiLine"></asp:TextBox>
              <span class="details lable">City</span> 
                    <asp:TextBox CssClass="input tb" ID="txtCity" type="text" placeholder="" required="required"  runat="server" ></asp:TextBox>
        </div>
             <div class="row3">
             <span class="details lable">State</span> 
                    <asp:TextBox CssClass="input tb" ID="txtState" type="text" placeholder="" required="required"  runat="server" ></asp:TextBox>
             
                <span class="details lable">Company</span> 
                    <asp:TextBox CssClass="input tb" ID="txtCompany" type="text" placeholder="" required="required"  runat="server" ></asp:TextBox>
        </div>

          
              <asp:Button runat="server" ID="btnCreate" Text ="Create" CssClass="btn btn-primary col-1" Style="margin-top:20px;" OnClick="btnCreate_Click"/>
         
           
</div>



        </div>
       </asp:Panel>

</div>      
        <asp:GridView ID="GridView2" CssClass="table  table-bordered table-hover" Style="margin-top:70px;" runat="server" AutoGenerateColumns="False" DataKeyNames="Phone" DataSourceID="AllSuppliers" AllowSorting="False">
<AlternatingRowStyle BackColor="#c0c0c0"/>
            <Columns>
                <asp:BoundField DataField="Sup_id" HeaderText="Supplier Id" ReadOnly="True" SortExpression="Sup_Id" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" ReadOnly="True" SortExpression="Phone" />
                <asp:BoundField DataField="SupName" HeaderText="SupName" SortExpression="SupName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" />
         
           <%--      <asp:TemplateField>
                    <ItemTemplate>
                         <asp:DropDownList  ID="DropColors" CssClass="input" runat="server" Height="40px" Width="200px">
                      <asp:ListItem  Value="0">Blue</asp:ListItem>
                      <asp:ListItem Value="2">Rainbow</asp:ListItem>

                       
                 </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>--%> 
            </Columns>
            <HeaderStyle BackColor="#666666" />
        </asp:GridView>


       <asp:GridView ID="GridView1" runat="server" style="width:100%;" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="GridView1_RowCancelingEdit"   
  
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
                        <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("Sup_Id") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Phone">  
                    <ItemTemplate>  
                        <asp:Label ID="lblPhone"  runat="server" Text='<%#Eval("Phone") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox  ID="txtPhone" MaxLength="10" type="tel" CssClass="col-12" runat="server" Text='<%#Eval("Phone") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="SupName">  
                    <ItemTemplate>  
                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("SupName") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txtName"  runat="server" Text='<%#Eval("SupName") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

                        <asp:TemplateField HeaderText="Email">  
                    <ItemTemplate>  
                        <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txtEmail" CssClass="col-12"  runat="server" Text='<%#Eval("Email") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                
                <asp:TemplateField HeaderText="Address">  
                    <ItemTemplate>  
                        <asp:Label ID="lblAddress" CssClass="col-12" runat="server" Text='<%#Eval("Address") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txtAddress" runat="server" Text='<%#Eval("Address") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

                 <asp:TemplateField HeaderText="City">  
                    <ItemTemplate>  
                        <asp:Label ID="lblCity" runat="server" Text='<%#Eval("City") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txtCity" CssClass="col-12" runat="server" Text='<%#Eval("City") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 
                
                <asp:TemplateField HeaderText="State">  
                    <ItemTemplate>  
                        <asp:Label ID="lblState" runat="server" Text='<%#Eval("State") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txtState" CssClass="col-12"  runat="server" Text='<%#Eval("State") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 
                
              
                <asp:TemplateField HeaderText="Company">  
                    <ItemTemplate>  
                        <asp:Label ID="lblCompany" runat="server" Text='<%#Eval("Company") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txtCompany" CssClass="col-12" runat="server" Text='<%#Eval("Company") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
               
            

            </Columns>  
            <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
            <RowStyle BackColor="#e7ceb6"/>  
        </asp:GridView>  



        <asp:SqlDataSource ID="AllSuppliers" runat="server" ConnectionString="<%$ ConnectionStrings:MobileShopDBConnectionString %>" SelectCommand="SELECT * FROM [Suppliers_tab]"></asp:SqlDataSource>

        </form>
    </asp:Content>
