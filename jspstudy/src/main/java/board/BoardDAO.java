package board;

import java.util.List;
import java.util.Map;
import java.util.Vector;
import javax.servlet.ServletContext;
import common.JDBConnect;

// board dao에서 상속 받아야 함 
public class BoardDAO extends JDBConnect {
	public BoardDAO(ServletContext application) {
		super(application);
	}

	// 화면단 jsp 만들기
	// 계시물 개수도 불러올 객체 만들기
	public int getTotalCount(Map<String, Object> param) { // 조건이 있을때
		int totalCount = 0; // 전체 개수 새는거
		String sql = "select count(*) from board ";// where title like "%k% 쿼리문 작성 할때는 +=
		if (param.get("findWord") != null) {// param이 null일수 없다 앞에 객체를 만들어 놨으니 값은 없을수 있다. 값이 있는지 없는지 확인하기 get으로
			sql += " where " + param.get("findCol") + " like '%" + param.get("findWord") + "%'";

		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1);// 컬럼 넘버를 totalcount에 집어 넣으면 해당 값이 나옴

		} catch (Exception e) {
			System.out.println("게시물 카운트 중 에러");
			e.printStackTrace();
		}

		return totalCount;
	}

	// 게시물 내용 읽기

	public List<BoardDTO> getList(Map<String, Object> param) {
		System.out.println(param.get("findWord"));
		List<BoardDTO> bl = new Vector<BoardDTO>(); // Vector 또는 ArrayList 쓰기
		// 결과물에 순서가 필요하니 리스트로 받음.
		String sql = "select * from board ";// 카운트 아니고 내용 불러올거라
		if (param.get("findWord") != null) {
			sql += " where " + param.get("findCol") + " like '%" + param.get("findWord") + "%'";

		}
		sql += " order by num desc"; // num이 DB 안에 있는 num 이라 출력되는건 아니고 검색했을때 순서는 내림 차순이 최근순

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				bl.add(dto);

			}

		} catch (Exception e) {
			System.out.println("게시물 목록 읽는 중 에러");
			e.printStackTrace();
		}

		return bl;

	}

	
	// 페이지별 게시물 읽어오기 
	public List<BoardDTO> getListPage(Map<String, Object> param) {
		System.out.println(param.get("findWord"));
		List<BoardDTO> bl = new Vector<BoardDTO>(); // Vector 또는 ArrayList 쓰기
		// 결과물에 순서가 필요하니 리스트로 받음.
		String sql = "select * from ( "
				+ "   select rownum pnum, s.* from( "
				+ "     select b.* from board b ";
		
			if (param.get("findWord") != null) {
				sql += " where " + param.get("findCol") + " like '%" + param.get("findWord") + "%'";
			}
			sql += "  order by num desc"
				+ "		)s"
				+ ")"
				+ " where pnum between ? and ? ";
				
		

		try {
			psmt =con.prepareStatement(sql);
			psmt.setString(1, param.get("start").toString());
			psmt.setString(2, param.get("end").toString());
			rs = psmt.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				bl.add(dto);

			}

		} catch (Exception e) {
			System.out.println("게시물 목록 읽는 중 에러");
			e.printStackTrace();
		}

		return bl;

	}
	
	
	
	// 계시물 작성
	public int insertWrite(BoardDTO dto) {
		int res = 0;
		try {
			String sql = "insert into board(num,title,content,id,visitcount)"
					+ " values(seq_board_num.nextval,?,?,?,0)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			res = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("게시물 입력 중 에러");
			e.printStackTrace();
		}
		return res;
	}

	// 게시물 중 하나 읽어보기
	 public BoardDTO getView(String num) {
         BoardDTO dto = new BoardDTO();

         String sql = "SELECT b.*,m.NAME  FROM board b, MEMBER m WHERE num=? AND b.id=m.ID";
         try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1,num);
            rs = psmt.executeQuery();
            if (rs.next()) {
               dto.setNum(rs.getString("num"));
               dto.setTitle(rs.getString("title"));
               dto.setContent(rs.getString("content"));
               dto.setId(rs.getString("id"));
               dto.setPostdate(rs.getDate("postdate"));
               dto.setVisitcount(rs.getString("visitcount"));
               dto.setName(rs.getString("name"));
            }
         } catch (Exception e) {
            e.printStackTrace();
         }

         return dto;
   }
   

	// 조회수 증가
	public void updateVisitCount(String num) {
		String sql = "update board set visitcount=visitcount+1 where num=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, num);
			psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 에러");
			e.printStackTrace();
		}

	}
	
	//게시물 삭제
	public int deletePost(String num) {
		int res=0;
		try {
			String sql="delete from board where num=?";
			psmt=con.prepareStatement(sql);
			psmt.setString(1,num);
			res=psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시물 삭제중 에러");
		}
		return res;
	}
	
	//게시물 수정 
	public int updateEdit(BoardDTO dto) {
		int res=0;
		try {
			String sql="update board set title=?, content=? where num=?";
			psmt=con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			res=psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 수정 중 에러 ");
		}
	return res;
	}
	
	
}
