using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Data;
using System.Data.OleDb;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace SOFI
{
    public static class Autentificacion
    {
       
        public static bool Autenticar(string usuario, string password)
        {
            OleDbConnection con;
            //Cadena de conexión
            string cs = ConfigurationManager.ConnectionStrings["ATT2007ConnectionString"].ConnectionString;
            //consulta a la base de datos
            string sql = " select count(*) from usuarios where usuario=@user and password=@pass";


            con = new OleDbConnection(cs);
            con.Open();
            OleDbCommand query = new OleDbCommand(sql, con);
            query.Parameters.AddWithValue("@user", usuario); //enviamos los parametros
            query.Parameters.AddWithValue("@pass", password);

                int count = Convert.ToInt32(query.ExecuteScalar()); //devuelve la fila afectada

                if (count == 0)
                    return false;
                else
                    return true;

        }
    }

}