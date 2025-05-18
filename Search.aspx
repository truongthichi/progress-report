<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="wedApple.Search" %>

<!DOCTYPE html>

<html>
<head>
    <title>Tìm kiếm sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Chi tiết sản phẩm</h2>

        <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-warning mt-3 d-none"></asp:Label>

        <asp:Repeater ID="rptResults" runat="server">
            <ItemTemplate>
                <div class="card mb-3 mx-auto" style="max-width: 500px;">
                    <img src='<%# ResolveUrl("~/Images/" + Eval("ImageUrl").ToString()) %>' alt='<%# Eval("ProductName") %>' class="img-responsive margin" style="width:70%" alt="Sản phẩm"  />
                    <div class="card-body">
                        <h5 class="card-title"><%# Eval("ProductName") %></h5>
                        <p class="card-text"><%# Eval("Description") %></p>
                        <p class="text-danger"><%# Eval("Price") %> VNĐ</p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</body>
</html>
