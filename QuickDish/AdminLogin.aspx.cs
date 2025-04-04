using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuickDish
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string hashedPassword = HashPassword(password);

            string cs = ConfigurationManager.ConnectionStrings["FoodDeliveryConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT FirstName FROM Users WHERE Email = @Email AND PasswordHash = @PasswordHash AND UserType = 'Admin'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@PasswordHash", hashedPassword);
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    string firstName = reader["FirstName"].ToString();

                    HttpCookie adminCookie = new HttpCookie("QuickDishUser");
                    adminCookie["FirstName"] = firstName;
                    adminCookie["UserType"] = "Admin";
                    adminCookie.Expires = DateTime.Now.AddDays(1);
                    Response.Cookies.Add(adminCookie);

                    Session["firstName"] = firstName;
                    Session["UserType"] = "Admin";

                    Response.Redirect("Home");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Invalid admin credentials.');", true);
                }
            }
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = Encoding.UTF8.GetBytes(password);
                byte[] hash = sha256.ComputeHash(bytes);
                StringBuilder sb = new StringBuilder();
                foreach (byte b in hash)
                {
                    sb.Append(b.ToString("x2"));
                }
                return sb.ToString();
            }
        }
    }
}