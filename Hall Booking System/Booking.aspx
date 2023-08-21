<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="HallBookingSystem.Booking" %>

<!DOCTYPE html>
<html>
<head>
    <title>Book a Hall</title>
    <style>
        body {
            background-color: #F0F5FF;
            font-family: Arial, sans-serif;
        }

        .container {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #FFFFFF;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            color: #0066CC;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #0066CC;
        }

        .textbox {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border-radius: 5px;
            border: 1px solid #CCCCCC;
        }

        .dropdown {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border-radius: 5px;
            border: 1px solid #CCCCCC;
        }

        .btn-book {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            font-weight: bold;
            color: #FFFFFF;
            background-color: #0066CC;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .message {
            color: #FF0000;
            font-weight: bold;
            text-align: center;
        }

        .success-message {
            color: #008000;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>
    <form runat="server">
        <div class="container">
            <h1>Book a Hall</h1>
            <div class="form-group">
                <label for="ddlHall">Select Hall:</label>
                <asp:DropDownList ID="ddlHall" runat="server" CssClass="dropdown">
                 <asp:ListItem Text="Conference Hall 1" Value="1"></asp:ListItem>
                 <asp:ListItem Text="Conference Hall 2" Value="2"></asp:ListItem>
                 <asp:ListItem Text="Conference Hall 3" Value="3"></asp:ListItem>
                 </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="txtDate">Date:</label>
                <asp:TextBox ID="txtDate" runat="server" CssClass="textbox"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtStartTime">Start Time:</label>
                <asp:TextBox ID="txtStartTime" runat="server" CssClass="textbox"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtEndTime">End Time:</label>
                <asp:TextBox ID="txtEndTime" runat="server" CssClass="textbox"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnBook" runat="server" Text="Book" OnClick="bookButton_Click" CssClass="btn-book" />
            </div>
            <div>
                <asp:Label ID="errorMessageLabel" runat="server" CssClass="message"></asp:Label>
                <asp:Label ID="successMessageLabel" runat="server" CssClass="success-message"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
