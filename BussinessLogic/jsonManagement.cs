using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using Newtonsoft.Json;
using System.Text;
using System.Threading.Tasks;

namespace Logic
{
    public class jsonManagement
    {

        private restClient request;
        private string IP = "";
        private string PORT = "";
        private string URL = "";
        // Constructor de la clase de manejos de JSON
        public jsonManagement()
        {
            // Instanciacion del cliente para poder accesar el servidor
            this.request = new restClient();
            // IP del servidor
            this.IP = "181.194.172.112";
            // Puerto para la comunicacion
            this.PORT = "9090";
            // Cuerpo basico del request
            this.URL = "http://" + IP + ":" + PORT + "/apiRESTful/api/consulta/";
        }

        /*LOS SIGUIENTES METODOS RETORNAN UN STRING CON LE JSON RESPECTIVO DE UNA CONSULTA */
        /*-----------------------------       GET       -----------------------------------*/

        #region CONSULTA PARA LOGGEAR DEPENDIENDO DE SI ES ADMIN O ESTUDIANTE
        public string logIn(string carnet, string password, int tipoUsuario)
        {
            // string de respuesta
            string id = "";
            switch (tipoUsuario)
            {
                // Estudiante
                case 1:
                    string requestType = "loginEstudiante/";
                    this.URL = this.URL + requestType + carnet + "/" + password;
                    this.request.endPoint = this.URL;
                    string getrequest = request.makeRequest(1);
                    getrequest = getrequest.Replace("\"", "'");
                    dynamic studentState = JsonConvert.DeserializeObject(getrequest);
                    id = studentState[0].Estado;
                    break;

                // Administrador
                case 2:
                    string get = "loginAdministrador/";
                    this.URL = this.URL + get + carnet + "/" + password;
                    this.request.endPoint = this.URL;
                    string makerequest = request.makeRequest(1);
                    makerequest = makerequest.Replace("\"", "'");
                    dynamic adminState = JsonConvert.DeserializeObject(makerequest);

                    id = adminState[0].iduniversidad;
                    break;

                // Administrador de centeo de acopio
                case 3:
                    string get2 = "loginAdministradorAcopio/";
                    this.URL = this.URL + get2 + carnet + "/" + password;
                    this.request.endPoint = this.URL;
                    string makerequest2 = request.makeRequest(1);
                    makerequest2 = makerequest2.Replace("\"", "'");
                    dynamic adminAcopioState = JsonConvert.DeserializeObject(makerequest2);

                    id = adminAcopioState[0].idsede;
                    break;
            }

            return id;
        }
        #endregion

        #region INFORAMCION ESTUDIANTE

