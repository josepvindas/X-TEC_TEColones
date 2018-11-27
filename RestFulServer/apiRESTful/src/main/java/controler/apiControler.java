package controler;

import javax.json.JsonArray;
import javax.ws.rs.*;
import javax.ws.rs.core.Application;
import Consultas.Consultas;


/**
 * Created by Jose on 5/13/2018
 */
@ApplicationPath("/api")

@Path("/consulta")

public class apiControler extends Application {
    Consultas consulta = new Consultas();

    @GET
    @Path("/mundo")
    public String getMessage(){ ;
        return  "POL lobo";

    }

    @GET
    @Path("/loginEstudiante/{idusuario}/{contraseña}")
    @Produces("application/json")
    public JsonArray logInEstudiante(@PathParam("idusuario") int idusuario, @PathParam("contraseña") String contraseña){
        return consulta.logInEtudiante(idusuario,contraseña);
    }


    @GET
    @Path("/loginAdministrador/{idusuario}/{contraseña}")
    @Produces("application/json")
    public JsonArray logInAdministrador(@PathParam("idusuario") int idusuario, @PathParam("contraseña") String contraseña){
        return consulta.logInAdministrador(idusuario,contraseña);
    }

    @GET
    @Path("/loginAdministradorAcopio/{idusuario}/{contraseña}")
    @Produces("application/json")
    public JsonArray logInAdministradorAcopio(@PathParam("idusuario") int idusuario, @PathParam("contraseña") String contraseña){
        return consulta.logInAdministradorAcopio(idusuario,contraseña);
    }


    @GET
    @Path("/returnCentroAcopio/{iduniversidad}")
    @Produces("application/json")
    public JsonArray  ReturnCentroAcopio(@PathParam("iduniversidad") int iduniversidad){
        return consulta.ReturnCentroAcopio(iduniversidad);
    }

    @GET
    @Path("/returnSede/{iduniversidad}")
    @Produces("application/json")
    public JsonArray  ReturnSede(@PathParam("iduniversidad") int iduniversidad){
        return consulta.ReturnSede(iduniversidad);
    }
    @GET
    @Path("/returnPromocion/{iduniversidad}")
    @Produces("application/json")
    public JsonArray  ReturnPromocion(@PathParam("iduniversidad") int iduniversidad){
        return consulta.ReturnPromocion(iduniversidad);
    }

    @GET
    @Path("/returnDepartamento/{iduniversidad}")
    @Produces("application/json")
    public JsonArray  ReturnDepartamento(@PathParam("iduniversidad") int iduniversidad){
        return consulta.ReturnDepartamento(iduniversidad);
    }

    @GET
    @Path("/returnUniversidad")
    @Produces("application/json")
    public JsonArray  ReturnUniversidad(){
        return consulta.ReturnUniversidad();
    }

    @GET
    @Path("/returnToneladasAnuales/{iduniversidad}/{year}")
    @Produces("application/json")
    public JsonArray returnToneladasAnuales(@PathParam("iduniversidad") int iduniversidad, @PathParam("year") int year){
        return consulta.returnToneladasAnuales(iduniversidad,year);
    }

    @GET
    @Path("/returnToneladasMes/{iduniversidad}/{month}/{year}")
    @Produces("application/json")
    public JsonArray returnToneladasMes(@PathParam("iduniversidad") int iduniversidad,@PathParam("month") int month, @PathParam("year") int year){
        return consulta.returnToneladasMes(iduniversidad,month,year);
    }


    @GET
    @Path("/returnToneladasSede/{iduniversidad}")
    @Produces("application/json")
    public JsonArray returnToneladasSede(@PathParam("iduniversidad") int iduniversidad){
        return consulta.returnToneladasSede(iduniversidad);
    }

    @GET
    @Path("/returnEstudiantesMensual/{iduniversidad}/{month}")
    @Produces("application/json")
    public JsonArray returnEstudiantesMensual(@PathParam("iduniversidad") int iduniversidad, @PathParam("month") int month){
        return consulta.returnEstudiantesMensual(iduniversidad,month);
    }

    @GET
    @Path("/returnTop10/{iduniversidad}")
    @Produces("application/json")
    public JsonArray returnTop10(@PathParam("iduniversidad") int iduniversidad){
        return consulta.returnTop10(iduniversidad);
    }

    @GET
    @Path("/returnDesgloseAnual/{iduniversidad}/{year}")
    @Produces("application/json")
    public JsonArray returnDesgloseAnual(@PathParam("iduniversidad") int iduniversidad, @PathParam("year") int year){
        return consulta.returnDesgloseAnual(iduniversidad,year);
    }

