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
    public partial class ReservationDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user is authenticated or not
            if (Request.Cookies["TicketoLoginAs"] == null)
            {
                //redirect to login page
                Response.Redirect("~/Login.aspx");
            }

            linkTicket.HRef = printTicketsUrl();
            checkSale();

        }

        protected void btnConfirmReservation_Click(object sender, EventArgs e)
        {
            addSale();
        }

        protected void btnCancelReservation_Click(object sender, EventArgs e)
        {
            cancelReservation();
        }

        public string printTicketsUrl()
        {
            return "~/clerk/Tickets.aspx?id=" + Request.QueryString["id"];
        }
        public string GetConnectionString()
        {
            //sets the connection string from your web config file "ConnString" is the name of your Connection String
            return System.Configuration.ConfigurationManager.ConnectionStrings["WebAss2.Properties.Settings.TicketoConn"].ConnectionString;
        }
        public void cancelReservation()
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
                param.Value = int.Parse(Request.QueryString["id"]);
                cmd.Parameters.Add(param);

                param4 = new SqlParameter("@reservationId", SqlDbType.Int);
                param4.Value = int.Parse(Request.QueryString["id"]);
                cmd3.Parameters.Add(param4);

                param5 = new SqlParameter("@reservationId", SqlDbType.Int);
                param5.Value = int.Parse(Request.QueryString["id"]);
                cmd4.Parameters.Add(param5);


                cmd.CommandType = CommandType.Text;
                cmd2.CommandType = CommandType.Text;
                cmd3.CommandType = CommandType.Text;
                cmd4.CommandType = CommandType.Text;

                int eventId = (int)cmd3.ExecuteScalar();
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
                    Response.Redirect("~/clerk/panel.aspx");
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

        public void addSale()
        {
            SqlConnection conn = new SqlConnection(GetConnectionString());
            string sql = "INSERT INTO Sales (salesDate, eventId, reservationId) VALUES "
                    + " (@date,@eventId,@reservationId)";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlParameter[] param = new SqlParameter[3];
                param[0] = new SqlParameter("@date", SqlDbType.DateTime);
                param[1] = new SqlParameter("@eventId", SqlDbType.Int);
                param[2] = new SqlParameter("@reservationId", SqlDbType.Int);

                param[0].Value = DateTime.Now;
                param[1].Value = int.Parse(DetailsView1.Rows[4].Cells[1].Text.ToString());
                param[2].Value = int.Parse(Request.QueryString["id"]);

                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    panelConfirmSuccess.Visible = true;
                    btnConfirmReservation.Enabled = false;
                    btnConfirmReservation.Text = "Confirmed!";
                } else
                {
                    panelConfirmFail.Visible = true;
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

        public void checkSale()
        {
            SqlConnection conn = new SqlConnection(GetConnectionString());
            string sql = "SELECT COUNT(*) FROM Sales WHERE (reservationId = @reservationId)";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlParameter param = new SqlParameter();
                param = new SqlParameter("@reservationId", SqlDbType.Int);

                param.Value = Request.QueryString["id"];
                
                cmd.Parameters.Add(param);
                
                cmd.CommandType = CommandType.Text;
                int result = (int) cmd.ExecuteScalar();

                if (result > 0)
                {
                    btnConfirmReservation.Enabled = false;
                    btnConfirmReservation.Text = "Confirmed!";
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
    }

}