<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="HallBookingSystem.Reports" %>

<!DOCTYPE html>
<html>
<head>
    <title>Reports - Current Bookings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f7fd;
            margin: 0;
            padding: 0;
        }

        .container {
            margin: 20px auto;
            max-width: 800px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Current Bookings</h2>
        <table>
            <tr>
                <th>Booking ID</th>
                <th>User ID</th>
                <th>Hall ID</th>
                <th>Date</th>
                <th>Start Time</th>
                <th>End Time</th>
            </tr>
            <% foreach (var booking in Bookings) { %>
                <tr>
                    <td><%: booking.Id %></td>
                    <td><%: booking.UserId %></td>
                    <td><%: booking.HallId %></td>
                    <td><%: booking.Date.ToString("yyyy-MM-dd") %></td>
                    <td><%: booking.StartTime.ToString(@"hh\T:mm:\ss tt") %></td>
                    <td><%: booking.EndTime.ToString(@"hh\T:mm:\ss tt") %></td>
                </tr>
            <% } %>
        </table>
    </div>
</body>
</html>
