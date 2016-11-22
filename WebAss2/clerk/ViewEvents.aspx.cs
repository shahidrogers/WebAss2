using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAss2
{
    public partial class ViewEventsClerk : Page
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

        protected void gvEvents_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if ((e.Row.RowType == DataControlRowType.DataRow))
            {
                string QueryString = DataBinder.Eval(e.Row.DataItem, "eventId").ToString();
                string NavigateURL = ResolveUrl(("~/clerk/EventDetails.aspx?id=" + QueryString));
                e.Row.Attributes.Add("onClick", string.Format("javascript:window.location=\'{0}\';", NavigateURL));
                e.Row.Style.Add("cursor", "pointer");
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
    }
}