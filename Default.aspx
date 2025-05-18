<%@ Page Title="" Language="C#" MasterPageFile="~/Manin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="wedApple.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script>
    function showSuggestions() {
        var query = document.getElementById('<%= txtSearch.ClientID %>').value;
        if (query.length < 1) {
            document.getElementById("suggestionsBox").style.display = "none";
            return;
        }

        fetch("SearchSuggestions.aspx?query=" + encodeURIComponent(query))
            .then(response => response.json())
            .then(data => {
                var box = document.getElementById("suggestionsBox");
                box.innerHTML = "";
                if (data.length > 0) {
                    box.style.display = "block";
                    data.forEach(item => {
                        var element = document.createElement("a");
                        element.href = "Search.aspx?query=" + encodeURIComponent(item);
                        element.className = "list-group-item list-group-item-action";
                        element.textContent = item;
                        box.appendChild(element);
                    });
                } else {
                    box.style.display = "none";
                }
            });
            }

</script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>

<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" style="margin: 13px;" href="#"> 
        <img src="https://ruybangphuonghoang.com/wp-content/uploads/2024/10/logo-apple-VECTOR-3-909x800.jpg" alt="Logo" style="margin: -21px;
    max-height: 69px;"/>
      </a> 
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul style="margin-right: -179px;" class="nav navbar-nav navbar-right">
        <asp:PlaceHolder ID="phLogin" runat="server">
          <li><a href="Register.aspx">Đăng Kí</a></li>
          <li><a href="Login.aspx">Đăng Nhập</a></li>
        </asp:PlaceHolder>

        <asp:PlaceHolder ID="phUser" runat="server" Visible="false">
          <li><a href="#">Xin chào, <asp:Label ID="lblUserName" runat="server"></asp:Label>!</a></li>
          <li>
            <form runat="server">
            <asp:Button ID="btnLogout" runat="server" Text="Đăng xuất" CssClass="btn btn-danger btn-lg w-100" OnClick="btnLogout_Click" />
            </form>
          </li>
        </asp:PlaceHolder>

        <li><a href="Cart.aspx">Giỏ Hàng</a></li>

      </ul>
    </div>
  </div>    
</nav>
    


<form runat="server" dir="auto">
    <!-- First Container -->
<div style="background: blanchedalmond;" class="container-fluid bg-1 text-center">
    <div style="background: darkseagreen;" class="container-fluid search-container text-center">
        <h3 class="center-item">Tìm kiếm sản phẩm</h3>
        <div class="center-container">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control center-item"
                placeholder="Nhập tên sản phẩm..." onkeyup="showSuggestions()" />
            <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm"
                CssClass="btn btn-primary center-item" OnClick="btnSearch_Click" />
            <div id="suggestionsBox" class="list-group mt-2 center-item" style="display: none;"></div>
        </div>
    </div>
</div>


        <!-- Product Grid -->

    <h2 style="background-color: thistle;
    color: brown;
    text-align: center;font-size: 45px;" class="title">Sản phẩm nổi bật</h2>
<div style="display: ruby;" class="product-grid">
    <asp:Repeater ID="rptProducts" runat="server">
        <ItemTemplate>
            <div style="" class="product-item">
                <img src='<%# ResolveUrl("~/Images/" + Eval("ImageUrl").ToString()) %>' 
                    alt='<%# Eval("ProductName") %>' class="product-image">
                <h5 class="product-title"><%# Eval("ProductName") %></h5>
                <p class="product-description"><%# Eval("Description") %></p>
                <p class="product-price">
                    Giá: <%# string.Format("{0:#,0} Đ", Eval("Price")) %>
                </p>
                <asp:Button ID="btnBuy" runat="server" Text="Mua ngay" CssClass="buy-button"
                    CommandArgument='<%# Eval("ProductID") %>' OnClick="btnBuy_Click" />
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>




</form>


<!-- Footer -->
<footer class="container-fluid footer bg-dark text-white text-center py-3">
    <div class="footer-content">
        <p>&copy; 2025 My Website | Designed with ❤️ using Bootstrap</p>
        <p style="font-size: 24px;
    color: #00ffdc;">
            liên hệ Gmail:chitt160784@tvu-onschool.edu.vn
        </p>
    </div>
</footer>
</body>


    
</asp:Content>
