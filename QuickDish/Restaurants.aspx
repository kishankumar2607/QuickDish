<%@ Page Title="Restaurants Page" Language="C#" AutoEventWireup="true" CodeBehind="Restaurants.aspx.cs"
    Inherits="QuickDish.Restaurants" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="container py-5">
        <h2 class="text-center mb-4">Explore Our Restaurants</h2>

        <asp:Repeater ID="RestaurantRepeater" runat="server" DataSourceID="SqlDataSourceRestaurants">
            <ItemTemplate>
                <div class="card mb-4 shadow-sm p-3">
                    <div class="row g-0 align-items-center">
                        <div class="col-md-3">
                            <img src='<%# Eval("Image") %>' class="img-fluid rounded" alt='<%# Eval("Name") %>' />
                        </div>
                        <div class="col-md-9">
                            <h4 class="text-dark"><%# Eval("Name") %></h4>
                            <p class="text-muted mb-2"><%# Eval("Description") %></p>
                            <asp:Button ID="btnViewMenu" runat="server" Text="View Menu"
                                PostBackUrl='<%# Eval("RestaurantID", "RestaurantMenu.aspx?id={0}") %>' CssClass="btn btn-outline-primary" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <asp:SqlDataSource ID="SqlDataSourceRestaurants" runat="server"
            ConnectionString="<%$ ConnectionStrings:FoodDeliveryConnection %>"
            SelectCommand="SELECT RestaurantID, Name, Description, Image FROM Restaurants">
        </asp:SqlDataSource>
    </main>
</asp:Content>
