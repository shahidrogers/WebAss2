using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAss2
{
    public partial class clerkpanel : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvReservations_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if ((e.Row.RowType == DataControlRowType.DataRow))
            {
                string QueryString = DataBinder.Eval(e.Row.DataItem, "reservationId").ToString();
                string NavigateURL = ResolveUrl(("~/clerk/ReservationDetails.aspx?id=" + QueryString));
                e.Row.Attributes.Add("onClick", string.Format("javascript:window.location=\'{0}\';", NavigateURL));
                e.Row.Style.Add("cursor", "pointer");
            }
        }
    }
}