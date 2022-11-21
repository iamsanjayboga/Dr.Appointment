using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DrAppointment
{
    public partial class ViewAllByList : System.Web.UI.Page
    {
        Database dc = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet dt1 = new DataSet();

            string query = "SELECT * FROM PatientDetails";

            dt1 = dc.ReadData(query);

            PatientGridView1.DataSource = dt1;
            PatientGridView1.DataBind();


            DataSet dt2 = new DataSet();

            string query2 = "SELECT * FROM DoctorDetails";

            dt2 = dc.ReadData(query2);

            DoctorGridView2.DataSource = dt2;
            DoctorGridView2.DataBind();
        }
    }
}