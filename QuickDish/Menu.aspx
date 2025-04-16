<%@ Page Title="Menu" Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs"
    Inherits="QuickDish.Menu" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <div class="menu-hero-banner mb-5">
            <h1>Explore the Best Dishes in Town</h1>
            <p class="lead mt-3">
                Delicious meals delivered fresh from your favorite restaurants
            </p>
            <asp:Button ID="btnExplore" runat="server" Text="Order Now" CssClass="button order-now-button"
                PostBackUrl="~/Restaurants.aspx" />
        </div>

        <div class="container text-center py-4 menu-section">
            <h5 class="subtitle">Our Menu</h5>
            <h2 class="fw-bold mb-3 text-black mt-2">Explore Our Delicious Menu Items</h2>
            <p class="text-muted mb-4 fs-5">
                Enjoy a wide variety of meals made with love and premium
                ingredients.
            </p>
        </div>

        <div class="container pb-5">
            <div class="menu-grid">
                <asp:Repeater ID="MenuRepeater" runat="server">
                    <ItemTemplate>
                        <div class="menu-item">
                            <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>'
                                alt='<%# Eval("ItemName") %>'
                                class="menu-item-image" />
                            <div class="menu-item-content">
                                <h5><%# Eval("ItemName") %></h5>
                                <p><%# Eval("Description") %></p>
                                <div class="d-flex align-items-center justify-content-between mt-2 mb-2">
                                    <p>
                                        <strong>Category:</strong> <%# Eval("Category") %>
                                    </p>
                                    <p>
                                        <strong>Price:</strong> $<%# Eval("Price", "{0:F2}") %>
                                    </p>
                                </div>
                                <div class="d-flex justify-content-center align-items-center mt-1">
                                    <asp:Button
                                        runat="server"
                                        Text="Add to Cart"
                                        CssClass="menu-add-to-cart-button"
                                        CommandName="AddToCart"
                                        CommandArgument='<%# Eval("ItemName") + "|" + Eval("Price") + "|" + Eval("ImageUrl") %>'
                                        OnCommand="AddToCart_Command" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <div class="menu-cta-button">
            <div class="cta-section">
                <h2 class="fw-bold text-white">Hungry Already?</h2>
                <p class="text-white fw-semibold mt-3 mb-4 fs-5">
                    Place your order now and enjoy the taste of freshly prepared
                dishes.
                </p>
                <asp:Button ID="btnOrderNow" runat="server" Text="Go to Cart" CssClass="cta-button"
                    PostBackUrl="~/Cart.aspx" />
            </div>
        </div>

    </main>
</asp:Content>
