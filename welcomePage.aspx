<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="welcomePage.aspx.cs" Inherits="MobileShop.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link href="fontawsome/css/all.css" rel="stylesheet" />
    <style media="screen">
        body {
            background-image: url(" ../Images/back_image.jpg");
            background-size: cover;
            height: 100%;
            background-repeat: no-repeat;
        }

        .background {
        }

        #form1 {
            animation: form-load 300ms ease-in 500ms;
            animation-fill-mode: forwards;
            transform: translateY(-0px);
            opacity: 0;
        }

        @keyframes form-load {
            0% {
                transform: translateY(-20%);
                opacity: 0;
            }

            100% {
                transform: translateY(0%);
                opacity: 1;
            }
        }

     
        .left{
             animation: form-load 300ms ease-in 500ms;
            animation-fill-mode: forwards;
            transform: translateX(-0px);
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
        }
         


        form {
            height: 517px;
            width: 400px;
            background-color: rgba(255,255,255,0.9);
            position: center;
            /*transform: translate(-50%,-50%);*/
            top: 50%;
            left: 30%;
            right: 70%;
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
            border-left-color: #aa07e0;
            /*backdrop-filter: blur(10px);*/
            border: 2px solid rgba(255,255,255,0);
            /*box-shadow: 0 0 40px rgba(8,7,16,0.6);*/
            padding: 50px 35px;
            margin-left:5px;
        }

            form * {
                font-family: 'Poppins',sans-serif;
                letter-spacing: 0.5px;
                outline: none;
                border: none;
            }

            form h3 {
                font-size: 32px;
                font-weight: 500;
                line-height: 42px;
                text-align: center;
            }

        label {
            display: block;
            margin-top: 30px;
            font-size: 16px;
            font-weight: 500;
            color: black;
        }

        input {
            display: block;
            border: solid #509eeb;
            height: 50px;
            width: 100%;
            background-color: rgba(255,255,255,1);
            border-radius: 3px;
            padding: 0 10px;
            margin-top: 8px;
            font-size: 14px;
            font-weight: 300;
        }

            input:focus::-webkit-input-placeholder {
            }

  
        #btnLogin {
            margin-top: 30px;
            width: 100%;
            background-color: cornflowerblue;
            color: #080710;
            padding: 15px 0;
            font-size: 18px;
            font-weight: 600;
            border-radius: 5px;
            cursor: pointer;
        }

            #btnLogin:hover {
                background-color: #ffffff;
            }

        input:focus {
            border: solid #509eeb;
        }

        .reglink {
            color: dodgerblue
        }

        #username, #password {
            color: black;
        }
    </style>

    <script>
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
     
    
</head>
<body style="justify-content: center; font-weight: 700;">
   
         
        

    <nav style="background-color: rgba(100,100,100,0.1); height: 70px; width: auto;">
        <img src="Images/logo.jpg" style="width: 70px; height: 60px; border-radius: 25px;" />

    </nav>

    <div class="Box" style="justify-content: center; width: 100%;">

        <div class="left" style="width: 50%; right: 0;">
            <img id="leftImage" src="Images/19199574.jpg" style="height: 620px; width: 450px; margin-left: 155px; margin-top: -20px; opacity: 0.9; border-top-left-radius: 10%; border-bottom-left-radius: 10%;" />
        </div>

        <div class="right" style="width: 70%; margin-top: -620px;padding-left:15px;">
            <form id="form1" runat="server" style="float: right;" defaultfocus="username">
                <div style="justify-content: center; display: flex;">

                    <img src="Images/profile.jpg" style="width: 90px; border-radius: 55px;" /><asp:Label runat="server" ID="errmsg"></asp:Label>

                </div>

                <label for="username">Admin name</label>
                <asp:TextBox ID="username" AutoCompleteType="Disabled" type="text" placeholder="Admin name" runat="server"></asp:TextBox>

                <label for="password">Password</label>
                <asp:TextBox ID="password" runat="server" type="password" placeholder="Password"> </asp:TextBox>

                <i class="fas fa-eye " id="togglePass" onclick="eyeClick()" style="cursor: pointer; margin-left: 94%; margin-top: -30px; margin-bottom: 30px; display: flex;"></i>





                <a href="ForgotPage.aspx">
                    <h5>Forgot Password</h5>
                </a>
                <asp:Button runat="server" ID="btnLogin" Text="Log In" OnClick="btnLogin_Click" />


                <p>Don't have an Account? <a href="Registration.aspx"><span class="reglink" id="reglink">Register</span></a></p>

            </form>
        </div>

    </div>
</body>

</html>
