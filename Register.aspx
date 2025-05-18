<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="wedApple.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

<div class="container mt-5 d-flex justify-content-center">
        <div class="p-4 border rounded shadow-lg mx-auto" style="max-width: 400px;">
            <h2 class="text-center">Đăng ký tài khoản</h2>

            <form runat="server">
                <div class="mb-3">
                    <label class="form-label">Tên đăng nhập:</label>
                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Mật khẩu:</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Nhập lại mật khẩu:</label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Địa chỉ:</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Số điện thoại:</label>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" />
                </div>

                <asp:Button ID="btnRegister" runat="server" Text="Đăng ký" CssClass="btn btn-primary w-100" OnClick="btnRegister_Click" />
            </form>
            <asp:Label ID="Label1" runat="server" CssClass="alert alert-success d-none"></asp:Label>
        </div>
    </div>
    <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-success d-none"></asp:Label>


</body>
</html>
