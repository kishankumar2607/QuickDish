<%@ Page Title="Restaurants Page" Language="C#" AutoEventWireup="true" CodeBehind="Restaurants.aspx.cs"
    Inherits="QuickDish.Restaurants" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="container py-5">
        <div class="restaurant-main-div">
            <h1>Find the Best Restaurants Near You</h1>
            <p>Explore our curated list of top-rated restaurants offering delicious dishes delivered
                to your doorstep.</p>
        </div>

        <div class="row">
            <asp:Repeater ID="RestaurantRepeater" runat="server" DataSourceID="SqlDataSourceRestaurants">
                <ItemTemplate>
                    <div class="col-md-6 col-lg-3 g-4 mb-5">
                        <div class="card h-100 border-0">
                            <img src='<%# Eval("Image") %>' class="card-img-top" alt='<%# Eval("Name") %>' style="height: 320px;
                                object-fit: cover;" />
                            <div class="card-body d-flex flex-column">
                                <h4><%# Eval("Name") %></h4>
                                <p><%# Eval("Description") %></p>
                                <p><strong>Location: </strong><%# Eval("Location") %></p>
                                <p><strong>Contact: </strong><%# Eval("ContactNumber") %></p>
                                <asp:Button ID="btnViewMenu" runat="server" Text="View Menu"
                                    PostBackUrl='<%# Eval("RestaurantID", "RestaurantMenu.aspx?id={0}") %>'
                                    CssClass="menu-add-to-cart-button mt-2" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <asp:SqlDataSource ID="SqlDataSourceRestaurants" runat="server"
            ConnectionString="<%$ ConnectionStrings:FoodDeliveryConnection %>"
            SelectCommand="SELECT RestaurantID, Name, Description, Location, ContactNumber, Image FROM Restaurants">
        </asp:SqlDataSource>

        <div class="menu-cta-button">
            <div class="cta-section">
                <h2 class="fw-bold text-white">Craving something delicious?</h2>
                <p class="text-white fw-semibold mt-3 mb-4 fs-5">
                    Browse menus and order your favorite dishes now.
                </p>
                <asp:Button ID="btnOrderNow" runat="server" Text="Explore Menu" CssClass="cta-button"
                    PostBackUrl="~/Menu.aspx" />
            </div>
        </div>
    </main>
</asp:Content>
