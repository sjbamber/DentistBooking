using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SiteSessionManagement;

public partial class controls_header : System.Web.UI.UserControl
{
    public String heading = "Page Title";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (SessionControl.isLoggedIn()) // User is signed in
        {
            topBarLink1.Text = "Sign Out";
            topBarLink1.NavigateUrl = "~/sign_out.aspx";
            topBarLabel.Text = "Welcome "+Session["title"]+" "+Session["forenames"]+" "+Session["surname"];
            if (SessionControl.isCustomer()) //User is a customer
            {
                topBarLink2.Text = "Book an Appointment";
                topBarLink2.NavigateUrl = "~/book_appointment.aspx";
            }
            if (SessionControl.isStaff()) //User is a staff member
            {
                topBarLink2.Text = "Staff Panel";
                topBarLink2.NavigateUrl = "~/staff.aspx";
            }
            if (SessionControl.isAdministrator()) //User is an administrator
            {
                topBarLink2.Text = "Admin Panel";
                topBarLink2.NavigateUrl = "~/admin.aspx";
            }
        }
        else // User is not signed in
        {
            topBarLink1.Text = "Sign In";
            topBarLink1.NavigateUrl = "~/sign_in.aspx";
            topBarLink2.Text = "Create an Account";
            topBarLink2.NavigateUrl = "~/new_user.aspx";
            topBarLabel.Text = "Book an appoinment online!";
        }
        
    }

}
