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
    public partial class busq_esp : System.Web.UI.Page
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

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (rb1.Checked == true)
                dt = new DataTable();
            con = new OleDbConnection(cs);
            con.Open();
            OleDbCommand query1 = new OleDbCommand("select count(codemp) from inasistencia where codemp='" + tb1.Text + "';", con);
            query1.ExecuteNonQuery();
            string query2 = Convert.ToString(query1.ExecuteScalar());
            if (query2 == "0")
            {
                Response.Write("<script>alert('El empleado no posee inasistencias');</script>");
            }
            else
            {
                adapt = new OleDbDataAdapter("SELECT A.codemp, B.name, A.fecha FROM inasistencia AS A INNER JOIN USERINFO AS B ON A.codemp = B.ssn WHERE A.CODEMP='" + tb1.Text + "' order by A.fecha;", con);
                adapt.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    gv_data.DataSource = dt;
                    gv_data.DataBind();
                }
                Label2.Text = ("Cantidad de inasistencias =" + " " + query2);
            }
            if (rb2.Checked == true)
            {
                dt = new DataTable();
                con = new OleDbConnection(cs);
                con.Open();
                OleDbCommand q1 = new OleDbCommand("select count(fecha) from inasistencia where fecha=#" + tb1.Text + "#;", con);
                q1.ExecuteNonQuery();
                string q2 = Convert.ToString(q1.ExecuteScalar());
                if (q2 == "0")
                {
                    Response.Write("<script>alert('La fecha no se encuentra registrada');</script>");
                }
                else
                {
                    adapt = new OleDbDataAdapter("SELECT A.codemp, B.name, A.fecha FROM inasistencia AS A INNER JOIN USERINFO AS B ON A.codemp = B.ssn WHERE A.fecha=#" + tb1.Text + "#;", con);
                    adapt.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        gv_data.DataSource = dt;
                        gv_data.DataBind();
                    }
                    Label2.Text = ("Cantidad de inasistencias =" + " " + q2);
                    con.Close();

                }

            }
        }

        protected void rb1_CheckedChanged(object sender, EventArgs e)
        {
            Button2.Enabled = true;

        }

        protected void rb2_CheckedChanged(object sender, EventArgs e)
        {
            Button2.Enabled = true;

        }


    }
}