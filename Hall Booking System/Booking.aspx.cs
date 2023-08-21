using System;
using System.Data.SqlClient;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;
using System.Collections.Generic;


namespace HallBookingSystem
{
    public partial class Booking : System.Web.UI.Page
    {
        // Retrieve the connection string from the web.config file
        private string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
               
            }
        }

        protected void bookButton_Click(object sender, EventArgs e)
        {
            // Retrieve the form inputs
            int selectedHallID = Convert.ToInt32(ddlHall.SelectedValue);
            DateTime selectedDate = Convert.ToDateTime(txtDate.Text);
            TimeSpan selectedStartTime = TimeSpan.Parse(txtStartTime.Text);
            TimeSpan selectedEndTime = TimeSpan.Parse(txtEndTime.Text);

            // Retrieve UserID and Position from the session variables
            int userID = Convert.ToInt32(Session["UserID"]);
            int positionID = Convert.ToInt32(Session["PositionID"]);

            string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                // Check if the selected hall is already booked
                string checkAvailabilityQuery = "SELECT COUNT(*) FROM Bookings WHERE HallID = @HallID " +
                    "AND Date = @Date AND ((StartTime <= @StartTime AND EndTime > @StartTime) " +
                    "OR (StartTime < @EndTime AND EndTime >= @EndTime) " +
                    "OR (StartTime >= @StartTime AND EndTime <= @EndTime))";

                MySqlCommand checkAvailabilityCommand = new MySqlCommand(checkAvailabilityQuery, connection);

                checkAvailabilityCommand.Parameters.AddWithValue("@HallID", selectedHallID);
                checkAvailabilityCommand.Parameters.AddWithValue("@Date", selectedDate);
                checkAvailabilityCommand.Parameters.AddWithValue("@StartTime", selectedStartTime);
                checkAvailabilityCommand.Parameters.AddWithValue("@EndTime", selectedEndTime);

                try
                {
                    connection.Open();

                    int conflictingBookingsCount = Convert.ToInt32(checkAvailabilityCommand.ExecuteScalar());

                    if (conflictingBookingsCount == 0)
                    {
                        // No conflicting bookings; proceed with the new booking

                        // Check if there are any existing bookings for the selected hall
                        string existingBookingsQuery = "SELECT COUNT(*) FROM Bookings WHERE HallID = @HallID";

                        MySqlCommand existingBookingsCommand = new MySqlCommand(existingBookingsQuery, connection);

                        existingBookingsCommand.Parameters.AddWithValue("@HallID", selectedHallID);

                        int existingBookingsCount = Convert.ToInt32(existingBookingsCommand.ExecuteScalar());

                        if (existingBookingsCount > 0)
                        {
                            // If there are existing bookings, check the position of the current user
                            // Only a user with a higher position can override the booking
                            string currentUserPositionQuery = "SELECT PositionID FROM Users WHERE UserID = @UserID";

                            MySqlCommand currentUserPositionCommand = new MySqlCommand(currentUserPositionQuery, connection);

                            currentUserPositionCommand.Parameters.AddWithValue("@UserID", userID);

                            int currentUserPosition = Convert.ToInt32(currentUserPositionCommand.ExecuteScalar());

                            if (currentUserPosition > positionID)
                            {
                                // User's position is not allowed to override existing bookings
                                errorMessageLabel.Text = "You do not have the required position to override existing bookings.";
                                return;
                            }
                            else
                            {
                                // Perform the override by deleting the existing booking
                                string deleteQuery = "DELETE FROM Bookings WHERE HallID = @HallID";

                                MySqlCommand deleteCommand = new MySqlCommand(deleteQuery, connection);

                                deleteCommand.Parameters.AddWithValue("@HallID", selectedHallID);

                                deleteCommand.ExecuteNonQuery();
                            }
                        }

                        // Insert the new booking into the database
                        string insertQuery = "INSERT INTO Bookings (HallID, UserID, Date, StartTime, EndTime) " +
                                             "VALUES (@HallID, @UserID, @Date, @StartTime, @EndTime)";

                        MySqlCommand insertCommand = new MySqlCommand(insertQuery, connection);

                        insertCommand.Parameters.AddWithValue("@HallID", selectedHallID);
                        insertCommand.Parameters.AddWithValue("@UserID", userID);
                        insertCommand.Parameters.AddWithValue("@Date", selectedDate);
                        insertCommand.Parameters.AddWithValue("@StartTime", selectedStartTime);
                        insertCommand.Parameters.AddWithValue("@EndTime", selectedEndTime);

                        insertCommand.ExecuteNonQuery();

                        // Show a confirmation message to the user
                        successMessageLabel.Text = "Booking successful!";
                    }
                    else
                    {
                        // The hall is already booked; display an error message
                        errorMessageLabel.Text = "The hall is not available for the selected date and time.";
                    }
                }
                catch (Exception ex)
                {
                    // Handle any exceptions that occur during database operations
                    errorMessageLabel.Text = ex.Message;
                }
            }
        }
    }
}
