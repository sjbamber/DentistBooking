using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; // Use libraries for interacting with a database
using System.Configuration;
using SiteSecurity; // Includes custom classes relating to site security
using SiteSessionManagement; // Includes custom classes relating to session management

public partial class NewUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (SessionControl.isLoggedIn() && SessionControl.isAdministrator())
        {
            rolePanel.Visible = true;
        }
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        SqlConnection db_connection = new SqlConnection(ConfigurationManager.ConnectionStrings["sh_dentistConnectionString"].ConnectionString);
        db_connection.Open();
        string selectUsername = "SELECT COUNT(*) FROM sh_dentist.dbo.users WHERE username='" + TextBoxUsername.Text.Trim() + "'";
        SqlCommand usernameExists = new SqlCommand(selectUsername, db_connection);
        int test = Convert.ToInt32(usernameExists.ExecuteScalar().ToString());
        if (test > 0) //Username already exists
        {
            notification.Visible = true;
            notification.Text = "<p>Username already exists. Please enter a different Username.</p>";
        }
        else //Insert the record
        {
            if (Page.IsValid) // Is the form Valid - For Server-side vaildation
            {
                // Hash the password before inserting it into the Database
                string salt = SecurePassword.CreateSalt(); // Create random salt
                string hashedPassword = SecurePassword.HashPassword(salt, TextBoxPassword.Text.Trim());

                string insertUser = "INSERT INTO sh_dentist.dbo.users (title, forenames, surname, street_no, address1, address2, address3, town, ";
                insertUser += "county, postcode, tel_no, email, date_of_birth, role, username, hashed_password, salt) ";
                insertUser += "VALUES (@title, @forenames, @surname, @street_no, @address1, @address2, @address3, @town, @county, ";
                insertUser += "@postcode, @tel_no, @email, CONVERT(datetime, @date_of_birth, 103), @role, @username, @hashed_password, @salt)";
                SqlCommand insertUserCommand = new SqlCommand(insertUser, db_connection);
                insertUserCommand.Parameters.AddWithValue("@title", TextBoxTitle.Text.Trim());
                insertUserCommand.Parameters.AddWithValue("@forenames", TextBoxFname.Text.Trim());
                insertUserCommand.Parameters.AddWithValue("@surname", TextBoxSname.Text.Trim());
                insertUserCommand.Parameters.AddWithValue("@street_no", TextBoxStreetno.Text.Trim());
                insertUserCommand.Parameters.AddWithValue("@address1", TextBoxAddress1.Text.Trim());
                insertUserCommand.Parameters.AddWithValue("@address2", TextBoxAddress2.Text.Trim());
                insertUserCommand.Parameters.AddWithValue("@address3", TextBoxAddress3.Text.Trim());
                insertUserCommand.Parameters.AddWithValue("@town", TextBoxTown.Text.Trim());
                insertUserCommand.Parameters.AddWithValue("@county", TextBoxCounty.Text.Trim());
                insertUserCommand.Parameters.AddWithValue("@postcode", TextBoxPostcode.Text.Trim());
                insertUserCommand.Parameters.AddWithValue("@tel_no", TextBoxTelno.Text.Trim());
                insertUserCommand.Parameters.AddWithValue("@email", TextBoxEmail.Text.Trim());
                insertUserCommand.Parameters.AddWithValue("@date_of_birth", TextBoxDOB.Text.Trim());
                insertUserCommand.Parameters.AddWithValue("@role", DropDownListRole.SelectedItem.ToString().Trim());
                insertUserCommand.Parameters.AddWithValue("@username", TextBoxUsername.Text.Trim());
                insertUserCommand.Parameters.AddWithValue("@hashed_password", hashedPassword);
                insertUserCommand.Parameters.AddWithValue("@salt", salt);
                try
                {
                    insertUserCommand.ExecuteNonQuery();
                    string getUserID = "SELECT user_id FROM sh_dentist.dbo.users WHERE username='" + TextBoxUsername.Text.Trim() + "'";
                    SqlCommand userIdCommand = new SqlCommand(getUserID, db_connection);
                    Session["user_id"] = userIdCommand.ExecuteScalar().ToString();
                    db_connection.Close();
                    Session["title"] = TextBoxTitle.Text.Trim();
                    Session["forenames"] = TextBoxFname.Text.Trim();
                    Session["surname"] = TextBoxSname.Text.Trim();
                    Session["role"] = DropDownListRole.SelectedItem.ToString().Trim();
                    Session["username"] = TextBoxUsername.Text.Trim();
                    Response.Redirect("~/appointment.aspx?account_create=1");
                }
                catch
                {
                    notification.Visible = true;
                    notification.Text = "<p>An error occured adding the user details to the Database. Please try again</p>";
                }
            }
        }
    }
}