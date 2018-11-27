using Logic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Globalization;

namespace TEColones.gui.Estudiante
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                DDList_Servicios.Items.Add("Departamento Financiero");
                DDList_Servicios.Items.Add("Comedor Institucional");
                alertError.Visible = false;
                fillProfile();
            }
            //imgProfile.ImageUrl = "/assets/img_avatar.png";

            // txtCarnetAmigo.Text = Session["Eid"].ToString();
        }

        protected void fillProfile()
        {
            jsonManagement JS = new jsonManagement();
            string myJson = JS.getEstudiante((string)Session["Eid"]);
            dynamic estudiante = JsonConvert.DeserializeObject(myJson);
            string x = (string)Session["Eid"];
            lblNombre.InnerHtml = (string)estudiante[0].Nombre + " " + (string)estudiante[0].Apellido1 + " " + (string)estudiante[0].Apellido2;
            lblCarnet.InnerHtml = (string)estudiante[0].Carnet;
            lblcolonesDisp.InnerHtml = (string)estudiante[0].CantidadColones;
            lblCorreo.InnerHtml = (string)estudiante[0].Correo;
            lblDescripcion.InnerHtml = (string)estudiante[0].Descripcion;
            lblEstado.InnerHtml = (string)estudiante[0].Estado;
            lblSede.InnerHtml = (string)estudiante[0].Sede;
            lblTecolonesDisp.InnerHtml = (string)estudiante[0].CantidadTecolones;
            lblTelefono.InnerHtml = (string)estudiante[0].Telefono;
        }


        protected void btnEditarPerfil_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/gui/Login.aspx");
        }

        protected void tranferirTEColones(object sender, EventArgs e)
        {
            jsonManagement JS = new jsonManagement();
            string idEstudiante = (string)Session["Eid"];
            string idEstudiante2 = txtCarnetAmigo.Text;
            string cantidad = txtMontoTransferir.Text;

            /*
            string myJson = JS.urlCambio(idEstudiante, idEstudiante2, cantidad);
            txtMontoTransferir.Text=myJson;*/

            string myJson = JS.CompartirTecolones(idEstudiante, idEstudiante2, cantidad);
            dynamic respuesta = JsonConvert.DeserializeObject(myJson);
            string value = respuesta[0].Respuesta;
            if (value.Equals("-1"))
            {
                alertError.InnerHtml = "Error al tratar de Registrar Material, Intente de nuevo";
                alertError.Visible = true;
            }
            else
            {
                alertError.InnerHtml = "Registro Exitoso";
                alertError.Visible = true;
            }


        }

        protected void canjearTEColones(object sender, EventArgs e)
        {
            string idEstudiante = (string)Session["Eid"];
            string cantidad = txtMontoCanjear.Text;
            jsonManagement JS = new jsonManagement();
            string myJson = JS.CambiarTecolones(idEstudiante, cantidad);
            dynamic respuesta = JsonConvert.DeserializeObject(myJson);
            //txtMontoTransferir.Text = respuesta;


            string value = respuesta[0].Respuesta;
            if (value.Equals("-1"))
            {
                alertError.InnerHtml = "Oooops, la cantidad de Tecolones a Canjear es mayor al Disponible";
                alertError.Visible = true;
            }
            else
            {
                alertError.InnerHtml = "Cambio Exitoso";
                alertError.Visible = true;
                fillProfile();
            }

        }

        protected void errorImplementacion(object sender, EventArgs e)
        {
            // do something
            if (alertError.Visible == true)
            {
                alertError.Visible = false;
            }
            else
            {
                alertError.InnerHtml = "Oops! Esto aun no ha sido implementado.";
                alertError.Visible = true;
            }

        }

    }
}