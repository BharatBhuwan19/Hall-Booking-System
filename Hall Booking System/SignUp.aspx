<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="SignUp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <style>
        body {
            background-color: #f2f7ff;
            font-family: Arial, sans-serif;
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
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #337ab7;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        .form-control {
            width: 100%;
            height: 30px;
            padding: 5px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .btn-signup {
            width: 100%;
            height: 40px;
            background-color: #337ab7;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-signup:hover {
            background-color: #23527c;
        }

        .login-link {
            color: #337ab7;
            text-decoration: none;
        }

        .login-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <img id="top-left" src="30038-tata-logo.png"/>
    <img id="bottom-left" src="Reimagine Logo (1).png"/>
    <img id="top-right" src="TSF _ Blue PNG logo.png"/>
   <form runat="server"> 
       <div class="container">
        <h2>Sign Up</h2>
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        <div class="form-group">
           <label>Username:</label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>First Name:</label>
            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Last Name:</label>
            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Position:</label>
            <asp:DropDownList ID="ddlPosition" runat="server" CssClass="form-control">
                <asp:ListItem Text="Select Position" Value=""></asp:ListItem>
                <asp:ListItem Text="Chief" Value="Chief"></asp:ListItem>
                <asp:ListItem Text="Manager" Value="Manager"></asp:ListItem>
                <asp:ListItem Text="General Employee" Value="General Employee"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" CssClass="btn-signup" />
        <br /><br />
        <span>Already have an account? <a href="Login.aspx" class="login-link">Sign In</a></span>
    </div>
   </form>
</body>
</html>
