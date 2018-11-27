using Logic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;

namespace TEColones
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListItem m = new ListItem("Estudiante", "1");
                ListItem m2 = new ListItem("Administrador", "2");
                ListItem m3 = new ListItem("Administrador Centro de Acopio", "3");
                DDList_User.Items.Add(m);
                DDList_User.Items.Add(m2);
                DDList_User.Items.Add(m3);

                DDList_User.DataBind();

                alertError.Visible = false;
            }

        }

        protected void btnCrearCuenta_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/gui/Estudiante/crearCuenta.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            string selection = DDList_User.SelectedItem.Text;
            int selectionID = Int32.Parse(DDList_User.SelectedValue.ToString());
            string userID = txtIdentificacion.Text;
            string userPSWD = txtPassword.Text;
            jsonManagement JS = new jsonManagement();
            string myJson = JS.logIn(userID, userPSWD, selectionID);

            if (selection == "Administrador")
            {
                if (myJson.Equals("-1"))
                {
                    //Aqui Vendría el Modal
                    alertError.InnerHtml = "Usuario o contrasena incorrectos. Por favor intentelo nuevamente";
                    alertError.Visible = true;

                }
                else
               
                {
                    if (myJson.Equals("-2"))
                    {
                        //Aqui Vendría el Modal
                        alertError.InnerHtml = "Ha fallado la contrasena tres veces, por favor dirijase a DATIC";
                        alertError.Visible = true;

                    }
                    else
                    {
                        Session["AminUniID"] = myJson;
                        Response.Redirect("~/gui/Administrador/DashboardAdmin.aspx");
                    }
                }

            }

            if (selection == "Administrador Centro de Acopio")
            {

                if (myJson.Equals("-1"))
                {
                    //Aqui Vendría el Modal
                    alertError.InnerHtml = "Usuario o contrasena incorrectos. Por favor intentelo nuevamente";
                    alertError.Visible = true;

                }

                else
                {
                    if (myJson.Equals("-2"))
                    {
                        //Aqui Vendría el Modal
                        alertError.InnerHtml = "Ha fallado la contrasena tres veces, por favor dirijase a DATIC";
                        alertError.Visible = true;

                    }
                    else
                    {
                        Session["AminSedeID"] = myJson;
                        Response.Redirect("~/gui/CentroAcopio/Dashboard.aspx");
                    }
                }
                
            }

            if (selection == "Estudiante")
            {
                if (myJson.Equals("activo"))
                {
                    Session["Eid"] = txtIdentificacion.Text;
                    Response.Redirect("~/gui/Estudiante/Dashboard.aspx");
                }
                else
                {
                    if (myJson.Equals("-1"))
                    {
                        //Aqui Vendría el Modal
                        alertError.InnerHtml = "Usuario o contrasena incorrectos. Por favor intentelo nuevamente";
                        alertError.Visible = true;
                    }
                    if (myJson.Equals("-2"))
                    {
                        //Aqui Vendría el Modal
                        alertError.InnerHtml = "Ha fallado la contrasena tres veces, por favor proceda a la seccion de recuperacion de contrasena";
                        alertError.Visible = true;
                    }
                    
                }
            }
        }

        protected void DDList_User_SelectedIndexChanged(object sender, EventArgs e)
        {


            //txtPassword.Text = DDList_User.SelectedValue.ToString();

        }

        protected void recuperarContrasena_Click(object sender, EventArgs e)
        {
            //Response.Redirect("~/gui/recuperarContrasena.aspx");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
        }
    }
}



