using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wedApple
{
    public partial class SearchSuggestions : System.Web.UI.Page
    {
        [WebMethod]
        public static string GetSuggestions(string query)
        {
            List<string> productNames = new List<string>();
            string connectionString = ConfigurationManager.ConnectionStrings["QLNDConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sqlQuery = "SELECT ProductName FROM Products WHERE ProductName LIKE @SearchQuery";
                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                cmd.Parameters.AddWithValue("@SearchQuery", "%" + query + "%");

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    productNames.Add(reader["ProductName"].ToString());
                }
            }

            return new JavaScriptSerializer().Serialize(productNames);
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}