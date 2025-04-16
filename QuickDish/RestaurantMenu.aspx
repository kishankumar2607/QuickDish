<%@ Page Title="Restaurant Menu" Language="C#" AutoEventWireup="true" CodeBehind="RestaurantMenu.aspx.cs"
    Inherits="QuickDish.RestaurantMenu" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class="container text-center py-4 menu-section">
            <h5 class="subtitle">Menu</h5>
            <h2 class="text-center mb-4">
    <asp:Label ID="lblRestaurantName" runat="server" CssClass="fw-bold text-primary fs-2"></asp:Label>
</h2>

            <p class="text-muted mb-4 fs-5">Delicious items crafted just for you!</p>
        </div>

        <div class="container pb-5">
            <div class="menu-grid">
                <asp:Repeater ID="RestaurantMenuRepeater" runat="server">
                    <ItemTemplate>
                        <div class="menu-item">
                            <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' alt='<%# Eval("ItemName") %>'
                                class="menu-item-image" />
                            <div class="menu-item-content">
                                <h5><%# Eval("ItemName") %></h5>
                                <p><%# Eval("Description") %></p>
                                <div class="d-flex align-items-center justify-content-between mt-2 mb-2">
                                    <p><strong>Category:</strong> <%# Eval("Category") %></p>
                                    <p><strong>Price:</strong> $<%# Eval("Price", "{0:F2}") %></p>
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
                <h2 class="fw-bold text-white">Like Something?</h2>
                <p class="text-white fw-semibold mt-3 mb-4 fs-5">Head to your cart and complete your
                    order.</p>
                <asp:Button ID="btnOrderNow" runat="server" Text="Go to Cart" CssClass="cta-button"
                    PostBackUrl="~/Cart.aspx" />
            </div>
        </div>
    </main>
</asp:Content>
