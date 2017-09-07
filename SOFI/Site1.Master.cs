using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SOFI
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
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
        protected void Page_Load(object sender, EventArgs e)
        {
            String activepage = Request.RawUrl;
            if (activepage.Contains("inicio.aspx"))
            {
                page1.Attributes.Add("class","active");
            }
            else if (activepage.Contains("busq_esp.aspx"))
            {
                page2.Attributes.Add("class","active");
            }
            else if (activepage.Contains("inasis_diaria.aspx"))
            {
                page3.Attributes.Add("class","active");
            }
            else if (activepage.Contains("inasis_quincenal.aspx"))
            {
                page4.Attributes.Add("class","active");
            }
            else if (activepage.Contains("asign_estatus.aspx"))
            {
                page5.Attributes.Add("class", "active");
            }

            

    }

        


    }
}