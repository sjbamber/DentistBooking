using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SiteSessionManagement; // Includes custom classes relating to session management

public partial class appointment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (SessionControl.isLoggedIn())
        {
            PanelSignedIn.Visible = true;
            PanelSignedOut.Visible = false;
            if (Page.Request.QueryString["account_create"] == "1")
            {
                notification.Visible = true;
                notification.Text = "<p>User Account created successfully</p>";
            }
        }
        else
        {
            PanelSignedOut.Visible = true;
            PanelSignedIn.Visible = false;
        }


    }
}