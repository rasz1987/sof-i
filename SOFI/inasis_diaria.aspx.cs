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
    public partial class inasis_diaria : System.Web.UI.Page
    {
        // CONEXIÓN A LA BASE DE DATOS MEDIANTE EL CONNECTIONSTRING DEL WEB.CONFIG.
        string cs = ConfigurationManager.ConnectionStrings["ATT2007ConnectionString"].ConnectionString;

        //DECLARACIÓN DE VARIABLES
        OleDbConnection con;
        OleDbDataAdapter adapt;
        DataTable dt;
        string a = "select fecha from INASISTENCIA where fecha = date()";
        string fec = DateTime.Today.ToString("dd/MM/yyyy");


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                inasistencia();
            }

        }
        
        //NOTIFICACIÓN PARA LA ACTUALIZACIÓN DIARIA DE LA TABLA INASISTENCIA
        protected void inasistencia()
        {
            con = new OleDbConnection(cs);
            con.Open();
            //VERIFICACIÓN DE LA DESCARGA DE LOS DATOS DE LA MAQUINA A LA DATABASE.
            OleDbCommand query = new OleDbCommand("SELECT count(userid) FROM CHECKINOUT WHERE CHECKTIME between DATE() and date()+1;", con);
            //OleDbCommand query = new OleDbCommand("SELECT count(userid) FROM CHECKINOUT WHERE CHECKTIME=DATE()", con);
            query.ExecuteNonQuery();
            string query1 = Convert.ToString(query.ExecuteScalar());
            if (query1 == "0")
            {
                Response.Write("<script>alert('Los datos del captahuella no han sido descargados aún, los datos deben ser descargados para poder generar y guardar las inasistencias diarias ');</script>");
                gv_data.Visible = false;
            }
            else
            {
                Button1.Enabled = true;
            }
            
            OleDbCommand contador = new OleDbCommand("select count(codemp) from inasistencia where fecha=date();", con);
            contador.ExecuteNonQuery();
            string contador1 = Convert.ToString(contador.ExecuteScalar());
            Label1.Text = ("Total de inasistencias = " + "" + contador1);
            con.Close();
 
        }



        // MÉTODO PARA MOSTRAR LOS DATOS EN EL GRIDVIEW
        protected void showdata()
        {
            dt = new DataTable();
            con = new OleDbConnection(cs);
            con.Open();
            adapt = new OleDbDataAdapter("SELECT userinfo.ssn AS codemp, '407' AS codcon, Date()-1 AS fecha, '0' AS monto, '0' AS acumulado FROM userinfo WHERE (((Exists (select * from checkinout where checkinout.userid = userinfo.userid and checkinout.checktime between Date()-1 and Date()))=False)); ", con);
            //adapt = new OleDbDataAdapter("select num_ser, fecha, desc_ser, nom_user, estatus, fecha_fin from dbo.sol_ser order by (fecha) desc", con);
            adapt.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                gv_data.DataSource = dt;
                gv_data.DataBind();
            }
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con = new OleDbConnection(cs);
            con.Open();
            
            OleDbCommand comando1 = new OleDbCommand(a, con);
            comando1.ExecuteNonQuery();
            string fecha = Convert.ToString(comando1.ExecuteScalar());
            
            //CONDICIÓN "IF-ELSE" PARA GUARDAR LAS INASISTENCIAS DIARIAS
            if (fecha != "")
                {
                    Response.Write("<script>alert('La lista de inasistecia ya se ha guardado por el día de hoy');</script>");
                }
            else
                {
                    string q = "INSERT INTO INASISTENCIA ( codemp, codcon, fecha, monto, acumulado) values(@codigo, @codconcept, @fecha, @monto, Acumulado)";
             //string q = "INSERT INTO INASISTENCIA (codemp) values(@codigo)";
                    OleDbCommand comando = new OleDbCommand(q, con);
                    foreach (GridViewRow row in gv_data.Rows)
                {
                    comando.Parameters.Clear();
                    comando.Parameters.AddWithValue("@codigo", Convert.ToString(row.Cells[0].Text));
                    comando.Parameters.AddWithValue("@codconcept", Convert.ToString(row.Cells[1].Text));
                    comando.Parameters.AddWithValue("@fecha", Convert.ToString(row.Cells[2].Text));
                    comando.Parameters.AddWithValue("@monto", Convert.ToString(row.Cells[3].Text));
                    comando.Parameters.AddWithValue("@acumulate", Convert.ToString(row.Cells[4].Text));
                    comando.ExecuteNonQuery();
                    
                }
                    Response.Redirect("inasis_diaria.aspx");
                con.Close();
            }

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            // Limpiamos la salida
            Response.Clear();
            // Con esto le decimos al browser que la salida sera descargable
            Response.ContentType = "application/octet-stream";
            // esta linea es opcional, en donde podemos cambiar el nombre del fichero a descargar (para que sea diferente al original)
            Response.AddHeader("Content-Disposition", "attachment; filename=images/MANUAL DE USUARIO SOFI.PDF");
            // Escribimos el fichero a enviar 
            Response.WriteFile("images/MANUAL DE USUARIO SOFI.PDF");
            // volcamos el stream 
            Response.Flush();
            // Enviamos todo el encabezado ahora
            Response.End();
        }

       

    }
}