        public string getEstudiante(string carnet)
        {
            string requestType = "returnEstudiante";
            string requestURL = URL + requestType + "/" + carnet;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(1);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion


        #region INFORMACION UNIVERSIDAD
        public string infoUniversidad()
        {
            string requestType = "returnUniversidad";
            string requestURL = URL + requestType;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(1);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region INFORMACION SEDE
        public string infosede(string idUniversidad)
        {
            string requestType = "returnSede/";
            string requestURL = URL + requestType + idUniversidad;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(1);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region INFORMACION DEPARTAMENTO
        public string infoDepartamento(string idUniversidad)
        {
            string requestType = "returnDepartamento/";
            string requestURL = URL + requestType + idUniversidad;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(1);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region INFORMACION CENTRO DE ACOPIO
        public string infoCentroAcopio(string idUniversidad)
        {
            string requestType = "returnCentroAcopio/";
            string requestURL = URL + requestType + idUniversidad;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(1);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion


        #region TONELADAS ANUALES
        public string getTonAnual(string idUniversidad, string year)
        {
            string requestType = "returnToneladasAnuales/";
            string requestURL = URL + requestType + idUniversidad + "/" + year;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(1);
            getrequest = getrequest.Replace("\"", "'");
            dynamic cantidad = JsonConvert.DeserializeObject(getrequest);


            return cantidad[0].cantAnual;
        }
        #endregion

        #region TONELADAS POR SEDE
        public string getTonSede(string idUniversidad)
        {
            string requestType = "returnToneladasSede/";
            string requestURL = URL + requestType + idUniversidad;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(1);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region TONELADAS MENSUAL ACTUAL
        public string getTonMes(string idUniversidad,string mes, string year)
        {
            string requestType = "returnToneladasMes/";
            string requestURL = URL + requestType + idUniversidad +"/" +mes+ "/"+ year;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(1);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region CANTIDAD DE TONELADAS POR SEDE
        public string getTonPorSede(string idUniversidad)
        {
            string requestType = "returnToneladasSede/";
            string requestURL = URL + requestType + idUniversidad;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(1);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region CANTIDAD DE ESTUDIANTES QUE RECICLAN EN UNA UNIVERSIDAD POR MES
        public string getEstMensual(string idUniversidad, string mes)
        {
            string requestType = "returnEstudiantesMensual/";
            string requestURL = URL + requestType + idUniversidad + "/" + mes;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(1);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region EL TOP 10
        public string getTopReciclaje(string idUniversidad)
        {
            string requestType = "returnTop10/";
            string requestURL = URL + requestType + idUniversidad;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(1);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region DESGLOCE ANUAL
        public string getDesgloceAnual(string idUniversidad, string year)
        {
            string requestType = "returnDesgloseAnual/";
            string requestURL = URL + requestType + idUniversidad + "/" + year;
            //request.endPoint = requestURL;
            //string getrequest = request.makeRequest(1);
            //getrequest = getrequest.Replace("\"", "'");
            return requestURL;
        }
        #endregion

        #region DESGLOCE POR MES Y ANO
        public string getDesgloceMesAno(string idUniversidad, string month, string year)
        {
            string requestType = "returnDesglose/";
            string requestURL = URL + requestType + idUniversidad + "/" + month + "/" + year;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(1);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region RETURN PROMOCION SIMPLE
        public string getPromocion(string iduniversidad)
        {
            string requestType = "returnPromocion/";
            string requestURL = URL + requestType + iduniversidad;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(1);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion



        /*-----------------------------       PUT       -----------------------------------*/

        #region INSERTAR ADMINISTRADOR
        public string insertAdministrador(string nombre, string apellido, string apellido2, string carnet, string password, string idDepartamento)
        {
            string requestType = "insertarAdministrador/";
            string requestURL = URL + requestType + nombre + "/" + apellido + "/" + apellido2 + "/" + carnet + "/" + password + "/" + idDepartamento;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(3);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion


        #region INSERTAR PROMOCION SIMPLE
        public string insertarPromocionSimple(string iduniversidad, string idmaterial, string cantidad, string bono, string fechainicio, string fechafinal)
        {
            string requestType = "insertarPromoSimple/";
            string requestURL = URL + requestType + iduniversidad + "/" + idmaterial + "/" + cantidad + "/" + bono + "/" + fechainicio + "/" + fechafinal;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(3);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region INSERTAR PROMOCION DOBLE
        public string insertarPromocionDoble(string iduniversidad, string idmaterial, string idmaterial2, string cantidad, string cantidad2, string bono, string fechainicio, string fechafinal)
        {
            string requestType = "insertarPromoDoble/";
            string requestURL = URL + requestType + iduniversidad + "/" + idmaterial + "/" + idmaterial2 + "/" + cantidad + "/" + cantidad2 + "/" + bono + "/" + fechainicio + "/" + fechafinal;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(3);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion


        #region URL INSERTAR PROMOCION DOBLE
        public string urlinsertarPromocionDoble(string iduniversidad, string idmaterial, string idmaterial2, string cantidad, string cantidad2, string bono, string fechainicio, string fechafinal)
        {
            string requestType = "insertarPromoDoble/";
            string requestURL = URL + requestType + iduniversidad + "/" + idmaterial + "/" + idmaterial2 + "/" + cantidad + "/" + cantidad2 + "/" + bono + "/" + fechainicio + "/" + fechafinal;
            // request.endPoint = requestURL;
            // string getrequest = request.makeRequest(3);
            //getrequest = getrequest.Replace("\"", "'");
            return requestURL;
        }
        #endregion

        #region URL ADMINISTRADOR
        public string urlinsertAdministrador(string nombre, string apellido, string apellido2, string carnet, string password, string idDepartamento)
        {
            string requestType = "insertarAdministrador/";
            string requestURL = URL + requestType + nombre + "/" + apellido + "/" + apellido2 + "/" + carnet + "/" + password + "/" + idDepartamento;
            //request.endPoint = requestURL;
            //string getrequest = request.makeRequest(3);
            //getrequest = getrequest.Replace("\"", "'");
            return requestURL;
        }
        #endregion

        #region URL ADMINISTRADOR ACOPIO
        public string urlinsertAdministradorAcopio(string nombre, string apellido, string apellido2, string carnet, string password, string idDepartamento)
        {
            string requestType = "insertarAdministradorAcopio/";
            string requestURL = URL + requestType + nombre + "/" + apellido + "/" + apellido2 + "/" + carnet + "/" + password + "/" + idDepartamento;
            //request.endPoint = requestURL;
            //string getrequest = request.makeRequest(3);
            //getrequest = getrequest.Replace("\"", "'");
            return requestURL;
        }
        #endregion

        #region INSERTAR ADMINISTRADOR CENTRO DE ACOPIO
        public string insertAdministradorAcopio(string nombre, string apellido, string apellido2, string carnet, string password, string idCentroAcopio)
        {
            string requestType = "insertarAdministradorAcopio/";
            string requestURL = URL + requestType + nombre + "/" + apellido + "/" + apellido2 + "/" + carnet + "/" + password + "/" + idCentroAcopio;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(3);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region INSERTAR ESTUDIANTE
        public string insertEstudiante(string nombre, string apellido, string apellido2, string carnet,
            string password, string foto, string telefonoPrincipal, string idSede, string correo, string descripcion,
            string telefonoSecundario, string correoSecundario)
        {
            string requestType = "insertarEstudiante/";
            string requestURL = URL + requestType + nombre + "/" + apellido + "/" + apellido2 + "/" + carnet + "/" +
                password + "/" + foto + "/" + telefonoPrincipal + "/" + idSede + "/" + correo + "/" + descripcion + "/" + telefonoSecundario + "/" + correoSecundario;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(3);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region OBTENER URL ESTUDIANTE
        public string URLEstudiante(string nombre, string apellido, string apellido2, string carnet,
            string password, string foto, string telefonoPrincipal, string idSede, string correo, string descripcion,
            string telefonoSecundario, string correoSecundario)
        {
            string requestType = "insertarEstudiante/";
            string requestURL = URL + requestType + nombre + "/" + apellido + "/" + apellido2 + "/" + carnet + "/" +
                password + "/" + foto + "/" + telefonoPrincipal + "/" + idSede + "/" + correo + "/" + descripcion + "/" + telefonoSecundario + "/" + correoSecundario;
            // request.endPoint = requestURL;
            //string getrequest = request.makeRequest(3);
            //getrequest = getrequest.Replace("\"", "'");
            return requestURL;
        }
        #endregion

        #region INSERTAR UNIVERSIDAD
        public string insertUniversidad(string nombre)
        {
            string requestType = "insertaruniversidad/";
            string requestURL = URL + requestType + nombre;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(3);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region INSERTAR CENTRO DE ACOPIO
        public string insertCentroAcopio(string nombre, string idSede)
        {
            string requestType = "insertarCentroAcopio/";
            string requestURL = URL + requestType + nombre + "/" + idSede;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(3);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region INSERTAR SEDE
        public string insertSede(string nombre, string ubicacion, string idUniversidad)
        {
            string requestType = "insertarSede/";
            string requestURL = URL + requestType + nombre + "/" + ubicacion + "/" + idUniversidad;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(3);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region INSERTAR DEPARTAMENTO 
        public string insertDepartamente(string departamento)
        {
            string requestType = "insertarDepartamento/";
            string requestURL = URL + requestType + departamento;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(3);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region INSERTAR TIPO TWEET
        public string insertTipoTweet(string cuerpo, string tipo)
        {
            string requestType = "insertarTipoTweet/";
            string requestURL = URL + requestType + cuerpo + "/" + tipo;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(3);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region INSERTAR CUENTA TWITTER 
        public string insertTwiteerAccount(string consumerkey, string consumersecret, string accesstoken, string accesstokensecret)
        {
            string requestType = "insertarCuentaTwitter/";
            string requestURL = URL + requestType + consumerkey + "/" + consumersecret + "/" + accesstoken + "/" + accesstokensecret;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(3);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region INSERTAR TIPO CAMBIO 
        public string insertTipoCambio(string tipoCambio)
        {
            string requestType = "insertarTipoCambio/";
            string requestURL = URL + requestType + tipoCambio;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(3);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion


        #region URL TIPO CAMBIO 
        public string urlTipoCambio(string tipoCambio)
        {
            string requestType = "insertarTipoCambio/";
            string requestURL = URL + requestType + tipoCambio;
            request.endPoint = requestURL;
            // string getrequest = request.makeRequest(3);
            //getrequest = getrequest.Replace("\"", "'");
            return requestURL;
        }
        #endregion

        #region INSERTAR ESTADO 
        public string insertEstado(string estado)
        {
            string requestType = "insertarEstado/";
            string requestURL = URL + requestType + estado;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(3);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region INSERTAR MATERIAL 
        public string insertMaterial(string nombre, string valor)
        {
            string requestType = "insertarMaterial/";
            string requestURL = URL + requestType + nombre + "/" + valor;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(3);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region INSERTAR MATERIAL POR ESTUDIANTE 
        public string insertMaterialEstudiante(string idUsuario, string idCentroAcopio, string idMaterial, string cantidad)
        {
            string requestType = "insertarEstudianteMaterial/";
            string requestURL = URL + requestType + idUsuario + "/" + idCentroAcopio + "/" + idMaterial + "/" + cantidad;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(3);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        /*-----------------------------       POST       -----------------------------------*/

        #region INTERCAMBIO TECOLONES
        public string cambiarTecolones(string idUsuario, string idUsuario2, string cantidad)
        {
            string requestType = "CambiarTecolones/";
            string requestURL = URL + requestType + idUsuario + "/" + idUsuario2 + "/" + cantidad;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(2);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion

        #region Canjear TECOLONES
        public string CambiarTecolones(string idUsuario, string cantidad)
        {
            string requestType = "CambiarTecolones/";
            string requestURL = URL + requestType + idUsuario + "/" + cantidad;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(2);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion



        #region ELIMINAR PROMOCIONES
        public string eliminarPromocion(string idPromocion)
        {
            string requestType = "deletePromocion/";
            string requestURL = URL + requestType + idPromocion;
            request.endPoint = requestURL;
            string getrequest = request.makeRequest(2);
            getrequest = getrequest.Replace("\"", "'");
            return getrequest;
        }
        #endregion






    }

}








