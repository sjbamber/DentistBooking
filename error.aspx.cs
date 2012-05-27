using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.Request.QueryString["error"] == "403")
        {
            Header1.heading = "Error 403: Access Forbidden";
            errorLabel.Text = "You do not have permission to access this resource.";
        }
        if (Page.Request.QueryString["error"] == "404")
        {
            Header1.heading = "Error 404: Page not found";
            errorLabel.Text = "The resource you are looking for (or one of its dependencies) could have been removed, had its name changed, or is temporarily unavailable.<br />  Please review the URL and make sure that it is spelled correctly.";
        }
    }
}