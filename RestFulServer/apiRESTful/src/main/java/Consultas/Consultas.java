package Consultas;

import controler.*;

import java.sql.*;
import java.util.ArrayList;
import javax.json.*;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;



public class Consultas {
    public Consultas(){

    }

    public JsonArray InsertEstudianteStatement(String pNombre, String pApellido1, String pApellido2, int pCarnet, String pContraseña, String pFoto, String pTelefonoPrincipal, int pidSede, String pCorreo, String pDescripcion, String ptelefonosecundario,String pcorreoSecundario){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();

        try{
            conn = conexion.getConnection();
            CallableStatement query = conn.prepareCall("{call insertestudiante(?,?,?,?,?,?,?,?,?,?,?,?)}");

            query.setInt(1, pCarnet);
            query.setString(2, pNombre);
            query.setString(3, pApellido1);
            query.setString(4, pApellido2);
            query.setString(5, pContraseña);
            query.setString(6, pFoto);
            query.setInt(7, pidSede);
            query.setString(8, pTelefonoPrincipal);
            query.setString(9, pCorreo);
            query.setString(10, pDescripcion);
            query.setString(11, ptelefonosecundario);
            query.setString(12, pcorreoSecundario);


            query.executeUpdate();
            builder.add(Json.createObjectBuilder().add("Respuesta","Registro exitoso"));
            query.close();
            conn.close();
        }
        catch (Exception e) {
            builder.add(Json.createObjectBuilder().add("Respuesta",-1));
        }
        return builder.build();
    }

    public JsonArray InsertAdministradorStatement(String pNombre, String pApellido1, String pApellido2, int pCarnet, String pContraseña, int piddepartamento){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();

        try{
            conn = conexion.getConnection();
            CallableStatement query = conn.prepareCall("{call insertadministrador(?,?,?,?,?,?)");

            query.setInt(1, pCarnet);
            query.setString(2, pNombre);
            query.setString(3, pApellido1);
            query.setString(4, pApellido2);
            query.setString(5, pContraseña);
            query.setInt(6, piddepartamento);


            query.executeUpdate();
            builder.add(Json.createObjectBuilder().add("Respuesta","Registro exitoso"));
            query.close();
            conn.close();
        }
        catch (Exception e) {
            builder.add(Json.createObjectBuilder().add("Respuesta",-1));
        }
        return builder.build();
    }

    public JsonArray InsertAdministradorAcopioStatement(String pNombre, String pApellido1, String pApellido2, int pCarnet, String pContraseña, int pidcentroacopio){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();

        try{
            conn = conexion.getConnection();
            CallableStatement query = conn.prepareCall("{call insertadministradoracopio(?,?,?,?,?,?)}");

            query.setInt(1, pCarnet);
            query.setString(2, pNombre);
            query.setString(3, pApellido1);
            query.setString(4, pApellido2);
            query.setString(5, pContraseña);
            query.setInt(6, pidcentroacopio);


            query.executeUpdate();
            builder.add(Json.createObjectBuilder().add("Respuesta","Registro exitoso"));
            query.close();
            conn.close();
        }
        catch (Exception e) {
            builder.add(Json.createObjectBuilder().add("Respuesta",-1));
        }
        return builder.build();
    }

    public JsonArray InsertSede(String pNombre, String pUbicacion, int pIdUniversidad){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();

        try{
            conn = conexion.getConnection();
            CallableStatement query = conn.prepareCall("{call  insertsede(?,?,?)}");

            query.setString(1, pNombre);
            query.setString(2, pUbicacion);
            query.setInt(3, pIdUniversidad);

            query.executeUpdate();
            builder.add(Json.createObjectBuilder().add("Respuesta","exitoso"));
            query.close();
            conn.close();

        }
        catch (Exception e) {
            builder.add(Json.createObjectBuilder().add("Respuesta",-1));
        }
        return builder.build();
    }

    public JsonArray InsertCentroAcopio(String pNombre, int pIdSede){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();

        try{
            conn = conexion.getConnection();
            CallableStatement query = conn.prepareCall("{call   insertcentroacopio (?,?)}");

            query.setInt(1, pIdSede);
            query.setString(2, pNombre);

            query.executeUpdate();
            builder.add(Json.createObjectBuilder().add("Respuesta","exitoso"));
            query.close();
            conn.close();
        }
        catch (Exception e) {
            builder.add(Json.createObjectBuilder().add("Respuesta",-1));
        }
        return builder.build();
    }

    public JsonArray InsertUniversidad(String pNombre){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();

        try{
            conn = conexion.getConnection();
            CallableStatement query = conn.prepareCall("{call   insertuniversidad (?)}");

            query.setString(1, pNombre);

            query.executeUpdate();
            builder.add(Json.createObjectBuilder().add("Respuesta","exitoso"));
            query.close();
            conn.close();

        }
        catch (Exception e) {
            builder.add(Json.createObjectBuilder().add("Respuesta",-1));
        }
        return builder.build();
    }

    public JsonArray InsertTweet(String pCuerpo, int ptipotweet){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();

        try{
            conn = conexion.getConnection();
            CallableStatement query = conn.prepareCall("{call   inserttweet (?,?)}");

            query.setString(1, pCuerpo);
            query.setInt(2, ptipotweet);

            query.executeUpdate();
            builder.add(Json.createObjectBuilder().add("Respuesta","exitoso"));
            query.close();
            conn.close();

        }
        catch (Exception e) {
            builder.add(Json.createObjectBuilder().add("Respuesta",-1));
        }
        return builder.build();
    }

