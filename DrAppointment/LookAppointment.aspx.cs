using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DrAppointment
{
    public partial class LookAppointment : System.Web.UI.Page
    {
        Database dc = new Database();
        public List<InfoDetails> filter = new List<InfoDetails>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if(Request.QueryString["CancelAppointment"] != null)
            {
                string appno = Request.QueryString["CancelAppointment"];
                cancelappointment(appno);
            }

            appointment();
        }

        private void cancelappointment(string appno)
        {
            string query = "DELETE FROM AppointmentDetails WHERE AppointmentNo =" + appno;

            if (dc.Insert(query))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Appointment Cancelled')", true);

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please try again')", true);

            }

        }
        private void appointment()
        {
            DataSet dt1 = new DataSet();

            string query = "SELECT TOP 1 * FROM PatientDetails WHERE Email=" + "'" + Session["email"] + "'";

            dt1 = dc.ReadData(query);

            if (dt1.Tables[0].Rows.Count != 0)
            {
                dt1 = dc.ReadData("SELECT A.AppointmentNo,A.PatientName,A.PatientAge, A.BookingDateTime, A.PatientEmail, D.Name FROM AppointmentDetails A JOIN DoctorDetails D ON A.DOCTORID = D.DoctorID where A.PatientEmail=" + "'" + Session["email"] + "'" + "order by a.BookingDateTime asc");

                DataTable CoursesData = dt1.Tables["Student"];

                for (int i = 0; i < dt1.Tables[0].Rows.Count; i++)
                {
                    InfoDetails id = new InfoDetails();

                    id.Name = dt1.Tables[0].Rows[i]["PatientName"].ToString();
                    id.Gender = dt1.Tables[0].Rows[i]["PatientAge"].ToString();
                    id.rating = dt1.Tables[0].Rows[i]["AppointmentNo"].ToString();
                    string[] arr = new string[2];
                    arr = dt1.Tables[0].Rows[i]["BookingDateTime"].ToString().Split(' ');
                    id.BirthDate = arr[1];
                    id.Expertise = arr[0];
                    id.Email = dt1.Tables[0].Rows[i]["PatientEmail"].ToString();
                    id.Phone = dt1.Tables[0].Rows[i]["Name"].ToString();

                    filter.Add(id);
                }
            }
            else
            {
                query = "SELECT TOP 1 * FROM DoctorDetails WHERE Email=" + "'" + Session["email"] + "'";
                dt1 = dc.ReadData(query);

                if (dt1.Tables[0].Rows.Count != 0)
                {
                    dt1 = dc.ReadData("SELECT A.AppointmentNo,A.PatientName,A.PatientAge, A.BookingDateTime, A.PatientEmail, D.Name FROM AppointmentDetails A JOIN DoctorDetails D ON A.DOCTORID = D.DoctorID where A.DoctorEmail=" + "'" + Session["email"] + "'" + "order by a.BookingDateTime asc");

                    DataTable CoursesData = dt1.Tables["Student"];

                    for (int i = 0; i < dt1.Tables[0].Rows.Count; i++)
                    {
                        InfoDetails id = new InfoDetails();

                        id.Name = dt1.Tables[0].Rows[i]["PatientName"].ToString();
                        id.Gender = dt1.Tables[0].Rows[i]["PatientAge"].ToString();
                        string[] arr = new string[2];
                        arr = dt1.Tables[0].Rows[i]["BookingDateTime"].ToString().Split(' ');
                        id.BirthDate = arr[1];
                        id.Expertise = arr[0];
                        id.Email = dt1.Tables[0].Rows[i]["PatientEmail"].ToString();
                        id.Phone = dt1.Tables[0].Rows[i]["Name"].ToString();
                        id.rating = dt1.Tables[0].Rows[i]["AppointmentNo"].ToString();

                        filter.Add(id);
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No User found In database Please register!!!')", true);
                }
            }





            

            
                      
        }
    }
}