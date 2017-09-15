using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.OleDb;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace SOFI
{
    public partial class asistencias : System.Web.UI.Page
    {
        // CONEXIÓN A LA BASE DE DATOS MEDIANTE EL CONNECTIONSTRING DEL WEB.CONFIG.
        string cs = ConfigurationManager.ConnectionStrings["ATT2007ConnectionString"].ConnectionString;
        //DECLARACIÓN DE VARIABLES
        OleDbConnection con;
        OleDbDataAdapter adapt;
        DataTable dt;
        string fec = DateTime.Today.ToString("dd/MM/yyyy");

        protected void Page_Load(object sender, EventArgs e)
        {
            MaintainScrollPositionOnPostBack = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Autentificacion.Asistencia(TextBox1.Text))
            {
                dt = new DataTable();
                con = new OleDbConnection(cs);
                con.Open();
                adapt = new OleDbDataAdapter("SELECT a.ssn, a.name, b.checktime FROM userinfo AS a INNER JOIN checkinout AS b ON a.userid = b.userid where a.ssn='" + TextBox1.Text + "' order by b.checktime desc", con);
                adapt.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    gv_data.DataSource = dt;
                    gv_data.DataBind();
                }
            }
            else
            {
                Response.Write("<script>alert('El empleado no existe');</script>");
            }
        }
    }
}
