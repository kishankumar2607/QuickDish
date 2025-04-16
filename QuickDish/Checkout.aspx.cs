using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuickDish
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Cart"] == null)
            {
                Response.Redirect("Menu.aspx");
            }
        }

        protected void ProceedButton_Click(object sender, EventArgs e)
        {
            // Validate all fields
            if (Page.IsValid)
            {
                Session["Cart"] = null;
                Response.Redirect("ThankYou.aspx");
            }
        }
    }
}