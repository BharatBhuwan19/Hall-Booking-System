using System;
using System.Web.UI;
using DHTMLX.Scheduler;
using DHTMLX.Scheduler.Controls;
using MySql.Data.MySqlClient;

public partial class Calendar : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DHXScheduler scheduler = new DHXScheduler();
        scheduler.Skin = DHXScheduler.Skins.Terrace;

        scheduler.Config.first_hour = 8;  // Set the start hour
        scheduler.Config.last_hour = 18;  // Set the end hour

        LoadBookedSlots(scheduler);  // Load booked slots from the database

        Controls.Add(scheduler);
    }

    protected void LoadBookedSlots(DHXScheduler scheduler)
    {
        string connectionString = "YourConnectionString";
        MySqlConnection connection = new MySqlConnection(connectionString);
        MySqlCommand cmd = new MySqlCommand("SELECT id, start_date, end_date FROM bookings", connection);

        try
        {
            connection.Open();
            MySqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                DHXEvent ev = new DHXEvent();
                ev.id = reader["id"].ToString();
                ev.start_date = Convert.ToDateTime(reader["start_date"]);
                ev.end_date = Convert.ToDateTime(reader["end_date"]);
                // Customize other event properties as needed
                scheduler.Events.Add(ev);
            }

            reader.Close();
        }
        catch (Exception ex)
        {
            // Handle exceptions here
        }
        finally
        {
            connection.Close();
        }
    }
}
