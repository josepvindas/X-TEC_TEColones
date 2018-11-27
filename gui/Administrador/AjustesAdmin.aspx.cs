using Logic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace TEColones.gui.Administrador
{
    public partial class AjustesAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                configPerfil.Visible = false;
                creacionCuenta.Visible = false;
                loadPlatformConfig();
                alertError.Visible = false;
                sedeAdmin.Visible = false;
            }

        }

        // Se encarga de cargar toda la informacion pertinente a la configuracion de la cuenta y distribuirla a los largo de la
        // GUI
        protected void loadPlatformConfig()
        {
            // Cargar algo desde el servidor aqui

            // Asignacion de los diferentes tipos de informacion desde la base de datos a variables
            string format = "Nu!";
            string carton = "50";
            string vidrio = "60";
            string papel = "30";
            string plastico = "100";
            string cambio = "500";

            // Distribucion de la informacion en la pantalla de configuracion de la plataforma
            formatTweet.Text = format;
            precioCarton.Text = carton;
            precioPapel.Text = papel;
            precioPlastico.Text = plastico;
            precioVidrio.Text = vidrio;
            txtTipoCambio.Text = cambio;

        }

        // Se encarga de cargar toda la informacion pertinenete a la configuracion del perfil de administrador y distribuirla a lo
        // largo de la GUI
        protected void loadProfileConfig()
        {
            // my code here
        }

        // Presenta al administrador con la opcion de crear una nueva cuenta de administraor, o bien, una cuenta para un encargado de un centeo de acopio. 
        protected void createAdminAccConfig()
        {
            ListItem m = new ListItem("Administrador", "1");
            ListItem m2 = new ListItem("Administrador Centro de Acopio", "2");
            DDList_tipoLogin.Items.Add(m);
            DDList_tipoLogin.Items.Add(m2);
            // Agregar las opciones al dropDown de universidades
            universidadAdmin.Items.Add("Instituto Tecnologico de Costa Rica");

            // Agregar las opciones al dropDown de Departamentos


            /*Esta funcion se encarga de manejar JsonArray, emplea un foreach de cada Json dentro del Array*/

            jsonManagement JS = new jsonManagement();
            string myJson = JS.infoDepartamento((string)Session["AminUniID"]);
            JArray myArray = JArray.Parse(myJson);
            string myJson2 = JS.infoCentroAcopio((string)Session["AminUniID"]);
            JArray myArray2 = JArray.Parse(myJson2);
            dynamic sede = JsonConvert.DeserializeObject(myJson);
            foreach (JObject item in myArray)
            {
                departamentoAdmin.Items.Add(new ListItem((string)item.GetValue("departamento"), (string)item.GetValue("iddepartamento")));
            }

            foreach (JObject item in myArray2)
            {
                sedeAdmin.Items.Add(new ListItem((string)item.GetValue("CentroAcopio"), (string)item.GetValue("idcentroacopio")));
            }

            /*
            departamentoAdmin.Items.Add("Departamento de Recursos Humanos");
            departamentoAdmin.Items.Add("Departamento Financiero Contable");
            departamentoAdmin.Items.Add("Departamento de Aprovisionamiento");
            departamentoAdmin.Items.Add("Departamento de Servicios Generales");
            departamentoAdmin.Items.Add("Departamento de Administración de Mantenimiento");
            departamentoAdmin.Items.Add("Centro de Vinculación Universidad Empresa");
            departamentoAdmin.Items.Add("Dirección de Posgrado");
            departamentoAdmin.Items.Add("Administración de Centros de Acopio");*/
        }

        // Ajusta la ventana a la informacion para la configuracion del perfil.
        protected void perfLink_Click(object sender, EventArgs e)
        {

            configPlatform.Visible = false;
            configPerfil.Visible = true;
            creacionCuenta.Visible = false;
            loadProfileConfig();
        }

        // Ajusta la ventana a la informacion para la configuracion de la plataforma.
        protected void platLink_Click(object sender, EventArgs e)
        {
            configPlatform.Visible = true;
            configPerfil.Visible = false;
            creacionCuenta.Visible = false;
            loadPlatformConfig();
        }

        // Ajusta la ventana a la informacion para la creacion de cuentas de administrador y encargado de centros de acopio.
        protected void crearLink_Click(object sender, EventArgs e)
        {
            txtPO.Text = precioCarton.Text;
            configPlatform.Visible = false;
            configPerfil.Visible = false;
            creacionCuenta.Visible = true;
            createAdminAccConfig();
        }

        // Redirecciona al usuario al Dashboard de administrador.
        protected void logo_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/gui/Administrador/DashboardAdmin.aspx");
        }

        // Redirecciona al usuario a la pagina de iniciar sesion luego de confirmar que desea realizar esta accion.
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            // Hacer Algo con un Modal aqui
            Response.Redirect("~/gui/Login.aspx");
        }

        // Obtiene todos los datos para la creacion de la cuenta de administrador o administrador del centro de acopio.
        protected void btnCrearCuenta_Click(object sender, EventArgs e)
        {
            jsonManagement JS = new jsonManagement();
            string tipoLogin = DDList_tipoLogin.SelectedItem.Text;
            string nombre = nombreAdmin.Text;
            string apellido1 = txtApellido1.Text;
            string apellido2 = txtApellido2.Text;
            string cedula = cedulaAdmin.Text;
            string correo = correoAdmin.Text;
            string universidad = universidadAdmin.SelectedValue.ToString();
            string departamento = departamentoAdmin.SelectedValue.ToString();
            string sede = sedeAdmin.SelectedValue.ToString();
            string contrasena = contrasenaAdmin.Text;

            if (tipoLogin == "Administrador")
            {
                string myJson = JS.insertAdministrador(nombre, apellido1, apellido2, cedula, contrasena, departamento);
                string my = JS.urlinsertAdministrador(nombre, apellido1, apellido2, cedula, contrasena, departamento);
                txtConfirmarPass.Text = my;

                if (my.Equals("-1"))
                {
                    alertError.InnerHtml = "Lo sentimos. No se puede crear una cuenta de administrador en este momento, por favor intentelo mas tarde.";
                    alertError.Visible = true;
                }
                else
                {
                    alertError.InnerHtml = "Cuenta de Administrador creada exitosamente.";
                    alertError.Visible = true;
                }
            }
            else{
                //txtApellido2.Text = JS.urlinsertAdministradorAcopio(nombre, apellido1, apellido2, cedula, contrasena, sede);
                
                string myJson = JS.insertAdministradorAcopio(nombre, apellido1, apellido2, cedula, contrasena, sede);
                dynamic resultado = JsonConvert.DeserializeObject(myJson);
                string my = resultado[0].Respuesta;


                if (my.Equals("-1"))
                {
                    alertError.InnerHtml = "Lo sentimos. No se puede crear una cuenta de administrador de Centro de Acopio en este momento, por favor intentelo mas tarde.";
                    alertError.Visible = true;
                }
                else
                {
                    alertError.InnerHtml = "Cuenta de Administrador de centro de acopio creada exitosamente.";
                    alertError.Visible = true;
                }
                
            }



        }

        // Guarda todos los cambios en la configuracion de la plataforma
        protected void btnGuardarCambios_Click(object sender, EventArgs e)
        {
            /*
            string formato = formatTweet.Text;
            string carton = precioCarton.Text;
            string paper = precioPapel.Text;
            string plastic = precioPlastico.Text;
            string glass = precioVidrio.Text;
            string convert = txtTipoCambio.Text;

            jsonManagement JS = new jsonManagement();
            JS.insertTipoTweet(formato, "1");
            JS.insertTipoCambio(convert);
            */
            // insertar precio de materiales
        }

        protected void btnActualizarTipoCambio_Click(object sender, EventArgs e)
        {
            jsonManagement JS = new jsonManagement();
            string myJson = JS.insertTipoCambio(txtTipoCambio.Text);
            dynamic cambio = JsonConvert.DeserializeObject(myJson);
            string respuesta = cambio[0].Respuesta;
            if (respuesta.Equals("-1"))
            {
                alertError.InnerHtml = "Error al tratar de actualziar el Tipo de Cambio, Intente de nuevo";
                alertError.Visible = true;
            }
            else
            {
                alertError.InnerHtml = "Tipo de Cambio Actualizado !";
                alertError.Visible = true;
            }
        }

        protected void txtTipoCambio_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DDList_tipoLogin_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDList_tipoLogin.SelectedItem.Text == "Administrador")
            {
                pDepar_Sede.InnerHtml = "Departamento";
                sedeAdmin.Visible = false;
                departamentoAdmin.Visible = true;

            }

            else
            {
                pDepar_Sede.InnerHtml = "Sede";
                sedeAdmin.Visible = true;
                departamentoAdmin.Visible = false;

            }
        }
    }
}
