using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DrAppointment
{
    public partial class Reservation : System.Web.UI.Page
    {

        Database dc = new Database();

        protected void Page_Load(object sender, EventArgs e)
        {

            if(Session["email"] == null)
            {
                //Session["url"] = Request.Url;
                Response.Redirect("Login.aspx");
            }
            

            string email  = Request.QueryString["Email"];

            loadData(email);
        }



        private void loadData(string email)
        {
            DataSet dt1 = new DataSet();
            try
            {

                dt1 = dc.ReadData("SELECT * FROM DoctorDetails where Email="+"'"+email+"'");
                var random = new Random();
                var list = new List<string> { "4.79(402)", "4.85(3,198)", "4.85(2,332)", "4.86(1,917)", "4.84(5,059)", "4.75(12)", "4.83(601)", "4.85(3,198)" };

                string drID = dt1.Tables[0].Rows[0]["DOCTORID"].ToString();
                Session["DoctorID"] = drID;
                name.Text = dt1.Tables[0].Rows[0]["NAME"].ToString();
                lblemail.Text += dt1.Tables[0].Rows[0]["EMAIL"].ToString();
                phone.Text += dt1.Tables[0].Rows[0]["PHONE"].ToString();
                expertise.Text = dt1.Tables[0].Rows[0]["EXPERTISE"].ToString();
                int index = random.Next(list.Count);

                rating.Text = list[index];


                
            }
            catch (Exception ex)
            {

            }
        }

        protected void ScheduleAppointment(object sender, EventArgs e)
        {
            DataSet dt1 = new DataSet();
            try
            {
                string pname = patientname.Text;
                string pemail = patientemail.Text;
                string page = patientage.Text;
                string healthcheck = healthcheckup.SelectedValue;
                string healthcondition = condition.SelectedValue;
                string drugalchol = drug.SelectedValue;
                string overallhealth = overall.SelectedValue;
                string datetime = datetimeappo.Text;
                string usercomment = comments.Text;

                string DrEmail = Request.QueryString["Email"];
                string DrID = Session["DoctorID"].ToString();

                dt1 = dc.ReadData("SELECT TOP 1 * FROM AppointmentDetails ORDER BY AppointmentNo DESC");

                int userid = 0;
                if (dt1.Tables[0].Rows.Count > 0)
                {
                    
                    userid = Convert.ToInt32(dt1.Tables[0].Rows[0]["AppointmentNo"].ToString()) + 1;
                }
                else
                {
                    userid = 1;
                }
                
                string query = "INSERT INTO AppointmentDetails VALUES(" + "'" + userid + "'" + "," + "'" + pname + "'" + "," + "'" + pemail + "'" + "," + "'" + page + "'" + "," + "'" + healthcheck + "'" + "," + "'" + healthcondition + "'" + "," + "'" + drugalchol + "'" + "," + "'" + overallhealth + "'" + "," + "'" + datetime + "'" + "," + "'" + usercomment + "'" + "," + "'" + DrID + "'" + "," + "'" + DrEmail + "'" + ")";
                

                if (dc.Insert(query))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thanks for Booking Appointment')", true);

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please try again')", true);

                }

            }
            catch(Exception ex)
            {

            }
        }
    }
}