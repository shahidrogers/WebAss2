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
    public partial class CancelReservation : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            panelCancelFail.Visible = false;
            panelCancelSuccess.Visible = false;
        }

        public string GetConnectionString()
        {
            //sets the connection string from your web config file "ConnString" is the name of your Connection String
            return System.Configuration.ConfigurationManager.ConnectionStrings["WebAss2.Properties.Settings.TicketoConn"].ConnectionString;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["TicketoLoginAs"] == null)
            {
                Response.Write("<script>alert('Please login to cancel a ticket')</script>");
            }
            else
            {
                if (checkUser() == true)
                {
                    queryDB();
                } else
                {
                    panelCancelFail.Visible = true;
                }
                
            }
        }

        public void queryDB()
        {
            SqlConnection conn = new SqlConnection(GetConnectionString());
            string sql = "DELETE FROM Reservations WHERE reservationId = "
                    + " (@reservationId)";
            string sql2 = "UPDATE Events SET numTickets=numTickets+@numSeats WHERE eventId = @eventId";
            string sql3 = "SELECT eventId FROM Reservations WHERE reservationId =" + " (@reservationId)";
            string sql4 = "SELECT seatQuantity FROM Reservations WHERE reservationId =" + " (@reservationId)";
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlCommand cmd2 = new SqlCommand(sql2, conn);
                SqlCommand cmd3 = new SqlCommand(sql3, conn);
                SqlCommand cmd4 = new SqlCommand(sql4, conn);
                SqlParameter param = new SqlParameter();
                SqlParameter param4 = new SqlParameter();
                SqlParameter param5 = new SqlParameter();

                param = new SqlParameter("@reservationId", SqlDbType.Int);
                param.Value = int.Parse(tbReservationID.Text);
                cmd.Parameters.Add(param);

                param4 = new SqlParameter("@reservationId", SqlDbType.Int);
                param4.Value = int.Parse(tbReservationID.Text);
                cmd3.Parameters.Add(param4);

                param5 = new SqlParameter("@reservationId", SqlDbType.Int);
                param5.Value = int.Parse(tbReservationID.Text);
                cmd4.Parameters.Add(param5);

            
                cmd.CommandType = CommandType.Text;
                cmd2.CommandType = CommandType.Text;
                cmd3.CommandType = CommandType.Text;
                cmd4.CommandType = CommandType.Text;

                int eventId = (int) cmd3.ExecuteScalar();
                int numSeats = (int)cmd4.ExecuteScalar();

                SqlParameter param2 = new SqlParameter("@eventId", SqlDbType.Int);
                SqlParameter param3 = new SqlParameter("@numSeats", SqlDbType.Int);
                param2.Value = eventId;
                param3.Value = numSeats;
                cmd2.Parameters.Add(param2);
                cmd2.Parameters.Add(param3);

                int result = cmd.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();

                if (result > 0)
                {
                    panelCancelSuccess.Visible = true;
                }
                else
                {
                    panelCancelFail.Visible = true;
                }

            }
            catch (Exception ex)
            {
                string msg = "Insert Error:";
                msg += ex.Message;
                panelCancelFail.Visible = true;
            }
            finally
            {
                conn.Close();
            }
        }

        public Boolean checkUser()
        {
           
            SqlConnection conn = new SqlConnection(GetConnectionString());
            string sql = "SELECT userId FROM Reservations WHERE reservationId = @reservationId";
           
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlParameter param = new SqlParameter();
              
                param = new SqlParameter("@reservationId", SqlDbType.Int);
                param.Value = int.Parse(tbReservationID.Text);
                cmd.Parameters.Add(param);

                cmd.CommandType = CommandType.Text;
               
                int userId = (int)cmd.ExecuteScalar();

                if (userId == int.Parse(Request.Cookies["TicketoUserId"].Value.ToString()) || Request.Cookies["TicketoLoginAs"].Value.ToString().Equals("admin") ||
                    Request.Cookies["TicketoLoginAs"].Value.ToString().Equals("clerk"))
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                string msg = "Insert Error:";
                msg += ex.Message;
                panelCancelFail.Visible = true;
                return false;
            }
            finally
            {
                conn.Close();
            }
        }
    
    }
}