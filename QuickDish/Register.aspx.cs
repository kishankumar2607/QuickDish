using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuickDish
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            String firstName = txtFirstName.Text;
            String lastName = txtLastName.Text;

            Session["firstName"] = firstName;
            Session["lastName"] = lastName;

            Response.Redirect("Home");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home");
        }
    }
}