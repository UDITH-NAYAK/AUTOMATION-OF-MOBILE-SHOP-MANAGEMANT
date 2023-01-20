<%@ Page Title="" Language="C#" MasterPageFile="~/DashLayout.Master" AutoEventWireup="true" CodeBehind="StockReport.aspx.cs" Inherits="MobileShop.WebForm18" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style> 
       
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <form runat="server">
    <div style="margin-top:-110%;">
        <h3>Stock Report </h3>
        <hr>
        </div>

        <div>
            <span  style="margin-left:20px;">Sart </span>
            <span style="margin-left:140px;">End </span>
            </div>
    <div class="Dates" style="margin-top:10px;  display:flex;">
        
         <asp:TextBox CssClass="input" style="margin-left:20px; cursor:pointer;" ID="txtStartDate" type="date" placeholder="" required="required" runat="server"></asp:TextBox>
         
        <asp:TextBox CssClass="input" style="margin-left:40px;cursor:pointer;" ID="txtEndDate" type="date" placeholder="" required="required" runat="server" AutoPostBack="True" OnTextChanged="txtEndDate_TextChanged" ></asp:TextBox>
        </div>


        <div style="margin-top:20px;">
             <span class="details row31" style="margin-top:20px;">Sort By</span>
                                <asp:DropDownList ID="DropSortTable" CssClass="input row31" Style="cursor: pointer; margin-top:20px;margin-bottom:20px;" runat="server" Height="40px" Width="200px"   AutoPostBack=True OnSelectedIndexChanged="DropSortTable_SelectedIndexChanged" >
                                    <asp:ListItem Value="0">--select--</asp:ListItem>
                                    <asp:ListItem Value="1">Brand</asp:ListItem>
                                    <asp:ListItem Value="2">Model</asp:ListItem>
                                    <asp:ListItem Value="3">Quantity</asp:ListItem>
                                    <asp:ListItem Value="4">Date</asp:ListItem>
                                </asp:DropDownList>

        </div>
            <asp:GridView ID=GridStock runat="server" CssClass="table table-hover " Width=96% >

            </asp:GridView>
        </form>
</asp:Content>
