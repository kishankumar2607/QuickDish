using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace QuickDish
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetWelcomeMessage();
                LoadCart();
            }

            CartGridView.RowCommand += CartGridView_RowCommand;
        }

        private void SetWelcomeMessage()
        {
            HttpCookie userCookie = Request.Cookies["QuickDishUser"];
            if (userCookie != null && userCookie["FirstName"] != null)
            {
                WelcomeLabel.Text = "Welcome, " + userCookie["FirstName"] + " 👋";
            }
            else
            {
                WelcomeLabel.Text = "Welcome to your cart!";
            }
        }

        private void LoadCart()
        {
            if (Session["Cart"] != null && ((List<Dictionary<string, object>>)Session["Cart"]).Count > 0)
            {
                var cart = (List<Dictionary<string, object>>)Session["Cart"];
                decimal subtotal = 0.00m;
                int totalItems = 0;

                CartGridView.DataSource = cart.Select(item => new
                {
                    ItemName = item["ItemName"],
                    Price = item["Price"],
                    ImageUrl = item["ImageUrl"],
                    Quantity = item.ContainsKey("Quantity") ? item["Quantity"] : 1
                }).ToList();
                CartGridView.DataBind();

                foreach (var item in cart)
                {
                    decimal price = Convert.ToDecimal(item["Price"]);
                    int quantity = item.ContainsKey("Quantity") ? Convert.ToInt32(item["Quantity"]) : 1;

                    subtotal += price * quantity;
                    totalItems += quantity;
                }

                decimal tax = subtotal * 0.13m;
                decimal total = subtotal + tax;

                SubtotalLabel.Text = subtotal.ToString("F2");
                TaxLabel.Text = tax.ToString("F2");
                TotalPriceLabel.Text = total.ToString("F2");
                TotalItemsLabel.Text = totalItems.ToString();

                EmptyCartLabel.Visible = false;
                CartPanel.Visible = true;
            }
            else
            {
                EmptyCartLabel.Visible = true;
                CartPanel.Visible = false;
            }
        }

        protected void QuantityTextBox_TextChanged(object sender, EventArgs e)
        {

            var textBox = sender as TextBox;
            var row = (GridViewRow)textBox.NamingContainer;


            var itemName = row.Cells[1].Text;


            var quantity = Convert.ToInt32(textBox.Text);


            var cart = (List<Dictionary<string, object>>)Session["Cart"];


            var cartItem = cart.FirstOrDefault(item => item["ItemName"].ToString() == itemName);
            if (cartItem != null)
            {
                cartItem["Quantity"] = quantity;
            }


            Session["Cart"] = cart;


            LoadCart();
        }

        protected void CartGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (Session["Cart"] != null)
            {
                var cart = (List<Dictionary<string, object>>)Session["Cart"];
                var itemName = e.CommandArgument.ToString();

                var cartItem = cart.FirstOrDefault(item => item["ItemName"].ToString() == itemName);
                if (cartItem != null)
                {
                    int currentQty = cartItem.ContainsKey("Quantity") ? Convert.ToInt32(cartItem["Quantity"]) : 1;

                    if (e.CommandName == "Increase")
                    {
                        if (currentQty < 10)
                        {
                            cartItem["Quantity"] = currentQty + 1;
                            QuantityMessageLabel.Visible = false;
                        }
                        else
                        {
                            QuantityMessageLabel.Text = "Maximum quantity is 10.";
                            QuantityMessageLabel.Visible = true;
                        }
                    }
                    else if (e.CommandName == "Decrease")
                    {
                        if (currentQty > 1)
                        {
                            cartItem["Quantity"] = currentQty - 1;
                            QuantityMessageLabel.Visible = false;
                        }
                        else
                        {
                            QuantityMessageLabel.Text = "Minimum quantity is 1.";
                            QuantityMessageLabel.Visible = true;
                        }
                    }

                    Session["Cart"] = cart;
                    LoadCart();
                }
            }
        }

        protected void RemoveFromCart_Command(object sender, CommandEventArgs e)
        {
            var itemName = e.CommandArgument.ToString();


            var cart = (List<Dictionary<string, object>>)Session["Cart"];


            var cartItem = cart.FirstOrDefault(item => item["ItemName"].ToString() == itemName);
            if (cartItem != null)
            {
                cart.Remove(cartItem);
            }


            Session["Cart"] = cart;


            LoadCart();
        }

        protected void ClearCartButton_Click(object sender, EventArgs e)
        {

            Session["Cart"] = null;


            LoadCart();
        }

        protected void CheckoutButton_Click(object sender, EventArgs e)
        {
            HttpCookie userCookie = Request.Cookies["QuickDishUser"];

            if (userCookie == null || string.IsNullOrEmpty(userCookie["FirstName"]))
            {
                CheckoutMessageLabel.Text = "⚠ Please login first to proceed to checkout.";
                CheckoutMessageLabel.Visible = true;
            }
            else
            {
                Response.Redirect("Checkout.aspx");
            }
        }


    }
}
