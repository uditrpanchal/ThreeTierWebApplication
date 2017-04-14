<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="CThreeTier.Customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-horizontal">
        <div class="container">
            <div class="col-md-6">
                <div class="form-group">
                    <div class="col-md-4">
                    <div class="control-label">
                        First Name
                    </div>
                </div>
                <div class="col-md-8">
                    <asp:HiddenField ID="hdnCustomerID" runat="server" Value="0" />
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" TabIndex="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqFirstName" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtFirstName" SetFocusOnError="True" ValidationGroup="vgSave" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class="form-group">
                    <div class="col-md-4">
                    <div class="control-label">
                        Birth Date
                    </div>
                </div>
                <div class="col-md-8">
                    <asp:TextBox ID="txtBirthDate" runat="server" CssClass="form-control" TabIndex="3"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqBirthDate" runat="server" ErrorMessage="Required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtBirthDate" ValidationGroup="vgSave" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegBirthDate" runat="server" ErrorMessage="Not a Valid Date. Must be in DD/MM/YYYY" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtBirthDate" ValidationGroup="vgSave" SetFocusOnError="True" ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[-/.](0[1-9]|1[012])[-/.](19|20)\d\d$"></asp:RegularExpressionValidator>
                </div>
                </div>
                <div class="form-group">
                    <div class="col-md-4">
                    <div class="control-label">
                        Address
                    </div>
                </div>
                <div class="col-md-8">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TabIndex="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqAddress" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtAddress" SetFocusOnError="True" ValidationGroup="vgSave" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                </div>
            </div>
            <div class="col-md-6">
                 <div class="form-group">
                    <div class="col-md-4">
                    <div class="control-label">
                        Last Name
                    </div>
                </div>
                <div class="col-md-8">
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" TabIndex="2"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqLastName" runat="server" ErrorMessage="Required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtLastName" SetFocusOnError="True" ValidationGroup="vgSave"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class="form-group">
                    <div class="col-md-4">
                    <div class="control-label">
                        Email
                    </div>
                </div>
                <div class="col-md-8">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TabIndex="4"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqEmail" runat="server" ErrorMessage="Required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtEmail" SetFocusOnError="True" ValidationGroup="vgSave"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegEmail" runat="server" ErrorMessage="Must be in Email Format" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtEmail" ValidationGroup="vgSave" SetFocusOnError="True" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>
                </div>
                </div>
             
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-6">
                        <div class="form-group">
                            <div class="col-md-8">

                            </div>
                            <div class="col-md-4">
                                <span class="pull-right">
                                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" ValidationGroup="vgSave" OnClick="btnSave_Click" /></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <div class="col-md-4">
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger" ValidationGroup="vgSave" />
                            </div>
                            <div class="col-md-offset-8">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>

    <div class="container">
    <div id="divGrid" runat="server" class="table-responsive">
        <asp:GridView ID="gdCustomer" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gdCustomer_SelectedIndexChanged"
          OnRowCommand="gdCustomer_RowCommand"
          OnRowDataBound="gdCustomer_RowDataBound"
            CssClass="table table-bordered"
            HeaderStyle-CssClass="bg-primary">
            <Columns>
                <asp:TemplateField HeaderText="FirstName">
                    <AlternatingItemTemplate>
                        <asp:LinkButton ID="lnkFirstName" runat="server" Text='<%# Bind("FirstName") %>' />
                        <asp:HiddenField ID="hdnCustomerID" runat="server" Value='<%# Bind("CustomerID") %>' />
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:LinkButton>
                        <asp:HiddenField ID="hdnCustomerID" runat="server" Value='<%# Bind("CustomerID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LastName">
                    <AlternatingItemTemplate>
                        <asp:HyperLink ID="hypLastName" runat="server" NavigateUrl='<%# String.Format("~/CustomerDetails.aspx?Id={0}",Eval("CustomerID")) %>' Text='<%# Bind("LastName") %>'></asp:HyperLink>
                       
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="hypLastName" runat="server" NavigateUrl='<%# String.Format("~/CustomerDetails.aspx?Id={0}",Eval("CustomerID")) %>' Text='<%# Bind("LastName") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="BirthDate">
                    <AlternatingItemTemplate>
                        <asp:Label ID="lblBirthDate" runat="server" Text='<%# Bind("BirthDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblBirthDate" runat="server" Text='<%# Bind("BirthDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <AlternatingItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address">
                    <AlternatingItemTemplate>
                        <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit | Delete">
                    <AlternatingItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="<%# Container.DataItemIndex %>" CommandName="EDT" Text="Edit"></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="<%# Container.DataItemIndex %>" CommandName="DLT" Text="Delete"></asp:LinkButton>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument="<%# Container.DataItemIndex %>" CommandName="EDT" Text="Edit"></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument="<%# Container.DataItemIndex %>" CommandName="DLT" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>
       
    </div>
        </div>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#aCustomer').parent().addClass('active');

            $('#<%=txtFirstName.ClientID%>').focus();
            $('#btnCancel').click(function () {
                $('#<%=txtFirstName.ClientID%>').focus();
                $('#<%=hdnCustomerID.ClientID%>').val('0');
                $('#<%=txtFirstName.ClientID%>').val('');
                $('#<%=txtLastName.ClientID%>').val('');
                $('#<%=txtBirthDate.ClientID%>').val('');
                $('#<%=txtEmail.ClientID%>').val('');
                $('#<%=txtAddress.ClientID%>').val('');
            });
        });
    </script>
</asp:Content>
