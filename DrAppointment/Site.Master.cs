using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DrAppointment
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["email"] != null)
                {
                    //navbarColor02.Visible = false;
                    welcomelbl.Visible = true;
                    //profile.Visible = true;
                    //logout.Visible = true;
                    Label1.InnerHtml = Session["name"].ToString();
                    joinus.Visible = false;
                    if(Session["email"].ToString() == "gcharupati@student.govst.edu")
                    {
                        admin.Visible = true;
                    }

                }
            }
            catch(Exception ex)
            {

            }
        }
    }
}