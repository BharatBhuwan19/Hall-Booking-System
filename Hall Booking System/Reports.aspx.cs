using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace HallBookingSystem
{
    public partial class Reports : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
        public List<Booking> Bookings { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bookings = GetBookings();
            }
        }

        private List<Booking> GetBookings()
        {
            List<Booking> bookings = new List<Booking>();

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                string query = "SELECT * FROM Bookings";
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    connection.Open();
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Booking booking = new Booking();
                            booking.Id = Convert.ToInt32(reader["BookingId"]);
                            booking.UserId = Convert.ToInt32(reader["UserId"]);
                            booking.HallId = Convert.ToInt32(reader["HallId"]);
                            booking.Date = Convert.ToDateTime(reader["Date"]);
                            booking.StartTime = Convert.ToDateTime(reader["StartTime"]);
                            booking.EndTime = Convert.ToDateTime(reader["EndTime"]);
                            bookings.Add(booking);
                        }
                    }
                }
            }

            return bookings;
        }
    }

    public partial class Booking
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int HallId { get; set; }
        public DateTime Date { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
    }
}
