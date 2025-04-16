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

            LoadOrderSummary();
        }

        private void LoadOrderSummary()
        {
            if (Session["Cart"] != null)
            {
                var cart = (List<Dictionary<string, object>>)Session["Cart"];
                int totalItems = 0;
                decimal subtotal = 0m;

                foreach (var item in cart)
                {
                    int quantity = item.ContainsKey("Quantity") ? Convert.ToInt32(item["Quantity"]) : 1;
                    decimal price = Convert.ToDecimal(item["Price"]);
                    subtotal += price * quantity;
                    totalItems += quantity;
                }

                decimal tax = subtotal * 0.13m;
                decimal totalWithTax = subtotal + tax;

                lblTotalItems.Text = totalItems.ToString();
                lblTotalPrice.Text = $"${totalWithTax:F2}";
            }
            else
            {
                lblTotalItems.Text = "0";
                lblTotalPrice.Text = "$0.00";
            }
        }

        protected void btnSubmitOrder_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Retrieve form data
                string email = txtEmail.Text;
                string emailAgain = txtEmailAgain.Text;
                string firstName = txtFirstName.Text;
                string lastName = txtLastName.Text;
                string phone = txtPhone.Text;
                string address = txtAddress.Text;
                string city = txtCity.Text;
                string state = txtState.Text;
                string country = txtCountry.Text;
                string paymentMethod = ddlPaymentMethod.SelectedValue;
                string cardNumber = txtCardNumber.Text;
                string expiryDate = txtExpiryDate.Text;
                string cvv = txtCVV.Text;

                Session.Remove("Cart");

                Response.Redirect("OrderConfirmation");
            }
        }
    }
}