    public JsonArray InsertPromoSimple(int piduniversidad, int pidmaterial, double pcantidad, double pbono, String fechainicio, String fechafinal){
        Conexion conexion = new Conexion();
        Connection conn;
        Connection conn1;
        JsonArrayBuilder builder = Json.createArrayBuilder();
        int idpromocion=0;
        String pidpromocon="";
        String tweet = "";
        String material = "";
        String cantidad = String.valueOf(pcantidad);
        String bono = String.valueOf(pbono);
        String consumerkey = "";
        String consumersecret= "";
        String accesstoken = "";
        String accesstokensecret= "";
        ConexionTwitterPromocionSimple twitt = new ConexionTwitterPromocionSimple();
        ArrayList list = new ArrayList();

        try{
            conn = conexion.getConnection();
            CallableStatement query = conn.prepareCall("{call   insertpromocionsimple(?,?,?,?,?,?)}");

            query.setInt(1, piduniversidad);
            query.setInt(2, pidmaterial);
            query.setDouble(3, pcantidad);
            query.setDouble(4, pbono);
            query.setString(5, fechainicio);
            query.setString(6, fechafinal);
            query.executeUpdate();
            query.close();

            try{
                CallableStatement st = conn.prepareCall("BEGIN returntweetpromocionsimple (?,?,?);END;");
                int t = 1;
                st.setInt(1, t);
                st.setInt(2, pidmaterial);
                st.registerOutParameter(3,OracleTypes.CURSOR);
                st.execute();

                ResultSet rs= ((OracleCallableStatement)st).getCursor(3);
                ResultSetMetaData rsMd = rs.getMetaData();
                while(rs.next()){

                    list.add(0,rs.getString("nombre"));
                    list.add(1,rs.getString("cuerpo"));
                    list.add(2,rs.getString("consumerkey"));
                    list.add(3,rs.getString("consumersecret"));
                    list.add(4,rs.getString("accesstoken"));
                    list.add(5,rs.getString("accesstokensecret"));
                }

                material = list.get(0).toString();
                tweet = list.get(1).toString();
                consumerkey=list.get(2).toString();
                consumersecret = list.get(3).toString();
                accesstoken = list.get(4).toString();
                accesstokensecret = list.get(5).toString();



                rs.close();
                st.close();
                conn.close();
                try{
                    conn1 = conexion.getConnection();
                    CallableStatement st0 = conn1.prepareCall("BEGIN returnidpromocion (?,?,?);END;");
                    st0.registerOutParameter(1,OracleTypes.CURSOR);
                    st0.setString(2,fechainicio);
                    st0.setString(3,fechafinal);
                    st0.execute();

                    ResultSet rs0= ((OracleCallableStatement)st0).getCursor(1);
                    ResultSetMetaData rsMd0 = rs0.getMetaData();
                    while(rs0.next()){

                        idpromocion=rs0.getInt("idpromocion");
                    }

                    pidpromocon=String.valueOf(idpromocion);
                    rs0.close();
                    st0.close();
                    conn1.close();

                }
                catch (Exception e){
                    builder.add(Json.createObjectBuilder().add("Respuesta",-2));

                }

                twitt.twittear(pidpromocon,material,consumerkey,consumersecret,accesstoken,accesstokensecret,tweet,bono,cantidad,fechainicio,fechafinal);

            }
            catch (Exception e){

            }


            builder.add(Json.createObjectBuilder().add("Respuesta","exitoso"));


        }
        catch (Exception e) {
            builder.add(Json.createObjectBuilder().add("Respuesta",-1));
        }
        return builder.build();
    }

    public JsonArray InsertPromoDoble(int piduniversidad, int pidmaterial1,int pidmaterial2, double pcantidad1,double pcantidad2, double pbono, String fechainicio, String fechafinal){
        Conexion conexion = new Conexion();
        Connection conn;
        Connection conn1;
        Connection conn2;
        int idpromocion=0;
        String pidpromocon="";
        JsonArrayBuilder builder = Json.createArrayBuilder();
        String tweet = "";
        String material = "";
        String material2 = "";
        String cantidad1 = String.valueOf(pcantidad1);
        String cantidad2 = String.valueOf(pcantidad2);
        String bono = String.valueOf(pbono);
        String consumerkey = "";
        String consumersecret= "";
        String accesstoken = "";
        String accesstokensecret= "";
        ConexionTwitterPromocionDoble twitt = new ConexionTwitterPromocionDoble();
        ArrayList list = new ArrayList();
        ArrayList list1 = new ArrayList();

        try{
            conn = conexion.getConnection();
            CallableStatement query = conn.prepareCall("{call   insertpromociondoble(?,?,?,?,?,?,?,?)}");

            query.setInt(1, piduniversidad);
            query.setInt(2, pidmaterial1);
            query.setInt(3, pidmaterial2);
            query.setDouble(4, pcantidad1);
            query.setDouble(5, pcantidad2);
            query.setDouble(6, pbono);
            query.setString(7, fechainicio);
            query.setString(8, fechafinal);


            query.executeUpdate();
            query.close();
            try{
                CallableStatement st = conn.prepareCall("BEGIN returntweetpromociondoble (?,?,?);END;");
                int t = 1;
                st.setInt(1, t);
                st.setInt(2, pidmaterial1);
                st.registerOutParameter(3,OracleTypes.CURSOR);
                st.execute();

                ResultSet rs= ((OracleCallableStatement)st).getCursor(3);
                ResultSetMetaData rsMd = rs.getMetaData();
                while(rs.next()){

                    list.add(0,rs.getString("nombre"));
                    list.add(1,rs.getString("cuerpo"));
                    list.add(2,rs.getString("consumerkey"));
                    list.add(3,rs.getString("consumersecret"));
                    list.add(4,rs.getString("accesstoken"));
                    list.add(5,rs.getString("accesstokensecret"));
                }

                material = list.get(0).toString();
                tweet = list.get(1).toString();
                consumerkey=list.get(2).toString();
                consumersecret = list.get(3).toString();
                accesstoken = list.get(4).toString();
                accesstokensecret = list.get(5).toString();



                rs.close();
                st.close();
                conn.close();
                try{
                    conn1 = conexion.getConnection();
                    CallableStatement st0 = conn1.prepareCall("BEGIN returnmaterial2(?,?);END;");
                    st0.setInt(1, pidmaterial2);
                    st0.registerOutParameter(2,OracleTypes.CURSOR);
                    st0.execute();

                    ResultSet rs0= ((OracleCallableStatement)st0).getCursor(2);
                    ResultSetMetaData rsMd0 = rs0.getMetaData();
                    while(rs0.next()){

                        list1.add(0,rs0.getString("nombre"));
                    }

                    material2 = list1.get(0).toString();
                    rs0.close();
                    st0.close();
                    conn1.close();


                }
                catch (Exception e){

                }

                try{
                    conn2 = conexion.getConnection();
                    CallableStatement st1 = conn2.prepareCall("BEGIN returnidpromocion (?,?,?);END;");
                    st1.registerOutParameter(1,OracleTypes.CURSOR);
                    st1.setString(2,fechainicio);
                    st1.setString(3,fechafinal);
                    st1.execute();

                    ResultSet rs1= ((OracleCallableStatement)st1).getCursor(1);
                    ResultSetMetaData rsMd1 = rs1.getMetaData();
                    while(rs1.next()){

                        idpromocion=rs1.getInt("idpromocion");
                    }

                    pidpromocon=String.valueOf(idpromocion);
                    rs1.close();
                    st1.close();
                    conn2.close();

                }
                catch (Exception e){
                    builder.add(Json.createObjectBuilder().add("Respuesta",-2));

                }

                twitt.twittear(pidpromocon,material,material2,consumerkey,consumersecret,accesstoken,accesstokensecret,tweet,bono,cantidad1,cantidad2,fechainicio,fechafinal);

            }
            catch (Exception e){

            }
            builder.add(Json.createObjectBuilder().add("Respuesta","exitoso"));



        }
        catch (Exception e) {
            builder.add(Json.createObjectBuilder().add("Respuesta",-1));
        }
        return builder.build();
    }

