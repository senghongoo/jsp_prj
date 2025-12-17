package kr.co.sist.map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.board.BoardDTO;
import kr.co.sist.dao.DbConn;

public class RestaurantDAO {

	private static RestaurantDAO rDAO;

	private RestaurantDAO() {

	}// RestaurantDAO

	public static RestaurantDAO getInstance() {
		if (rDAO == null) {
			rDAO = new RestaurantDAO();
		} // end if

		return rDAO;
	}// getInstance

	public List<RestaurantDTO> selectAllRestaurant(String id) {
		List<RestaurantDTO> list = new ArrayList<RestaurantDTO>();

		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 1. JNDI사용객체 생성
			// 2. DataSource 얻기
			// 3. Connection 얻기
			con = dbCon.getConn();
			// 4. 쿼리문생성객체 얻기
			StringBuilder selectBoard = new StringBuilder();
			selectBoard.append("	select  num, title, input_date,cnt,id				 ")
					.append("	from	(select  num, title, input_date,cnt,id,		")
					.append("	row_number() over( order by input_date desc) rnum	")
					.append("	from		board									");
			// dynamic query : 검색키워드가 있다면 검색 키워드에 해당하는 글의 개수 검색
			if (rDTO.getKeyword() != null && !rDTO.getKeyword().isEmpty()) {
				selectBoard.append(" where instr(").append(rDTO.getFieldStr()).append(",?) != 0");
			} // end if
			selectBoard.append("	)where rnum between ? and ?							");

			pstmt = con.prepareStatement(selectBoard.toString());
			// 5. 바인드변수 값 설정
			int pstmtIdx = 0;
			if (rDTO.getKeyword() != null && !rDTO.getKeyword().isEmpty()) {
				pstmt.setString(++pstmtIdx, rDTO.getKeyword());
			} // end if

			pstmt.setInt(++pstmtIdx, rDTO.getStartNum());
			pstmt.setInt(++pstmtIdx, rDTO.getEndNum());
			// 6. 조회결과 얻기
			BoardDTO bDTO = null;

			rs = pstmt.executeQuery();

			while (rs.next()) {
				bDTO = new BoardDTO();
				bDTO.setNum(rs.getInt("num"));
				bDTO.setTitle(rs.getString("title"));
				bDTO.setInput_date(rs.getDate("input_date"));
				bDTO.setCnt(rs.getInt("cnt"));
				bDTO.setId(rs.getString("id"));

				list.add(bDTO);
			} // end while

		} finally {
			// 7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		} // end finally

		return list;
	}// selectAllRestaurant

	public void insertRestaurant(RestaurantDTO rDTO) throws SQLException {

	}// insertRestaurant

}// class
