using System;
using Logic;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;

namespace TEColones.gui.Estudiante
{
    public partial class SigninEstudiante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
                //alertError.Visible = false;
                // cargar la imagen del avatar desde el folder de assets
                OmgProfile.ImageUrl = "assets/img_avatar.png";

                // Lista de universidades
                DDList_Universidad.Items.Add("Instituto Tecnologico de Costa Rica");


            }
        }
        protected void loadData()
        {
            jsonManagement JS = new jsonManagement();
            string myJson = JS.infosede("1");

            JArray myArray = JArray.Parse(myJson);
            dynamic sede = JsonConvert.DeserializeObject(myJson);

            foreach (JObject item in myArray)
            {
                DDList_Sede.Items.Add(new ListItem((string)item.GetValue("Sede"), (string)item.GetValue("idsede")));
            }
        }

        // Al dar click en el boton de crear cuenta se comunica con la base 
        protected void btnSignUp_Click()
        {
            /*
            string nombre = txtNombre.Text;
            string primerApellido = txtApellido1.Text;
            string SegundoApellido = txtApellido2.Text;
            string correo = txtEmail.Text;
            string telefono = txtNumeroTel.Text;
            string carnet = txtNumeroSec.Text;
            string password = txtPassword.Text;
            string idSede = DDList_Sede.SelectedValue.ToString();
            string descripcion = txtDescripcionEst.Text;
            string correoSecundario = txtEmailSec.Text;
            string telefonoSecundario = txtNumeroSec.Text;
            jsonManagement JS = new jsonManagement();
            JS.insertUniversidad("Jooko");
           
            */

           /* string myJson = JS.insertEstudiante(nombre, primerApellido, SegundoApellido, carnet, password, "0", 
                telefono, idSede, correo, descripcion, telefonoSecundario,correoSecundario); */
            /*
            dynamic respuesta = JsonConvert.DeserializeObject(myJson);
            string estudiante = respuesta[0].Respuesta;
            {
                if (estudiante.Equals("-1"))
                {
                    //Aqui Vendría el Modal
                    alertError.InnerHtml = "Ha fallado la contrasena tres veces, por favor dirijase a DATIC";
                    alertError.Visible = true;

                }
                else
                {
                    alertError.InnerHtml = "Ha fallado la contrasena tres veces, por favor dirijase a DATIC";
                    alertError.Visible = true;

                    //Response.Redirect("~/gui/Estudiante/SigninEstudiante.aspx");
                }
            }
            */


        }

        protected void btnSignUp_Click1(object sender, EventArgs e)
        {
            txtDescripcionEst.Text = txtNombre.Text;

            /*
              dynamic respuesta = JsonConvert.DeserializeObject(myJson);
              string estudiante = respuesta[0].Respuesta;
            {
                if (estudiante.Equals("-1"))
                {
                    //Aqui Vendría el Modal
                    alertError.InnerHtml = "Ha fallado la contrasena tres veces, por favor dirijase a DATIC";
                    alertError.Visible = true;

                }
                else
                {
                    alertError.InnerHtml = "Ha fallado la contrasena tres veces, por favor dirijase a DATIC";
                    alertError.Visible = true;

                    //Response.Redirect("~/gui/Estudiante/SigninEstudiante.aspx");
                }
            }
            */
            
        }
    }
}