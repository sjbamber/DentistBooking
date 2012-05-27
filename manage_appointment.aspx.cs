﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SiteSessionManagement; // Includes custom classes relating to session management

public partial class manage_appointment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!SessionControl.isLoggedIn())
        {
            Response.Redirect("~/sign_in.aspx");
        } 
        else 
        {
            if (!(SessionControl.isAdministrator() || SessionControl.isStaff()))
            {
                Response.Redirect("~/appointment.aspx");
            }
            if (SessionControl.isAdministrator())
            {
                GoBackLink.NavigateUrl = "~/admin.aspx";
            }
        }
        notification.Visible = false;
    }

    protected void GridViewAppointmentUpdate(object sender, GridViewUpdatedEventArgs e) //Event occurs when update command is sent 
    {
        if (e.AffectedRows == 1)
        {
            //the update is successful
            notification.Visible = true;
            notification.Text = "Update Successful";
        }
        else
        {
            //the update is failed
            notification.Visible = true;
            notification.Text = "Update Failed";
        }
    }
}
