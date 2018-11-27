using System;
using System.Collections.Generic;
using System.Linq;
using Logic;
using System.Web;
using System.Web.UI;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Web.UI.WebControls;

namespace TEColones.gui.Estudiante
{
    public partial class crearCuenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DDList_Universidad.Items.Add("Instituto Tecnologico de Costa Rica");
                alertError.Visible = false;
                loadData();
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

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            string nombre = txtNombre.Text;
            string primerApellido = txtApellido1.Text;
            string SegundoApellido = txtApellido2.Text;
            string correo = txtCorreo1.Text;
            string telefono = txtTelefono.Text;
            string carnet = txtCarnet.Text;
            string password = txtPassword.Text;
            string idSede = DDList_Sede.SelectedValue.ToString();
            string descripcion = txtDescripcionEst.Text;
            string correoSecundario = txtCorreo2.Text;
            string telefonoSecundario = txtTelefono2.Text;
            jsonManagement JS = new jsonManagement();

            string myJson = JS.insertEstudiante(nombre, primerApellido, SegundoApellido, carnet, password, "0",
                telefono, idSede, correo, descripcion, telefonoSecundario, correoSecundario);

            
            string urlEstudiante= JS.URLEstudiante(nombre, primerApellido, SegundoApellido, carnet, password, "0",
                 telefono, idSede, correo, descripcion, telefonoSecundario, correoSecundario);
                 


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
                }



                txtDescripcionEst.Text = urlEstudiante;

            }
        }
    }
}

