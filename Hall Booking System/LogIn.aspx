<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        body {
            position: relative;
            height: 100vh;
            margin: 0;
        }
        #top-left {
            position: absolute;
            top: 0px;
            left: 90px;
            width: 150px;
        }

        #bottom-left {
            position: absolute;
            bottom: 200px;
            left: 100px;
            width: 200px;
        }

        #top-right {
            position: absolute;
            top: 10px;
            right: 30px;
            width: 250px;
        }
        .container {
            width: 400px;
            margin: 0 auto;
            margin-top: 100px;
            background-color: rgba(0, 0, 0, 0.2);
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #0099CC;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border-radius: 3px;
            border: 1px solid #CCCCCC;
        }

        .btn-primary {
            background-color: #0099CC;
            color: #FFFFFF;
            border: none;
            padding: 8px 16px;
            font-size: 14px;
            border-radius: 3px;
            cursor: pointer;
        }

        .btn-primary:hover {
            background-color: #007399;
        }

        .text-danger {
            color: #FF0000;
            font-weight: bold;
        }

        .text-center {
            text-align: center;
        }

        .text-muted {
            color: #999999;
        }

        .text-muted a {
            color: #0099CC;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div id="image-container">
    <img id="top-left" src="TATA Logo 1.png"/>
    <img id="bottom-left" src="Reimagine Logo (1).png"/>
    <img id="top-right" src="TSF _ Blue PNG logo.png"/>
    </div>
    <form id="formLogin" runat="server">
        <div class="container">
            <h2>Login</h2>
            <div class="form-group">
                <label for="txtUsername">Username:</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            <div class="form-group">
                <label for="txtPassword">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
            <div class="text-center text-muted">
                Don't have an account? <a href="SignUp.aspx">Sign Up</a>
            </div>
        </div>
    </form>
</body>
</html>