    public JsonArray InsertCuentaTwitter(String pconsumerkey, String pconsumersecret, String paccesstoken, String paccesstokensecret, int piduniversidad){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();

        try{
            conn = conexion.getConnection();
            CallableStatement query = conn.prepareCall("{call  insertcuentatwitter(?,?,?,?,?)}");

            query.setString(1, pconsumerkey);
            query.setString(2, pconsumersecret);
            query.setString(3, paccesstoken);
            query.setString(4, paccesstokensecret);
            query.setInt(5,piduniversidad);

            query.executeUpdate();
            builder.add(Json.createObjectBuilder().add("Respuesta","exitoso"));
            query.close();
            conn.close();

        }
        catch (Exception e) {
            builder.add(Json.createObjectBuilder().add("Respuesta",-1));
        }
        return builder.build();
    }

    public JsonArray InsertDepartamento(String pDepartamento){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();

        try{
            conn = conexion.getConnection();
            CallableStatement query = conn.prepareCall("{call insertdepartamento (?)}");

            query.setString(1, pDepartamento);

            query.executeUpdate();
            builder.add(Json.createObjectBuilder().add("Respuesta","exitoso"));
            query.close();
            conn.close();

        }
        catch (Exception e) {
            builder.add(Json.createObjectBuilder().add("Respuesta",-1));
        }
        return builder.build();
    }

    public JsonArray InsertTipoCambio(double pTipoCambio){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();

        try{
            conn = conexion.getConnection();
            CallableStatement query = conn.prepareCall("{call  inserttipocambio (?)}");

            query.setDouble(1, pTipoCambio);

            query.executeUpdate();
            builder.add(Json.createObjectBuilder().add("Respuesta","exitoso"));
            query.close();
            conn.close();

        }
        catch (Exception e) {
            builder.add(Json.createObjectBuilder().add("Respuesta",-1));
        }
        return builder.build();
    }

    public JsonArray InsertEstado(int pEstado){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();

        try{
            conn = conexion.getConnection();
            CallableStatement query = conn.prepareCall("{call  insertestado (?)}");

            query.setFloat(1, pEstado);

            query.executeUpdate();
            builder.add(Json.createObjectBuilder().add("Respuesta","exitoso"));
            query.close();
            conn.close();

        }
        catch (Exception e) {
            builder.add(Json.createObjectBuilder().add("Respuesta",-1));
        }
        return builder.build();
    }

    public JsonArray DeletePromocion(int pidpromocion){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();
        String tweet = "";
        String consumerkey = "";
        String consumersecret= "";
        String accesstoken = "";
        String accesstokensecret= "";
        ConexionTwitterDeletePromocion twitt = new ConexionTwitterDeletePromocion();
        ArrayList list = new ArrayList();

        try{
            conn = conexion.getConnection();
            CallableStatement query = conn.prepareCall("{call  deletepromocion (?)}");

            query.setInt(1, pidpromocion);

            query.executeUpdate();
            query.close();
            try {
                CallableStatement st = conn.prepareCall("BEGIN returntweet(?);END;");
                st.registerOutParameter(1, OracleTypes.CURSOR);
                st.execute();

                ResultSet rs = ((OracleCallableStatement) st).getCursor(1);
                ResultSetMetaData rsMd = rs.getMetaData();
                while (rs.next()) {

                    list.add(0, rs.getString("cuerpo"));
                    list.add(1, rs.getString("consumerkey"));
                    list.add(2, rs.getString("consumersecret"));
                    list.add(3, rs.getString("accesstoken"));
                    list.add(4, rs.getString("accesstokensecret"));
                }

                tweet = list.get(0).toString();
                consumerkey = list.get(1).toString();
                consumersecret = list.get(2).toString();
                accesstoken = list.get(3).toString();
                accesstokensecret = list.get(4).toString();
                String pidpromoco = String.valueOf(pidpromocion);
                rs.close();
                st.close();
                conn.close();
                twitt.twittear(pidpromoco,consumerkey,consumersecret,accesstoken,accesstokensecret,tweet);
            }
                catch(Exception t){

                }


            builder.add(Json.createObjectBuilder().add("Respuesta","exitoso"));

        }
        catch (Exception e) {
            builder.add(Json.createObjectBuilder().add("Respuesta",-1));
        }
        return builder.build();
    }

