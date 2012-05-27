using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SiteSessionManagement
{
    /// <summary>
    /// Class containing session control methods
    /// </summary>
    public class SessionControl
    {
        public static bool isLoggedIn()
        {
            if (HttpContext.Current.Session["user_id"] != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool isAdministrator()
        {
            if ((String)HttpContext.Current.Session["role"] == "Administrator")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool isStaff()
        {
            if ((String)HttpContext.Current.Session["role"] == "Staff")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool isCustomer()
        {
            if ((String)HttpContext.Current.Session["role"] == "Customer")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}