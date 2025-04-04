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