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
    public partial class EventDetailsClerk : Page
    {
        static int salesId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user is authenticated or not
            if (Request.Cookies["TicketoLoginAs"] == null)
            {
                //redirect to login page
                Response.Redirect("~/Login.aspx");
            }
            panelConfirmSuccess.Visible = false;
            panelConfirmFail.Visible = false;
            
        }

        protected void btnSell_Click(object sender, EventArgs e)
        {
            CVNumTickets.Validate();
            if (CVNumTickets.IsValid)
            {
                addSale();
            }
        }

        public string printTicketsUrl()
        {
            return "~/clerk/Tickets2.aspx?id=" + salesId;
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
                panelConfirmFail.Visible = true;
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

        public void addSale()
        {
            SqlConnection conn = new SqlConnection(GetConnectionString());
            string sql = "INSERT INTO Sales (salesDate, eventId, seatQuantity) OUTPUT INSERTED.salesId VALUES "
                    + " (@date,@eventId,@seatQuantity) ";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlParameter[] param = new SqlParameter[3];
                param[0] = new SqlParameter("@date", SqlDbType.DateTime);
                param[1] = new SqlParameter("@eventId", SqlDbType.Int);
                param[2] = new SqlParameter("@seatQuantity", SqlDbType.Int);

                param[0].Value = DateTime.Now;
                param[1].Value = int.Parse(DetailsView1.Rows[0].Cells[1].Text.ToString());
                param[2].Value = DDLNumTickets.SelectedValue;


                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                salesId = (int) cmd.ExecuteScalar();

                linkTicket.HRef = printTicketsUrl();

                if (salesId > 0)
                {
                    panelConfirmSuccess.Visible = true;
                    subtractSeats();
                }
                else
                {
                    panelConfirmFail.Visible = true;
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert Error:";
                panelConfirmFail.Visible = true;
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                conn.Close();
            }

        }

        public void subtractSeats()
        {

            SqlConnection conn = new SqlConnection(GetConnectionString());
            string sql = "UPDATE Events SET numTickets=numTickets-@seatQuantity WHERE eventId = @eventId";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);

                SqlParameter param = new SqlParameter("@eventId", SqlDbType.Int);
                SqlParameter param2 = new SqlParameter("@seatQuantity", SqlDbType.Int);
                param.Value = int.Parse(Request.QueryString["id"]);
                param2.Value = int.Parse(DDLNumTickets.SelectedValue);
                cmd.Parameters.Add(param);
                cmd.Parameters.Add(param2);

                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                DetailsView1.DataBind();
                
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