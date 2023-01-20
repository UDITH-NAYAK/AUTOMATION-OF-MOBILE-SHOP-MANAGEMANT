<%@ Page Title="" Language="C#" MasterPageFile="~/DashLayout.Master" AutoEventWireup="true" CodeBehind="PurchaseBill.aspx.cs" Inherits="MobileShop.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
   

      .button1 {
    border-style: none;
    border-color: inherit;
    border-width: medium;
    min-height:5px;
    background-color: cornflowerblue;
    border-radius: 25px;
    color: #fff;
    font-size: 18px;
    letter-spacing: 1px;
    cursor: pointer;
}

 .details {
    margin-top: 20px;
    margin-left: 55px;
    margin-right: 10px;
}

.input {
    margin-top: 20px;
    margin-left: 40px;
    margin-right: 15px;
    width:200px;
    outline: none;
  font-size: 16px;
  border-radius: 5px;
  padding-left: 15px;
  border: 1px solid #ccc;
  border-bottom-width: 2px;
  height:40px;

    
}


.input:focus{
  border-color: #6b9af2;
    box-shadow:rgba(255,255,255,0.8);

}

.input:hover{
    border-color: #6b9af2;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}
 


 

.content {
    background-color: white;
    justify-content: space-around;
    font-weight: 700;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    border-radius: 10px;
    width: 97%;
    margin-top:20px;
    /*margin-top:60px;*/
}

 
.components{
    display:grid;
    grid-gap:10px;

}

 

    .components > .row1,.row2,.row3,.row4 {
        padding: 0px 30px,0px,10px;
        margin-top:20px;
        justify-content:space-around;
    }                                   
    




  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <form runat="server" style="margin-top:-110%">
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





    <div id="Panel1" style="">
    <h1> Purchase Bill</h1>
    <hr />
    
        <asp:Button runat="server" CssClass=" btn btn-group-sm btn-primary col-1" style="margin-top:20px;" Text="Add" ID="btnAdd" UseSubmitBehavior="False"/>
            <asp:Button runat="server" type="button" CssClass="btn btn-group-sm btn-primary col-1"   style="margin-left:20px;margin-top:20px;" Text="Update" ID="btnUpdate"  UseSubmitBehavior="False" /> 
            <div class="content" id="content" style="">
         
           <div class="components">
               <div class="row1">
            <span class="details">Bill no</span>
                <asp:TextBox CssClass="input" ID="txtBill_No" placeholder="" required="required"  runat="server" Enabled="False"></asp:TextBox>    
               <%--<asp:Button ID="btnNewId" runat="server" Text="New" Enabled="True" UseSubmitBehavior="False" OnClick="btnNewId_Click" />--%>
           
            <span class="details">Bill Date</span> 
                <asp:TextBox CssClass="input" ID="txtDate" type="date" placeholder="" required="required"  runat="server"></asp:TextBox>


                     <span class="details">Categorey</span> 
                     <asp:DropDownList  ID="DropCatType" CssClass="input" style="cursor:pointer" required="required" runat="server" Height="40px" Width="200px"  AutoPostBack="True">
                   <asp:ListItem  Value="0">--select--</asp:ListItem>  
                   <asp:ListItem  Value="1">Mobile</asp:ListItem>
                      <asp:ListItem Value="2">Accessories</asp:ListItem>
                       
                 </asp:DropDownList>

           

                   <div class="row2">
            <span class="details">Brand</span>

                     <asp:DropDownList  ID="DropCategory" style="cursor:pointer;" CssClass="input" runat="server" Height="40px" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="DropCategory_SelectedIndexChanged" >
                   <asp:ListItem  Value="0">--select--</asp:ListItem>  
                    
                       
                 </asp:DropDownList>
                       
                    
                      <span class="details">Suplier Name</span>
                         <asp:TextBox CssClass="input" ID="txtSuppName" type="text" placeholder="" required="required"  runat="server"></asp:TextBox>
   

                     <span class="details" >Qty</span> 
                <asp:TextBox CssClass="input" Min=0 ID="txtqty" type="number" placeholder="" required="required"  runat="server"></asp:TextBox>


</div>

                   <div class="row3">
                     <span class="details">Discount</span> 
                <asp:TextBox CssClass="input" Min=0 ID="txtDis" type="number" placeholder="" required="required"  runat="server"></asp:TextBox>
                   
                       
                       <span class="details">Tax %</span> 
                <asp:TextBox CssClass="input" ID="txtTax" type="number" placeholder="" required="required"  runat="server"></asp:TextBox>

                     <span class="details">Total</span> 
                <asp:TextBox CssClass="input" ID="txtTotal" type="number" placeholder="" required="required"  runat="server"></asp:TextBox>

                       </div>

                   <div class="row4">
                    <span class="details"> Paid</span> 
                <asp:TextBox CssClass="input" Min=0 ID="txtPaid" type="number" placeholder="" required="required"  runat="server"></asp:TextBox>
                      

                       </div>
         </div>             
                
           </div>
            <div>
                &nbsp;
            </div>
    </div>
        
        
        

        </div>

          <asp:GridView width="100%" Style="margin-top:40px;" CssClass="table table-bordered table-stripped table-hover"   ID="GridOrdered" runat="server" OnSelectedIndexChanged="GridOrdered_SelectedIndexChanged" >
              <Columns>
                  <asp:TemplateField HeaderText="Status">
                      <ItemTemplate>
                          <asp:CheckBox ID="checkStat" runat="server" Text="Arrived" style="cursor:pointer;"/>
                      </ItemTemplate>
                  </asp:TemplateField>
              </Columns>
              <Columns>
                  <asp:TemplateField  HeaderText="Purchase amt">
                      <ItemTemplate>
                          <asp:TextBox ID=txtPurchaseAmt runat="server" Placeholder="0.00" Width=80px></asp:TextBox>
                      </ItemTemplate>
                  </asp:TemplateField>
              </Columns>
              <Columns>
                  <asp:TemplateField HeaderText="Retail amt">
                      <ItemTemplate>
                          <asp:TextBox ID=txtSellAmt runat="server" Placeholder="0.00" Width=80px></asp:TextBox>
                      </ItemTemplate>
                  </asp:TemplateField>
              </Columns>

               <Columns>
                  <asp:TemplateField HeaderText="Arrived qty">
                      <ItemTemplate>
                          <asp:TextBox ID=txtArrivedQty runat="server"  Placeholder="0" Width=80px></asp:TextBox>
                      </ItemTemplate>
                  </asp:TemplateField>
              </Columns>
          </asp:GridView>
          <asp:Button ID="btnGetSelected" runat="server" Text="Save" OnClick="GetSelectedRecords" CausesValidation=False UseSubmitBehavior=False />
            <div>
                <asp:Button ID="btnSubmit" style="margin-top:20px;margin-left:20px;"  CssClass="btn btn-success  col-1 " runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </div>
    
    </form>
</asp:Content>


 