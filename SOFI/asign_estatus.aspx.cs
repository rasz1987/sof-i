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
    public partial class asign_estatus : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ATT2007ConnectionString"].ConnectionString;

        //DECLARACIÓN DE VARIABLES
        OleDbConnection con;
        OleDbDataAdapter adapt;
        DataTable dt;




        string fec = DateTime.Today.ToString("dd/MM/yyyy");
        protected void Page_Load(object sender, EventArgs e)
        {
            RangeValidator1.MaximumValue = DateTime.Today.AddMonths(2).ToShortDateString();
            RangeValidator1.MinimumValue = DateTime.Today.ToShortDateString();

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "3")
            {
                Label2.Visible = true;
                tb1.Visible = true;
            }
            else
            {
                Label2.Visible = false;
                tb1.Visible = false;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
                con = new OleDbConnection(cs);
                string q = "INSERT INTO ESTATUS (ci, id_falta, fec_ini, fec_hasta, desc_reposo) values(@ci, @id_falta, @fec_ini, @fec_hasta, @desc)";
                OleDbCommand comando = new OleDbCommand(q, con);
                con.Open();

                foreach (ListItem li in CheckBoxList1.Items)
                {
                    if (li.Selected)
                    {
                        comando.Parameters.Clear();
                        comando.Parameters.AddWithValue("@ci", Convert.ToString(li.Value));
                        comando.Parameters.AddWithValue("@id_falta", Convert.ToString(DropDownList1.SelectedValue));
                        comando.Parameters.AddWithValue("@fec_ini", Convert.ToString(TextBox2.Text));
                        comando.Parameters.AddWithValue("@fec_hasta", Convert.ToString(TextBox3.Text));
                        comando.Parameters.AddWithValue("@desc", Convert.ToString(tb1.Text));
                        comando.ExecuteNonQuery();
                        Response.Write("<script>alert('Sus datos se han guardado satisfactoriamente');window.location.href='asign_estatus.aspx';</script>");
                    }
                 }
                con.Close();
                    
                
       

        }
    }
}