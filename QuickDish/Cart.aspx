<%@ Page Title="Cart Page" Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="QuickDish.Cart" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="container py-5">
        <h2 class="mb-4 text-center">Your Cart</h2>

        <asp:GridView 
            ID="CartGridView" 
            runat="server" 
            AutoGenerateColumns="False" 
            CssClass="table table-bordered text-center">
            <Columns>
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' style="height:80px;" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                <asp:TemplateField HeaderText="Quantity">
                    <ItemTemplate>
                        <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Eval("Quantity") %>' Width="40px" OnTextChanged="QuantityTextBox_TextChanged" AutoPostBack="True"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Remove">
                    <ItemTemplate>
                        <asp:Button ID="RemoveButton" runat="server" Text="Remove" CssClass="btn btn-danger btn-sm" CommandName="Remove" CommandArgument='<%# Eval("ItemName") %>' OnCommand="RemoveFromCart_Command" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <!-- Display Total Price -->
        <div class="mt-4 text-right">
            <h4>Total: $<asp:Label ID="TotalPriceLabel" runat="server" Text="0.00"></asp:Label></h4>
        </div>

        <div class="mt-4">
            <asp:Button ID="ClearCartButton" runat="server" Text="Clear Cart" CssClass="btn btn-warning" OnClick="ClearCartButton_Click" />
            <a href="Checkout.aspx" class="btn btn-success float-right">Proceed to Checkout</a>
        </div>

        <asp:Label 
            ID="EmptyCartLabel" 
            runat="server" 
            Text="Your cart is empty." 
            CssClass="text-danger fs-5" 
            Visible="false" />
    </main>
</asp:Content>
