using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAss2
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_OnClick(object s, EventArgs e)
        {
            Response.Redirect("~/Events_Search.aspx/?eventTitle=" + tbSearch.Text);
        }
    }
}