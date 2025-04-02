
# 🍽️ QuickDish - Online Food Delivery Website with Admin Portal

**QuickDish** is a responsive ASP.NET Web Forms eCommerce platform designed for online food ordering and delivery. It allows customers to browse restaurants, view menus, add items to a cart, and place orders. Admin users can manage restaurant listings, menu items, orders, and user accounts through a secure backend panel.

---

## 📌 Features

### 👤 Customer Side
- View a list of restaurants with images and descriptions
- Browse menu items by restaurant and category
- Add items to a shopping cart and place an order
- View order summary and order confirmation
- Leave reviews for menu items

### 🔐 Admin Panel
- Admin login and authentication
- Add/Edit/Delete:
  - Restaurants (with image)
  - Menu Items (with images, descriptions, categories)
  - Orders and their status
- View customer reviews and order history
- GridView-based data management
- Form validation using ASP.NET validators

---

## 🧱 Tech Stack

| Technology         | Purpose                                |
|--------------------|----------------------------------------|
| ASP.NET Web Forms  | Main web framework                     |
| C#                 | Backend logic                          |
| SQL Server / MDF   | Database (stored in `App_Data`)        |
| ADO.NET / SqlDataSource | Database access                    |
| Bootstrap          | Responsive design                      |
| HTML/CSS/JS        | Frontend                              |
| GridView & Repeater| Data display and editing               |

---

## 📂 Project Structure

```
QuickDish/
│
├── App_Data/
│   └── FoodDeliveryDB.mdf         # SQL Server database file
│
├── Admin/
│   ├── Login.aspx
│   ├── Dashboard.aspx
│   ├── ManageRestaurants.aspx
│   └── ManageMenu.aspx
│
├── image/
│   └── restaurants/                    # Contains restaurant and food images
│
├── Pages/
│   ├── Home.aspx
│   ├── Restaurants.aspx
│   ├── Menu.aspx
│   ├── Cart.aspx
│   ├── Checkout.aspx
│   └── Confirmation.aspx
│
├── Site.Master                    # Master page
├── Web.config                     # Config & DB connection
└── README.md
```

---

## 🛠️ Setup Instructions

1. **Clone or Download the Project**
   ```bash
   git clone https://github.com/kishankumar2607/QuickDish.git
   ```

2. **Open in Visual Studio**
   - Open the `.sln` file in Visual Studio.
   - Ensure the `.mdf` file is present in `App_Data`.

3. **Update Connection String (if needed)**
   In `Web.config`, update:
   ```xml
   <connectionStrings>
     <add name="FoodDeliveryConnection"
          connectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\FoodDeliveryDB.mdf;Integrated Security=True"
          providerName="System.Data.SqlClient" />
   </connectionStrings>
   ```

4. **Run the Project**
   - Press `F5` or click `Start` to run the application.
   - Navigate between customer and admin views.

5. **Login Details**
   - **Admin Email:** `bob@example.com`
   - **Password:** (As hashed in DB - set up login handler accordingly)

---

## 🖼️ Demo Images

Images are stored in the `/image` folder and linked in the database under the `Image` fields for both restaurants and menu items.

---

## ✅ Accessibility & Responsive Design

- All text colors meet contrast standards using [WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/)
- Bootstrap ensures mobile responsiveness
- Input validation with ASP.NET Validators for all forms

---

## 📣 Team

- Kishan Kumar Das
- Bibin Tom Joseph
- Jithin Thomas Jacob
- Shantha Kumar
- Kasivishwanadham Thota

---

## 📧 Contact

Have questions or suggestions? Feel free to open an issue or contact the project contributor.
