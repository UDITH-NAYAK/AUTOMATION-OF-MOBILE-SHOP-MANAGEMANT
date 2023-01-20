<%@ Page Title="" Language="C#" MasterPageFile="~/DashLayout.Master" AutoEventWireup="true" CodeBehind="Service.aspx.cs" Inherits="MobileShop.WebForm19" EnableEventValidation="false" %>
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
    margin-left: 10px;
    width:200px;
    position:sticky;

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


 


 

.content {
    background-color:#7c9ce8;
    
    justify-content: space-around;
    font-weight: 700;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    border-radius: 10px;
    width: 99%;
    margin-top:20px;
}

 
 
.content{
   display:flex;
        flex-direction:row;


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
    <h1> Service</h1>
    <hr />
    
        <asp:Button runat="server" CssClass=" btn btn-group-sm btn-primary col-2" style="margin-top:20px;" Text="Existing Customer" ID="btnAdd" UseSubmitBehavior="False" OnClick="btnAdd_Click"/>
            <asp:Button runat="server" type="button" CssClass="btn btn-group-sm btn-primary col-1"   style="margin-left:20px;margin-top:20px;" Text="NEW" ID="btnNewCust"  UseSubmitBehavior="False" OnClick="btnNewCust_Click" /> 
            <div class="content" id="content" style="">
            <%--<br> <input type="checkbox"/>--%>
               
                <asp:Panel ID=PanelExisting runat="server">
               <fieldset class="div1" style="border:solid #9b59b6 2px; width:100%; margin-left:10px;border-right:10px;">
                   <legend>Details</legend>
                 
               
                   <br>
                 

                     <span class="details">enter invoice no.</span>
                <asp:textbox cssclass="input" id="txtinvoice" style="margin-left:10px;" placeholder="" required="required"  runat="server" OnTextChanged="txtinvoice_TextChanged" autopostback=true ></asp:textbox>    
                 <%--<asp:button runat="server" type="button"    style="margin-left:20px;margin-top:20px;" text="search" id="btnsearch"  usesubmitbehavior="True" onclick="btnSearch_Click" causesvalidation="False" />--%> <br>
          <hr>

                    <span class="details">select item </span>
                   <asp:dropdownlist cssclass="input"   id="DropitemName" runat="server" required="required" onselectedindexchanged="DropitemName_SelectedIndexChanged"  >
                       <asp:listitem> --select--</asp:listitem>

                   </asp:dropdownlist>
                   <br>
 
                   
                   <asp:label id=lblimei runat="server" cssclass="details" text="imei no.">
                       </asp:label>
                   <asp:dropdownlist id=DropIMEI runat="server" cssclass="input"  required="required"   onselectedindexchanged="DropIMEI_SelectedIndexChanged" autopostback=true>

                   </asp:dropdownlist>
                   <br>

                    <span class="details">component</span>
         <asp:dropdownlist id="DropExistComp" cssclass="input" runat="server" required="required" height="40px" width="200px" style="cursor:pointer;" >
                                <asp:listitem value="0">--select--</asp:listitem>
                                <asp:listitem value="1">display</asp:listitem>
                                <asp:listitem value="2">battrey</asp:listitem>
                                <asp:listitem value="2">speaker</asp:listitem>

                            </asp:dropdownlist>
               <br>
                    <span class="details">warrenty end date</span>
                       <asp:textbox cssclass="input" id="txtWarEXP"  placeholder="" runat="server" ></asp:textbox>    
                
                   <br>
                    <span class="details">date.</span>
                <asp:textbox cssclass="input" id="txtreqdate" placeholder="" required="required"   runat="server" textmode=date></asp:textbox>    
               <br>
                    <span class="details">return date.</span>
                <asp:textbox cssclass="input" id="txtreturndate" placeholder="" required="required"  runat="server" textmode=date></asp:textbox>    
               
                   <br> 
                   <span class="details">Service Dis.</span>
                <asp:TextBox CssClass="input" ID="txtExistDiscription" placeholder="Type here" required="required" runat="server" TextMode=MultiLine></asp:TextBox>  
               
                   </fieldset>
                <asp:Button ID=btnExistingSubmit CssClass="btn btn-success btn-outline-dark col-2 " style="margin-top:20px;" runat="server" Text="Submit" OnClick="btnExistingSubmit_Click" />
                    </asp:Panel>
               
                

               <%-- New Customer --%>

                <asp:Panel ID=PanelNewCustService runat="server" Visible="False">
                      <fieldset class="div1" style="border:solid #9b59b6 2px; width:100%; margin-left:20px;">
                   <legend>Details</legend>
                            <span class="details">Brand name</span>
                <asp:TextBox CssClass="input" ID="txtBrand" placeholder="eg.vivo,oppo,etc"  runat="server" ></asp:TextBox>    
                          
                           <span class="details">Model name</span>
                <asp:TextBox CssClass="input" ID="txtModel" placeholder="enter model number here" runat="server" ></asp:TextBox>    
              <br>

                           <span class="details">IMEI No.</span>
                <asp:TextBox CssClass="input" ID="txtIMEI" placeholder="Enter IMEI" MaxLength="15" Min="15" title="Enter Proper IMEI Number" required="required" runat="server" ></asp:TextBox>  
                          <br>

                             <span class="details">Service Dis.</span>
                <asp:TextBox CssClass="input" ID="txtDis" placeholder="Type here" runat="server" TextMode=MultiLine></asp:TextBox>  
                          <br>

 <span class="details">Component</span>
         <asp:DropDownList ID="DropCategory" CssClass="input" runat="server" Height="40px" Width="200px" style="cursor:pointer;" >
                                <asp:ListItem Value="0">--select--</asp:ListItem>
                                <asp:ListItem Value="1">Display</asp:ListItem>
                                <asp:ListItem Value="2">Battrey</asp:ListItem>
                                <asp:ListItem Value="2">Speaker</asp:ListItem>

                            </asp:DropDownList>
<div>
                          

    </div>

                          </fieldset>
               <asp:Button ID=btnNewServiceSubmit CssClass="btn btn-success  col-2 " style="margin-top:20px;" runat="server" Text="Submit" OnClick="btnNewServiceSubmit_Click" />
               <asp:Button ID=btnClear CssClass="btn btn-warning btn-outline-danger col-2 " style="margin-top:20px;" runat="server" Text="Clear" OnClick="btnClear_Click"  />

                </asp:Panel>


            <div>
                &nbsp;
            </div>

                <%-- Coustomer info div --%>
                       <div class="c" >
               <fieldset class="div2" style="border:solid #9b59b6 3px; width:98%; margin-left:20px;">
                   <legend>Customer Details</legend>
             <div class="left" >
                 <span class="details">Name</span> 
                <asp:TextBox CssClass="input" ID="txtCustname" placeholder="" required="required" title="Only characters" pattern="[A-Za-z]+"   runat="server" Visible="False" ></asp:TextBox>    <br>
                <asp:TextBox CssClass="input" ID="txtCustname2" placeholder=""       runat="server" ></asp:TextBox>    <br>
          
                  <span class="details">Contact Phno.</span>
                <asp:TextBox CssClass="input" ID="txtphno" Visible="False" placeholder="" title="Only 10 digit numbers" required="required" Min="0" pattern="[0-9]{10}" runat="server" MaxLength=10></asp:TextBox>    <br>
                <asp:TextBox CssClass="input" ID="txtphno2" placeholder="" runat="server" MaxLength=10></asp:TextBox>    <br>
                 
                 <span class="details">Address</span>
                <asp:TextBox CssClass="input" ID="txtAddress" Visible="False" placeholder="" required="required"  title="Only characters"    runat="server" ></asp:TextBox>    
               <br> <asp:TextBox CssClass="input" ID="txtAddress2" placeholder=""   runat="server" ></asp:TextBox>    
                
                 </div>
                   </fieldset>
                &nbsp
           </div>
           </div>
    </div>
        
        
        

        <asp:GridView ID=GridSerive Width="100%" Style="margin-top: 40px;" runat="server" >
          
        </asp:GridView>

        </form>















</asp:Content>
