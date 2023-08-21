<!DOCTYPE html>
<html>
<head>
    <title>Venue Management System - Dashboard</title>
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
        .header-image {
            height: 50px; /* Adjust the desired height */
            width: auto; /* Let the width adjust automatically based on the height */
            display: block; /* Ensure the image is treated as a block element */
            margin: 0 auto; /* Center the image horizontally */
        }
        .container {
             display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin: 20px auto;
            max-width: 800px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-left: 0;
            margin-right: auto;
        }
        .dashboard-row {
            width: 48%; /* Adjust the width as needed */
            margin-bottom: 20px;
        }
        
        .dashboard-item {
          width: 100%;
        }
        
        .dashboard-item h3 {
            color: #2699fb;
        }
        
        .dashboard-item p {
            color: #777;
        }
        
        .dashboard-item .cta-button {
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
        <img src="TSF _ White PNG logo.png" alt="Header Image" class="header-image">
        <h1>Venue Management System</h1>
        <p>This web application assists the employees of the Tata Steel Foundation in seamlessly booking the conference halls present in the premises and to also check their availability.</p>
    </div>
    
    <div class="container">
       <div class="dashboard-row">
           <div class="dashboard-item">
            <h3>Hall Details</h3>
            <p>View and manage details of conference halls.</p>
            <button class="cta-button" onclick="location.href='HallDetails.aspx'">Go to Hall Details</button>
        </div>
        
        <div class="dashboard-item">
            <h3>Booking Management</h3>
            <p>Manage bookings for conference halls.</p>
            <button class="cta-button" onclick="location.href='Booking.aspx'">Go to Booking</button>

        </div>
        
        <div class="dashboard-item">
            <h3>Calendar Integration</h3>
            <p>Integrate with office calendar for scheduling.</p>
            <button class="cta-button" onclick="location.href='Calendar.aspx'">Go to Calendar</button>
        </div>
       </div> 
        <div class="dashboard-row">
        <div class="dashboard-item">
            <h3>Reports</h3>
            <p>Reports and analytics of the data</p>
            <button class="cta-button" onclick="location.href='Reports.aspx'">Go to Reports</button>
        </div>
        
        <div class="dashboard-item">
            <h3>Help and Support</h3>
            <p>Get assistance and support for any issues.</p>
            <button class="cta-button">Go to Help and Support</button>
        </div>
       </div>
    </div>
</body>
</html>
