using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAss2
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["TicketoLoginAs"] != null)
            {
                BtnLogin.Visible = false;

                if (Request.Cookies["TicketoLoginAs"].Value.ToString().Equals("customer"))
                {
                    ListLoggedIn.Visible = false;
                    BtnLogout.Visible = true;
                } else
                {
                    ListLoggedIn.Visible = true;
                    BtnLogout.Visible = false;
                }
                
            } else
            {
                BtnLogin.Visible = true;
                ListLoggedIn.Visible = false;
                BtnLogout.Visible = false;
            }
        }
    }
}