<%@ Page Language="C#" AutoEventWireup="true" CodeFile="calendar.aspx.cs" Inherits="calendar" %>

<!DOCTYPE html>
<html>
<head>
    <title>Conference Hall Booking Calendar</title>
    <link href="path/to/fullcalendar.css" rel="stylesheet" />
    <script src="path/to/jquery.min.js"></script>
    <script src="path/to/moment.min.js"></script>
    <script src="path/to/fullcalendar.js"></script>
    <script>
        $(document).ready(function () {
            // Retrieve the hall ID from the query string
            var hallId = getQueryStringValue("hallId");

            // Initialize the FullCalendar with the hall ID
            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                defaultView: 'month',
                selectable: true,
                selectHelper: true,
                events: 'calendar.aspx/GetHallBookings?hallId=' + hallId, // Fetch bookings for the specific hall ID
                eventRender: function (event, element) {
                    element.css('background-color', 'red'); // Highlight booked slots in red
                }
            });

            // Helper function to retrieve the value of a query string parameter
            function getQueryStringValue(key) {
                return decodeURIComponent(window.location.search.replace(new RegExp("^(?:.*[&\\?]" + encodeURIComponent(key).replace(/[\.\+\*]/g, "\\$&") + "(?:\\=([^&]*))?)?.*$", "i"), "$1"));
            }
        });
    </script>
</head>
<body>
    <div id="calendar"></div>
</body>
</html>
