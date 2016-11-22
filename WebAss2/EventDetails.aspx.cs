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
    public partial class EventDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["TicketoLoginAs"] == null)
            {
                panelLoginContinue.Visible = false;
            }
        }

       
        protected void btnBookTicket_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["TicketoLoginAs"] == null)
            {
                //Response.Write("<script>alert('Please login to book a ticket')</script>");
                panelLoginContinue.Visible = true;
            } else
            {
                CVNumTickets.Validate();
                if (CVNumTickets.IsValid) {
                    queryDB();
                }
                
            }

        }

        public string GetConnectionString()
        {
            //sets the connection string from your web config file "ConnString" is the name of your Connection String
            return System.Configuration.ConfigurationManager.ConnectionStrings["WebAss2.Properties.Settings.TicketoConn"].ConnectionString;
        }

        public int checkSeatsLeft()
        {
            SqlConnection conn = new SqlConnection(GetConnectionString());
            string sql = "SELECT numTickets FROM Events WHERE eventId = @eventId";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
             
                SqlParameter param = new SqlParameter();
               
                param = new SqlParameter("@eventId", SqlDbType.Int);
                param.Value = int.Parse(Request.QueryString["id"]);
               
                cmd.Parameters.Add(param);
                cmd.CommandType = CommandType.Text;
                
                return (int)cmd.ExecuteScalar();
               
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                panelBookFail.Visible = true;
                string msg = "Insert Error:";
                msg += ex.Message;
                return 0;
                throw new Exception(msg);
            }
            finally
            {
                conn.Close();
            }

        }

        protected void ValidateNumTickets(object sender, ServerValidateEventArgs e)
        {
            int remainingSeats = checkSeatsLeft();

            if (remainingSeats < int.Parse(DDLNumTickets.SelectedValue))
            {
                e.IsValid = false;
            }

        }

        public void queryDB()
        {
            
            SqlConnection conn = new SqlConnection(GetConnectionString());
            string sql = "INSERT INTO Reservations (eventId, reservationTime, seatQuantity, reservationString, userId) OUTPUT INSERTED.reservationId VALUES "
                    + " (@eventId, @reservationTime, @seatQuantity, @reservationString, @userId)";
            string sql2 = "UPDATE Events SET numTickets=numTickets-@seatQuantity WHERE eventId = @eventId";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlCommand cmd2 = new SqlCommand(sql2, conn);
                SqlParameter[] param = new SqlParameter[5];
                //param[0] = new SqlParameter("@id", SqlDbType.Int, 20);
                param[0] = new SqlParameter("@eventId", SqlDbType.Int);
                param[1] = new SqlParameter("@reservationTime", SqlDbType.DateTime);
                param[2] = new SqlParameter("@seatQuantity", SqlDbType.Int);
                param[3] = new SqlParameter("@reservationString", SqlDbType.VarChar, 255);
                param[4] = new SqlParameter("@userId", SqlDbType.Int);

             
                param[0].Value = int.Parse(Request.QueryString["id"]);
                param[1].Value = DateTime.Now;
                param[2].Value = int.Parse(DDLNumTickets.SelectedValue);
                param[3].Value = "e" + Request.QueryString["id"].ToString() + "u" + Request.Cookies["TicketoUserId"].Value.ToString();
                param[4].Value = int.Parse(Request.Cookies["TicketoUserId"].Value);

                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                SqlParameter param2 = new SqlParameter("@eventId", SqlDbType.Int);
                SqlParameter param3 = new SqlParameter("@seatQuantity", SqlDbType.Int);
                param2.Value = int.Parse(Request.QueryString["id"]);
                param3.Value = int.Parse(DDLNumTickets.SelectedValue);
                cmd2.Parameters.Add(param2);
                cmd2.Parameters.Add(param3);
                
                cmd.CommandType = CommandType.Text;
                cmd2.CommandType = CommandType.Text;
                int result = (int) cmd.ExecuteScalar();
                cmd2.ExecuteNonQuery();

                if (result > 0)
                {
                    panelBookingSuccess.Visible = true;
                    lblReservationString.Text = result.ToString(); 
                } else
                {
                    panelBookFail.Visible = true;
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                panelBookFail.Visible = true;
                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                conn.Close();
            }

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            queryDBsignup();
        }

        public void queryDBsignup()
        {
            SqlConnection conn = new SqlConnection(GetConnectionString());
            string sql = "INSERT INTO Users (name, username, password, userType, contactNo) OUTPUT INSERTED.userId VALUES "
                    + " (@name,@username,@password,@userType,@contactNo)";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlParameter[] param = new SqlParameter[5];
                //param[0] = new SqlParameter("@id", SqlDbType.Int, 20);
                param[0] = new SqlParameter("@name", SqlDbType.VarChar, 255);
                param[1] = new SqlParameter("@username", SqlDbType.VarChar, 50);
                param[2] = new SqlParameter("@password", SqlDbType.VarChar, 50);
                param[3] = new SqlParameter("@userType", SqlDbType.VarChar, 50);
                param[4] = new SqlParameter("@contactNo", SqlDbType.VarChar, 255);

                param[0].Value = tbFullName.Text;
                param[1].Value = tbUsername.Text;
                param[2].Value = tbPassword.Text;
                param[3].Value = "customer";
                param[4].Value = tbContactNo.Text;

                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                int userId = (int)cmd.ExecuteScalar();

                //success, login user by saving cookie
                HttpCookie cookie = new HttpCookie("TicketoLoginAs");
                cookie.Value = "customer";
                cookie.Expires = DateTime.Now.AddHours(1);
                Response.Cookies.Add(cookie);

                HttpCookie cookieUserId = new HttpCookie("TicketoUserId");
                cookieUserId.Value = userId.ToString();
                cookieUserId.Expires = DateTime.Now.AddHours(1);
                Response.Cookies.Add(cookieUserId);

                HttpCookie cookieRecentSignup = new HttpCookie("TicketoRecentSignup");
                cookieRecentSignup.Value = "true";
                cookieRecentSignup.Expires = DateTime.Now.AddHours(1);
                Response.Cookies.Add(cookieRecentSignup);
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


    }
}