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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["QLNDConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO UserND (UserName, Password, Address, PhoneNumber) VALUES (@UserName, @Password, @Address, @PhoneNumber)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text); // Nên mã hóa mật khẩu!
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            // Lưu tên đăng nhập vào Session để dùng trong Default.aspx
            Session["UserName"] = txtUserName.Text;

            // Chuyển hướng sang Default.aspx
            Response.Redirect("Default.aspx");
        }



    }
}