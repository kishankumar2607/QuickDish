<%@ Page Title="Restaurant Menu" Language="C#" AutoEventWireup="true" CodeBehind="RestaurantMenu.aspx.cs"
    Inherits="QuickDish.RestaurantMenu" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>

        <div class="restaurant-hero-banner">
            <h1 class="display-5 fw-bold text-primary">Welcome to</h1>
            <h2 class="text-dark fw-bold mb-3">
                <asp:Label ID="lblRestaurantName" runat="server"></asp:Label>
            </h2>
            <p class="lead text-muted fs-5 px-3">
                Dive into our exclusive selection of handcrafted dishes, made with passion and fresh
                ingredients.
            </p>
        </div>

        <div class="container text-center menu-section">
            <h5 class="subtitle">Featured Dishes</h5>
            <h2 class="fw-bold mt-3 mb-2 text-black">What’s Cooking at
                <asp:Label ID="lblRestaurantName2" runat="server" /></h2>
            <p class="text-muted mb-5 fs-5">
                Explore the top picks from this restaurant’s kitchen,
                curated to delight your taste buds.
            </p>

            <div class="menu-grid">
                <asp:Repeater ID="RestaurantMenuRepeater" runat="server">
                    <ItemTemplate>
                        <div class="menu-item">
                            <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' alt='<%# Eval("ItemName") %>'
                                class="menu-item-image" />
                            <div class="menu-item-content">
                                <h5 class="text-dark fw-bold mb-1"><%# Eval("ItemName") %></h5>
                                <p class="text-muted small mb-2"><%# Eval("Description") %></p>
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

        <div class="menu-cta-button mt-5">
            <div class="cta-section text-center bg-dark py-5">
                <h2 class="fw-bold text-white">Like Something?</h2>
                <p class="text-white fw-semibold mt-3 mb-4 fs-5">
                    Head to your cart and complete your
                    order before someone else does!
                </p>
                <asp:Button ID="btnOrderNow" runat="server" Text="Go to Cart" CssClass="cta-button"
                    PostBackUrl="~/Cart.aspx" />
            </div>
        </div>
    </main>
</asp:Content>
