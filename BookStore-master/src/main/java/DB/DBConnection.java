package DB;

import java.sql.Connection;
import java.sql.DriverManager;
public class DBConnection {
	private static final String URL = setting("DB_URL", "jdbc:mysql://localhost:3306/bookstore?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC&characterEncoding=UTF-8");
	private static final String USER = setting("DB_USER", "root");
	private static final String PASSWORD = setting("DB_PASS", "1234");

	private static String setting(String name, String fallback) {
		String value = System.getProperty(name);
		if (value == null || value.isBlank()) value = System.getenv(name);
		return value == null || value.isBlank() ? fallback : value;
	}

	public static Connection getConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (Exception e) {
			System.err.println("[BookStore] Database connection failed: " + e.getMessage());
			return null;
		}
	}
}
