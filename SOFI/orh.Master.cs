using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SOFI
{
    public partial class orh : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //se borra la cookie de autenticacion
            FormsAuthentication.SignOut();

            //se redirecciona al usuario a la pagina de login
            Response.Redirect(Request.UrlReferrer.ToString());
        }

        
    }
}