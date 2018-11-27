using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TEColones.gui.Administrador
{
    public partial class HistorialAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListItem m = new ListItem("2018", "1");
                ListItem m2 = new ListItem("2017", "2");
                ListItem m3 = new ListItem("2016", "3");

                ListItem m4 = new ListItem("Enero", "1");
                ListItem m5 = new ListItem("Febreo", "2");
                ListItem m6 = new ListItem("Marzo", "3");

                ListItem m7 = new ListItem("CENTRAL", "1");
                ListItem m8 = new ListItem("SAN JOSE", "2");
                ListItem m9 = new ListItem("SAN CARLOS", "3");

                DDList_Ano.Items.Add(m);
                DDList_Ano.Items.Add(m2);
                DDList_Ano.Items.Add(m3);
                DDList_Ano.DataBind();

                DDList_Mes.Items.Add(m4);
                DDList_Mes.Items.Add(m5);
                DDList_Mes.Items.Add(m6);
                DDList_Mes.DataBind();

                DDList_Sede.Items.Add(m7);
                DDList_Sede.Items.Add(m8);
                DDList_Sede.Items.Add(m9);
                DDList_Sede.DataBind();
            }
        }

        protected void btnConsulta_Click(object sender, EventArgs e)
        {
            // Do Something
            getGraphInfo();
        }

        protected string getGraphInfo()
        {
            string info = "[['Sede', 'Reciclaje'],['SEDE CENTRAL CARTAGO', 20], ['SEDE REGIONAL SAN CARLOS', 10],['CENTRO ACADÉMICO DE ALAJUELA', 7],['CENTRO ACADÉMICO DE LIMÓN', 8],['CENTRO ACADÉMICO DE SAN JOSÉ', 5]]";

            return info;
        }
    }
}