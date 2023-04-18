package membership;

import java.sql.PreparedStatement;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	public MemberDAO(String driver, String url, String id, String pw) {
		// 받은값을 JDBC 에 값을 넣어주면 됨
		super(driver, url, id, pw);

	}

	public MemberDTO getMember(String uid,String upw){
		String query="SELECT * FROM MEMBER WHERE ID=? AND PW=?";
		MemberDTO dto= new MemberDTO();
	try {	
		psmt =con.prepareStatement(query);
		psmt.setString(1,uid);
		psmt.setString(2,upw);
		rs=psmt.executeQuery();

	if(rs.next()) {
		dto.setId(rs.getString("id"));
		dto.setPw(rs.getString("pw"));
		dto.setName(rs.getString("name"));
		dto.setRegdate(rs.getString("regdate"));
	}
	
	}catch (Exception e){
		e.printStackTrace();
	}
	return dto;
}
	
	// 여기에 테이블 수정 할 항목을 적어주면 됨 
	
	
}