    public JsonArray InsertMaterial(String pnombre, double pvalor){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();

        try{
            conn = conexion.getConnection();
            CallableStatement query = conn.prepareCall("{call  insertmaterial (?,?)}");

            query.setString(1,pnombre);
            query.setDouble(2,pvalor);

            query.executeUpdate();
            builder.add(Json.createObjectBuilder().add("Respuesta","exitoso"));
            query.close();
            conn.close();

        }
        catch (Exception e) {
            builder.add(Json.createObjectBuilder().add("Respuesta",-1));
        }
        return builder.build();
    }

    public JsonArray InsertEstudianteMaterial(int pidusuario, int pidsede, int pidmaterial, double pcantidad) {
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();
        JsonArrayBuilder builder1 = Json.createArrayBuilder();
        String material = "";
        String usuario = "";
        String tweet = "";
        String consumerkey = "";
        String consumersecret= "";
        String accesstoken = "";
        String accesstokensecret= "";
        ConexionTwitter twitt = new ConexionTwitter();
        ArrayList list = new ArrayList();

        try{
            conn = conexion.getConnection();
            CallableStatement query = conn.prepareCall("{call registrarmaterial (?,?,?,?)}");

            query.setInt(1,pidusuario);
            query.setInt(2,pidsede);
            query.setInt(3,pidmaterial);
            query.setDouble(4,pcantidad);

            query.executeUpdate();
            query.close();
            try{
                CallableStatement st = conn.prepareCall("BEGIN returntweetmaterial(?,?,?,?);END;");
                int t = 1;
                st.setInt(1, t);
                st.setInt(2, pidusuario);
                st.setInt(3, pidmaterial);
                st.registerOutParameter(4,OracleTypes.CURSOR);
                st.execute();

                ResultSet rs= ((OracleCallableStatement)st).getCursor(4);
                ResultSetMetaData rsMd = rs.getMetaData();
                while(rs.next()){

                    list.add(0,rs.getString("nombre"));
                    list.add(1,rs.getString("usuario"));
                    list.add(2,rs.getString("cuerpo"));
                    list.add(3,rs.getString("consumerkey"));
                    list.add(4,rs.getString("consumersecret"));
                    list.add(5,rs.getString("accesstoken"));
                    list.add(6,rs.getString("accesstokensecret"));
                }

                material = list.get(0).toString();
                usuario=list.get(1).toString();
                tweet = list.get(2).toString();
                consumerkey=list.get(3).toString();
                consumersecret = list.get(4).toString();
                accesstoken = list.get(5).toString();
                accesstokensecret = list.get(6).toString();



                rs.close();
                st.close();
                conn.close();
               twitt.twittear(material,usuario,consumerkey,consumersecret,accesstoken,accesstokensecret,tweet);

            }
            catch (Exception e){

            }


            //twitt.twittear("eToKTORLfJhJ2yO6fBO8vLbsT","OO5Qt4S0IJYmOokS2RwyOTEmaaumrm3VUnmP7PZGhHptSfoZVS","1057781122757746693-6UrR0wfOQ5sD33HO50DdMR5WHd09hR","nFDZlIq5Fp2YBIGmKIc58ow7WvrBsQNDoD6vrlJq3Wk2f","cachi");

            builder.add(Json.createObjectBuilder().add("Respuesta","exitoso"));


        }
        catch (Exception e) {
            builder.add(Json.createObjectBuilder().add("Respuesta",-1));
        }
        return builder.build();
    }

    public JsonArray ReturnCentroAcopio(int piduniversidad){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();
        String g = null;
        try{
            conn = conexion.getConnection();
            CallableStatement st = conn.prepareCall("BEGIN returnacopio (?,?);END;");
            st.setInt(1,piduniversidad);
            st.registerOutParameter(2,OracleTypes.CURSOR);
            st.execute();

            ResultSet rs= ((OracleCallableStatement)st).getCursor(2);
            ResultSetMetaData rsMd = rs.getMetaData();
            while(rs.next()){

                builder.add(Json.createObjectBuilder().add("idcentroacopio",rs.getInt("idcentroacopio"))
                        .add("CentroAcopio", rs.getString("nombre")));
            }

            rs.close();
            st.close();
            conn.close();

        }
        catch (Exception e){
            builder.add(Json.createObjectBuilder().add("idcentroacopio",-1));

        }

        return  builder.build();
    }

    public JsonArray ReturnSede(int piduniversidad){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();
        String g = null;
        try{
            conn = conexion.getConnection();
            CallableStatement st = conn.prepareCall("BEGIN returnsede (?,?);END;");
            st.setInt(1,piduniversidad);
            st.registerOutParameter(2,OracleTypes.CURSOR);
            st.execute();

            ResultSet rs= ((OracleCallableStatement)st).getCursor(2);
            ResultSetMetaData rsMd = rs.getMetaData();
            while(rs.next()){

                builder.add(Json.createObjectBuilder().add("idsede",rs.getInt("idsede"))
                        .add("Sede", rs.getString("nombre")));
            }

            rs.close();
            st.close();
            conn.close();

        }
        catch (Exception e){
            builder.add(Json.createObjectBuilder().add("idsede",-1));

        }

        return  builder.build();
    }

