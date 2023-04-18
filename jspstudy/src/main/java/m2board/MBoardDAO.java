package m2board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;

public class MBoardDAO extends JDBConnect {
	public MBoardDAO() {
		super();
	}

	// fileboard table 검색조건 고려 결과 전체 개수
	public int countAll(Map<String, Object> map) {
		int totalCount = 0;
		String query = "select count(*) from fileboard ";
		if (map.get("searchStr") != null) {
			query += " where " + map.get("searchType") + " like '%" + map.get("searchStr") + "%'";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 카운트 중 에러");
			e.printStackTrace();
		}
		return totalCount;
	}
//	select *
//	from(
//	  select row_number() over(order by idx desc) pnum
//	      ,b.*
//	  from fileboard b
//	  order by idx desc
//	) where pnum between 1 and 2
//
//	select *
//	from(
//	    select rownum as pnum,s.*
//	    from(
//	        select *
//	        from fileboard
//	        where title like '%자%'
//	        order by idx desc
//	    )s
//	)where pnum between 1 and 2

	public List<MBoardDTO> getListPage(Map<String, Object> map) {
		List<MBoardDTO> bl = new Vector<>();
		String query = "select * from( " + "    select rownum as pnum,s.* from(" + "        select * from fileboard";
		if (map.get("searchStr") != null) {
			query += " where " + map.get("searchType") + " like '%" + map.get("searchStr") + "%'";
		}
		query += "        order by idx desc" + "    ) s" + ") where pnum between ? and ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while (rs.next()) {
				MBoardDTO dto = new MBoardDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setNfile(rs.getString("nfile"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setVisitcount(rs.getInt("visitcount"));
				dto.setPass(rs.getString("pass"));
				bl.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 목록 읽기 중 에러");
			e.printStackTrace();
		}
		return bl;
	}

	public int insertWrite(MBoardDTO dto) {
		int result = 0;
		String query = "insert into fileboard(idx,name,title,content,ofile,nfile,pass)"
				+ "values(seq_board_num.nextval,?,?,?,?,?,?)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getNfile());
			psmt.setString(6, dto.getPass());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외");
			e.printStackTrace();
		}
		return result;
	}

	public void updateVisitCount(String idx) {
		String query = "update fileboard set visitcount=visitcount+1" + "where idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("조회수 증가 중 예외");
			e.printStackTrace();
		}
	}

	public MBoardDTO getView(String idx) {
		MBoardDTO dto = new MBoardDTO();
		String query = "select * from fileboard where idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setNfile(rs.getString("nfile"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setVisitcount(rs.getInt("visitcount"));
				dto.setPass(rs.getString("pass"));
			}
		} catch (Exception e) {
			System.out.println("상세보기 중 예외");
			e.printStackTrace();
		}
		return dto;
	}

	public void updateDowncount(String idx) {
		String query = "update fileboard set downcount=downcount+1 " + " where idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("다운로드 수 증가 중 예외");
			e.printStackTrace();
		}
	}

	public int getDowncount(String idx) {
		int dcount = 0;
		String query = "select downcount from fileboard where idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			rs.next();
			dcount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("다운로드 수 읽기 중 에러");
			e.printStackTrace();
		}
		return dcount;
	}

	public boolean confirmPassword(String pass, String idx) {
		boolean isRight = false;
		try {
			String query = "select count(*) from fileboard where pass=? and idx=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, pass);
			psmt.setString(2, idx);
			rs = psmt.executeQuery();
			rs.next();
			if (rs.getInt(1) == 1) {
				isRight = true;
			}
		} catch (Exception e) {
			isRight = false;
			System.out.println("암호 검증 중 에러");
			e.printStackTrace();
		}
		return isRight;
	}

	public int deletePost(String idx) {
		int result = 0;
		try {
			String query = "delete from fileboard where idx=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("게시물 삭제 중 에러");
			e.printStackTrace();
		}

		return result;
	}

	public int updatePost(MBoardDTO dto) {
		int result = 0;
		try {
			String query = "update fileboard" 
					+ " set title=?, name=?, content=?, ofile=?, nfile=?"
					+ " where idx=? and pass=?";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getNfile());
			psmt.setString(6, dto.getIdx());
			psmt.setString(7, dto.getPass());
			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("게시물 수정 중 에러");
			e.printStackTrace();
		}
		return result;
	}

}
