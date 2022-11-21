using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DrAppointment
{
    public partial class Login : System.Web.UI.Page
    {
        Database DCCon = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["url"] != null && Session["email"]!= null)
            {
                Response.Redirect(Session["url"].ToString());
            }
        }


        protected void LoginAttemp(object sender, EventArgs e)
        {
            DataSet dt1 = new DataSet();
            try
            {
                string txtemail = email.Text;
                string txtph = phone.Text;
                string txtdate = dob.Text;

                string query = "SELECT TOP 1 * FROM PatientDetails WHERE Email=" + "'" + txtemail + "' AND PHONE=" + "'" + txtph + "' AND BIRTHDATE=" + "'" + txtdate + "'";

                dt1 = DCCon.ReadData(query);

                if (dt1.Tables[0].Rows.Count != 0)
                {
                    Session["email"] = dt1.Tables[0].Rows[0]["EMAIL"].ToString();
                    Session["name"] = dt1.Tables[0].Rows[0]["NAME"].ToString();

                    Response.Redirect("Default.aspx");
                }
                else
                {
                    query = "SELECT TOP 1 * FROM DoctorDetails WHERE Email=" + "'" + txtemail + "' AND PHONE=" + "'" + txtph + "' AND BIRTHDATE=" + "'" + txtdate + "'";
                    dt1 = DCCon.ReadData(query);

                    if (dt1.Tables[0].Rows.Count != 0)
                    {
                        Session["email"] = dt1.Tables[0].Rows[0]["EMAIL"].ToString();
                        Session["name"] = dt1.Tables[0].Rows[0]["NAME"].ToString();

                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No User found In database Please register!!!')", true);

                    }
                }
            }
            catch(Exception ex)
            {

            }
            
        }

    }
}