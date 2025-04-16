using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace QuickDish
{
    public partial class RestaurantMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int restaurantId = 0;
                if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out restaurantId))
                {
                    LoadRestaurantName(restaurantId);
                    LoadMenuByRestaurant(restaurantId);
                }
            }
        }

        private void LoadRestaurantName(int restaurantId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["FoodDeliveryConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Name FROM Restaurants WHERE RestaurantID = @RestaurantID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@RestaurantID", restaurantId);
                conn.Open();
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    lblRestaurantName.Text = result.ToString();
                }
                else
                {
                    lblRestaurantName.Text = "Restaurant not found";
                }
            }
        }

        private void LoadMenuByRestaurant(int restaurantId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["FoodDeliveryConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT ItemName, Description, Price, Category, ImageUrl FROM MenuItems WHERE RestaurantID = @RestaurantID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@RestaurantID", restaurantId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                foreach (DataRow row in dt.Rows)
                {
                    if (row["ImageUrl"] != DBNull.Value)
                    {
                        row["ImageUrl"] = "~/" + row["ImageUrl"].ToString();
                    }
                }

                RestaurantMenuRepeater.DataSource = dt;
                RestaurantMenuRepeater.DataBind();
            }
        }

        protected void AddToCart_Command(object sender, CommandEventArgs e)
        {
            string[] itemData = e.CommandArgument.ToString().Split('|');
            string itemName = itemData[0];
            decimal price = Convert.ToDecimal(itemData[1]);
            string imageUrl = itemData[2];

            Dictionary<string, object> cartItem = new Dictionary<string, object>
    {
        { "ItemName", itemName },
        { "Price", price },
        { "ImageUrl", imageUrl }
    };

            List<Dictionary<string, object>> cart = Session["Cart"] as List<Dictionary<string, object>> ?? new List<Dictionary<string, object>>();
            cart.Add(cartItem);
            Session["Cart"] = cart;

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Item added to cart!');", true);
        }

    }
}
