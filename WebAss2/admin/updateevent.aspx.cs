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
    public partial class updateevent : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user is authenticated or not
            if (Request.Cookies["TicketoLoginAs"] == null)
            {
                //redirect to login page
                Response.Redirect("~/Login.aspx");
            }

            if (!IsPostBack)
            {
                tbTitle.Text = (String)Session["Title"];
                tbDescription.Text = (String)Session["Description"];
                calDate.SelectedDate = (DateTime)Session["Date"];
                tbTicketQty.Text = (String)Session["NumTickets"];
                tbPrice.Text = (String)Session["Price"];
                tbVenue.Text = (String)Session["Venue"];
            }
            

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            queryDB();
        }

        public string GetConnectionString()
        {
            //sets the connection string from your web config file "ConnString" is the name of your Connection String
            return System.Configuration.ConfigurationManager.ConnectionStrings["WebAss2.Properties.Settings.TicketoConn"].ConnectionString;
        }

        public void queryDB()
        {
            SqlConnection conn = new SqlConnection(GetConnectionString());
            string sql = "UPDATE Events SET title=@Title, description=@Description, location=@Location, date=@Date, numTickets=@NumberOfTickets, price=@Price, " +
                "venue=@Venue WHERE eventId=@eventId";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlParameter[] param = new SqlParameter[8];
                //param[0] = new SqlParameter("@id", SqlDbType.Int, 20);
                param[0] = new SqlParameter("@Title", SqlDbType.VarChar, 255);
                param[1] = new SqlParameter("@Description", SqlDbType.VarChar, 255);
                param[2] = new SqlParameter("@Location", SqlDbType.VarChar, 255);
                param[3] = new SqlParameter("@Date", SqlDbType.Date);
                param[4] = new SqlParameter("@NumberOfTickets", SqlDbType.Int);
                param[5] = new SqlParameter("@Price", SqlDbType.Money);
                param[6] = new SqlParameter("@Venue", SqlDbType.VarChar, 255);
                param[7] = new SqlParameter("@eventId", SqlDbType.Int);

                param[0].Value = tbTitle.Text;
                param[1].Value = tbDescription.Text;
                param[2].Value = ddlLocation.SelectedValue;
                param[3].Value = calDate.SelectedDate;
                param[4].Value = Int32.Parse(tbTicketQty.Text);
                param[5].Value = decimal.Parse(tbPrice.Text);
                param[6].Value = tbVenue.Text;
                param[7].Value = Request.QueryString["id"];

                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                int result = cmd.ExecuteNonQuery();
              
                //redirect to panel
                Response.Redirect("panel.aspx");
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

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            //clear cookie
            if (Request.Cookies["TicketoLoginAs"] != null)
            {
                Response.Cookies["TicketoLoginAs"].Expires = DateTime.Now.AddHours(-1);
            }

            //redirect to home page
            Response.Redirect("~/Login.aspx");
        }

        protected void ValidateDate(object sender, ServerValidateEventArgs e)
        {
            DateTime selectedDate = calDate.SelectedDate;
            Console.WriteLine(selectedDate.ToShortDateString());

            if (selectedDate < DateTime.Today)
            {
                e.IsValid = false;
                calDate.SelectedDate = DateTime.Today;
            }

        }

        

        protected void calDate_SelectionChanged(object source, EventArgs e)
        {
            CVDate.Validate();
        }

    }
}