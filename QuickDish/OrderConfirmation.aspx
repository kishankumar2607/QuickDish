<%@ Page Title="Order Confirmation Page" Language="C#" AutoEventWireup="true" CodeBehind="OrderConfirmation.aspx.cs"
    Inherits="QuickDish.OrderConfirmation" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class="confirmation-container-main">
            <div class="confirmation-container">
                <h1>Your order has been successfully placed!</h1>
                <p>Thank you for shopping with us.</p>
                <asp:Button ID="btnReturnHome" runat="server" CssClass="button"
                    Text="Return to Home" OnClick="btnReturnHome_Click" />
            </div>
        </div>
    </main>
</asp:Content>

