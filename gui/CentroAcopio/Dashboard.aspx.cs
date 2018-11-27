using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logic;
using Newtonsoft.Json;

namespace TEColones.gui.CentroAcopio
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListItem m = new ListItem("Carton", "2");
                ListItem m2 = new ListItem("Plastico", "1");
                ListItem m3 = new ListItem("Papel", "4");
                ListItem m4 = new ListItem("Vidrio", "3");

                DDlist_material.Items.Add(m);
                DDlist_material.Items.Add(m2);
                DDlist_material.Items.Add(m3);
                DDlist_material.Items.Add(m4);
                alertError.Visible = false;
                //  DDList_material.DataBind();
            }
        }

        protected void registrarMaterial (object sender, EventArgs e)
        {
            string idSede = (string)Session["AminSedeID"];
            string idUsuario = txtCarnet.Text;
            string cantidad = TxtCantidad.Text;
            string idmaterial = DDlist_material.SelectedValue.ToString();
            jsonManagement JS = new Logic.jsonManagement();
            string myJson = JS.insertMaterialEstudiante(idUsuario, idSede, idmaterial, cantidad);
            dynamic respuesta = JsonConvert.DeserializeObject(myJson);
            string value = respuesta[0].Respuesta;
            if (value.Equals("-1"))
            {
                alertError.InnerHtml = "Error al tratar de Registrar Material, Intente de nuevo";
                alertError.Visible = true;
            }
            else {
                alertError.InnerHtml = "Registro Exitoso";
                alertError.Visible = true;
            }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/gui/Login.aspx");
        }


    }
}