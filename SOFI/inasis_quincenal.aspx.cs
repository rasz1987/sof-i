using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.OleDb;
using System.Web;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace SOFI
{
    public partial class inasis_quincenal : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                //showdata();
            }

        }

        protected void showdata()
        {
            dt = new DataTable();
            con = new OleDbConnection(cs);
            con.Open();
            adapt = new OleDbDataAdapter("SELECT A.codemp, A.codcon, Count(A.codemp) AS cantidad, A.monto, A.acumulado FROM INASISTENCIA as A WHERE (((A.[FECHA]) Between #" + tb1.Text + "# And #" + tb2.Text + "#)) GROUP BY A.codemp, A.codcon, A.monto, A.acumulado ORDER BY codemp;", con);
            adapt.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                gv_data.DataSource = dt;
                gv_data.DataBind();
            }
            Button2.Enabled = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            showdata();

        }

        protected void gv_data_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            exportoexcel("Inasistencia_CIDESA.xls", gv_data);
        }

        //EXPORTAR GRIDVIEW A OTRO FROMATOS
        private void exportoexcel(string nameReport, GridView wControl)
        {

            HttpResponse response = Response;
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            Page pageToRender = new Page();
            HtmlForm form = new HtmlForm();
            form.Controls.Add(wControl);
            pageToRender.Controls.Add(form);
            response.Clear();
            response.Buffer = true;
            response.ContentType = "application/vnd.ms-excel";
            response.AddHeader("Content-Disposition", "attachment;filename=" + nameReport);
            response.Charset = "UTF-8";
            response.ContentEncoding = Encoding.Default;
            pageToRender.RenderControl(htw);
            response.Write(sw.ToString());
            response.End();

        }
    }
}