    @GET
    @Path("/returnDesglose/{iduniversidad}/{month}/{year}")
    @Produces("application/json")
    public JsonArray returnDesglose(@PathParam("iduniversidad") int iduniversidad,@PathParam("month") int month ,@PathParam("year") int year){
        return consulta.returnDesglose(iduniversidad,month,year);
    }

    @GET
    @Path("/returnMaterial")
    @Produces("application/json")
    public JsonArray  ReturnMaterial(){
        return consulta.ReturnMaterial();
    }

    @GET
    @Path("/returnEstudiante/{idusuario}")
    @Produces("application/json")
    public JsonArray  ReturnEstudiante(@PathParam("idusuario") int idusuario){
        return consulta.ReturnEstudiante(idusuario);
    }


    @PUT
    @Path("/insertarAdministrador/{nombre}/{apellido1}/{apellido2}/{carnet}/{contraseña}/{iddepartamento}")
    @Produces("application/json")
    public JsonArray InsertAdministrador(@PathParam("nombre") String nombre, @PathParam("apellido1") String apellido1, @PathParam("apellido2") String apellido2, @PathParam("carnet") int carnet,
                            @PathParam("contraseña") String contraseña, @PathParam("iddepartamento") int iddepartamento) {

        return consulta.InsertAdministradorStatement(nombre,apellido1,apellido2,carnet,contraseña,iddepartamento);
    }

    @PUT
    @Path("/insertarAdministradorAcopio/{nombre}/{apellido1}/{apellido2}/{carnet}/{contraseña}/{idcentroacopio}")
    @Produces("application/json")
    public JsonArray InsertAdministradorAcopio(@PathParam("nombre") String nombre, @PathParam("apellido1") String apellido1, @PathParam("apellido2") String apellido2, @PathParam("carnet") int carnet,
                            @PathParam("contraseña") String contraseña, @PathParam("idcentroacopio") int idcentroacopio) {

        return consulta.InsertAdministradorAcopioStatement(nombre,apellido1,apellido2,carnet,contraseña,idcentroacopio);
    }

    @PUT
    @Path("/insertarEstudiante/{nombre}/{apellido1}/{apellido2}/{carnet}/{contraseña}/{foto}/{TelefonoPrincipal}/{idSede}/{correo}/{Descripcion}/{telefonoSecundario}/{correoSecundario}")
    @Produces("application/json")
    public JsonArray InsertEstudiante(@PathParam("nombre") String nombre, @PathParam("apellido1") String apellido1, @PathParam("apellido2") String apellido2, @PathParam("carnet") int carnet,
                            @PathParam("contraseña") String contraseña, @PathParam("foto") String foto,@PathParam("TelefonoPrincipal") String TelefonoPrincipal,@PathParam("idSede") int idSede,
                            @PathParam("correo") String correo,@PathParam("Descripcion") String Descripcion, @PathParam("telefonoSecundario") String tesec, @PathParam("correoSecundario") String corsec) {

        return consulta.InsertEstudianteStatement(nombre,apellido1,apellido2,carnet,contraseña,foto,TelefonoPrincipal,idSede,correo,Descripcion,tesec,corsec);
    }

    @PUT
    @Path("/insertarSede/{nombre}/{ubicacion}/{iduniversidad}")
    @Produces("application/json")
    public JsonArray  InsertSede(@PathParam("nombre") String nombre, @PathParam("ubicacion") String ubiacion, @PathParam("iduniversidad") int iduniversidad){
        return consulta.InsertSede(nombre,ubiacion,iduniversidad);
    }

    @PUT
    @Path("/insertarCentroAcopio/{nombre}/{idsede}")
    @Produces("application/json")
    public JsonArray  InsertCentroAcopio(@PathParam("nombre") String nombre, @PathParam("idsede") int idsede){
        return consulta.InsertCentroAcopio(nombre,idsede);
    }

    @PUT
    @Path("/insertaruniversidad/{nombre}")
    @Produces("application/json")
    public JsonArray  InsertUniversidad(@PathParam("nombre") String nombre){
        return consulta.InsertUniversidad(nombre);
    }

    @PUT
    @Path("/insertarTweet/{cuerpo}/{tipotweet}")
    @Produces("application/json")
    public JsonArray  InsertTweet(@PathParam("cuerpo") String nombre,@PathParam("tipotweet") int tipotweet){
        return consulta.InsertTweet(nombre,tipotweet);
    }

