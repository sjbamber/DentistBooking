using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SiteSessionManagement; // Includes custom classes relating to session management

public partial class view_appointment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (SessionControl.isLoggedIn())
        {
            if (AppointmentGridView.Rows.Count == 0)
            {

            }
        }
        else
        {
            Response.Redirect("~/sign_in.aspx");
        }
    }
}