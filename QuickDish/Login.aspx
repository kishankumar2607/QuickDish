<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QuickDish.Login"
    MasterPageFile="~/Site.Master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <main class="py-5 my-2">
        <div class="container d-flex flex-column align-items-center justify-content-center">
            <section class="text-center">
                <h2 class="fw-bold text-black mb-5">Welcome Back! Please Log In</h2>
            </section>

            <section class="login-div p-4">
                <div class="form-group mb-4">
                    <label for="txtEmail" class="pb-0">Email Address:</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator
                        ID="rfvEmail"
                        runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email Address is required."
                        Display="Dynamic"
                        CssClass="error" />
                    <asp:RegularExpressionValidator
                        ID="revEmail"
                        runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Enter a valid email address."
                        ValidationExpression="\w+([-+.'']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        Display="Dynamic"
                        CssClass="error" />
                </div>

                <div class="form-group mb-4">
                    <label for="txtPassword" class="pb-0">Password:</label>
                    <asp:TextBox
                        ID="txtPassword"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Password" />
                    <asp:RequiredFieldValidator
                        ID="rfvPassword"
                        runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="Password is required."
                        Display="Dynamic"
                        CssClass="error" />
                </div>

                <div class="register-account">
                    <p>Don't have an account </p><a href="Register">Register</a>
                </div>

                <div class="d-flex align-items-center justify-content-center gap-4">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="button py-2" OnClick="btnLogin_Click" />
                </div>
            </section>
        </div>
    </main>

</asp:Content>
