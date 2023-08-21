<!DOCTYPE html>
<html>
<head>
    <title>Venue Management System - Hall Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f7fd;
            margin: 0;
            padding: 0;
        }
        
        .header {
            background-color: #2699fb;
            color: #fff;
            padding: 20px;
            text-align: center;
        }
        
        .container {
            margin: 20px auto;
            max-width: 800px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .hall-details {
            margin-bottom: 20px;
        }
        
        .hall-details h2 {
            color: #2699fb;
        }
        
        .hall-details p {
            color: #777;
        }
        
        .hall-details .cta-button {
            background-color: #2699fb;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Venue Management System</h1>
        <p>Details of the Conference Halls</p>
    </div>
    
    <div class="container">
        <div class="hall-details">
            <h2>Conference Hall 1</h2>
            <p>Capacity: 50 people</p>
            <p>Features: Projector, Whiteboard</p>
            <p>Description:</p>
            <button class="cta-button" onclick="location.href='Booking.aspx'">Go to Booking</button>
        </div>
        
        <div class="hall-details">
            <h2>Conference Hall 2</h2>
            <p>Capacity: 30 people</p>
            <p>Features: Whiteboard</p>
            <p>Description:</p>
            <button class="cta-button" onclick="location.href='Booking.aspx'">Go to Booking</button>
        </div>
        
        <div class="hall-details">
            <h2>Conference Hall 3</h2>
            <p>Capacity: 20 people</p>
            <p>Features: Projector</p>
            <p>Description:</p>
            <button class="cta-button" onclick="location.href='Booking.aspx'">Go to Booking</button>
        </div>
    </div>
</body>
</html>
