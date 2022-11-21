using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DrAppointment
{
    public partial class JoinUs : System.Web.UI.Page
    {
        Database DCCon = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {
            expertise.Visible = false;
            expertdiv.Visible = false;
        }


        protected void SelectExpertise(object sender, EventArgs e)
        {
            if(JoinAs.SelectedValue == "Doctor")
            {
                expertdiv.Visible = true;
                expertise.Visible = true;
            }
            else
            {
                expertise.Visible = false;
            }
        }


        protected void Registeration(object sender, EventArgs e)
        {
            DataSet dt1 = new DataSet();
            try
            {
                string txtname = name.Text;
                string txtemail = email.Text;
                string txtdob = dob.Text;
                string txtph = phone.Text;
                string txtgender = Gender.SelectedValue;
                string txtjoinas = JoinAs.SelectedValue;
                string query = string.Empty;
                if (txtjoinas == "Doctor")
                {
                    string txtexpert = expertise.SelectedValue;

                    dt1 = DCCon.ReadData("SELECT TOP 1 * FROM DoctorDetails ORDER BY DOCTORID DESC");

                    int userid = 0;
                    if (dt1.Tables.Count > 0)
                    {
                        userid = Convert.ToInt32(dt1.Tables[0].Rows[0]["DOCTORID"].ToString().Replace("DR", "")) + 1;
                    }
                    else
                    {
                        userid = 1;
                    }
                    string id = "DR" + userid;

                    query = "INSERT INTO DoctorDetails VALUES(" + "'" + id + "'" + "," + "'" + txtname + "'" + "," + "'" + txtgender + "'" + "," + "'" + txtdob + "'" + "," + "'" + txtemail + "'" + "," + "'" + txtph + "'" + "," + "'" + txtexpert + "'" + ")";
                }
                else if(txtjoinas == "Patient")
                {
                    dt1 = DCCon.ReadData("SELECT TOP 1 * FROM PatientDetails ORDER BY PATIENTID DESC");
                    int userid = 0;
                    if(dt1.Tables.Count > 0)
                    {
                        userid = Convert.ToInt32(dt1.Tables[0].Rows[0]["PATIENTID"].ToString().Replace("P","")) + 1;
                    }
                    else
                    {
                        userid = 1;
                    }
                    
                    string id = "P" + userid;

                    query = "INSERT INTO PatientDetails VALUES(" + "'" + id + "'" + "," + "'" + txtname + "'" + "," + "'" + txtgender + "'" + "," + "'" + txtdob + "'" + "," + "'" + txtemail + "'" + "," + "'" + txtph + "'" + ")";
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Select Who you want to Join As??')", true);
                }
                
                if (DCCon.Insert(query))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thanks for registering')", true);

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please try again')", true);

                }
            }
            catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error Occured!!!')", true);
            }
        }
        
    }
}