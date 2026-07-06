package util;
import java.sql.*;


public class DbConnection {

    private static final String URL="jdbc:mysql://localhost:3306/vote_system";

    private static final String USER="root";

    private static final String PASSWORD="Adarsh2211";

    public static Connection getConnection() throws Exception{
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL,USER,PASSWORD);
    }


}