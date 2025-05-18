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
    public partial class Login : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.TextBox txtUserName;
        protected System.Web.UI.WebControls.TextBox txtPassword;
        protected System.Web.UI.WebControls.Label lblMessage;

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["QLNDConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT UserName FROM UserND WHERE UserName = @UserName AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                con.Open();
                object result = cmd.ExecuteScalar();

                if (result != null) // Đăng nhập thành công
                {
                    Session["UserName"] = txtUserName.Text;
                    Response.Redirect("Default.aspx");
                }
                else // Đăng nhập thất bại
                {
                    lblMessage.Text = "❌ Sai tên đăng nhập hoặc mật khẩu!";
                    lblMessage.CssClass = "alert alert-danger";
                    lblMessage.Style["display"] = "block";
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
    }
}