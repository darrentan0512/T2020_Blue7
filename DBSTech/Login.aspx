<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DBSTech.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="login/login.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->

                <!-- Icon -->
                <div class="fadeIn first">
                    <img src="https://www.dbs.com.sg/iwov-resources/flp/images/dbs_logo.svg" id="icon" alt="User Icon" />
                </div>

                <!-- Login Form -->
                <input type="text" runat="server" id="txt_login" class="fadeIn second" name="login" placeholder="login">
                <input type="password" id="password" class="fadeIn third" name="login" placeholder="password">
                <asp:Button ID="btn_Login" runat="server" Text="Log In" class="fadeIn fourth" OnClick="Button1_Click"/>
                <!-- Remind Passowrd -->
                <div id="formFooter">
                    <a class="underlineHover" href="#">Forgot Password?</a>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
