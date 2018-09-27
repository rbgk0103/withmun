package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ListDao {

	Connection conn;

	public ListDao() {

		conn = new DBConnection().getConn();
	}

	int listSize = 10;
	int blockSize = 3;
	int nowPage = 1; // getter/setter
	int totSize = 0;
	int totPage = 0; // getter
	int totBlock = 0; // getter
	int nowBlock = 0;

	int endPage = 0; // getter
	int startPage = 0; // getter

	int endNo = 0; // getter
	int startNo = 0; // getter

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getTotSize() {
		return totSize;
	}

	public void setTotSize(int totSize) {
		this.totSize = totSize;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}

	public int getTotBlock() {
		return totBlock;
	}

	public void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public void pageCompute(String findStr) {
		String sql = "select count(serial) cnt from BOARD B where " 
				+ " B.name like ? " + " or B.doc like ? ";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");

			ResultSet rs = ps.executeQuery();
			rs.next();

			totSize = rs.getInt("cnt");

			totPage = (int) Math.ceil(totSize / (double) listSize);
			totBlock = (int) Math.ceil(totPage / (double) blockSize);
			nowBlock = (int) Math.ceil(nowPage / (double) blockSize);

			endPage = nowBlock * blockSize;
			if (endPage > totPage)
				endPage = totPage;
			startPage = endPage - blockSize + 1;
			if (startPage < 1)
				startPage = 1;

			endNo = nowPage * listSize;
			if (endPage > totSize)
				endNo = totSize;
			startNo = endNo - listSize;
			if (startNo < 1)
				startNo = 0;

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public List<ListVo> select(String findStr) { // 검색
		pageCompute(findStr);
		// grp desc, serial
		List<ListVo> list = new ArrayList<>();
		String sql = " SELECT * FROM BOARD  WHERE NAME like ? or DOC like ? ORDER BY grp DESC ,  reply ASC limit ?, ? ";

		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			ps.setInt(3, startNo);
			ps.setInt(4, listSize);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ListVo vo = new ListVo();
				vo.setSerial(Integer.parseInt(rs.getString("serial")));
				vo.setName(rs.getString("name"));
				vo.setPwd(rs.getString("pwd"));
				vo.setDoc(rs.getString("doc"));
				vo.setBdate(rs.getDate("bdate").toString());
				vo.setReply(Integer.parseInt(rs.getString("reply")));
				vo.setGrp(Integer.parseInt(rs.getString("grp")));

				list.add(vo);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			list = null;
		} /*finally {
			try {
				conn.close();
				conn = null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}*/
		return list;
		
		
		// DB가 현재 존재 하지 않아 실행이되지 않아 finally 뒷부분 주석처리 하여 Q&A 가 실행되게 하였다.
	
	}

	public boolean insert(ListVo vo) {
		boolean b = true;
		String sql = "INSERT INTO BOARD(name, pwd, doc, bdate, reply, grp) "
				+ "VALUES(? , ? , ? , now() , 1 , (select MAX(LAST_INSERT_ID(SERIAL)+1) from BOARD b) )";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getDoc());
			int cnt = ps.executeUpdate(); // insert, update, delete
			if (cnt <= 0)
				b = false;

		} catch (Exception ex) {
			ex.printStackTrace();
			b = false;
		} finally {
			return b;
		}
	}

	public boolean rep(ListVo vo) { // 답글
		boolean b = true;

		String sql = "INSERT INTO BOARD(name, pwd, doc, bdate, reply , grp) VALUES('위드문','dlsxjsotusjf1201',?,now(),3,?)";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getDoc());
			ps.setInt(2, vo.getSerial());

			int cnt = ps.executeUpdate(); // insert, update, delete
			if (cnt <= 0)
				b = false;

		} catch (Exception ex) {
			ex.printStackTrace();
			b = false;
		} finally {
			return b;
		}
	}

	public boolean repUpdate(ListVo vo) { // 답글
		boolean b = true;
		String sql = "update BOARD set reply = 2 where serial = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getSerial());

			int cnt = ps.executeUpdate(); // insert, update, delete
			if (cnt <= 0)
				b = false;

		} catch (Exception ex) {
			ex.printStackTrace();
			b = false;
		} finally {
			return b;
		}
	}

	public boolean delete(ListVo vo) { // 삭제
		boolean b = true;
		String sql = "delete from BOARD where serial = ? and pwd = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getSerial());
			ps.setString(2, vo.getPwd());

			int cnt = ps.executeUpdate();
			if (cnt <= 0) {

				b = false;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			b = false;
		} finally {
			return b;
		}
	}

	public boolean deleteReply(ListVo vo) { // 삭제
		boolean b = true;
		String sql = "delete from BOARD where grp = ? and reply = 3";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getSerial());

			int cnt = ps.executeUpdate();
			if (cnt <= 0) {

				b = false;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			b = false;
		} finally {
			return b;
		}
	}

	//////////////////////////////// 관리자용 delete//////////////////////////
	public boolean deleteAdm(ListVo vo) { // 삭제
		boolean b = true;
		String sql = "delete from BOARD where serial = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getSerial());
			int cnt = ps.executeUpdate();
			if (cnt <= 0) {

				b = false;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			b = false;
		} finally {
			return b;
		}
	}

	public boolean deleteAdmReply(ListVo vo) { // 삭제
		boolean b = true;
		String sql = "delete from BOARD where grp = ? and reply = 3";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getSerial());

			int cnt = ps.executeUpdate();
			if (cnt <= 0) {

				b = false;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			b = false;
		} finally {
			return b;
		}
	}

	////////////////////// 관리자가 reply 삭제했을때 원본 글 reply 값  update/////////////////////////
	public boolean updateReplyStatus(ListVo vo) {

		boolean b = true;
		String sql = "UPDATE BOARD SET REPLY = 1 WHERE SERIAL = ( SELECT B.GRP FROM ( SELECT GRP FROM BOARD WHERE SERIAL = ?) AS B )";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getSerial());
			int cnt = ps.executeUpdate(); // insert, update, delete
			System.out.println(sql);
			System.out.println(vo.getSerial()+" : updateReplyStatus 겟시리얼");
			System.out.println("cnt : "+cnt);
			if (cnt <= 0)
				b = false;
		} catch (Exception ex) {
			ex.printStackTrace();
			b = false;
		} finally {
			return b;
		}

	}

}
