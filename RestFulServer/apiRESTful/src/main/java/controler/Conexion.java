package controler;
import java.sql.Connection;
import java.sql.*;

public class Conexion {

    public Conexion() {
    }


    public static Connection conn;

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("oracle.jdbc.OracleDriver");
        String url = ("jdbc:oracle:thin:@localhost:1521:XE");
        conn = DriverManager.getConnection(url, "Tecolones", "system");

        return conn;

    }
}

        