    @PUT
    @Path("/insertarCuentaTwitter/{consumerkey}/{consumersecret}/{accesstoken}/{accesstokensecret}/{iduniversidad}")
    @Produces("application/json")
    public JsonArray  InsertCuentaTwitter(@PathParam("consumerkey") String consumerkey, @PathParam("consumersecret") String consumersecret, @PathParam("accesstoken") String accesstoken,@PathParam("accesstokensecret") String accesstokensecret,@PathParam("iduniversidad") int iduniversidad){
        return consulta.InsertCuentaTwitter(consumerkey,consumersecret,accesstoken,accesstokensecret,iduniversidad);
    }

    @PUT
    @Path("/insertarDepartamento/{departamento}")
    @Produces("application/json")
    public JsonArray  InsertDepartamento(@PathParam("departamento") String departamento){
        return consulta.InsertDepartamento(departamento);
    }

    @PUT
    @Path("/insertarTipoCambio/{tipocambio}")
    @Produces("application/json")
    public JsonArray  InsertDepartamento(@PathParam("tipocambio") double tipocambio){
        return consulta.InsertTipoCambio(tipocambio);
    }

    @PUT
    @Path("/insertarEstado/{estado}")
    @Produces("application/json")
    public JsonArray  InsertEstado(@PathParam("estado") int estado){
        return consulta.InsertEstado(estado);
    }

    @PUT
    @Path("/insertarMaterial/{nombre}/{valor}")
    @Produces("application/json")
    public JsonArray  InsertMaterial(@PathParam("nombre") String nombre, @PathParam("valor") double valor){
        return consulta.InsertMaterial(nombre,valor);
    }

    @PUT
    @Path("/insertarEstudianteMaterial/{idusuario}/{idsede}/{idmaterial}/{cantidad}")
    @Produces("application/json")
    public JsonArray  InsertEstudianteMaterial(@PathParam("idusuario") int idusuario, @PathParam("idsede") int idsede, @PathParam("idmaterial") int idmaterial, @PathParam("cantidad") double cantidad){
        return consulta.InsertEstudianteMaterial(idusuario,idsede,idmaterial,cantidad);
    }

    @PUT
    @Path("/insertarPromoSimple/{iduniversidad}/{idmaterial}/{cantidad}/{bono}/{fechainicio}/{fechafinal}")
    @Produces("application/json")
    public JsonArray  InsertPromoSimple(@PathParam("iduniversidad") int iduniversidad, @PathParam("idmaterial") int idmaterial, @PathParam("cantidad") double cantidad, @PathParam("bono") double bono,@PathParam("fechainicio") String fechainicio, @PathParam("fechafinal") String fechafinal){
        return consulta.InsertPromoSimple(iduniversidad,idmaterial,cantidad,bono,fechainicio,fechafinal);
    }

    @PUT
    @Path("/insertarPromoDoble/{iduniversidad}/{idmaterial1}/{idmaterial2}/{cantidad1}/{cantidad2}/{bono}/{fechainicio}/{fechafinal}")
    @Produces("application/json")
    public JsonArray  InsertPromoDoble(@PathParam("iduniversidad") int iduniversidad, @PathParam("idmaterial1") int idmaterial1,@PathParam("idmaterial2") int idmaterial2,
                                       @PathParam("cantidad1") double cantidad1,@PathParam("cantidad2") double cantidad2, @PathParam("bono") double bono,@PathParam("fechainicio") String fechainicio, @PathParam("fechafinal") String fechafinal){
        return consulta.InsertPromoDoble(iduniversidad,idmaterial1,idmaterial2,cantidad1,cantidad2,bono,fechainicio,fechafinal);
    }

    @POST
    @Path("/CompartirTecolones/{idusuario1}/{idusuario2}/{cantidad}")
    @Produces("application/json")
    public JsonArray  CambiarTecolones(@PathParam("idusuario1") int idusuario1,@PathParam("idusuario2") int idusuario2,@PathParam("cantidad") double cantidad){
        return consulta.CambiarTecolones(idusuario1,idusuario2,cantidad);
    }

    @POST
    @Path("/deletePromocion/{idpromocion}")
    @Produces("application/json")
    public JsonArray  deletePromocion(@PathParam("idpromocion") int idpromocion){
        return consulta.DeletePromocion(idpromocion);
    }
    @POST
    @Path("/CambiarTecolones/{idusuario}/{cantidad}")
    @Produces("application/json")
    public JsonArray  cambiarTecolones(@PathParam("idusuario") int idusuario, @PathParam("cantidad") double cantidad){
        return consulta.CanjearTecolones(idusuario,cantidad);
    }


}




