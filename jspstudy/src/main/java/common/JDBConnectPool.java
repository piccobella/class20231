package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JDBConnectPool {

	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;

	public JDBConnectPool() {// 서버단에서 가져오는 방법 자바로 짜는 것 
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context)initCtx.lookup("java:comp/env"); // 설정된 값에서 LOOKUP  
			DataSource source = (DataSource)ctx.lookup("dbcp_my_oracle");// 이값을 불러와서 
			
			con=source.getConnection();
			System.out.println("DB CP connect success");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("DB CP connect fail");
		}
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();

			System.out.println("DB CP connection 반납");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}