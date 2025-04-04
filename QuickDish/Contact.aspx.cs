using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuickDish
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string message = txtMessage.Text.Trim();

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thank you for contacting us! We will get back to you soon.');", true);

            // Clear form fields
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtMessage.Text = "";
        }
    }
}