    public JsonArray ReturnPromocion(int piduniversidad){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();
        String g = null;
        try{
            conn = conexion.getConnection();
            CallableStatement st = conn.prepareCall("BEGIN returnpromociones (?,?);END;");
            st.setInt(1,piduniversidad);
            st.registerOutParameter(2,OracleTypes.CURSOR);
            st.execute();

            ResultSet rs= ((OracleCallableStatement)st).getCursor(2);
            ResultSetMetaData rsMd = rs.getMetaData();
            while(rs.next()){

                builder.add(Json.createObjectBuilder().add("idpromocion",rs.getInt("idpromocion")).add("Bono",rs.getDouble("bono"))
                        .add("Fechainicio", rs.getString("fechainicio")).add("Fechafinal", rs.getString("fechafinal")).add("Tipo",rs.getString("tipo")));
            }

            rs.close();
            st.close();
            conn.close();

        }
        catch (Exception e){
            builder.add(Json.createObjectBuilder().add("idpromocion",-1));

        }

        return  builder.build();
    }

    public JsonArray ReturnDepartamento(int piduniversidad){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();
        String g = null;
        try{
            conn = conexion.getConnection();
            CallableStatement st = conn.prepareCall("BEGIN returndepartamento (?,?);END;");
            st.setInt(1,piduniversidad);
            st.registerOutParameter(2,OracleTypes.CURSOR);
            st.execute();

            ResultSet rs= ((OracleCallableStatement)st).getCursor(2);
            ResultSetMetaData rsMd = rs.getMetaData();
            while(rs.next()){

                builder.add(Json.createObjectBuilder().add("iddepartamento",rs.getInt("iddepartamento"))
                        .add("departamento", rs.getString("departamento")));
            }

            rs.close();
            st.close();
            conn.close();

        }
        catch (Exception e){
            builder.add(Json.createObjectBuilder().add("iddepartamento",-1));

        }

        return  builder.build();
    }

    public JsonArray ReturnUniversidad(){
        Conexion conexion =  new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();
        String g = null;
        try{
            conn = conexion.getConnection();
            CallableStatement st = conn.prepareCall("BEGIN returnuniversidad(?);END;");
            st.registerOutParameter(1,OracleTypes.CURSOR);
            st.execute();

            ResultSet rs= ((OracleCallableStatement)st).getCursor(1);
            ResultSetMetaData rsMd = rs.getMetaData();
            while(rs.next()){

                builder.add(Json.createObjectBuilder().add("iduniversidad",rs.getInt("iduniversidad"))
                        .add("Universidad", rs.getString("nombre")));
            }

            rs.close();
            st.close();
            conn.close();

        }
        catch (Exception e){
            builder.add(Json.createObjectBuilder().add("iduniversidad",-1));

        }

        return  builder.build();
    }

    public JsonArray ReturnMaterial(){
        Conexion conexion =  new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();
        String g = null;
        try{
            conn = conexion.getConnection();
            CallableStatement st = conn.prepareCall("BEGIN returnmaterial(?);END;");
            st.registerOutParameter(1,OracleTypes.CURSOR);
            st.execute();

            ResultSet rs= ((OracleCallableStatement)st).getCursor(1);
            ResultSetMetaData rsMd = rs.getMetaData();
            while(rs.next()){

                builder.add(Json.createObjectBuilder().add("Material", rs.getString("nombre")));
            }

            rs.close();
            st.close();
            conn.close();

        }
        catch (Exception e){
            builder.add(Json.createObjectBuilder().add("Material",-1));

        }

        return  builder.build();
    }

    public JsonArray ReturnEstudiante(int pidusuario){
        Conexion conexion =  new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();
        String g = null;
        try{
            conn = conexion.getConnection();
            CallableStatement st = conn.prepareCall("BEGIN returnestudiante(?,?);END;");
            st.setInt(1,pidusuario);
            st.registerOutParameter(2,OracleTypes.CURSOR);
            st.execute();

            ResultSet rs= ((OracleCallableStatement)st).getCursor(2);
            ResultSetMetaData rsMd = rs.getMetaData();
            while(rs.next()){

                builder.add(Json.createObjectBuilder().add("Carnet", rs.getInt("idusuario")).add("Nombre",rs.getString("nombre"))
                        .add("Apellido1",rs.getString("apellido1")).add("Apellido2",rs.getString("apellido2"))
                        .add("Descripcion",rs.getString("descripcion")).add("Correo",rs.getString("correo"))
                        .add("Telefono",rs.getString("telefono")).add("CantidadColones",rs.getDouble("cantidadcolones"))
                        .add("CantidadTecolones",rs.getDouble("cantidadtecolones")).add("Estado",rs.getString("estado"))
                        .add("Universidad",rs.getString("universidad")).add("Sede",rs.getString("sede")));
            }

            rs.close();
            st.close();
            conn.close();

        }
        catch (Exception e){
            builder.add(Json.createObjectBuilder().add("Carnet",-1));

        }

        return  builder.build();
    }

