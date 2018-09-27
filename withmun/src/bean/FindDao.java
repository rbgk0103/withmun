package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FindDao {
Connection conn;
int count;


	public int getCount() {
	return count;
	}
	
	public void setCount(int count) {
		this.count = count;
	}

	public FindDao() {
		conn = new DBConnection().getConn();
	}
	
	public List<FindVo> select(String findStr , String grp){
		List<FindVo> list = new ArrayList<>();
		
		String sql = 
				"select * from FIND where ( keyword like ? or pagename like ? or grp like ? ) and grp like ?";
			
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ findStr + "%");
			ps.setString(2, "%"+ findStr + "%");
			ps.setString(3, "%"+ findStr + "%");
			ps.setString(4, "%"+ grp + "%");
			
			
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				FindVo vo = new FindVo();
				vo.setGrp(rs.getString("grp"));
				vo.setKeyword(rs.getString("keyword"));
				vo.setOneline(rs.getString("oneline"));
				vo.setImg(rs.getString("img"));
				vo.setPage(rs.getString("page"));
				vo.setPagename(rs.getString("pagename"));
				count++;
					
				list.add(vo);
			}
		
		}catch(Exception ex) {
			ex.printStackTrace();
			list = null;
		}
		return list;
		
	}
}