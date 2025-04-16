using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace QuickDish
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMenuItems();
            }
        }

        private void LoadMenuItems()
        {
            string connStr = ConfigurationManager.ConnectionStrings["FoodDeliveryConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT ItemName, Description, Price, Category, ImageUrl FROM MenuItems";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                foreach (DataRow row in dt.Rows)
                {
                    if (row["ImageUrl"] != DBNull.Value)
                    {
                        row["ImageUrl"] = "~/" + row["ImageUrl"].ToString();
                    }
                }

                MenuRepeater.DataSource = dt;
                MenuRepeater.DataBind();
            }
        }

        protected void AddToCart_Command(object sender, CommandEventArgs e)
        {
            string[] itemData = e.CommandArgument.ToString().Split('|');
            string itemName = itemData[0];
            decimal price = Convert.ToDecimal(itemData[1]);
            string imageUrl = itemData[2];

            // Ensure the full image path is added to the cart (relative to the root)
            Dictionary<string, object> cartItem = new Dictionary<string, object>
    {
        { "ItemName", itemName },
        { "Price", price },
        { "ImageUrl", imageUrl }  // Update this line to ensure correct path
    };

            List<Dictionary<string, object>> cart;
            if (Session["Cart"] == null)
                cart = new List<Dictionary<string, object>>();
            else
                cart = (List<Dictionary<string, object>>)Session["Cart"];

            cart.Add(cartItem);
            Session["Cart"] = cart;

            // Display confirmation (using a JavaScript alert)
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Item added to cart!');", true);
        }


    }
}
