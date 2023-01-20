<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPage.aspx.cs" Inherits="MobileShop.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>

        *{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins',sans-serif;
}
        /*.container{
  max-width: 900px;
  width:500px;
  height:500px;
  background-color: #fff;
  padding: 25px 30px;
  border-radius: 5px;
  box-shadow: black;
  flex-direction:column;

}*/

        .user-details .input-box input:focus
/*.user-details .input-box input:valid*/
{
  border-color: #9b59b6;
}
  
 form .button{
   height: 45px;
   margin: 35px;
 }
 form .button input{
   height: 100%;
   width: 50%;
   border-radius: 25px;
   border: none;
   color: #fff;
   font-size: 18px;
    
   letter-spacing: 1px;
   cursor: pointer;
   
   background: linear-gradient(135deg, #71b7e6, #9b59b6);
 }

 @media(max-width: 500px){
 
form .user-details .input-box{
    margin-bottom: 15px;
    width: 100%;
  }

  form .category{
    width: 100%;
  }
   
   
  }
  @media(max-width: 459px){
  .container .content .category{
    flex-direction: column;
  }
}
    </style>

    <style>
 
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins',sans-serif;
}

    body {

        margin-top:90px;
        
        display: flex;
        justify-content: center;
        /*align-items: center;*/
        padding: 10px;
       background-size:cover;
        background-image: url("../Images/back_image.jpg");

       background-repeat:no-repeat;
        /*background: linear-gradient(135deg, #71b7e6, #9b59b6);*/
    }
.container{
  max-width: 900px;
  width:500px;
  height:600px;
  background-color: #fff;
  padding: 25px 30px;
  border-radius: 15px;
  box-shadow: black;
  flex-direction:column;
         background-color: rgba(255,255,255,0.65);
}
.container .title{
  font-size: 25px;
  font-weight: 500;
  position: relative;
}
.container .title::before{
  content: "";
  position: absolute;
  top:24px;
  left: 0;
  bottom: 0;
  height: 3px;
  width: 90px;
  border-radius: 5px;
  background: linear-gradient(135deg, #71b7e6, #9b59b6);
  margin-top:5px;
}
.content form .user-details{
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin: 20px 0 12px 0;
  flex-direction: column;
}
form .user-details .input-box{
  margin-bottom: 15px;
  
   
}
form .input-box span.details{
  display: block;
  font-weight: 500;
  margin-bottom: 5px;
}
.user-details .input-box .input{
  height: 45px;
  width: 75%;
  outline: none;
  font-size: 16px;
  border-radius: 5px;
  padding-left: 15px;
  border: 3px solid #ccc;
  border-bottom-width: 2px;
}
.user-details .input-box input:focus
/*.user-details .input-box input:valid*/
{
  border-color: #9b59b6;
}
  
 form .button{
   height: 45px;
   margin: 35px;
 }
 .Submit{
   height: 50px;
   width: 100%;
   border-radius: 25px;
   border: none;
   color: #fff;
   font-size: 18px;
    margin-top:10px;
   letter-spacing: 1px;
   cursor: pointer;
   
   background: linear-gradient(135deg, #71b7e6, #9b59b6);
 }
  .Submit:hover{
  /* transform: scale(0.99); */
  background: linear-gradient(-135deg, #71b7e6, #9b59b6);
  }

 
 @media(max-width: 500px){
 
form .user-details .input-box{
    margin-bottom: 15px;
    width: 100%;
  }

  form .category{
    width: 100%;
  }
   
   
  }
  @media(max-width: 459px){
  .container .content .category{
    flex-direction: column;
  }
}
 
  .errorLabel::before{   
  content: "User name not found";

  display:block;
  position:relative;
  top:1px;
  left: 0;
  bottom: 0;
  height: 3px;
  width: 100%;
  border-radius: 5px;
  margin-top:5px;
  color:rgb(198, 19, 19);
  }
                   
 

</style>

    
</head>
<body>

        <div class="container">
            <div class="content">
    <form id="form1" runat="server" autocomplete="off">
        <div class="user-details">
              
            <div class="input-box">
                <span class="details">User name</span><asp:Label runat="server" ID="errormsg"></asp:Label>
                <asp:TextBox CssClass="input errorLabel" ID="txtUserName"  placeholder="Enter your user name" required="required" runat="server"></asp:TextBox>   
                
                    <asp:Label ID="lblErrUserName" runat="server"  CssClass="errorLabel" Visible="False"></asp:Label></div>
             

               <div class="input-box">
            <span class="details">Security question</span>
                  <asp:DropDownList   CssClass="input" ID="DropDownList1" runat="server" Height="40px" Width="200px">
                      <asp:ListItem  Value="0">None</asp:ListItem>
                      <asp:ListItem Value="2">Your birth date</asp:ListItem>
                       <asp:ListItem Value="3">Primary school name</asp:ListItem>
                      <asp:ListItem Value="3">favorite</asp:ListItem>

                  </asp:DropDownList>
</div>

                    <div class="input-box" >
            <span class="details">Answer</span>
                  <asp:TextBox CssClass="input"  ID="txtAns" placeholder="Your answer" required="required" runat="server" OnTextChanged="txtAns_TextChanged"></asp:TextBox>   
          
                    </div>

            <asp:Panel ID="PanelNewPass" runat="server" class="input-box" Visible="False">


                     
            <span class="details">New password</span>
                  <asp:TextBox CssClass="input"  ID="txtnewPass" placeholder="New password" required="required" runat="server" ValidationGroup="[A-Z a-z 0-9]"></asp:TextBox>   
          
                    
             <div class="input-box" >
            <span class="details">Confirm password</span>
                  <asp:TextBox CssClass="input"  ID="txtCpass" placeholder="Confirm password" required="required" runat="server" ValidationGroup="[A-Z a-z 0-9]" OnTextChanged="txtCpass_TextChanged"></asp:TextBox>   
                              </div>
            </asp:Panel>



                  
                       <asp:Button ID="btnSubmit" class="Submit" runat="server" Text="Submit" OnClick="btnSubmit_Click" Visible="False" />
                       <asp:Button ID="btnAnwerSub" class="Submit" runat="server" Text="Submit answer" OnClick="btnAnswerSub_Click" />
            <div>
                <p style="margin-top:9px;"><a href="welcomePage.aspx"> Back to Singin Page? Click here</a></p>
            </div>
                  


                   
          
            </div>
    </form>
                
            </div>


        </div>
</body>
</html>
