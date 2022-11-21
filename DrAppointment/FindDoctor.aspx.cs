using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DrAppointment
{
    public partial class FindDoctor : System.Web.UI.Page
    {
        Database dc = new Database();
        public List<InfoDetails> filter = new List<InfoDetails>();
        protected void Page_Load(object sender, EventArgs e)
        {

            string querystring = Request.QueryString["Expertise"];
            if(querystring == null)
            {
                LoadDoctors("SELECT * FROM DoctorDetails");
            }
            else if (querystring.Contains("Eye"))
            {
                LoadDoctors("SELECT * FROM DoctorDetails where Expertise = 'Eye Care'");
            }
            else if (querystring.Contains("Primary"))
            {
                LoadDoctors("SELECT * FROM DoctorDetails where Expertise = 'Primary Care'");
            }
            else if (querystring.Contains("Dentist"))
            {
                LoadDoctors("SELECT * FROM DoctorDetails where Expertise = 'Dentist'");
            }
            else if (querystring.Contains("Dermatologists"))
            {
                LoadDoctors("SELECT * FROM DoctorDetails where Expertise = 'Dermatologists'");
            }
            else
            {
                LoadDoctors("SELECT * FROM DoctorDetails");
            }
            


        }


        private void LoadDoctors(string query)
        {
            DataSet dt1 = new DataSet();
            try
            {
                dt1 = dc.ReadData(query);
                var random = new Random();
                var list = new List<string> { "4.79(402)", "4.85(3,198)", "4.85(2,332)", "4.86(1,917)", "4.84(5,059)", "4.75(12)", "4.83(601)", "4.85(3,198)" };

                for (int i = 0; i < dt1.Tables[0].Rows.Count; i++)
                {
                    InfoDetails id = new InfoDetails();

                    id.Name = dt1.Tables[0].Rows[i]["NAME"].ToString();
                    id.Gender = dt1.Tables[0].Rows[i]["GENDER"].ToString();
                    id.BirthDate = dt1.Tables[0].Rows[i]["BIRTHDATE"].ToString();
                    id.Email = dt1.Tables[0].Rows[i]["EMAIL"].ToString();
                    id.Phone = dt1.Tables[0].Rows[i]["PHONE"].ToString();
                    id.Expertise = dt1.Tables[0].Rows[i]["EXPERTISE"].ToString();

                    int index = random.Next(list.Count);

                    id.rating = list[index];

                    filter.Add(id);
                }
            }
            catch(Exception ex)
            {

            }
            

        }
    }
}