    public JsonArray logInEtudiante(int pidusuario,String pContraseña){
        Conexion conexion = new Conexion();
        Connection conn0;
        Connection conn;
        Connection conn1;
        Connection conn5;
        JsonArrayBuilder builder = Json.createArrayBuilder();
        int intentos = 0;
                try{
                    conn = conexion.getConnection();
                    CallableStatement st = conn.prepareCall("{?=call returnintento (?)}");
                    st.registerOutParameter(1,OracleTypes.INTEGER);
                    st.setInt(2,pidusuario);
                    st.executeUpdate();
                    intentos = st.getInt(1);
                    st.close();
                    conn.close();
                    if(intentos<3){
                        try{
                            conn1 = conexion.getConnection();
                            CallableStatement st1 = conn1.prepareCall("{? = call loginestudiante (?,?)}");
                            st1.registerOutParameter(1,OracleTypes.VARCHAR);
                            st1.setInt(2,pidusuario);
                            st1.setString(3,pContraseña);
                            st1.executeUpdate();
                            String retorno = st1.getString(1);
                            try{
                                conn5 = conexion.getConnection();
                                CallableStatement st5 = conn5.prepareCall("{call updateIntentocerrarsesion (?)}");
                                st5.setInt(1,pidusuario);
                                st5.executeUpdate();
                                st5.close();
                                conn5.close();

                            }
                            catch (Exception k){
                                builder.add(Json.createObjectBuilder().add("Estado",-1));

                            }

                            builder.add(Json.createObjectBuilder().add("Estado",retorno));

                            st1.close();
                            conn1.close();
                        }
                        catch (Exception e){
                            try{
                                conn0 = conexion.getConnection();
                                CallableStatement st0 = conn0.prepareCall("{call updateIntentologinestudiante (?)}");
                                st0.setInt(1,pidusuario);
                                st0.executeUpdate();
                                st0.close();
                                conn0.close();
                                try {
                                    conn = conexion.getConnection();
                                    CallableStatement st9 = conn.prepareCall("{?=call returnintento (?)}");
                                    st9.registerOutParameter(1, OracleTypes.INTEGER);
                                    st9.setInt(2, pidusuario);
                                    st9.executeUpdate();
                                    intentos = st9.getInt(1);
                                    st9.close();
                                    conn.close();
                                }
                                catch (Exception e4){

                                }

                                if(intentos==3){
                                    try{
                                        conn0 = conexion.getConnection();
                                        CallableStatement st8 = conn0.prepareCall("{call updateestado (?,?)}");
                                        int estado = 3;
                                        st8.setInt(1,pidusuario);
                                        st8.setInt(2,estado);
                                        st8.executeUpdate();
                                        st8.close();
                                        conn0.close();

                                    }
                                    catch (Exception k){
                                        builder.add(Json.createObjectBuilder().add("Estado",-2));

                                    }
                                }

                            }
                            catch (Exception k){
                                builder.add(Json.createObjectBuilder().add("Estado",-1));

                            }
                            builder.add(Json.createObjectBuilder().add("Estado",-1));

                        }

                    }
                    else{

                        builder.add(Json.createObjectBuilder().add("Estado",-2));


                    }

                }
                catch (Exception e){
                    builder.add(Json.createObjectBuilder().add("Estado",-1));
                }

        return  builder.build();
    }

    public JsonArray logInAdministrador(int pidusuario,String pContraseña){
        Conexion conexion = new Conexion();
        Connection conn0;
        Connection conn;
        Connection conn1;
        Connection conn5;
        JsonArrayBuilder builder = Json.createArrayBuilder();
        int intentos = 0;
        try{
            conn = conexion.getConnection();
            CallableStatement st = conn.prepareCall("{?=call returnintento (?)}");
            st.registerOutParameter(1,OracleTypes.INTEGER);
            st.setInt(2,pidusuario);
            st.executeUpdate();
            intentos = st.getInt(1);
            st.close();
            conn.close();
            if(intentos<3){
                try{
                    conn1 = conexion.getConnection();
                    CallableStatement st1 = conn1.prepareCall("{? = call loginadministrador(?,?)}");
                    st1.registerOutParameter(1,OracleTypes.VARCHAR);
                    st1.setInt(2,pidusuario);
                    st1.setString(3,pContraseña);
                    st1.executeUpdate();
                    String retorno = st1.getString(1);
                    try{
                        conn5 = conexion.getConnection();
                        CallableStatement st5 = conn5.prepareCall("{call updateIntentocerrarsesion (?)}");
                        st5.setInt(1,pidusuario);
                        st5.executeUpdate();
                        st5.close();
                        conn5.close();

                    }
                    catch (Exception k){
                        builder.add(Json.createObjectBuilder().add("iduniversidad",-1));

                    }

                    builder.add(Json.createObjectBuilder().add("iduniversidad",retorno));

                    st1.close();
                    conn1.close();
                }
                catch (Exception e){
                    try{
                        conn0 = conexion.getConnection();
                        CallableStatement st0 = conn0.prepareCall("{call updateIntentologinadmi (?)}");
                        st0.setInt(1,pidusuario);
                        st0.executeUpdate();
                        st0.close();
                        conn0.close();


                    }
                    catch (Exception k){
                        builder.add(Json.createObjectBuilder().add("iduniversidad",-1));

                    }
                    builder.add(Json.createObjectBuilder().add("iduniversidad",-1));

                }

            }
            else{
                builder.add(Json.createObjectBuilder().add("iduniversidad",-2));


            }

        }
        catch (Exception e){
            builder.add(Json.createObjectBuilder().add("iduniversidad",-1));
        }

        return  builder.build();

    }

