<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="QuickDish._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <div class="container mian-div">
            <div class="text-section">
                <h1>Dive into Delights Of Delectable <span>Food</span></h1>
                <p>
                    Where Each Plate Weaves a Story of Culinary Mastery and Passionate Craftsmanship
                </p>
                <div class="buttons">
                    <asp:Button ID="btnOrderNow" runat="server" CssClass="order-btn" Text="Order Now"
                        PostBackUrl="~/Menu.aspx" />
                    <asp:Button ID="btnWatchVideo" runat="server" CssClass="video-btn" Text="Watch Video" />
                </div>
            </div>
            <div class="image-section">
                <img src="image/banner.png" alt="banner" />
            </div>
        </div>

        <div class="container categories-container">
            <h3 class="subtitle">CUSTOMER FAVORITES</h3>
            <h2>Popular Categories</h2>
            <div class="categories">
                <div class="category-item">
                    <img src="image/burger.png" alt="Main Dish" />
                    <p>Main Dish</p>
                    <span>(86 dishes)</span>
                </div>
                <div class="category-item">
                    <img src="image/sandwitch.png" alt="Breakfast" />
                    <p>Breakfast</p>
                    <span>(12 breakfast)</span>
                </div>
                <div class="category-item">
                    <img src="image/dessert.png" alt="Dessert" />
                    <p>Dessert</p>
                    <span>(48 dessert)</span>
                </div>
                <div class="category-item">
                    <img src="image/soda.png" alt="Browse All" />
                    <p>Browse All</p>
                    <span>(255 items)</span>
                </div>
            </div>
        </div>

        <div class="container dishes-container">
            <h3 class="subtitle">SPECIAL DISHES</h3>
            <h2>Standout Dishes From Our Menu</h2>

            <div class="dish-grid">
                <asp:Repeater ID="rptDishes" runat="server" DataSourceID="SqlDataSourceDishes">
                    <ItemTemplate>
                        <div class="dish-item">
                            <div class="dish-img">
                                <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("ItemName") %>' />
                            </div>
                            <p class="dish-name"><%# Eval("ItemName") %></p>
                            <p class="dish-description"><%# Eval("Description") %></p>
                            <div class="dish-details">
                                <span class="dish-price"><strong>Price: </strong>$<%# Eval("Price", "{0:F2}") %></span>
                                <span class="dish-rating">&#9733; 4.9</span>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>


        <asp:SqlDataSource ID="SqlDataSourceDishes" runat="server"
            ConnectionString="<%$ ConnectionStrings:FoodDeliveryConnection %>"
            SelectCommand="SELECT TOP 6 ItemName, Description, Price, ImageUrl 
                   FROM MenuItems 
                   WHERE ImageUrl IS NOT NULL AND Description IS NOT NULL 
                   ORDER BY MenuItemID DESC">
        </asp:SqlDataSource>

        <div class="container testimonial-section">
            <div class="testimonial-image">
                <img src="image/chef.png" alt="Chef" />
            </div>
            <div class="testimonial-content">
                <h3 class="subtitle">TESTIMONIALS</h3>
                <h2>What Our Customers Say About Us</h2>
                <p>“I had the pleasure of dining at Foodi last night...”</p>
                <div class="testimonial-feedback">
                    <div class="testimonial-customer-image">
                        <img src="image/testimonial1.png" alt="Customer 1" class="testimonial1" />
                        <img src="image/testimonial2.png" alt="Customer 2" class="testimonial2" />
                        <img src="image/testimonial3.png" alt="Customer 3" class="testimonial3" />
                    </div>
                    <div class="feedback">
                        <h3>Customer Feedback</h3>
                        <span class="rating">&#9733; 4.9</span>
                        <span>(18.6k Reviews)</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="container services-section">
            <div class="services-content">
                <h3 class="subtitle">OUR STORY & SERVICES</h3>
                <h2>Our Culinary Journey And Services</h2>
                <p>Rooted in passion, we curate unforgettable dining experiences...</p>
                <asp:Button ID="btnExplore" runat="server" Text="Explore" cssClass="order-btn" OnClick="btnExplore_Click" />
            </div>
            <div class="services-cards">
                <div class="service-card">
                    <img src="image/catering.png" alt="catering-image" />
                    <h4>CATERING</h4>
                    <p>Delight your guests with our flavors and presentation</p>
                </div>
                <div class="service-card">
                    <img src="image/fast-delivery.png" alt="fast-delivery-image" />
                    <h4>FAST DELIVERY</h4>
                    <p>We deliver your order promptly to your door</p>
                </div>
                <div class="service-card">
                    <img src="image/shopping-cart-check.png" alt="shopping-cart-image" />
                    <h4>ONLINE ORDERING</h4>
                    <p>Explore menu & order with ease using our Online Ordering</p>
                </div>
                <div class="service-card">
                    <img src="image/gift.png" alt="gift-image" />
                    <h4>GIFT CARDS</h4>
                    <p>Give the gift of exceptional dining with Foodi Gift Cards</p>
                </div>
            </div>
        </div>
    </main>

</asp:Content>
