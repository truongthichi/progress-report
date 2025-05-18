<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="wedApple.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="cart-container">
    
  <div class="container mt-4">
    <div class="card p-3">
        <div class="cart-header text-center p-4 bg-primary text-white rounded">
<div class="container mt-4">
    <h2 class="text-center mb-4">Giỏ hàng của bạn</h2>
    <div class="d-flex flex-wrap justify-content-center gap-4">
        <asp:Repeater ID="rptCart" runat="server">
            <ItemTemplate>
                <div class="card product-card">
                    <img src='<%# ResolveUrl("~/Images/" + Eval("ImageUrl").ToString()) %>' 
                        alt='<%# Eval("ProductName") %>' class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title"><%# Eval("ProductName") %></h5>
                        <p class="card-text"><%# Eval("Description") %></p>
                        <p class="price">
                            Giá: <%# string.Format("{0:#,0} Đ", Eval("Price")) %>
                        </p>
                        <asp:Button ID="btnRemove" runat="server" Text="Xóa" CssClass="btn btn-danger w-100"
                            CommandArgument='<%# Eval("ProductID") %>' OnClick="btnRemove_Click" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>



    
    <div class="cart-footer">
        <h3>Tổng cộng: <asp:Label ID="lblTotal" runat="server" /></h3>
        <asp:Button ID="btnCheckout" runat="server" Text="Thanh toán" CssClass="btn btn-success" OnClick="btnCheckout_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Hủy" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
         <asp:Button ID="btnContinueShopping" runat="server" Text="Tiếp tục mua hàng" CssClass="btn btn-primary"
    OnClick="btnContinueShopping_Click" />

    </div>
</div>

    </form>
</body>
</html>
