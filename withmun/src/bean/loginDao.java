package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class loginDao {
	Connection conn;
	
	public loginDao() {
		conn = new DBConnection().getConn();
	}

	
	public boolean log(String findid, String findpwd){ // 로그인
		boolean b = true;
		String sql = "select * from ADM where "
		+ "id = ? "
		+ "and pwd = ? ";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, findid);
			ps.setString(2, findpwd);
			
			ResultSet rs = ps.executeQuery();
				if(!rs.next()) {
					b = false;
				}
		}catch(Exception ex) {
			ex.printStackTrace();
			b = false;
		}finally {
			return b;			
		}
	}
}
