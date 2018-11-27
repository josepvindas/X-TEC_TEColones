package Consultas;

import org.junit.Test;

import javax.json.Json;
import javax.json.JsonArrayBuilder;

import static org.junit.Assert.*;

public class ConsultasTest {
    private Consultas consulta = new Consultas();

    @org.junit.Test
    public void insertEstudianteStatement() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("Respuesta", "Registro exitoso"));
        assertEquals(builder.build(), consulta.InsertEstudianteStatement("JeanPol", "Alvarado", "Mendez",
                2015095715, "mariana07", "10011001001", "86472905", 1, "ce.kalvarado07@gmail.com"
                , "Amante del soccer,ingeniero,pizza con piña","25146821 "," "));
    }


    @org.junit.Test
    public void insertAdministradorStatement() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("Respuesta", "Registro exitoso"));
        assertEquals(builder.build(), consulta.InsertAdministradorStatement("Jose Pablo", "Vindas", "Campos", 304050877, "hardcore666", 1));
    }

    @org.junit.Test
    public void insertAdministradorAcopioStatement() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("Respuesta", "Registro exitoso"));
        assertEquals(builder.build(), consulta.InsertAdministradorAcopioStatement("Susana", "Granados", "Alfaro", 302560859, "p0000l", 1));
    }

    @org.junit.Test
    public void insertUniversidad() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("Respuesta", "exitoso"));
        assertEquals(builder.build(), consulta.InsertUniversidad("XTEC"));
    }

    @org.junit.Test
    public void insertSede() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("Respuesta", "exitoso"));
        assertEquals(builder.build(), consulta.InsertSede("Central", "Cartago", 1));
    }

    @org.junit.Test
    public void insertCentroAcopio() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("Respuesta", "exitoso"));
        assertEquals(builder.build(), consulta.InsertCentroAcopio("Central", 1));
    }

    //TipoTweet debe de insertarse primero
    @org.junit.Test
    public void insertTweet() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("Respuesta", "exitoso"));
        assertEquals(builder.build(), consulta.InsertTweet("estudiante ha cambiado material", 1));

    }

    @org.junit.Test
    public void insertCuentaTwitter() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("Respuesta", "exitoso"));
        assertEquals(builder.build(), consulta.InsertCuentaTwitter("eToKTORLfJhJ2yO6fBO8vLbsT", "OO5Qt4S0IJYmOokS2RwyOTEmaaumrm3VUnmP7PZGhHptSfoZVS", "1057781122757746693-6UrR0wfOQ5sD33HO50DdMR5WHd09hR", "nFDZlIq5Fp2YBIGmKIc58ow7WvrBsQNDoD6vrlJq3Wk2f", 1));

    }

    @org.junit.Test
    public void insertDepartamento() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("Respuesta", "exitoso"));
        assertEquals(builder.build(), consulta.InsertDepartamento("Vicerrectoria de Asuntos Académicos"));
    }

    @org.junit.Test
    public void insertTipoCambio() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("Respuesta", "exitoso"));
        assertEquals(builder.build(), consulta.InsertTipoCambio(85.0f));
    }


    @org.junit.Test
    public void insertMaterial() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("Respuesta", "exitoso"));
        assertEquals(builder.build(), consulta.InsertMaterial("Plastico", 100.0f));

    }

    @org.junit.Test
    public void insertEstudianteMaterial() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("Respuesta", "exitoso"));
        assertEquals(builder.build(), consulta.InsertEstudianteMaterial(2015478972, 7, 1, 900));

    }

    @org.junit.Test
    public void returnCentroAcopio() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("idcentroacopio", 1)
                .add("CentroAcopio", "Central"));
        assertEquals(builder.build(), consulta.ReturnCentroAcopio(1));

    }

    @org.junit.Test
    public void returnSede() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("idsede", 1)
                .add("Sede", "Central"));
        assertEquals(builder.build(), consulta.ReturnSede(1));
    }

    @org.junit.Test
    public void returnUniversidad() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("iduniversidad", 1)
                .add("Universidad", "XTEC"));
        assertEquals(builder.build(), consulta.ReturnUniversidad());

    }

    @org.junit.Test
    public void logInEtudiante() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("Estado", "activo"));
        assertEquals(builder.build(), consulta.logInEtudiante(2015095715, "mariana07"));

    }

    @org.junit.Test
    public void logInAdministrador() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("iduniversidad", 1));
        assertEquals(builder.build(), consulta.logInAdministrador(304050877, "hardcore666"));
    }

    @org.junit.Test
    public void logInAdministradorAcopio() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("idsede", 1));
        assertEquals(builder.build(), consulta.logInAdministradorAcopio(302560859, "p0000l"));
    }

    @org.junit.Test
    public void cambiarTecolones() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("Respuesta", "Exito"));
        assertEquals(builder.build(), consulta.CambiarTecolones(2015045477, 2015045476, 100));

    }

    @org.junit.Test
    public void returnToneladasAnuales() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("cantAnual", 0));
        assertEquals(builder.build(), consulta.returnToneladasAnuales(1, 2018));
    }

    @org.junit.Test
    public void returnToneladasSede() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("Sede", 1)
                .add("Toneladas", 5.0f)); //modificar toneladas
        assertEquals(builder.build(), consulta.returnToneladasSede(1));

    }

    @org.junit.Test
    public void returnEstudiantesMensual() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("EstudianteMensual", 1));
        assertEquals(builder.build(), consulta.returnEstudiantesMensual(1, 11));

    }

    @org.junit.Test
    public void returnTop10() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("idusuario", 2015095715)
                .add("Nombre", "JeanPol").add("Apellido1", "Alvarado").add("Apellido2", "Mendez").add("Cantidad Kilos", 5.2f));
        assertEquals(builder.build(), consulta.returnTop10(1));
    }

    @org.junit.Test
    public void returnDesgloseAnual() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("Material", "Plastico")
                .add("ToneladasAnuales", 5.0f));
        assertEquals(builder.build(), consulta.returnDesgloseAnual(1, 2018));
    }

    @org.junit.Test
    public void returnDesglose() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("Material", "Plastico")
                .add("Toneladas", 5.0f));
        assertEquals(builder.build(), consulta.returnDesglose(1, 11, 2018));
    }

    @Test
    public void insertPromoSimple() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("Respuesta", "exitoso"));
        assertEquals(builder.build(), consulta.InsertPromoSimple(1,2,10.0,50.0,"5-11-2018","6-11-2018"));
    }

    @Test
    public void insertPromoDoble() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("Respuesta", "exitoso"));
        assertEquals(builder.build(), consulta.InsertPromoDoble(1,2,1,100,15,10000.0,"17-11-2018","30-11-2018"));
    }

    @Test
    public void returnToneladasMes() {
    }

    @Test
    public void deletePromocion() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        builder.add(Json.createObjectBuilder().add("Respuesta", "exitoso"));
        assertEquals(builder.build(), consulta.DeletePromocion(19));
    }
}
