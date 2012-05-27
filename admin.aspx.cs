using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SiteSessionManagement;

public partial class controls_admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!SessionControl.isLoggedIn())
        {
            Response.Redirect("~/sign_in.aspx");
        }
        else
        {
            if (!SessionControl.isAdministrator())
            {
                Response.Redirect("~/index.aspx");
            }
        }
    }
}