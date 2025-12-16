package kr.co.sist.siteProperty;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DbConn;

public class SiteProperty {

	public static SitePropertyVO spVO;

	// static 영역은 클래스가 사용되면 한번만 자동으로 호출되는 영역.
	static {
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = db.getConn();
			String selectSiteInfo = "select protocol, server_name, context_root, manage_path, key, title\r\n"
					+ " from site_property where context_root='/jsp_prj'";
					// + " from site_property where context_root='/2nd_prj_restArea'";
			pstmt = con.prepareStatement(selectSiteInfo);
			rs = pstmt.executeQuery();

			// SiteProperty에 static으로 설정 정보를 저장할 변수를 만들고
			// 조회된 결과를 할당하여 
			if (rs.next()) {
				spVO = new SitePropertyVO(rs.getString("protocol"), rs.getString("server_name"),
						rs.getString("context_root"), rs.getString("manage_path"), rs.getString("key"),
						rs.getString("title"));
			} // end if
		} catch (SQLException se) {
			se.printStackTrace();
		} // end catch
	}

}// class
