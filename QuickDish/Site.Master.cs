using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuickDish
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get the last segment from the URL (e.g., "Menu" from "/Menu")
            string page = Request.Url.AbsolutePath.ToLower().Trim('/');

            // Set active class based on the current page
            liHome.Attributes["class"] = page == "home" ? "nav-item active" : "nav-item";
            liMenu.Attributes["class"] = page == "menu" ? "nav-item active" : "nav-item";
            liRestaurants.Attributes["class"] = page == "restaurants" ? "nav-item active" : "nav-item";
            liCart.Attributes["class"] = page == "cart" ? "nav-item active" : "nav-item";
            liAbout.Attributes["class"] = page == "about" ? "nav-item active" : "nav-item";
            liAdmin.Attributes["class"] = page == "admin" ? "nav-item active" : "nav-item";
            liLogin.Attributes["class"] = page == "login" ? "nav-item active" : "nav-item";

            HttpCookie userCookie = Request.Cookies["QuickDishUser"];

            if (userCookie != null && !IsPostBack)
            {
                string firstName = userCookie["FirstName"];
                string userType = userCookie["UserType"];

                lblUser.InnerText = "Welcome, " + firstName;
                liLogin.Visible = false;
                liUser.Visible = true;
                liLogout.Visible = true;

                liAdmin.Visible = userType == "Admin";

                if (userType == "Admin")
                {
                    liCart.Visible = false;
                    liAbout.Visible = false;
                }
                else
                {
                    liCart.Visible = true;
                    liAbout.Visible = true;
                }
            }
            else if (!IsPostBack)
            {
                liLogin.Visible = true;
                liUser.Visible = false;
                liLogout.Visible = false;
                liAdmin.Visible = false;
                liCart.Visible = true;
                liAbout.Visible = true;
            }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            if (Request.Cookies["QuickDishUser"] != null)
            {
                HttpCookie cookie = new HttpCookie("QuickDishUser");
                cookie.Expires = DateTime.Now.AddDays(-1); // delete
                Response.Cookies.Add(cookie);
            }

            Response.Redirect("Home.aspx");
        }
    }
}