    public JsonArray logInAdministradorAcopio(int pidusuario,String pContraseña){
        Conexion conexion = new Conexion();
        Connection conn0;
        Connection conn;
        Connection conn1;
        Connection conn5;
        JsonArrayBuilder builder = Json.createArrayBuilder();
        int intentos = 0;
        try{
            conn = conexion.getConnection();
            CallableStatement st = conn.prepareCall("{?=call returnintento (?)}");
            st.registerOutParameter(1,OracleTypes.INTEGER);
            st.setInt(2,pidusuario);
            st.executeUpdate();
            intentos = st.getInt(1);
            st.close();
            conn.close();
            if(intentos<3){
                try{
                    conn1 = conexion.getConnection();
                    CallableStatement st1 = conn1.prepareCall("{? = call loginadministradoracopio(?,?)}");
                    st1.registerOutParameter(1,OracleTypes.VARCHAR);
                    st1.setInt(2,pidusuario);
                    st1.setString(3,pContraseña);
                    st1.executeUpdate();
                    String retorno = st1.getString(1);

                    try{
                        conn5 = conexion.getConnection();
                        CallableStatement st5 = conn5.prepareCall("{call updateIntentocerrarsesion (?)}");
                        st5.setInt(1,pidusuario);
                        st5.executeUpdate();
                        st5.close();
                        conn5.close();

                    }
                    catch (Exception k){
                        builder.add(Json.createObjectBuilder().add("idsede",-1));

                    }


                    builder.add(Json.createObjectBuilder().add("idsede",retorno));

                    st1.close();
                    conn1.close();
                }
                catch (Exception e){
                    try{
                        conn0 = conexion.getConnection();
                        CallableStatement st0 = conn0.prepareCall("{call updateIntentologinadmiaco (?)}");
                        st0.setInt(1,pidusuario);
                        st0.executeUpdate();
                        st0.close();
                        conn0.close();

                    }
                    catch (Exception k){
                        builder.add(Json.createObjectBuilder().add("idsede",-1));

                    }
                    builder.add(Json.createObjectBuilder().add("idsede",-1));

                }

            }
            else{
                builder.add(Json.createObjectBuilder().add("idsede",-2));


            }

        }
        catch (Exception e){
            builder.add(Json.createObjectBuilder().add("idsede",-1));
        }

        return  builder.build();

    }

    public JsonArray CambiarTecolones(int pidusuario1,int pidusuario2,double pcantidad){
        Conexion conexion = new Conexion();
        Connection conn;
        Connection conn1;
        JsonArrayBuilder builder = Json.createArrayBuilder();
        String usuario = "";
        String tweet = "";
        String consumerkey = "";
        String consumersecret= "";
        String accesstoken = "";
        String accesstokensecret= "";
        conexionTwitterCompartir twitt = new conexionTwitterCompartir();
        ArrayList list = new ArrayList();

        try{
            conn = conexion.getConnection();
            CallableStatement st = conn.prepareCall("{call rebajartecolones(?,?,?)}");
            st.setInt(1,pidusuario1);
            st.setInt(2,pidusuario2);
            st.setDouble(3,pcantidad);
            st.executeUpdate();
            st.close();
            conn.close();
            try{
                conn = conexion.getConnection();
                CallableStatement st1 = conn.prepareCall("{call aumentartecolones(?,?)}");
                st1.setInt(1,pidusuario2);
                st1.setDouble(2,pcantidad);
                st1.executeUpdate();
                st1.close();
                conn.close();

                try{
                    conn1 = conexion.getConnection();
                    CallableStatement st0 = conn1.prepareCall("BEGIN returntweetcompartir (?,?,?);END;");
                    int t = 1;
                    st0.setInt(1, t);
                    st0.setInt(2, pidusuario1);
                    st0.registerOutParameter(3,OracleTypes.CURSOR);
                    st0.execute();

                    ResultSet rs= ((OracleCallableStatement)st0).getCursor(3);
                    ResultSetMetaData rsMd = rs.getMetaData();
                    while(rs.next()){

                        list.add(0,rs.getString("nombre"));
                        list.add(1,rs.getString("cuerpo"));
                        list.add(2,rs.getString("consumerkey"));
                        list.add(3,rs.getString("consumersecret"));
                        list.add(4,rs.getString("accesstoken"));
                        list.add(5,rs.getString("accesstokensecret"));
                    }


                    usuario=list.get(0).toString();
                    tweet = list.get(1).toString();
                    consumerkey=list.get(2).toString();
                    consumersecret = list.get(3).toString();
                    accesstoken = list.get(4).toString();
                    accesstokensecret = list.get(5).toString();




                    rs.close();
                    st0.close();
                    conn1.close();


                }
                catch (Exception e){
                    builder.add(Json.createObjectBuilder().add("Respuesta",-1));


                }
            }
            catch (Exception e){

            }


            twitt.twittear(usuario,consumerkey,consumersecret,accesstoken,accesstokensecret,tweet);

            builder.add(Json.createObjectBuilder().add("Respuesta","Exito"));


        }
        catch (Exception e){
            builder.add(Json.createObjectBuilder().add("Respuesta",-1));
        }

        return  builder.build();
    }//en realidad es CompartirTecolones

    public JsonArray CanjearTecolones(int pidusuario, double pcantidad){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();

        try{
            conn = conexion.getConnection();
            CallableStatement query = conn.prepareCall("{call  updatecolones (?,?)}");

            query.setInt(1,pidusuario);
            query.setDouble(2,pcantidad);

            query.executeUpdate();
            builder.add(Json.createObjectBuilder().add("Respuesta","exitoso"));
            query.close();
            conn.close();

        }
        catch (Exception e) {
            builder.add(Json.createObjectBuilder().add("Respuesta",-1));
        }
        return builder.build();
    }

    public JsonArray returnToneladasMes(int piduniversidad,int pmonth,int pyear){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();

        try{
            conn = conexion.getConnection();
            CallableStatement st = conn.prepareCall("{? = call returntoneladasmes  (?,?,?)}");
            st.registerOutParameter(1,OracleTypes.INTEGER);
            st.setInt(2,piduniversidad);
            st.setInt(3,pmonth);
            st.setInt(4,pyear);
            st.executeUpdate();
            double retorno = st.getDouble(1);
            builder.add(Json.createObjectBuilder().add("cantMes",retorno));
            st.close();
            conn.close();

        }
        catch (Exception e){
            builder.add(Json.createObjectBuilder().add("cantMes",-1));
        }

        return  builder.build();
    }

