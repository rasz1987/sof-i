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
    public partial class inicio : System.Web.UI.Page
    {
        // CONEXIÓN A LA BASE DE DATOS MEDIANTE EL CONNECTIONSTRING DEL WEB.CONFIG.
        string cs = ConfigurationManager.ConnectionStrings["ATT2007ConnectionString"].ConnectionString;

        //DECLARACIÓN DE VARIABLES
        OleDbConnection con;
        OleDbDataAdapter adapt;
        DataTable dt;
        string a = "select fecha from INASISTENCIA where fecha = date()";
        //string query1 = "SELECT ssn, name, pager AS Teléfono, date() AS fecha FROM userinfo WHERE not exists (select * from checkinout where checkinout.userid = userinfo.userid and checkinout.checktime between date() and date()+1) and userinfo.ssn is not null;";
        string query1 = "SELECT a.codemp, b.name, c.deptname AS oficina, DATE() AS fecha FROM (inasistencia AS a INNER JOIN userinfo AS b ON a.codemp = b.ssn ) INNER JOIN departments AS c ON b.defaultdeptid=c.deptid WHERE a.fecha=DATE() AND b.ssn IS NOT NULL ORDER BY c.deptname;";
        string fec = DateTime.Today.ToString("dd/MM/yyyy");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                inasistencia();

            }

        }

        protected void inasistencia()
        {
            con = new OleDbConnection(cs);
            con.Open();
            OleDbCommand comando1 = new OleDbCommand(a, con);
            comando1.ExecuteNonQuery();
            string fecha = Convert.ToString(comando1.ExecuteScalar());

            if (fecha.ToString() == "")
            {
                Response.Write("<script>alert('La lista de inasistecia se encuentra desactualizada, solicite a ORH que actualice la tabla');</script>");
            }
            else
            {
                con = new OleDbConnection(cs);
                con.Open();

                dt = new DataTable();
                con = new OleDbConnection(cs);
                con.Open();
                adapt = new OleDbDataAdapter(query1, con);
                adapt.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    gv_data.DataSource = dt;
                    gv_data.DataBind();
                }
                OleDbCommand contador = new OleDbCommand("select count(codemp) from inasistencia where fecha=date();", con);
                contador.ExecuteNonQuery();
                string contador1 = Convert.ToString(contador.ExecuteScalar());
                Label1.Text = ("Total de inasistencias = " + "" + contador1);
                con.Close();
            }
            con.Close();
        }

        
    }
}