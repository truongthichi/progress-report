using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wedApple
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Product> cartList = (List<Product>)Session["Cart"];
                if (cartList != null && cartList.Count > 0)
                {
                    rptCart.DataSource = cartList;
                    rptCart.DataBind();

                    decimal totalPrice = cartList.Sum(p => p.Price);
                    lblTotal.Text = string.Format("{0:#,0} Đ", totalPrice);
                }
            }

            if (!IsPostBack)
            {
                List<Product> cartList = (List<Product>)Session["Cart"];
                if (cartList != null && cartList.Count > 0)
                {
                    rptCart.DataSource = cartList;
                    rptCart.DataBind();
                }
            }
        }
        protected void btnRemove_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int productId = Convert.ToInt32(btn.CommandArgument);

            List<Product> cartList = (List<Product>)Session["Cart"];
            cartList.RemoveAll(p => p.ProductID == productId);
            Session["Cart"] = cartList;

            Response.Redirect("Cart.aspx"); // Refresh lại trang
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            // Xóa giỏ hàng sau khi thanh toán
            Session["Cart"] = null;

            // Hiển thị thông báo trước khi chuyển trang
            string script = "alert('Thanh toán thành công!'); window.location='Default.aspx';";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
        }

        protected void btnContinueShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx"); // Chuyển hướng đến trang mua hàng
        }

    }
}