using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAss2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('Test')</script>");
            //check if logged in already via session
            try
            {
                if(!IsPostBack)
                {
                    string checkCookie = Request.Cookies["TicketoLoginAs"].Value.ToString();
                    Response.Write("<script>alert('Logged in as: " + checkCookie + "')</script>");
                    if (checkCookie.Equals("admin"))
                    {
                        //if logged in as admin previously, redirect to admin panel
                        Response.Redirect("admin/panel.aspx");
                    }
                    else if (checkCookie.Equals("clerk"))
                    {
                        //if logged in as clerk previously, redirect to admin panel
                        Response.Redirect("clerk/panel.aspx");
                    }
                }
            }
            catch
            {

            }
            
        }

        public string GetConnectionString()
        {
            //sets the connection string from your web config file "ConnString" is the name of your Connection String
            return System.Configuration.ConfigurationManager.ConnectionStrings["WebAss2.Properties.Settings.TicketoConn"].ConnectionString;
        }

        public void queryDB(String un, String pw)
        {
            SqlConnection conn = new SqlConnection(GetConnectionString());

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Select * from Users where username='" + un + "' and password='" + pw + "'", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    //check if admin or clerk
                    String userType = "";
                    foreach (DataRow row in dt.Rows)
                    {
                        userType = row["userType"].ToString();
                    }

                    //save cookie
                    //this.Session["TicketoLoginAs"] = "admin";
                    HttpCookie cookie = new HttpCookie("TicketoLoginAs");
                    cookie.Value = userType;
                    cookie.Expires = DateTime.Now.AddHours(1);
                    Response.Cookies.Add(cookie);

                    //redirect user to admin or clerk panel
                    Response.Redirect(userType + "/panel.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Please enter valid Username and Password')</script>");
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                conn.Close();
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            queryDB(tbUsername.Text, tbPassword.Text);
        }
    }
}