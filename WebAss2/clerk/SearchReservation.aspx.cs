using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAss2
{
    public partial class SearchReservation : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user is authenticated or not
            if (Request.Cookies["TicketoLoginAs"] == null)
            {
                //redirect to login page
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/clerk/ReservationDetails.aspx?id=" + tbReservationID.Text);
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
    }
}