using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; // Use libraries for interacting with a database
using System.Configuration;
using SiteSessionManagement;

public partial class book_appointment : System.Web.UI.Page
{
    private System.Drawing.Color Red;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!SessionControl.isLoggedIn())
        {
            Response.Redirect("~/sign_in.aspx");
        }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        double duration= 0.0; // Declare the duration of service types
        if (ServiceDropDownList.Text == "Checkup") 
        {
            duration = 15.0; // Checkup times are 15 minutes
        }
		else
        {
            if (ServiceDropDownList.Text == "Treatment")
            {
                duration = 45.0; // Treatment times are 45 minutes
            }
        }
        DateTime currentDateTime = DateTime.Now;                                  //The current system date and time
        DateTime dateTime = DateTime.Parse(DateTextBox.Text + " " + TimeTextBox.Text);   //The entered date and time
        // Check if the date entered has expired
        if (dateTime < currentDateTime)
        {
            notification.Visible = true;
            notification.Text = "<p>The date and time requested has expired. Please select a date and time in the future.</p>";
        }
        else
        {
            // Check For an appointment clash
            SqlConnection db_connection = new SqlConnection(ConfigurationManager.ConnectionStrings["sh_dentistConnectionString"].ConnectionString);
            db_connection.Open();
            DateTime time = DateTime.Parse(TimeTextBox.Text);   //The entered time
            DateTime endTime = time.AddMinutes(duration);       //The entered time plus the duration of the appointment
            string checkDateTime = "SELECT * FROM sh_dentist.dbo.appointment ";
            checkDateTime += "WHERE date = '" + DateTextBox.Text + "' ";
            checkDateTime += "AND time BETWEEN '" + time.TimeOfDay + "' AND '" + endTime.TimeOfDay + "'";
            SqlCommand dateClash = new SqlCommand(checkDateTime, db_connection);
            int test = 0;
            try
            {
                test = Convert.ToInt32(dateClash.ExecuteScalar().ToString());
            }
            catch
            {
                notification.Visible = true;
                notification.Text = "<p>An error occured. Please try again</p>";
            }
            if (test > 0) //Date Clash Found
            {
                notification.Visible = true;
                notification.Text = "<p>An appointment has already been booked for this time. Please select another date and time</p>";
            }
            else // Insert the appointment record
            {
                if (Page.IsValid) // Is the form Valid - For Server-side vaildation
                {
                    string insertAppointment = "INSERT INTO sh_dentist.dbo.appointment (date, time, service, confirmed, provider_id, user_id) ";
                    insertAppointment += "VALUES (CONVERT(datetime, @date, 103), @time, @service, @confirmed, @provider_id, @user_id)";
                    SqlCommand insertAppointmentCommand = new SqlCommand(insertAppointment, db_connection);
                    insertAppointmentCommand.Parameters.AddWithValue("@date", DateTextBox.Text.Trim());
                    insertAppointmentCommand.Parameters.AddWithValue("@time", TimeTextBox.Text.Trim());
                    insertAppointmentCommand.Parameters.AddWithValue("@service", ServiceDropDownList.Text.Trim());
                    insertAppointmentCommand.Parameters.AddWithValue("@confirmed", "0");
                    insertAppointmentCommand.Parameters.AddWithValue("@provider_id", "3");
                    insertAppointmentCommand.Parameters.AddWithValue("@user_id", Session["user_id"]);
                    try
                    {
                        insertAppointmentCommand.ExecuteNonQuery();
                        notification.Visible = true;
                        notification.Text = "<p>Appointment booking successful</p>";
                    }
                    catch // If the Insert fails
                    {
                        notification.Visible = true;
                        notification.Text = "<p>An error occured adding the appointment details to the Database. Please try again.</p>";
                    }
                }
            }
            db_connection.Close();
        }
    }
}