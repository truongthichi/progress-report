using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wedApple
{
    public partial class Search : System.Web.UI.Page
    {
      
            protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["query"] != null)
                {
                    string searchQuery = Request.QueryString["query"];
                    LoadProductDetails(searchQuery);
                }
            }
        }

        private void LoadProductDetails(string productName)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["QLNDConnections"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT ProductName, Description, Price, ImageURL FROM Products WHERE ProductName = @ProductName";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ProductName", productName);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    rptResults.DataSource = new List<object>
            {
                new { ProductName = reader["ProductName"], Description = reader["Description"], Price = reader["Price"], ImageURL = reader["ImageURL"] }
            };
                    rptResults.DataBind();
                }
                else
                {
                    lblMessage.Text = "⚠️ Không tìm thấy sản phẩm!";
                    lblMessage.CssClass = "alert alert-warning";
                    lblMessage.Style["display"] = "block";
                }
            }
        }

    }
}
