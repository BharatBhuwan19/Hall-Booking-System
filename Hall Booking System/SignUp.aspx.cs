using System;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;


public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        string username = Request.Form["txtUsername"];
        string password = Request.Form["txtPassword"];
        string firstname = Request.Form["txtFirstname"];
        string lastname = Request.Form["txtLastname"];
        string position = Request.Form["ddlPosition"];
        Label lblMessage = (Label)FindControl("lblMessage");

        // Check if any mandatory fields are empty
        if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(firstname) || string.IsNullOrEmpty(lastname) || string.IsNullOrEmpty(position))
        {
            lblMessage.Text = "Please fill in all fields.";
            return;
        }
        if (string.IsNullOrEmpty(position) || position == "Select Position")
        {
            lblMessage.Text = "Please select a position.";
            return;
        }
        int positionID;
        switch (position)
        {
            case "Chief":
                positionID = 3;
                break;
            case "Manager":
                positionID = 2;
                break;
            case "General Employee":
                positionID = 1;
                break;
            default:
                // Handle unknown positions or set a default value
                positionID = 0;
                break;
        }

        // Establish database connection
        string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
        using (MySqlConnection connection = new MySqlConnection(connectionString))
        {
            try
            {
                connection.Open();

                // Check if username already exists
                string checkQuery = "SELECT COUNT(*) FROM Users WHERE Username = @Username";
                MySqlCommand checkCommand = new MySqlCommand(checkQuery, connection);
                checkCommand.Parameters.AddWithValue("@Username", username);

                int existingUserCount = Convert.ToInt32(checkCommand.ExecuteScalar());

                if (existingUserCount > 0)
                {
                    lblMessage.Text = "Username already exists.";
                    return;
                }

                // Insert new user into the database
                string insertQuery = "INSERT INTO Users (Username, Password, Firstname, Lastname, Position, PositionId) VALUES (@Username, @Password, @Firstname, @Lastname, @Position, @PositionId)";
                MySqlCommand insertCommand = new MySqlCommand(insertQuery, connection);
                insertCommand.Parameters.AddWithValue("@Username", username);
                insertCommand.Parameters.AddWithValue("@Password", password);
                insertCommand.Parameters.AddWithValue("@Firstname", firstname);
                insertCommand.Parameters.AddWithValue("@Lastname", lastname);
                insertCommand.Parameters.AddWithValue("@Position", position);
                insertCommand.Parameters.AddWithValue("@PositionID", positionID);

                int rowsAffected = insertCommand.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    // Redirect user to login page after successful signup
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblMessage.Text = "Sign up failed.";
                }

                connection.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
            }
        }
    }
}
