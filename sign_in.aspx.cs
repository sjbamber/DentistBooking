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

public partial class includes_sign_in : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (SessionControl.isLoggedIn())
        {
            if (SessionControl.isAdministrator())
            {
                Response.Redirect("~/admin.aspx");
            }
            else
            {
                if (SessionControl.isStaff())
                {
                    Response.Redirect("~/staff.aspx");
                }
                else
                {
                    Response.Redirect("~/appointment.aspx");
                }
            } 
            

        }
        if (Page.Request.QueryString["sign_out"] == "1")
        {
            notification.Visible = true;
            notification.Text = "Sign Out Successful";
        }
    }

    protected void Login_Click(object sender, EventArgs e)
    {
        SqlConnection db_connection = new SqlConnection(ConfigurationManager.ConnectionStrings["sh_dentistConnectionString"].ConnectionString);
        db_connection.Open();
        string selectUsername = "SELECT COUNT(*) FROM sh_dentist.dbo.users WHERE username='" + TextBoxUsername.Text.Trim() + "'";
        SqlCommand usernameExists = new SqlCommand(selectUsername, db_connection);
        int test = Convert.ToInt32(usernameExists.ExecuteScalar().ToString());
        if (test == 1) //Username exists and is unique
        {
            string selectPassword = "SELECT hashed_password, salt FROM sh_dentist.dbo.users WHERE username='" + TextBoxUsername.Text.Trim() + "'";
            SqlCommand queryPassword = new SqlCommand(selectPassword, db_connection);
            SqlDataReader passwordReader = queryPassword.ExecuteReader();
            string dbPassword = "";
            string salt = "";
            while (passwordReader.Read())
            {
                dbPassword = passwordReader.GetString(0);
                salt = passwordReader.GetString(1);
            }
            // Hash the password from the textbox before comparison
            string hashedPassword = SecurePassword.HashPassword(salt, TextBoxPassword.Text.Trim());
            passwordReader.Close();
            if (dbPassword == hashedPassword)
            {
                string selectUserSession = "SELECT user_id, title, forenames, surname, role FROM sh_dentist.dbo.users WHERE username='" + TextBoxUsername.Text.Trim() + "'";
                SqlCommand queryUser = new SqlCommand(selectUserSession, db_connection);
                SqlDataReader sessionReader = queryUser.ExecuteReader();
                while (sessionReader.Read())
                {
                    Session["user_id"] = sessionReader.GetSqlInt32(0);
                    Session["title"] = sessionReader.GetString(1);
                    Session["forenames"] = sessionReader.GetString(2);
                    Session["surname"] = sessionReader.GetString(3);
                    Session["role"] = sessionReader.GetString(4);
                }
                sessionReader.Close();
                Session["username"] = TextBoxUsername.Text.Trim();
                Response.Redirect("~/sign_in.aspx");
            }
            else
            {
                notification.Visible = true;
                notification.Text = "Password Invalid";
            }
        }
        else
        {
            notification.Visible = true;
            notification.Text = "Username not found";
        }
        db_connection.Close();
    }
}