using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace wedApple
{
   
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
            if (Session["UserName"] != null)
            {
                phLogin.Visible = false;  // Ẩn Đăng ký & Đăng nhập
                phUser.Visible = true;    // Hiển thị tên tài khoản
                lblUserName.Text = Session["UserName"].ToString();
            }
            else
            {
                phLogin.Visible = true;   // Hiển thị Đăng ký & Đăng nhập
                phUser.Visible = false;   // Ẩn tên tài khoản
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();  // Xóa trạng thái đăng nhập
            Response.Redirect("Default.aspx"); // Quay lại trang chính
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchQuery = txtSearch.Text.Trim();
            Response.Redirect("Search.aspx?query=" + searchQuery);
        }

        [WebMethod]
        public static List<string> GetProductSuggestions(string prefixText)
        {
            List<string> productNames = new List<string>();
            string connectionString = ConfigurationManager.ConnectionStrings["QLNDConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT ProductName FROM Products WHERE ProductName LIKE @SearchQuery";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@SearchQuery", "%" + prefixText + "%");

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    productNames.Add(reader["ProductName"].ToString());
                }
            }

            return productNames;
        }
        private void LoadProducts()
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=QuanLySanPham;Integrated Security=True";
            string query = "SELECT ProductID, ProductName, Description, Price, ImageUrl FROM Products";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                rptProducts.DataSource = reader;
                rptProducts.DataBind();
            }
        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int productId = Convert.ToInt32(btn.CommandArgument);

            // Lấy thông tin sản phẩm từ cơ sở dữ liệu
            Product product = GetProductById(productId);

            if (product != null)
            {
                // Thêm sản phẩm vào giỏ hàng (sử dụng Session)
                List<Product> cart = (List<Product>)Session["Cart"] ?? new List<Product>();
                cart.Add(product);
                Session["Cart"] = cart;

                // Chuyển hướng sang trang giỏ hàng
                Response.Redirect("Cart.aspx");
            }
        }

        public Product GetProductById(int productId)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLNDConnections"].ConnectionString))
            {
                string query = "SELECT * FROM Products WHERE ProductID = @ProductID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ProductID", productId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    return new Product
                    {
                        ProductID = (int)reader["ProductID"],
                        ProductName = reader["ProductName"].ToString(),
                        Description = reader["Description"].ToString(),
                        Price = (decimal)reader["Price"],
                        ImageURL = reader["ImageURL"].ToString()
                    };
                }
            }
            return null;
        }


    }
}
    
