package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {

	// 멤버 변수 선언
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;

	public JDBConnect() {
		// jdbc driver load
		try {
			Class.forName("oracle.jdbc.OracleDriver");

			// db.connect
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "jin";
			String pw = "1234";
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB 연결 ()");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public JDBConnect(String driver,String url,String id,String pw) {
		// jdbc driver load
		try {
			Class.forName(driver);

			// db.connect
			
			con = DriverManager.getConnection(url, id, pw);
			//con.prepareStatement(url).executeUpdate() update 는 insert into 등 그런문 사용 / executequery(select)할때 
			System.out.println("DB 연결 (매개변수 인자)");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public JDBConnect(ServletContext application) {
	
			try {
				
				String driver=application.getInitParameter("OracleDriver");
				Class.forName(driver);
				String url =application.getInitParameter("OracleUrl");
				String id =application.getInitParameter("OracleId");
				String pw =application.getInitParameter("OraclePw");
				con = DriverManager.getConnection(url, id, pw);
				System.out.println("DB 연결 (초기화 매개변수)");

			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	
	
	public void close() {
		try {
			if (con != null)
				con.close();
			System.out.println("DB연결 해제");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
