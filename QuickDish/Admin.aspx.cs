using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuickDish
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie userCookie = Request.Cookies["QuickDishUser"];

            // Check if user is logged in and is an Admin
            if (userCookie == null || userCookie["UserType"] != "Admin")
            {
                // Not an admin — deny access
                Response.Clear();
                Response.Write("<h2 style='color:red; text-align:center; margin-top:50px;'>Access Denied: Only Admin can access this page.</h2>");
                Response.End();
            }

        }

        protected void ddlAdminView_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = ddlAdminView.SelectedValue;

            if (selectedValue == "Restaurants")
            {
                pnlRestaurants.Visible = true;
                pnlMenuItems.Visible = false;
            }
            else if (selectedValue == "MenuItems")
            {
                pnlRestaurants.Visible = false;
                pnlMenuItems.Visible = true;
            }
        }
    }
}