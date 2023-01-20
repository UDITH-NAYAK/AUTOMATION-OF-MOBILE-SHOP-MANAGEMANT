    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="MobileShop.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     <link href="fontawsome/css/all.css" rel="stylesheet" />

 
<style>
 
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins',sans-serif;
}

    body {

        margin-top:90px;
        /*height: 100vh;*/
        display: flex;
        justify-content: center;
        /*align-items: center;*/
        padding: 10px;
        background-image: url("../Images/black_lined.jpg");
       background-size:cover;
       background-repeat:no-repeat;
        /*background: linear-gradient(135deg, #71b7e6, #9b59b6);*/
    }
.container{
  max-width: 900px;
  width:500px;
  height:500px;
  background-color: #fff;
  padding: 25px 30px;
  border-radius: 5px;
  box-shadow: black;
  flex-direction:column;
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
  width: 100%;
  outline: none;
  font-size: 16px;
  border-radius: 5px;
  padding-left: 15px;
  border: 1px solid #ccc;
  border-bottom-width: 2px;
}
.user-details .input-box input:focus
/*.user-details .input-box input:valid*/
{
  border-color: #9b59b6;
}
  
 form .button{
   height: 45px;
   margin: 35px 0
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
 form .button input:hover{
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
  nav{
      background-color:rgba(100,100,100,0.1);
      position:absolute;
      top:0px;
      height:60px;
      left:0px;
  }

   .container{
            animation:form-load 300ms ease-in 500ms;
             animation-fill-mode:forwards;
             transform:translateY(-0px);
                opacity:0;

        }
        @keyframes form-load{
            0%{
                transform:translateX(-80%);
                opacity:0;

            }
            100%{
                 transform:translateY(0%);

                opacity:1;

                
               
            }
        }

       

</style>
    
   
    </head>
<body>
    <script type="text/javascript">
        let pass = document.getElementById("txtpass").Text;
        let cpass = document.getElementById("txtlname").text;
        document.getElementById("btnRegister").addEventListener("click", ()=>{
            if (pass != cpass) {
                cpass.textContent = pass.textContent;
                
                alert("password does not match");
            }
            
        });

         let eyeClick = function (e)
         {
             let tgPass = document.getElementById('togglePass');
             const password = document.getElementById("password");
             console.log(password);
             if (password.getAttribute('type') === 'password') {
                 password.setAttribute('type', 'text')
                 tgPass.setAttribute('class', 'fas fa-eye-slash')
             } else {
                 password.setAttribute('type', 'password');
                 //tgPass.removeAttribute('class');
                 tgPass.setAttribute('class', 'fas fa-eye ');

             }
         };

    </script>
    <nav style="align-content:center;">
        <img src="Images/logo.jpg" style="width:90px; height:80px;border-radius:25px;margin-left:3px;" />
       

    </nav>
     
    <div id="bg-image">
  <div class="container">
    <div class="title">Registration</div> 
    <div class="content">
      <form id="form1" action="#" runat="server" defaultfocus="txtfname">
        <div class="user-details">
          
            <div class="input-box">
            <span class="details">User name</span>

              <asp:TextBox AutoCompleteType="Disabled" CssClass="input" ID="txtfname" placeholder="Enter your username" required="required"  runat="server"></asp:TextBox>
             </div>
       
         
          <div class="input-box">
            <span class="details">Phone Number</span>
           <asp:TextBox AutoCompleteType="Disabled" CssClass="input" ID="txtphno" minlength="10" placeholder="Enter your number" required="required" runat="server" MaxLength="10"></asp:TextBox>   
          </div>
          <div class="input-box">
            <span class="details">Password</span>
               <asp:TextBox CssClass="input"   title="Should contain A-Z a-z 0-9 length should be atleast 8 chars" minlength="8" ID="txtpass" placeholder="Enter your password" required="required" runat="server" TextMode="Password" ValidationGroup="[A-Z a-z 0-9]{8}"></asp:TextBox>   
          </div>
          <div class="input-box">
            <span class="details">Confirm Password</span>
               <asp:TextBox CssClass="input" ID="txtCPass" placeholder="Enter your confirm password" required="required" runat="server" TextMode="Password">
               </asp:TextBox>   
              
                    
             
              <%--<input type="password" placeholder="Confirm your password" id="txtCPass" />--%>
          </div>
              <div class="input-box">
            <span class="details">Security question</span>
                  <asp:DropDownList  ID="DropDownList1" runat="server" Height="40px" Width="200px">
                      <asp:ListItem  Value="0">None</asp:ListItem>
                      <asp:ListItem Value="2">Your birth date</asp:ListItem>
                       <asp:ListItem Value="3">Primary school name</asp:ListItem>
                      <asp:ListItem Value="3">favorite</asp:ListItem>


                  </asp:DropDownList>

                   
          </div>

            <div class="input-box" >
            <span class="details">Answer</span>
                  <asp:TextBox CssClass="input" AutoCompleteType="Disabled"  ID="txtAns" placeholder="Your answer" required="required" runat="server"></asp:TextBox>   
          
          </div>

        </div>
         
        <div class="button" id="BtnSubmit">
            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
        </div>
          <a href="welcomePage.aspx" style="text-decoration:none;">Back to LogIn?</a>
      </form>
    </div>
  </div>
    </div>

</body>
</html>


