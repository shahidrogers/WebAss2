using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAss2
{
    public partial class EventDetailsAdmin : Page
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

        protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            Response.Redirect("~/admin/panel.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Session["Title"] = DetailsView1.Rows[1].Cells[1].Text.ToString();
            Session["Description"] = DetailsView1.Rows[2].Cells[1].Text.ToString();
            Session["Venue"] = DetailsView1.Rows[3].Cells[1].Text.ToString();
            Session["Date"] = DateTime.Parse(DetailsView1.Rows[5].Cells[1].Text.ToString());
            Session["NumTickets"] = DetailsView1.Rows[6].Cells[1].Text.ToString();
            Session["Price"] = DetailsView1.Rows[7].Cells[1].Text.ToString();
            Response.Redirect("~/admin/updateevent.aspx?id=" + Request.QueryString["id"]);
        }
    }
}