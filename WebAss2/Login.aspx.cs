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
                   
                    if (checkCookie.Equals("admin"))
                    {
                        //if logged in as admin previously, redirect to admin panel
                        Response.Redirect("admin/panel.aspx");
                    }
                    else if (checkCookie.Equals("clerk"))
                    {
                        //if logged in as clerk previously, redirect to admin panel
                        Response.Redirect("clerk/panel.aspx");
                    } else
                    {
                        HttpCookie myCookie = new HttpCookie("TicketoLoginAs");
                        myCookie.Expires = DateTime.Now.AddDays(-1d);
                        Response.Cookies.Add(myCookie);
                        Response.Redirect("~/Default.aspx");
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
                    String userId = "";
                    foreach (DataRow row in dt.Rows)
                    {
                        userType = row["userType"].ToString();
                        userId = row["userId"].ToString();
                    }

                    //save cookie
                    //this.Session["TicketoLoginAs"] = "admin";
                    HttpCookie cookie = new HttpCookie("TicketoLoginAs");
                    cookie.Value = userType;
                    cookie.Expires = DateTime.Now.AddHours(1);
                    Response.Cookies.Add(cookie);

                    HttpCookie cookieUserId = new HttpCookie("TicketoUserId");
                    cookieUserId.Value = userId;
                    cookieUserId.Expires = DateTime.Now.AddHours(1);
                    Response.Cookies.Add(cookieUserId);

                    //redirect user to admin or clerk panel
                    if (userType.Equals("customer"))
                    {
                        Response.Redirect("~/Default.aspx");
                    } else
                    {
                        Response.Redirect(userType + "/panel.aspx");
                    }
                    
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