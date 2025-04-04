<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Contact.aspx.cs" Inherits="QuickDish.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="container py-5">
        <div class="contact-section">
            <h3>Contact Us</h3>
            <p>
                We're here to help and answer any question you might have.
            </p>
        </div>

        <div class="row g-5 align-items-center">
            <div class="col-md-6">
                <img src="image/contact_us.jpg" alt="Contact QuickDish" class="img-fluid rounded shadow" />
            </div>

            <div class="col-md-6">
                <div class="card p-4 border-0 shadow-sm">
                    <h4 class="fw-bold mb-4" style="color: #dc4914;">Send Us a Message</h4>

                    <div class="form-group mb-3">
                        <label for="txtFullName">Full Name:</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvFullName" runat="server"
                            ControlToValidate="txtFullName"
                            ErrorMessage="Full name is required." CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="form-group mb-3">
                        <label for="txtEmail">Email Address:</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Email address is required." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server"
                            ControlToValidate="txtEmail"
                            ValidationExpression="\w+([-+.'']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ErrorMessage="Enter a valid email address." CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="form-group mb-3">
                        <label for="txtMessage">Message:</label>
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5"
                            CssClass="form-control" placeholder="Tell us how we can assist you..."></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMessage" runat="server"
                            ControlToValidate="txtMessage"
                            ErrorMessage="Message is required." CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <asp:Button ID="btnSubmit" runat="server" Text="Send Message"
                        CssClass="button" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>

        <div class="row mt-5">
            <div class="col text-center">
                <p class="text-muted">
                    Prefer direct communication? Reach us at <strong>support@quickdish.com</strong>
                    or call <strong>+1 (123) 456-7890</strong>.
                </p>
            </div>
        </div>
    </main>
</asp:Content>
