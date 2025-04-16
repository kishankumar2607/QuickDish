# 🍽️ QuickDish - Online Food Ordering Web App with Admin Portal

**QuickDish** is a responsive ASP.NET Web Forms food ordering platform where customers can explore restaurants, browse menus, and place orders. Admins can manage restaurants, menu items, and orders through a secured dashboard. The application supports real-time cart management, restaurant-wise menu display, and order checkout with validation.

---

## 📌 Features

### 👤 Customer Side
- Explore a curated list of restaurants with logos and descriptions
- View menu items **specific to selected restaurant**
- Add items to cart with adjustable quantity and stock limits
- View cart summary with:
  - Subtotal, tax (13%), and total
  - Quantity adjustments with +/- buttons
- Checkout page with full form validation (email, card, postal code)
- Order summary in the checkout section
- Confirmation screen after checkout

### 🔐 Admin Portal
- Admin login (auth system placeholder for integration)
- Manage:
  - Restaurants (add/edit/delete + image)
  - Menu items per restaurant (with categories and images)
  - Order and cart data (view only)
- GridView + DetailsView with validation
- Backend form validation using ASP.NET Validators

---

## 🧱 Tech Stack

| Technology         | Purpose                                |
|--------------------|----------------------------------------|
| ASP.NET Web Forms  | Core framework                         |
| C#                 | Server-side logic                      |
| SQL Server / MDF   | Database storage                       |
| ADO.NET / SqlDataSource | DB access                          |
| Bootstrap 5        | UI styling and responsiveness          |
| HTML/CSS/JS        | Frontend                               |
| GridView / Repeater| Data binding & presentation            |

---

## 📂 Project Structure

```
QuickDish/
│
├── App_Data/
│   └── FoodDeliveryDB.mdf             # Database
│
├── Admin/
│   └── Admin.aspx                     # Admin management dashboard
│
├── Pages/
│   ├── Home.aspx                      # Landing Page
│   ├── Restaurants.aspx               # Lists all restaurants
│   ├── RestaurantMenu.aspx?id={id}    # Restaurant-wise menu
│   ├── Menu.aspx                      # General menu
│   ├── Cart.aspx                      # Cart with quantity control
│   ├── Checkout.aspx                  # Order placement
│   └── Confirmation.aspx              # Order success
│
├── image/
│   └── restaurants/                   # Restaurant logos
│   └── menu/                          # Food images
│
├── Site.Master                        # Common layout
├── Web.config                         # Configuration & connection string
└── README.md
```

---

## 🚀 Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/kishankumar2607/QuickDish.git
   ```

2. **Open in Visual Studio**
   - Open `QuickDish.sln`
   - Ensure `FoodDeliveryDB.mdf` exists under `App_Data`

3. **Update Connection String (if required)**
   Inside `Web.config`:
   ```xml
   <connectionStrings>
     <add name="FoodDeliveryConnection"
          connectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\FoodDeliveryDB.mdf;Integrated Security=True"
          providerName="System.Data.SqlClient" />
   </connectionStrings>
   ```

4. **Run the Project**
   - Press `F5` or click **Start**
   - Browse: `Home`, `Restaurants`, `Menu`, `Cart`, `Checkout`

5. **Admin Login**
   (Authentication placeholder — can be extended with login page + database credentials)

---

## 🖼️ Restaurants Sample

Here are some of the restaurants preloaded in the database:

| Name              | Description               | Location     |
|-------------------|---------------------------|--------------|
| Pizza Palace       | Authentic Italian Pizza   | Downtown     |
| Sushi World        | Fresh Sushi and Rolls     | Midtown      |
| Taco Time          | Mexican food fast & fresh | Eastside     |
| Curry House        | Spicy Indian Cuisine      | South End    |
| Green Fork Vegan   | Healthy plant-based meals | Green Lane   |
| Spice Route Bistro | Bold and aromatic flavors | River Market |

---

## 🛒 Cart & Checkout Features

- Quantity controlled with +/- buttons (1–10 range)
- Live total updates
- Cart stores items using session
- Checkout form includes:
  - Required fields
  - Email & CVV pattern validation
  - Order summary: Subtotal, Tax, Total

---

## ✅ Accessibility & UI

- Clean and mobile-friendly with Bootstrap
- Contrast compliant color choices
- Dynamic validations using ASP.NET

---

## 👥 Team

- Kishan Kumar Das
- Bibin Tom Joseph
- Jithin Thomas Jacob
- Al Shifan Sajida Beevi Hussain
- Shantha Kumar
- Kasivishwanadham Thota

---

## 📧 Contact

Questions or feedback?  
Open an issue or message [@kishankumar2607](https://github.com/kishankumar2607) on GitHub.
