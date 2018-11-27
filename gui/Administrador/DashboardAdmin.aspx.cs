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

namespace TEColones.gui.Administrador
{
    public partial class DashboardAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillPromocion();
                fillDropdownlist();
                DDList_Promocion.DataBind();
                div_doble.Visible = false;
                parseData();
                alertError.Visible = false;
            }
        }
  
        protected void fillDropdownlist()
        {
            ListItem m = new ListItem("Carton", "2");
            ListItem m2 = new ListItem("Plastico", "1");
            ListItem m3 = new ListItem("Papel", "4");
            ListItem m4 = new ListItem("Vidrio", "3");

            ListItem m5 = new ListItem("Promocion Simple", "1");

            ListItem m6 = new ListItem("Promocion Doble", "2");

            DDList_Material1.Items.Add(m);
            DDList_Material1.Items.Add(m2);
            DDList_Material1.Items.Add(m3);
            DDList_Material1.Items.Add(m4);


            DDList_Material2.Items.Add(m);
            DDList_Material2.Items.Add(m2);
            DDList_Material2.Items.Add(m3);
            DDList_Material2.Items.Add(m4);

            DDList_Material3.Items.Add(m);
            DDList_Material3.Items.Add(m2);
            DDList_Material3.Items.Add(m3);
            DDList_Material3.Items.Add(m4);

            DDList_Promocion.Items.Add(m5);
            DDList_Promocion.Items.Add(m6);

            DDList_Promocion.DataBind();
            DDList_Material1.DataBind();
            DDList_Material2.DataBind();
            DDList_Material3.DataBind();


        }

        protected void fillPromocion()
        {
            jsonManagement JS = new jsonManagement();
            string schoolID = (string)Session["AminUniID"];
            string test = JS.getPromocion(schoolID);
            JArray myArray = JArray.Parse(test);
            dynamic promocion = JsonConvert.DeserializeObject(test);
            foreach (JObject item in myArray)
            {
                string Promocion = (string)item.GetValue("Bono") + " " + (string)item.GetValue("Fechainicio") + " " + (string)item.GetValue("Fechafinal") + " " + (string)item.GetValue("Tipo");
                HtmlGenericControl a = new HtmlGenericControl("a");
                a.Attributes.Add("class", "list-group-item list-group-item-action");
                a.Attributes.Add("href", "#");
                a.InnerHtml = Promocion;
                promotions.Controls.Add(a);

                ListItem m = new ListItem(Promocion , (string)item.GetValue("idpromocion"));
                DDList_PromocionesEliminar.Items.Add(m);
                
            }

            DDList_PromocionesEliminar.DataBind();
        }

        // Funcion general de distribucion de datos a lo largo de la pagina
        protected void parseData()
        {
            string schoolID = (string)Session["AminUniID"];
            //string schoolID = "1";
            jsonManagement JS = new jsonManagement();
            string myJson = JS.getTopReciclaje(schoolID);
            dynamic top = JsonConvert.DeserializeObject(myJson);


            string toneladas = JS.getTonMes(schoolID, "11", "2018");
            dynamic cantTonMes = JsonConvert.DeserializeObject(toneladas);


            // Aqui se obtienen los nombres del top 10 de los estudiantes, y se asignan a sus respectivos campos en la GUI
            //P0.InnerHtml = "Jose Pablo Vindas Campos - 2015183072";
            string[] students = new string[10];

            for (int i = 0; i < 10; i++)
            {
                string name = top[i].Nombre;
                string lastName = top[i].Apellido1;
                string lastName2 = top[i].Apellido2;
                string id = top[i].idusuario;

                string data = name + " " + lastName + " " + lastName2 + " - " + id;
                students[i] = data;
            }

            P0.InnerHtml = students[0];
            P1.InnerHtml = students[1];
            P2.InnerHtml = students[2];
            P3.InnerHtml = students[3];
            P4.InnerHtml = students[4];
            P5.InnerHtml = students[5];
            P6.InnerHtml = students[6];
            P7.InnerHtml = students[7];
            P8.InnerHtml = students[8];
            P9.InnerHtml = students[9];
            //P0.InnerHtml = top;

            // Aqui van las metas de toneladas de reciclaje que se desea recoger anualmente
            int metaAno = 240;
            int metaMes = metaAno / 12;

            // Obtener desde el JSON la cantidad de reciclaje generada este ano y este mes
            string yearQuantity = JS.getTonAnual(schoolID, "2018");
            //float AnoActual = float.Parse(yearQuantity), CultureInfo.InvariantCulture;
            int AnoActual = 200;
            string monthQuantity= cantTonMes[0].cantMes; 
            int mesActual = cantTonMes[0].cantMes;

            porAno.InnerHtml = yearQuantity;
            porMes.InnerHtml = monthQuantity;

            // calculando el porcentaje del progreso completado hasta el momento y actualizando las barras en la GUI
            if (AnoActual > metaAno)
            {
                progressAno.InnerHtml = "100%";
            }
            else
            {
                int temp = (AnoActual * 100) / metaAno;
                progressAno.InnerHtml = temp.ToString() + "%";
            }

            if (mesActual > metaMes)
            {
                progressMes.InnerHtml = "100%";
            }
            else
            {
                int temp2 = (mesActual * 100) / metaMes;
                progressMes.InnerHtml = temp2.ToString() + "%";
            }

            // Agregar la informacion del dinero distribuido este mes
            dineroBeneficios.InnerHtml = cantTonMes[0].cantMes; 
            // Agregar la informacion de la cantidad de estudiantes que participan este mes

            ususariosPorMes.InnerHtml = "3000";

        }

        protected string getGraphInfo()
        {
            //string info = "[['Sede', 'Reciclaje'],['SEDE CENTRAL CARTAGO', 0.785], ['SEDE REGIONAL SAN CARLOS', 10],['CENTRO ACADÉMICO DE ALAJUELA', 7],['CENTRO ACADÉMICO DE LIMÓN', 8],['CENTRO ACADÉMICO DE SAN JOSÉ', 5]]";
             
             jsonManagement JS = new jsonManagement();

             string info = JS.getTonPorSede((string)Session["AminUniID"]);
             JArray myArray = JArray.Parse(info);

             dynamic promocion = JsonConvert.DeserializeObject(info);
             string Promocion= "[['Sede', 'Reciclaje']";
             foreach (JObject item in myArray)
             {
                 Promocion += "," + "["+ "'" + (string)item.GetValue("Sede") + "'" + "," +(string)item.GetValue("Toneladas")  + "]";
             }
             Promocion = Promocion + "]";

            // cantidadMaterial3.Text = Promocion;

             return Promocion;
            //return info;
        }

        //Publicar contenido de la promocion
        protected void btnPublicar_Click(object sender, EventArgs e)
        {
            // Hacer algo con el servidor aqui
            jsonManagement JS = new jsonManagement();


            //Obtener informacion de la caja de contenido
            string selection = DDList_Promocion.SelectedItem.Text;
            if (selection == "Promocion Doble")

            {
                string universidad = (string)Session["AminUniID"];
                string material1 = DDList_Material1.SelectedValue.ToString();
                string material2 = DDList_Material2.SelectedValue.ToString();
                string cantidad1 = cantidadMaterial1.Text;
                string cantidad2 = cantidadMaterial2.Text;
                string bono = txt_bono.Text;
                string fechaInicio = txtStartDate.Text;
                string fechaFinal = txtEndDate.Text;
                string myJson = JS.insertarPromocionDoble(universidad, material1, material2, cantidad1, cantidad2, bono, fechaInicio, fechaFinal);

                dynamic promo = JsonConvert.DeserializeObject(myJson);
                string respuesta = promo[0].Respuesta;
                if (respuesta.Equals("-1"))
                {

                    alertError.InnerHtml = "Error al generar Promocion Doble. Intente de nuevo";
                    alertError.Visible = true;
                }
                else
                {
                    alertError.InnerHtml = "Se ha generado el una Promocion Doble con Exito";
                    alertError.Visible = true;
                }

            }
            else
            {
                if (selection == "Promocion Simple")
                {
                    //txtPassword.Text = DDList_User.SelectedValue.ToString();
                    string universidad = (string)Session["AminUniID"];
                    string material3 = DDList_Material3.SelectedValue.ToString();
                    string cantidad3 = cantidadMaterial3.Text;
                    string bono2 = txt_bono2.Text;
                    string fechaInicio2 = txtStartDate2.Text;
                    string fechaFinal2 = txtEndDate2.Text;
                    string myJson = JS.insertarPromocionSimple(universidad, material3, cantidad3, bono2, fechaInicio2, fechaFinal2);
                    dynamic promo = JsonConvert.DeserializeObject(myJson);
                    string respuesta = promo[0].Respuesta;
                    if (respuesta.Equals("-1"))
                    {
                        alertError.InnerHtml = "Error al generar Promocion Doble. Intente de nuevo";
                        alertError.Visible = true;
                    }
                    else
                    {
                        alertError.InnerHtml = "Se ha generado el una Promocion Simple con Exito";
                        alertError.Visible = true;
                    }

                }

            }
            fillPromocion();
        }

        // Redireccionar a la pagina del historial
        protected void btnHistorial_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/gui/Administrador/HistorialAdmin.aspx");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            
            jsonManagement JS = new jsonManagement();
            string myJson = JS.eliminarPromocion(DDList_PromocionesEliminar.SelectedValue.ToString());
            dynamic promo = JsonConvert.DeserializeObject(myJson);
            string eliminar = promo[0].Respuesta;
            if (eliminar.Equals("-1")) {
                alertError.InnerHtml = "No se ha podido eliminar la Pormocion. Intente de nuevo";
                alertError.Visible = true;
            }
            else {
                alertError.InnerHtml = "Se ha eliminado la Promocion Exitosamente";
                alertError.Visible = true;
                fillPromocion();
            } 
        }

        // Redireccionar a la pagina de los ajustes
        protected void btnAjustes_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("~/gui/Administrador/AjustesAdmin.aspx");
        }


        protected void DDList_Promocion_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selection = DDList_Promocion.SelectedItem.Text;
            if (selection == "Promocion Doble")

            {
                div_doble.Visible = true;
                div_simple.Visible = false;
            }
            else
            {
                div_doble.Visible = false;
                div_simple.Visible = true;
            }
        }
    }
}