    public JsonArray returnToneladasAnuales(int piduniversidad,int pyear){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();

        try{
            conn = conexion.getConnection();
            CallableStatement st = conn.prepareCall("{? = call returntoneladasanuales  (?,?)}");
            st.registerOutParameter(1,OracleTypes.INTEGER);
            st.setInt(2,piduniversidad);
            st.setInt(3,pyear);
            st.executeUpdate();
            double retorno = st.getDouble(1);
            builder.add(Json.createObjectBuilder().add("cantAnual",retorno));
            st.close();
            conn.close();

        }
        catch (Exception e){
            builder.add(Json.createObjectBuilder().add("cantAnual",-1));
        }

        return  builder.build();
    }

    public JsonArray returnToneladasSede(int piduniversidad){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();

        try{
            conn = conexion.getConnection();
            CallableStatement st = conn.prepareCall("BEGIN returntoneladassede (?,?);END;");
            st.setInt(1, piduniversidad);
            st.registerOutParameter(2,OracleTypes.CURSOR);
            st.execute();

            ResultSet rs= ((OracleCallableStatement)st).getCursor(2);
            ResultSetMetaData rsMd = rs.getMetaData();
            while(rs.next()){

                builder.add(Json.createObjectBuilder().add("Sede",rs.getString("nombre"))
                        .add("Toneladas", rs.getDouble("sum(cantidad)/1000")));
            }

            rs.close();
            st.close();
            conn.close();

        }
        catch (Exception e){
            builder.add(Json.createObjectBuilder().add("Sede",-1));

        }

        return  builder.build();
    }

    public JsonArray returnEstudiantesMensual(int piduniversidad, int pmonth){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();

        try{
            conn = conexion.getConnection();
            CallableStatement st = conn.prepareCall("{? = call returnestudiantesmensuales (?,?)}");
            st.registerOutParameter(1,OracleTypes.INTEGER);
            st.setInt(2,piduniversidad);
            st.setInt(3,pmonth);
            st.executeUpdate();
            int retorno = st.getInt(1);
            builder.add(Json.createObjectBuilder().add("EstudianteMensual",retorno));
            st.close();
            conn.close();

        }
        catch (Exception e){
            builder.add(Json.createObjectBuilder().add("EstudianteMensual",-1));
            e.printStackTrace();
        }

        return  builder.build();
    }

    public JsonArray returnTop10(int piduniversidad){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();

        try{
            conn = conexion.getConnection();
            CallableStatement st = conn.prepareCall("BEGIN returntop(?,?);END;");
            st.setInt(1, piduniversidad);
            st.registerOutParameter(2,OracleTypes.CURSOR);
            st.execute();

            ResultSet rs= ((OracleCallableStatement)st).getCursor(2);
            ResultSetMetaData rsMd = rs.getMetaData();
            while(rs.next()){

                builder.add(Json.createObjectBuilder().add("idusuario",rs.getInt("idusuario"))
                        .add("Nombre", rs.getString("nombre")).add("Apellido1",rs.getString("apellido1")).add("Apellido2",rs.getString("apellido2")).add("CantidadKilos",rs.getDouble("suma")));
            }

            rs.close();
            st.close();
            conn.close();


        }
        catch (Exception e){
            builder.add(Json.createObjectBuilder().add("idusuario",-1));
            e.printStackTrace();
        }

        return  builder.build();
    }

    public JsonArray returnDesgloseAnual(int piduniversidad,int pyear){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();

        try{
            conn = conexion.getConnection();
            CallableStatement st = conn.prepareCall("BEGIN returndesgloseanual(?,?,?);END;");
            st.setInt(1, piduniversidad);
            st.setInt(2, pyear);
            st.registerOutParameter(3,OracleTypes.CURSOR);
            st.execute();

            ResultSet rs= ((OracleCallableStatement)st).getCursor(3);
            ResultSetMetaData rsMd = rs.getMetaData();
            while(rs.next()){

                builder.add(Json.createObjectBuilder().add("Material",rs.getString("nombre"))
                        .add("ToneladasAnuales", rs.getDouble("suma")));
            }

            rs.close();
            st.close();
            conn.close();

        }
        catch (Exception e){
            builder.add(Json.createObjectBuilder().add("Material",-1));
            e.printStackTrace();
        }

        return  builder.build();
    }

    public JsonArray returnDesglose(int pidsede,int pmonth,int pyear){
        Conexion conexion = new Conexion();
        Connection conn;
        JsonArrayBuilder builder = Json.createArrayBuilder();

        try{
            conn = conexion.getConnection();
            CallableStatement st = conn.prepareCall("BEGIN returndesglose(?,?,?,?);END;");
            st.setInt(1, pidsede);
            st.setInt(2, pmonth);
            st.setInt(3, pyear);
            st.registerOutParameter(4,OracleTypes.CURSOR);
            st.execute();

            ResultSet rs= ((OracleCallableStatement)st).getCursor(4);
            ResultSetMetaData rsMd = rs.getMetaData();
            while(rs.next()){

                builder.add(Json.createObjectBuilder().add("Material",rs.getString("nombre"))
                        .add("Toneladas", rs.getDouble("suma")));
            }

            rs.close();
            st.close();
            conn.close();

        }
        catch (Exception e){
            builder.add(Json.createObjectBuilder().add("Material", -1));
            e.printStackTrace();
        }

        return  builder.build();
    }

}
