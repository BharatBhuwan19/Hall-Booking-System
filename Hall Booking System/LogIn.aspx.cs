using System;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;


public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = Request.Form["txtUsername"];
        string password = Request.Form["txtPassword"];
        Label lblMessage = (Label)FindControl("lblMessage"); 
 
        // Establish database connection
        string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
        using (MySqlConnection connection = new MySqlConnection(connectionString))
        {
            try
            {
                connection.Open();

                // Perform login verification
                string query = "SELECT UserID, PositionID FROM Users WHERE Username = @Username AND Password = @Password";
                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@Username", username);
                command.Parameters.AddWithValue("@Password", password);

                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        // User is authenticated; store UserID and PositionID in session variables
                        int userID = reader.GetInt32("UserID");
                        int positionID = reader.GetInt32("PositionID");

                        Session["UserID"] = userID;
                        Session["PositionID"] = positionID;

                        // Redirect user to main page after successful login
                        Response.Redirect("MainPage.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid username or password.";
                    }

                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
            }
        }
    }
}
