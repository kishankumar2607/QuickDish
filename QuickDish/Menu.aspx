<%@ Page Title="Menu Page" Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs"
    Inherits="QuickDish.Menu" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <!-- Header Section -->
        <div class="container text-center py-5">
            <h5 class="text-uppercase text-warning fw-bold mb-2">Our Menu</h5>
            <h2 class="fw-bold mb-3">Explore Our Delicious Menu Items</h2>
            <p class="text-muted">Enjoy a wide variety of meals made with love and premium ingredients.
            </p>
        </div>

        <!-- Menu Items Grid -->
        <div class="container pb-5">
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                <asp:Repeater ID="MenuRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col">
                            <div class="card h-100 border-0 shadow rounded-4">
                                <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>'
                                    alt='<%# Eval("ItemName") %>'
                                    class="card-img-top rounded-top-4"
                                    style="height: 220px; object-fit: cover;" />
                                <div class="card-body d-flex flex-column justify-content-between">
                                    <h5 class="card-title text-dark fw-bold"><%# Eval("ItemName") %></h5>
                                    <p class="card-text text-muted small mb-2"><%# Eval("Description") %></p>
                                    <p class="text-secondary mb-1"><strong>Category:</strong> <%# Eval("Category") %>
                                    </p>
                                    <div class="d-flex justify-content-between align-items-center mt-auto">
                                        <span class="fw-semibold text-primary">$<%# Eval("Price", "{0:F2}") %></span>
                                        <!--<button type="button" class="btn btn-outline-warning btn-sm px-3">Add to Cart</button>-->
                                        <asp:Button
                                            runat="server"
                                            Text="Add to Cart"
                                            CssClass="btn btn-outline-warning btn-sm px-3"
                                            CommandName="AddToCart"
                                            CommandArgument='<%# Eval("ItemName") + "|" + Eval("Price") + "|" + Eval("ImageUrl") %>'
                                            OnCommand="AddToCart_Command" />

                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </main>
</asp:Content>
