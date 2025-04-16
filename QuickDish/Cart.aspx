<%@ Page Title="Cart" Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs"
    Inherits="QuickDish.Cart" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main class="container py-5">

        <div class="welcome-div">
            <asp:Label ID="WelcomeLabel" runat="server" CssClass="cart-welcome-msg"></asp:Label>
            <asp:Label ID="EmptyCartLabel" runat="server" Text="Your cart is empty." CssClass="cart-emplty-msg"
                Visible="false" />
        </div>


        <asp:Panel ID="CartPanel" runat="server" Visible="false">
            <h2 class="mb-5 text-center fw-bold text-black">Your Cart</h2>

            <asp:Label ID="QuantityMessageLabel" runat="server" CssClass="text-danger fw-semibold d-block mb-3"
                Visible="false"></asp:Label>

            <asp:GridView
                ID="CartGridView"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-bordered text-center">
                <Columns>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' style="height: 80px;" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                    <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Button ID="btnDecrease" runat="server" Text="-" CommandName="Decrease" CommandArgument='<%# Eval("ItemName") %>'
                                CssClass="btn btn-outline-secondary btn-sm me-1" />
                            <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>' CssClass="mx-2" />
                            <asp:Button ID="btnIncrease" runat="server" Text="+" CommandName="Increase" CommandArgument='<%# Eval("ItemName") %>'
                                CssClass="btn btn-outline-secondary btn-sm ms-1" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Remove">
                        <ItemTemplate>
                            <asp:Button ID="RemoveButton" runat="server" Text="Remove" CssClass="btn btn-danger btn-sm"
                                CommandName="Remove" CommandArgument='<%# Eval("ItemName") %>' OnCommand="RemoveFromCart_Command" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div class="total-items-container">
                <p>
                    <strong>Total Items:</strong>
                    <asp:Label ID="TotalItemsLabel" runat="server" Text="0"></asp:Label>
                </p>
                <p>
                    <strong>Subtotal (before tax):</strong> $<asp:Label ID="SubtotalLabel" runat="server"
                        Text="0.00"></asp:Label>
                </p>
                <p><strong>Tax (13%):</strong> $<asp:Label ID="TaxLabel" runat="server" Text="0.00"></asp:Label>
                </p>
                <h4><strong>Total:</strong> $<asp:Label ID="TotalPriceLabel" runat="server" Text="0.00"></asp:Label>
                </h4>
            </div>


            <div class="clear-proced-button">
                <asp:Button ID="ClearCartButton" runat="server" Text="Clear Cart" CssClass="btn btn-warning"
                    OnClick="ClearCartButton_Click" />

                <asp:Button ID="CheckoutButton" runat="server" Text="Proceed to Checkout" CssClass="btn btn-success float-right"
                    OnClick="CheckoutButton_Click" />
            </div>
            <asp:Label ID="CheckoutMessageLabel" runat="server" CssClass="text-danger fw-semibold mt-3 d-block"
                Visible="false" />

        </asp:Panel>

    </main>


</asp:Content>
