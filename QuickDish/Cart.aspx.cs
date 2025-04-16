using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace QuickDish
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        private void LoadCart()
        {
            if (Session["Cart"] != null)
            {
                var cart = (List<Dictionary<string, object>>)Session["Cart"];
                decimal totalPrice = 0.00m;  // Variable to store the total price

                // Calculate the total price of all items in the cart
                CartGridView.DataSource = cart.Select(item => new
                {
                    ItemName = item["ItemName"],
                    Price = item["Price"],
                    ImageUrl = item["ImageUrl"],
                    Quantity = item.ContainsKey("Quantity") ? item["Quantity"] : 1 // Default quantity to 1
                }).ToList();
                CartGridView.DataBind();

                // Sum up the total price
                foreach (var item in cart)
                {
                    decimal price = Convert.ToDecimal(item["Price"]);
                    int quantity = item.ContainsKey("Quantity") ? Convert.ToInt32(item["Quantity"]) : 1; // Safely check for quantity
                    totalPrice += price * quantity;
                }

                // Display the total price
                TotalPriceLabel.Text = totalPrice.ToString("F2");  // Format as currency
                EmptyCartLabel.Visible = false;  // Hide the empty cart label if there are items
            }
            else
            {
                EmptyCartLabel.Visible = true;
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

    }
}
