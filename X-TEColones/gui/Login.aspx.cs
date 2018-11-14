using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gui_Login : System.Web.UI.Page
{    
        protected void Page_Load(object sender, EventArgs e)
    {
        DDList_User.Items.Add("Estudiante");
        DDList_User.Items.Add("Administrador");
        DDList_User.Items.Add("Administrador Centro de Acopio");

    }

    protected void btnCrearCuenta_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/gui/Estudiante/SigninEstudiante.aspx"); 
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Write("<script>alert('USUARIO INCORRECTO')</script>");
        Response.Redirect("~/gui/Estudiante/Dashboard.aspx");
    }
}
