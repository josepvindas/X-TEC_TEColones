using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gui_Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        DDList_Servicios.Items.Add("Departamento Financiero");
        DDList_Servicios.Items.Add("Comedor Institucional");
        imgProfile.ImageUrl = "/assets/img_avatar.png";


    }

    protected void btnEditarPerfil_Click(object sender, EventArgs e)
    {
        //  ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Pop", "< script >$('#transferModal').modal('show');</ script > ", false);
        // Response.Redirect("~/gui/EditProfile.aspx");
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);

    }
}