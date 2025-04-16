<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="QuickDish.Checkout" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="container py-5">
        <h2 class="text-center mb-4">Checkout</h2>

        <!-- Checkout Form -->
        <asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="text-danger mb-3" />

        <!-- Full Name -->
        <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" placeholder="Enter your full name" required="true"></asp:TextBox>
        <asp:RequiredFieldValidator ID="NameValidator" runat="server" ControlToValidate="NameTextBox" InitialValue="Enter your full name" ErrorMessage="Name is required" ForeColor="Red" Display="Dynamic" />

        <!-- Email -->
        <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control mt-3" placeholder="Enter your email" required="true"></asp:TextBox>
        <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ControlToValidate="EmailTextBox" InitialValue="Enter your email" ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic" />
        <asp:RegularExpressionValidator ID="EmailRegexValidator" runat="server" ControlToValidate="EmailTextBox" ValidationExpression="^\S+@\S+\.\S+$" ErrorMessage="Please enter a valid email" ForeColor="Red" Display="Dynamic" />

        <!-- Phone Number -->
        <asp:TextBox ID="PhoneTextBox" runat="server" CssClass="form-control mt-3" placeholder="Enter your phone number" required="true"></asp:TextBox>
        <asp:RequiredFieldValidator ID="PhoneValidator" runat="server" ControlToValidate="PhoneTextBox" InitialValue="Enter your phone number" ErrorMessage="Phone number is required" ForeColor="Red" Display="Dynamic" />

        <!-- Address -->
        <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control mt-3" placeholder="Enter your address" required="true"></asp:TextBox>
        <asp:RequiredFieldValidator ID="AddressValidator" runat="server" ControlToValidate="AddressTextBox" InitialValue="Enter your address" ErrorMessage="Address is required" ForeColor="Red" Display="Dynamic" />

        <!-- Postal Code (Canadian) -->
        <asp:TextBox ID="PostalCodeTextBox" runat="server" CssClass="form-control mt-3" placeholder="Enter your postal code" required="true"></asp:TextBox>
        <asp:RequiredFieldValidator ID="PostalCodeValidator" runat="server" ControlToValidate="PostalCodeTextBox" InitialValue="Enter your postal code" ErrorMessage="Postal code is required" ForeColor="Red" Display="Dynamic" />
        <asp:RegularExpressionValidator ID="PostalCodeRegexValidator" runat="server" ControlToValidate="PostalCodeTextBox" ValidationExpression="^[A-Za-z]\d[A-Za-z][ -]?\d[A-Za-z]\d$" ErrorMessage="Please enter a valid Canadian postal code (e.g., K1A 0B1)" ForeColor="Red" Display="Dynamic" />

        <!-- Province -->
        <asp:DropDownList ID="ProvinceDropDown" runat="server" CssClass="form-control mt-3">
            <asp:ListItem Text="Select Province" Value="" />
            <asp:ListItem Text="Alberta" Value="AB" />
            <asp:ListItem Text="British Columbia" Value="BC" />
            <asp:ListItem Text="Manitoba" Value="MB" />
            <asp:ListItem Text="New Brunswick" Value="NB" />
            <asp:ListItem Text="Newfoundland and Labrador" Value="NL" />
            <asp:ListItem Text="Nova Scotia" Value="NS" />
            <asp:ListItem Text="Ontario" Value="ON" />
            <asp:ListItem Text="Prince Edward Island" Value="PE" />
            <asp:ListItem Text="Quebec" Value="QC" />
            <asp:ListItem Text="Saskatchewan" Value="SK" />
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="ProvinceValidator" runat="server" ControlToValidate="ProvinceDropDown" InitialValue="Select Province" ErrorMessage="Province is required" ForeColor="Red" Display="Dynamic" />

        <!-- Credit Card Number -->
        <asp:TextBox ID="CardNumberTextBox" runat="server" CssClass="form-control mt-3" placeholder="Enter your credit card number" required="true"></asp:TextBox>
        <asp:RequiredFieldValidator ID="CardNumberValidator" runat="server" ControlToValidate="CardNumberTextBox" InitialValue="Enter your credit card number" ErrorMessage="Credit card number is required" ForeColor="Red" Display="Dynamic" />
        <asp:RegularExpressionValidator ID="CardNumberRegexValidator" runat="server" ControlToValidate="CardNumberTextBox" ValidationExpression="^\d{16}$" ErrorMessage="Please enter a valid 16-digit credit card number" ForeColor="Red" Display="Dynamic" />

        <!-- Expiry Date -->
        <asp:TextBox ID="ExpiryDateTextBox" runat="server" CssClass="form-control mt-3" placeholder="Enter card expiry date (MM/YY)" required="true"></asp:TextBox>
        <asp:RequiredFieldValidator ID="ExpiryDateValidator" runat="server" ControlToValidate="ExpiryDateTextBox" InitialValue="Enter card expiry date" ErrorMessage="Expiry date is required" ForeColor="Red" Display="Dynamic" />
        <asp:RegularExpressionValidator ID="ExpiryDateRegexValidator" runat="server" ControlToValidate="ExpiryDateTextBox" ValidationExpression="^(0[1-9]|1[0-2])\/([0-9]{2})$" ErrorMessage="Please enter a valid expiry date (MM/YY)" ForeColor="Red" Display="Dynamic" />

        <!-- CVV -->
        <asp:TextBox ID="CvvTextBox" runat="server" CssClass="form-control mt-3" placeholder="Enter card CVV" required="true"></asp:TextBox>
        <asp:RequiredFieldValidator ID="CvvValidator" runat="server" ControlToValidate="CvvTextBox" InitialValue="Enter card CVV" ErrorMessage="CVV is required" ForeColor="Red" Display="Dynamic" />
        <asp:RegularExpressionValidator ID="CvvRegexValidator" runat="server" ControlToValidate="CvvTextBox" ValidationExpression="^\d{3}$" ErrorMessage="Please enter a valid 3-digit CVV" ForeColor="Red" Display="Dynamic" />

        <!-- Proceed to Payment -->
        <asp:Button ID="ProceedButton" runat="server" Text="Proceed to Payment" CssClass="btn btn-success mt-3" OnClick="ProceedButton_Click" />
    </main>
</asp:Content>
