<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="wedApple.Login" %>

<!DOCTYPE html>
<html>
<head>
    <title>Đăng nhập</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5 d-flex justify-content-center">
        <div class="p-4 border rounded shadow-lg mx-auto" style="max-width: 400px;">
            <h2 class="text-center">Đăng nhập</h2>

            <form runat="server">
                <div class="mb-3">
                    <label class="form-label">Tên đăng nhập:</label>
                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Mật khẩu:</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" CssClass="btn btn-primary w-100" OnClick="btnLogin_Click" />
            </form>

            <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-danger d-none"></asp:Label>
        </div>
    </div>
</body>
</html>
