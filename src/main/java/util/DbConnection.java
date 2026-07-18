package util;
import java.sql.*;


public class DbConnection {

    public static Connection getConnection() throws Exception {
        String url = System.getenv("DB_URL");
        String user = System.getenv("DB_USER");
        String password = System.getenv("DB_PASSWORD");

        System.out.println("[DB_CONNECT] Attempting DB connection...");
        System.out.println("[DB_CONNECT] URL: " + url);
        System.out.println("[DB_CONNECT] USER: " + user);

        if (url == null || url.trim().isEmpty()) {
            System.err.println("[DB_CONNECT] ERROR: DB_URL is missing!");
            throw new RuntimeException("DB_URL environment variable is not configured in Render Environment settings!");
        }

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        System.out.println("[DB_CONNECT] SUCCESS: Connected to MySQL database!");
        return con;
    }


}