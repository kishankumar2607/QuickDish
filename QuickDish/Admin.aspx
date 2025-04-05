<%@ Page Language="C#" Title="Admin" AutoEventWireup="true" CodeBehind="Admin.aspx.cs"
    Inherits="QuickDish.Admin" MasterPageFile="~/Site.Master" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .header {
            text-align: center;
            margin-bottom: 30px;
        }

            .header h1 {
                font-size: 2.5rem;
                font-weight: bold;
            }

        .form-control, .btn {
            border-radius: 6px;
        }

        .text-danger {
            color: red;
            font-size: 0.9rem;
        }
    </style>

    <div class="container py-4">
        <div class="header">
            <h1>Admin Dashboard</h1>
            <p>Manage Restaurants and Menu Items</p>
        </div>

        <div class="mb-4">
            <asp:DropDownList ID="ddlAdminView" runat="server" AutoPostBack="true" CssClass="form-control w-50 mx-auto"
                OnSelectedIndexChanged="ddlAdminView_SelectedIndexChanged">
                <asp:ListItem Text="Restaurants" Value="Restaurants" />
                <asp:ListItem Text="Menu Items" Value="MenuItems" />
            </asp:DropDownList>
        </div>

        <asp:Panel ID="pnlRestaurants" runat="server">
            <div class="card p-4 mb-4">
                <h3 class="text-center fw-bold mb-3">Restaurant List</h3>
                <asp:GridView ID="gvRestaurants" runat="server" AutoGenerateColumns="False" DataKeyNames="RestaurantID"
                    CssClass="table table-bordered" DataSourceID="SqlDataSourceRestaurants" AllowPaging="true"
                    AllowSorting="true">
                    <Columns>
                        <asp:BoundField DataField="RestaurantID" HeaderText="ID" ReadOnly="true" />

                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate><%# Eval("Name") %></ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtNameEdit" runat="server" Text='<%# Bind("Name") %>' CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="rfvNameEdit" runat="server" ControlToValidate="txtNameEdit"
                                    ErrorMessage="Name is required." Display="Dynamic" CssClass="text-danger" ValidationGroup="EditGroup" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Image URL">
                            <ItemTemplate><%# Eval("Image") %></ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtImageEdit" runat="server" Text='<%# Bind("Image") %>' CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="rfvImageEdit" runat="server" ControlToValidate="txtImageEdit"
                                    ErrorMessage="Image URL is required." Display="Dynamic" CssClass="text-danger"
                                    ValidationGroup="EditGroup" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate><%# Eval("Description") %></ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDescEdit" runat="server" Text='<%# Bind("Description") %>' CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="rfvDescEdit" runat="server" ControlToValidate="txtDescEdit"
                                    ErrorMessage="Description is required." Display="Dynamic" CssClass="text-danger"
                                    ValidationGroup="EditGroup" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Location">
                            <ItemTemplate><%# Eval("Location") %></ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtLocationEdit" runat="server" Text='<%# Bind("Location") %>' CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="rfvLocationEdit" runat="server" ControlToValidate="txtLocationEdit"
                                    ErrorMessage="Location is required." Display="Dynamic" CssClass="text-danger"
                                    ValidationGroup="EditGroup" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Contact Number">
                            <ItemTemplate><%# Eval("ContactNumber") %></ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtContactEdit" runat="server" Text='<%# Bind("ContactNumber") %>'
                                    CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="rfvContactEdit" runat="server" ControlToValidate="txtContactEdit"
                                    ErrorMessage="Contact number is required." Display="Dynamic" CssClass="text-danger"
                                    ValidationGroup="EditGroup" />
                                <asp:RegularExpressionValidator ID="revContactEdit" runat="server"
                                    ControlToValidate="txtContactEdit"
                                    ValidationExpression="^\d{10}$"
                                    ErrorMessage="Enter 10 digit contact number."
                                    Display="Dynamic" CssClass="text-danger" ValidationGroup="EditGroup" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-primary btn-sm" />
                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" Text="Delete"
                                    CssClass="btn btn-danger btn-sm"
                                    OnClientClick="return confirm('Are you sure you want to delete this restaurant?');" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" Text="Update"
                                    CssClass="btn btn-success btn-sm" ValidationGroup="EditGroup" />
                                <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel"
                                    CssClass="btn btn-secondary btn-sm" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </div>

            <asp:DetailsView ID="dvRestaurant" runat="server" CssClass="table table-bordered"
                DataSourceID="SqlDataSourceRestaurants" AutoGenerateRows="False" DefaultMode="Insert">
                <Fields>
                    <asp:TemplateField HeaderText="Name">
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtNameInsert" runat="server" Text='<%# Bind("Name") %>' CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvNameInsert" runat="server" ControlToValidate="txtNameInsert"
                                ErrorMessage="Name is required." Display="Dynamic" CssClass="text-danger" ValidationGroup="InsertGroupRestaurant" />
                        </InsertItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Image URL">
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtImageInsert" runat="server" Text='<%# Bind("Image") %>' CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvImageInsert" runat="server" ControlToValidate="txtImageInsert"
                                ErrorMessage="Image URL is required." Display="Dynamic" CssClass="text-danger"
                                ValidationGroup="InsertGroupRestaurant" />
                        </InsertItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Description">
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtDescriptionInsert" runat="server" Text='<%# Bind("Description") %>'
                                CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvDescriptionInsert" runat="server" ControlToValidate="txtDescriptionInsert"
                                ErrorMessage="Description is required." Display="Dynamic" CssClass="text-danger"
                                ValidationGroup="InsertGroupRestaurant" />
                        </InsertItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Location">
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtLocationInsert" runat="server" Text='<%# Bind("Location") %>'
                                CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvLocationInsert" runat="server" ControlToValidate="txtLocationInsert"
                                ErrorMessage="Location is required." Display="Dynamic" CssClass="text-danger"
                                ValidationGroup="InsertGroupRestaurant" />
                        </InsertItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Contact Number">
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtContactInsert" runat="server" Text='<%# Bind("ContactNumber") %>'
                                CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvContactInsert" runat="server" ControlToValidate="txtContactInsert"
                                ErrorMessage="Contact number is required." Display="Dynamic" CssClass="text-danger"
                                ValidationGroup="InsertGroupRestaurant" />
                            <asp:RegularExpressionValidator ID="revContactInsert" runat="server"
                                ControlToValidate="txtContactInsert"
                                ValidationExpression="^\d{10}$"
                                ErrorMessage="Enter a valid 10-digit number." Display="Dynamic" CssClass="text-danger"
                                ValidationGroup="InsertGroupRestaurant" />
                        </InsertItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <InsertItemTemplate>
                            <asp:LinkButton ID="btnInsert" runat="server" CommandName="Insert" Text="Insert"
                                CssClass="btn btn-success" ValidationGroup="InsertGroupRestaurant" />
                            <asp:LinkButton ID="btnCancelInsert" runat="server" CommandName="Cancel" Text="Cancel"
                                CssClass="btn btn-secondary" />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>

        </asp:Panel>

        <asp:SqlDataSource ID="SqlDataSourceRestaurants" runat="server"
            ConnectionString="<%$ ConnectionStrings:FoodDeliveryConnection %>"
            SelectCommand="SELECT * FROM Restaurants"
            InsertCommand="INSERT INTO Restaurants (Name, Image, Description, Location, ContactNumber) VALUES (@Name, @Image, @Description, @Location, @ContactNumber)"
            UpdateCommand="UPDATE Restaurants SET Name=@Name, Image=@Image, Description=@Description, Location=@Location, ContactNumber=@ContactNumber WHERE RestaurantID=@RestaurantID"
            DeleteCommand="DELETE FROM Restaurants WHERE RestaurantID=@RestaurantID">
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Image" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Location" Type="String" />
                <asp:Parameter Name="ContactNumber" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Image" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Location" Type="String" />
                <asp:Parameter Name="ContactNumber" Type="String" />
                <asp:Parameter Name="RestaurantID" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="RestaurantID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>

        <asp:Panel ID="pnlMenuItems" runat="server" Visible="false">
            <div class="card p-4 mb-4">
                <h3 class="text-center fw-bold mb-3">Menu Items List</h3>
                <asp:ValidationSummary ID="valSummaryMenuItemInsert" runat="server" CssClass="text-danger" />
                <asp:GridView ID="gvMenuItems" runat="server" AutoGenerateColumns="False" DataKeyNames="MenuItemID"
                    CssClass="table table-bordered" DataSourceID="SqlDataSourceMenuItems" AllowPaging="true"
                    AllowSorting="true">
                    <Columns>
                        <asp:BoundField DataField="MenuItemID" HeaderText="ID" ReadOnly="true" />
                        <asp:TemplateField HeaderText="Restaurant ID">
                            <ItemTemplate><%# Eval("RestaurantID") %></ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRestaurantIDEdit" runat="server" Text='<%# Bind("RestaurantID") %>'
                                    CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="rfvRestaurantIDEdit" runat="server" ControlToValidate="txtRestaurantIDEdit"
                                    ErrorMessage="Restaurant ID is required." CssClass="text-danger" Display="Dynamic"
                                    ValidationGroup="EditGroupMenu" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Item Name">
                            <ItemTemplate><%# Eval("ItemName") %></ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtItemNameEdit" runat="server" Text='<%# Bind("ItemName") %>' CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="rfvItemNameEdit" runat="server" ControlToValidate="txtItemNameEdit"
                                    ErrorMessage="Item Name is required." CssClass="text-danger" Display="Dynamic"
                                    ValidationGroup="EditGroupMenu" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate><%# Eval("Description") %></ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDescriptionEdit" runat="server" Text='<%# Bind("Description") %>'
                                    CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="rfvDescriptionEdit" runat="server" ControlToValidate="txtDescriptionEdit"
                                    ErrorMessage="Description is required." CssClass="text-danger" Display="Dynamic"
                                    ValidationGroup="EditGroupMenu" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate><%# Eval("Price") %></ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPriceEdit" runat="server" Text='<%# Bind("Price") %>' CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="rfvPriceEdit" runat="server" ControlToValidate="txtPriceEdit"
                                    ErrorMessage="Price is required." CssClass="text-danger" Display="Dynamic"
                                    ValidationGroup="EditGroupMenu" />
                                <asp:RegularExpressionValidator ID="revPriceEdit" runat="server"
                                    ControlToValidate="txtPriceEdit"
                                    ValidationExpression="^\d+(\.\d{1,2})?$"
                                    ErrorMessage="Enter valid price (e.g. 10 or 10.99)." CssClass="text-danger"
                                    Display="Dynamic" ValidationGroup="EditGroupMenu" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Image URL">
                            <ItemTemplate><%# Eval("ImageUrl") %></ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtImageUrlEdit" runat="server" Text='<%# Bind("ImageUrl") %>' CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="rfvImageUrlEdit" runat="server" ControlToValidate="txtImageUrlEdit"
                                    ErrorMessage="Image URL is required." CssClass="text-danger" Display="Dynamic"
                                    ValidationGroup="EditGroupMenu" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Category">
                            <ItemTemplate><%# Eval("Category") %></ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCategoryEdit" runat="server" Text='<%# Bind("Category") %>' CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="rfvCategoryEdit" runat="server" ControlToValidate="txtCategoryEdit"
                                    ErrorMessage="Category is required." CssClass="text-danger" Display="Dynamic"
                                    ValidationGroup="EditGroupMenu" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEditMenu" runat="server" CommandName="Edit" Text="Edit"
                                    CssClass="btn btn-primary btn-sm" />
                                <asp:LinkButton ID="btnDeleteMenu" runat="server" CommandName="Delete" Text="Delete"
                                    CssClass="btn btn-danger btn-sm"
                                    OnClientClick="return confirm('Are you sure you want to delete this item?');" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="btnUpdateMenu" runat="server" CommandName="Update" Text="Update"
                                    CssClass="btn btn-success btn-sm" ValidationGroup="EditGroupMenu" />
                                <asp:LinkButton ID="btnCancelMenu" runat="server" CommandName="Cancel" Text="Cancel"
                                    CssClass="btn btn-secondary btn-sm" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <asp:DetailsView ID="dvMenuItem" runat="server" CssClass="table table-bordered"
                    DataSourceID="SqlDataSourceMenuItems" AutoGenerateRows="False" DefaultMode="Insert">
                    <Fields>
                        <asp:TemplateField HeaderText="Restaurant ID">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtRestaurantIDInsert" runat="server" Text='<%# Bind("RestaurantID") %>'
                                    CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="rfvRestaurantIDInsert" runat="server" ControlToValidate="txtRestaurantIDInsert"
                                    ErrorMessage="Restaurant ID is required." Display="Dynamic" CssClass="text-danger"
                                    ValidationGroup="InsertGroupMenu" />
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Item Name">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtItemNameInsert" runat="server" Text='<%# Bind("ItemName") %>'
                                    CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="rfvItemNameInsert" runat="server" ControlToValidate="txtItemNameInsert"
                                    ErrorMessage="Item Name is required." Display="Dynamic" CssClass="text-danger"
                                    ValidationGroup="InsertGroupMenu" />
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Description">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtDescriptionInsert" runat="server" Text='<%# Bind("Description") %>'
                                    CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="rfvDescriptionInsert" runat="server" ControlToValidate="txtDescriptionInsert"
                                    ErrorMessage="Description is required." Display="Dynamic" CssClass="text-danger"
                                    ValidationGroup="InsertGroupMenu" />
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Price">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtPriceInsert" runat="server" Text='<%# Bind("Price") %>' CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="rfvPriceInsert" runat="server" ControlToValidate="txtPriceInsert"
                                    ErrorMessage="Price is required." Display="Dynamic" CssClass="text-danger" ValidationGroup="InsertGroupMenu" />
                                <asp:RegularExpressionValidator ID="revPriceInsert" runat="server"
                                    ControlToValidate="txtPriceInsert"
                                    ValidationExpression="^\d+(\.\d{1,2})?$"
                                    ErrorMessage="Enter valid price (e.g. 10 or 10.99)." Display="Dynamic" CssClass="text-danger"
                                    ValidationGroup="InsertGroupMenu" />
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Image URL">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtImageUrlInsert" runat="server" Text='<%# Bind("ImageUrl") %>'
                                    CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="rfvImageUrlInsert" runat="server" ControlToValidate="txtImageUrlInsert"
                                    ErrorMessage="Image URL is required." Display="Dynamic" CssClass="text-danger"
                                    ValidationGroup="InsertGroupMenu" />
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Category">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtCategoryInsert" runat="server" Text='<%# Bind("Category") %>'
                                    CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="rfvCategoryInsert" runat="server" ControlToValidate="txtCategoryInsert"
                                    ErrorMessage="Category is required." Display="Dynamic" CssClass="text-danger"
                                    ValidationGroup="InsertGroupMenu" />
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <asp:LinkButton ID="btnInsertMenu" runat="server" CommandName="Insert" Text="Insert"
                                    CssClass="btn btn-success" ValidationGroup="InsertGroupMenu" />
                                <asp:LinkButton ID="btnCancelInsertMenu" runat="server" CommandName="Cancel" Text="Cancel"
                                    CssClass="btn btn-secondary" />
                            </InsertItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>

            </div>
        </asp:Panel>

        <asp:SqlDataSource ID="SqlDataSourceMenuItems" runat="server"
            ConnectionString="<%$ ConnectionStrings:FoodDeliveryConnection %>"
            SelectCommand="SELECT * FROM MenuItems"
            InsertCommand="INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, ImageUrl, Category) VALUES (@RestaurantID, @ItemName, @Description, @Price, @ImageUrl, @Category)"
            UpdateCommand="UPDATE MenuItems SET RestaurantID=@RestaurantID, ItemName=@ItemName, Description=@Description, Price=@Price, ImageUrl=@ImageUrl, Category=@Category WHERE MenuItemID=@MenuItemID"
            DeleteCommand="DELETE FROM MenuItems WHERE MenuItemID=@MenuItemID">
            <InsertParameters>
                <asp:Parameter Name="RestaurantID" Type="Int32" />
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="ImageUrl" Type="String" />
                <asp:Parameter Name="Category" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="RestaurantID" Type="Int32" />
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="ImageUrl" Type="String" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="MenuItemID" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="MenuItemID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
