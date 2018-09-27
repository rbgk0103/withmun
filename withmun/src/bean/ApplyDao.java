package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.http.fileupload.FileUpload;

import com.oreilly.servlet.MultipartRequest;

/**
 * @author JHTA
 *
 */
public class ApplyDao {
	
	/*
	 * 필드
	 */
	
	// DB처리 관련 변수들
	Connection conn = null;
	PreparedStatement ps = null;
	
	// 페이징처리 관련 변수들
	   int listSize = 5; // 한 페이지안에 데이터 수
	   int blockSize = 2; // 
	   int nowPage = 1; // 현제 페이지

	   int totSize = 0 ; // 전체 데이터 양
	   int totPage = 0;
	   int totBlock = 0;
	   int nowBlock = 0;

	   int endPage = 0;
	   int startPage = 0;

	   int endNo = 0; 
	   int startNo = 0;
	   
	   
	
	
	/*
	 * 생성자(dao객체 만들자마자 커넥션까지!)
	 */
	public ApplyDao() {
		conn = new DBConnection().getConn();
	}
	
	/*
	 * 메소드들
	 */
	
	/* 이력서 리스트 페이지 */
	   public void pageCompute(String findstr) {
	      String sql = 
	             "select count(pwd) cnt from apply where "
	            + "field like ? "
	            + "or name like ? "
	            + "or email like ? ";
	      
	      try {
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ps.setString(1,  "%" + findstr + "%");
	         ps.setString(2,  "%" + findstr + "%");
	         ps.setString(3,  "%" + findstr + "%");
	         
	         ResultSet rs = ps.executeQuery();
	         rs.next();
	         totSize = rs.getInt("cnt");
	         
	         totPage = (int)Math.ceil(totSize/(double)listSize);
	         totBlock = (int)Math.ceil(totPage/(double)blockSize);
	         nowBlock = (int)Math.ceil(nowPage/(double)blockSize);
	         
	         endPage = nowBlock * blockSize;
	         if(totPage < endPage) {
	            endPage = totPage;
	         }
	         
	         if((totSize % listSize) != 0) { // 전체 데이터가 리스트사아즈랑 맞아떨어지지않을때
	            if(nowPage == totPage) {
	            listSize = (totSize % listSize); // 마지막페이지의 리스트크기는 (전체데이터/리스트사이즈)의 나이머지 크기만큼으로 변환
	            }
	         }

	         startPage = endPage - blockSize + 1;
	         
	         if(startPage < 1) {
	            startPage = 1;
	         }

	         endNo = nowPage * listSize;
	         if(totSize < endNo) {
	            endNo = totSize;
	         }
	         startNo = endNo - listSize + 1;
	         if(startNo < 1) {
	            startNo = 1;
	         }
	      }catch(Exception ex) {
	         ex.printStackTrace();
	      }finally {
	      }
	   }   
	   
	   // 이력서 리스트
	   public List<ApplyVo> selectList(String findstr){
	      pageCompute(findstr);
	      List<ApplyVo> list = new ArrayList<>();
	      String sql = "select * from(select rownum nu, r.* from(select * from apply where "
	      + "field like ? "
	      + "or name like ? "
	      + "or email like ?)r )where nu between ? and ? and apply_date is not null";
	      
	      try {
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ps.setString(1,  "%" + findstr + "%");
	         ps.setString(2,  "%" + findstr + "%");
	         ps.setString(3,  "%" + findstr + "%");
	         ps.setInt(4, startNo);
	         ps.setInt(5, endNo);
	         
	         ResultSet rs = ps.executeQuery();
	         while(rs.next()) {
	            ApplyVo v = new ApplyVo();
	            v.setaNo(Integer.parseInt(rs.getString("ano")));
	            v.setField(rs.getString("field"));
	            v.setEmail(rs.getString("email"));
	            v.setName(rs.getString("name"));
	            v.setApplyDate(rs.getDate("apply_date").toString());
	            v.setReview(Integer.parseInt(rs.getString("review")));
	            list.add(v);
	         }
	         
	      }catch(Exception ex) {
	         ex.printStackTrace();
	         list = null;
	      }finally {
	         try {
	            conn.close();
	            conn = null;
	         }catch(SQLException e) {
	            e.printStackTrace();
	         }
	         return list;
	      }
	   }
	
	
	// 이력서 관리자가 자세히보기
	      public ApplyVo viewApply(int ano) {
	            ApplyVo prvVo = null;
	            String sql = " select * from apply where ano = ? ";
	            
	            try {
	               PreparedStatement ps = conn.prepareStatement(sql);
	               ps.setInt(1,  ano);
	               ResultSet rs = ps.executeQuery();
	               
	               while(rs.next()) {
	                  prvVo = new ApplyVo();
	                  
	                  prvVo.setaNo(rs.getInt("ANO"));
	                  prvVo.setEmail(rs.getString("EMAIL"));
	                  prvVo.setPwd(rs.getString("PWD"));
	                  prvVo.setName(rs.getString("NAME"));
	                  prvVo.setField(rs.getString("FIELD"));
	                  prvVo.setJumin1(rs.getString("JUMIN1"));
	                  prvVo.setJumin2(rs.getString("JUMIN2"));
	                  prvVo.setAddr(rs.getString("ADDR"));
	                  prvVo.setZipCode(rs.getString("ZIPCODE"));

	                  
	                  // tel 자르기
	                  String rsTel;
	                  String[] arrTel;
	                  String tel1, tel2, tel3;
	                  
	                  rsTel = rs.getString("TEL");
	                  arrTel = rsTel.split("-");
	                  
	                  tel1 = arrTel[0];
	                  tel2 = arrTel[1];
	                  tel3 = arrTel[2];
	                  
	                  prvVo.setTel1(tel1);
	                  prvVo.setTel2(tel2);
	                  prvVo.setTel3(tel3);
	                  
	                  
	                  // mobile 자르기
	                  String rsMobile;
	                  String[] arrMobile;
	                  String mobile1, mobile2, mobile3;
	                  
	                  rsMobile = rs.getString("MOBILE");
	                  arrMobile = rsMobile.split("-");
	                  
	                  mobile1 = arrMobile[0];
	                  mobile2 = arrMobile[1];
	                  mobile3 = arrMobile[2];
	                  
	                  prvVo.setMobile1(mobile1);
	                  prvVo.setMobile2(mobile2);
	                  prvVo.setMobile3(mobile3);
	                  
	                  
	                  prvVo.setHighName(rs.getString("HIGH_NAME"));
	                  prvVo.setHighStart(rs.getString("HIGH_START").substring(0, 10));
	                  prvVo.setHighFinish(rs.getString("HIGH_FINISH").substring(0, 10));
	                  prvVo.setHighJolUp(rs.getString("HIGH_JOLUP"));
	                  
	                  prvVo.setColName(rs.getString("COL_NAME"));
	                  prvVo.setColStart(rs.getString("COL_START").substring(0, 10));
	                  prvVo.setColFinish(rs.getString("COL_FINISH").substring(0, 10));
	                  prvVo.setColMajor(rs.getString("COL_MAJOR"));
	                  prvVo.setColGrade(rs.getString("COL_GRADE"));
	                  prvVo.setColJolUp(rs.getString("COL_JOLUP"));
	                  
	                  prvVo.setUnivName(rs.getString("UNIV_NAME"));
	                  prvVo.setUnivStart(rs.getString("UNIV_START").substring(0, 10));
	                  prvVo.setUnivFinish(rs.getString("UNIV_FINISH").substring(0, 10));
	                  prvVo.setUnivMajor(rs.getString("UNIV_MAJOR"));
	                  prvVo.setUnivGrade(rs.getString("UNIV_GRADE"));
	                  prvVo.setUnivJolUp(rs.getString("UNIV_JOLUP"));
	                  
	                  prvVo.setGradName(rs.getString("GRAD_NAME"));
	                  prvVo.setGradStart(rs.getString("GRAD_START").substring(0, 10));
	                  prvVo.setGradFinish(rs.getString("GRAD_FINISH").substring(0, 10));
	                  prvVo.setGradMajor(rs.getString("GRAD_MAJOR"));
	                  prvVo.setGradGrade(rs.getString("GRAD_GRADE"));
	                  prvVo.setGradJolUp(rs.getString("GRAD_JOLUP"));
	                  
	                  prvVo.setGunByul(rs.getString("GUN_BYUL"));
	                  prvVo.setGunByung(rs.getString("GUN_BYUNG"));
	                  prvVo.setGunGye(rs.getString("GUN_GYE"));
	                  prvVo.setGunStart(rs.getString("GUN_START").substring(0, 10));
	                  prvVo.setGunFinish(rs.getString("GUN_FINISH").substring(0, 10));
	                  prvVo.setGunPil(rs.getString("GUN_PIL"));
	                  prvVo.setGunMiPilWhy(rs.getString("GUN_MIPILWHY"));
	                  
	                  prvVo.setLang1Name(rs.getString("LANG1_NAME"));
	                  prvVo.setLang1Score(rs.getString("LANG1_SCORE"));
	                  prvVo.setLang1Date(rs.getString("LANG1_DATE").substring(0, 10));
	                  prvVo.setLang2Name(rs.getString("LANG2_NAME"));
	                  prvVo.setLang2Score(rs.getString("LANG2_SCORE"));
	                  prvVo.setLang2Date(rs.getString("LANG2_DATE").substring(0, 10));
	                  
	                  prvVo.setLicense1Name(rs.getString("LICENSE1_NAME"));
	                  prvVo.setLicense1Date(rs.getString("LICENSE1_DATE").substring(0, 10));
	                  prvVo.setLicense1Org(rs.getString("LICENSE1_ORG"));
	                  prvVo.setLicense2Name(rs.getString("LICENSE2_NAME"));
	                  prvVo.setLicense2Date(rs.getString("LICENSE2_DATE").substring(0, 10));
	                  prvVo.setLicense2Org(rs.getString("LICENSE2_ORG"));
	                  
	                  prvVo.setActivity1Content(rs.getString("ACTIVITY1_CONTENT"));
	                  prvVo.setActivity1Start(rs.getString("ACTIVITY1_START").substring(0, 10));
	                  prvVo.setActivity1Finish(rs.getString("ACTIVITY1_FINISH").substring(0, 10));
	                  prvVo.setActivity1Org(rs.getString("ACTIVITY1_ORG"));
	                  prvVo.setActivity2Content(rs.getString("ACTIVITY2_CONTENT"));
	                  prvVo.setActivity2Start(rs.getString("ACTIVITY2_START").substring(0, 10));
	                  prvVo.setActivity2Finish(rs.getString("ACTIVITY2_FINISH").substring(0, 10));
	                  prvVo.setActivity2Org(rs.getString("ACTIVITY2_ORG"));
	                  
	                  prvVo.setFamily1Rel(rs.getString      ("FAMILY1_REL"));
	                  prvVo.setFamily1Name(rs.getString      ("FAMILY1_NAME"));
	                  prvVo.setFamily1Birth(rs.getString      ("FAMILY1_BIRTH").substring(0, 10));
	                  prvVo.setFamily1Academic(rs.getString   ("FAMILY1_ACADEMIC"));
	                  prvVo.setFamily1Job(rs.getString      ("FAMILY1_JOB"));
	                  prvVo.setFamily1Company(rs.getString   ("FAMILY1_COMPANY"));
	                  prvVo.setFamily1Position(rs.getString   ("FAMILY1_POSITION"));
	                  prvVo.setFamily1Livewith(rs.getString   ("FAMILY1_LIVEWITH"));
	                  
	                  prvVo.setFamily2Rel(rs.getString      ("FAMILY2_REL"));        
	                  prvVo.setFamily2Name(rs.getString      ("FAMILY2_NAME"));       
	                  prvVo.setFamily2Birth(rs.getString      ("FAMILY2_BIRTH").substring(0, 10));      
	                  prvVo.setFamily2Academic(rs.getString   ("FAMILY2_ACADEMIC"));   
	                  prvVo.setFamily2Job(rs.getString      ("FAMILY2_JOB"));        
	                  prvVo.setFamily2Company(rs.getString   ("FAMILY2_COMPANY"));    
	                  prvVo.setFamily2Position(rs.getString   ("FAMILY2_POSITION"));   
	                  prvVo.setFamily2Livewith(rs.getString   ("FAMILY2_LIVEWITH"));   
	                  
	                  prvVo.setFamily3Rel(rs.getString      ("FAMILY3_REL"));        
	                  prvVo.setFamily3Name(rs.getString      ("FAMILY3_NAME"));       
	                  prvVo.setFamily3Birth(rs.getString      ("FAMILY3_BIRTH").substring(0, 10));      
	                  prvVo.setFamily3Academic(rs.getString   ("FAMILY3_ACADEMIC"));   
	                  prvVo.setFamily3Job(rs.getString      ("FAMILY3_JOB"));        
	                  prvVo.setFamily3Company(rs.getString   ("FAMILY3_COMPANY"));    
	                  prvVo.setFamily3Position(rs.getString   ("FAMILY3_POSITION"));   
	                  prvVo.setFamily3Livewith(rs.getString   ("FAMILY3_LIVEWITH"));   
	                  
	                  prvVo.setFamily4Rel(rs.getString      ("FAMILY4_REL"));        
	                  prvVo.setFamily4Name(rs.getString      ("FAMILY4_NAME"));       
	                  prvVo.setFamily4Birth(rs.getString      ("FAMILY4_BIRTH").substring(0, 10));      
	                  prvVo.setFamily4Academic(rs.getString   ("FAMILY4_ACADEMIC"));   
	                  prvVo.setFamily4Job(rs.getString      ("FAMILY4_JOB"));        
	                  prvVo.setFamily4Company(rs.getString   ("FAMILY4_COMPANY"));    
	                  prvVo.setFamily4Position(rs.getString   ("FAMILY4_POSITION"));   
	                  prvVo.setFamily4Livewith(rs.getString   ("FAMILY4_LIVEWITH"));   
	                  
	                  prvVo.setHobby(rs.getString("HOBBY"));
	                  prvVo.setSpecial(rs.getString("SPECIAL"));
	                  prvVo.setReligion(rs.getString("RELIGION"));
	                  prvVo.setBoHun(rs.getString("BOHUN"));
	                  
	                  prvVo.setSungJang(rs.getString("SUNGJANG"));
	                  prvVo.setCharact(rs.getString("CHARACT"));
	                  prvVo.setMotive(rs.getString("MOTIVE"));
	                  prvVo.setFuture(rs.getString("FUTURE"));
	                  
	                  prvVo.setPhotoC(rs.getString("PHOTOC"));
	                  prvVo.setPhotoS(rs.getString("PHOTOS"));
	               }
	               
	               
	               
	            }catch(Exception ex) {
	               ex.printStackTrace();
	               prvVo = null;
	               
	            }finally {
	               return prvVo;
	               
	            }
	         }   
	   
	   
	   
	   
	
	// profileInsert.ap
	public boolean profileInsert(ApplyVo piVo) {
		boolean b = true;
		String sql =
		  " insert into APPLY ( "
		+ " ANO,EMAIL,PWD,NAME,FIELD, "
		+ " JUMIN1,JUMIN2,ADDR,ZIPCODE,TEL,MOBILE, "
		+ " HIGH_NAME,HIGH_START,HIGH_FINISH,HIGH_JOLUP, "
		+ " COL_NAME,COL_START,COL_FINISH,COL_MAJOR,COL_GRADE,COL_JOLUP, "
		+ " UNIV_NAME,UNIV_START,UNIV_FINISH,UNIV_MAJOR,UNIV_GRADE,UNIV_JOLUP, "
		+ " GRAD_NAME,GRAD_START,GRAD_FINISH,GRAD_MAJOR,GRAD_GRADE,GRAD_JOLUP,  "
		+ "	GUN_BYUL,GUN_BYUNG,GUN_GYE,GUN_START,GUN_FINISH,GUN_PIL,GUN_MIPILWHY, "
		+ " LANG1_NAME,LANG1_SCORE,LANG1_DATE, "
		+ "	LANG2_NAME,LANG2_SCORE,LANG2_DATE, "
		+ "	LICENSE1_NAME,LICENSE1_DATE,LICENSE1_ORG, "
		+ " LICENSE2_NAME,LICENSE2_DATE,LICENSE2_ORG, "
		+ "	ACTIVITY1_CONTENT,ACTIVITY1_START,ACTIVITY1_FINISH,ACTIVITY1_ORG, "
		+ "	ACTIVITY2_CONTENT,ACTIVITY2_START,ACTIVITY2_FINISH,ACTIVITY2_ORG, "
		+ " FAMILY1_REL,FAMILY1_NAME,FAMILY1_BIRTH,FAMILY1_ACADEMIC,FAMILY1_JOB,FAMILY1_COMPANY,FAMILY1_POSITION,FAMILY1_LIVEWITH, "
		+ "	FAMILY2_REL,FAMILY2_NAME,FAMILY2_BIRTH,FAMILY2_ACADEMIC,FAMILY2_JOB,FAMILY2_COMPANY,FAMILY2_POSITION,FAMILY2_LIVEWITH, "
		+ "	FAMILY3_REL,FAMILY3_NAME,FAMILY3_BIRTH,FAMILY3_ACADEMIC,FAMILY3_JOB,FAMILY3_COMPANY,FAMILY3_POSITION,FAMILY3_LIVEWITH, "
		+ "	FAMILY4_REL,FAMILY4_NAME,FAMILY4_BIRTH,FAMILY4_ACADEMIC,FAMILY4_JOB,FAMILY4_COMPANY,FAMILY4_POSITION,FAMILY4_LIVEWITH, "
		+ "	HOBBY,SPECIAL,RELIGION,BOHUN, "
		+ "	SUNGJANG,CHARACT,MOTIVE,FUTURE, "
		+ "	PHOTOC,PHOTOS, REVIEW ) "
		
		+ " VALUES ( "		
		+ " SEQ_APPLY.NEXTVAL, ?, ?, ?, ?, "
		+ " ?, ?, ?, ?, ?, ?, "
		+ " ?, ?, ?, ?, "
		+ " ?, ?, ?, ?, ?, ?,  "
		+ " ?, ?, ?, ?, ?, ?, "
		+ " ?, ?, ?, ?, ?, ?,  "
		+ " ?, ?, ?, ?, ?, ?, ?, "
		+ " ?, ?, ?, "
		+ " ?, ?, ?, "
		+ " ?, ?, ?, "
		+ " ?, ?, ?, "
		+ " ?, ?, ?, ?, "
		+ " ?, ?, ?, ?, " 
		+ " ?, ?, ?, ?, ?, ?, ?, ?, " 
		+ " ?, ?, ?, ?, ?, ?, ?, ?,  "
		+ " ?, ?, ?, ?, ?, ?, ?, ?,  "
		+ " ?, ?, ?, ?, ?, ?, ?, ?, "
		+ " ?, ?, ?, ?, "
		+ " ?, ?, ?, ?, "
		+ " ?, ?, ? ) ";
				
				
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, piVo.getEmail()) ;
			ps.setString(2, piVo.getPwd() );
			ps.setString(3, piVo.getName() );
			ps.setString(4, piVo.getField() );
			
			ps.setString(5, piVo.getJumin1() );
			ps.setString(6, piVo.getJumin2() );
			ps.setString(7, piVo.getAddr() );
			ps.setString(8, piVo.getZipCode()  );
			ps.setString(9, piVo.getTel()  );
			ps.setString(10, piVo.getMobile());
			
			// 학업
			ps.setString(11, piVo.getHighName()  );
			ps.setString(12, piVo.getHighStart()  );
			ps.setString(13, piVo.getHighFinish()  );
			ps.setString(14, piVo.getHighJolUp().trim());
			ps.setString(15, piVo.getColName()  );
			ps.setString(16, piVo.getColStart()  );
			ps.setString(17, piVo.getColFinish()  );
			ps.setString(18, piVo.getColMajor()  );
			ps.setString(19, piVo.getColGrade() );
			ps.setString(20, piVo.getColJolUp().trim() );
			ps.setString(21, piVo.getUnivName() );
			ps.setString(22, piVo.getUnivStart() );
			ps.setString(23, piVo.getUnivFinish() );
			ps.setString(24, piVo.getUnivMajor() );
			ps.setString(25, piVo.getUnivGrade());
			ps.setString(26, piVo.getUnivJolUp().trim() );
			ps.setString(27, piVo.getGradName());
			ps.setString(28, piVo.getGradStart() );
			ps.setString(29, piVo.getGradFinish() );
			ps.setString(30, piVo.getGradMajor() );
			ps.setString(31, piVo.getGradGrade() );
			ps.setString(32, piVo.getGradJolUp().trim() );
			
			// 병역
			ps.setString(33, piVo.getGunByul() );
			ps.setString(34, piVo.getGunByung() );
			ps.setString(35, piVo.getGunGye() );
			ps.setString(36, piVo.getGunStart() );
			ps.setString(37, piVo.getGunFinish() );
			ps.setString(38, piVo.getGunPil() );
			ps.setString(39, piVo.getGunMiPilWhy() );
			ps.setString(40, piVo.getLang1Name() );
			ps.setString(41, piVo.getLang1Score() );
			ps.setString(42, piVo.getLang1Date() );
			ps.setString(43, piVo.getLang2Name() );
			ps.setString(44, piVo.getLang2Score() );
			ps.setString(45, piVo.getLang2Date() );
			ps.setString(46, piVo.getLicense1Name() );
			ps.setString(47, piVo.getLicense1Date() );
			ps.setString(48, piVo.getLicense1Org() );
			ps.setString(49, piVo.getLicense2Name() );
			ps.setString(50, piVo.getLicense2Date() );
			ps.setString(51, piVo.getLicense2Org() );
			ps.setString(52, piVo.getActivity1Content() );
			ps.setString(53, piVo.getActivity1Start() );
			ps.setString(54, piVo.getActivity1Finish() );
			ps.setString(55, piVo.getActivity1Org() );
			ps.setString(56, piVo.getActivity2Content() );
			ps.setString(57, piVo.getActivity2Start() );
			ps.setString(58, piVo.getActivity2Finish() );
			ps.setString(59, piVo.getActivity2Org() );
			ps.setString(60, piVo.getFamily1Rel()       );
			ps.setString(61, piVo.getFamily1Name()      );
			ps.setString(62, piVo.getFamily1Birth()        );
			ps.setString(63, piVo.getFamily1Academic()    );
			ps.setString(64, piVo.getFamily1Job()        );
			ps.setString(65, piVo.getFamily1Company()    );
			ps.setString(66, piVo.getFamily1Position()    );
			ps.setString(67, piVo.getFamily1Livewith()   );
			ps.setString(68, piVo.getFamily2Rel()       );
			ps.setString(69, piVo.getFamily2Name()      );
			ps.setString(70, piVo.getFamily2Birth()     );
			ps.setString(71, piVo.getFamily2Academic()  );
			ps.setString(72, piVo.getFamily2Job()       );
			ps.setString(73, piVo.getFamily2Company()   );
			ps.setString(74, piVo.getFamily2Position()  );
			ps.setString(75, piVo.getFamily2Livewith()  );
			ps.setString(76, piVo.getFamily3Rel()       );
			ps.setString(77, piVo.getFamily3Name()      );
			ps.setString(78, piVo.getFamily3Birth()     );
			ps.setString(79, piVo.getFamily3Academic()  );
			ps.setString(80, piVo.getFamily3Job()       );
			ps.setString(81, piVo.getFamily3Company()   );
			ps.setString(82, piVo.getFamily3Position()  );
			ps.setString(83, piVo.getFamily3Livewith()  );
			ps.setString(84, piVo.getFamily4Rel()       );
			ps.setString(85, piVo.getFamily4Name()      );
			ps.setString(86, piVo.getFamily4Birth()     );
			ps.setString(87, piVo.getFamily4Academic()  );
			ps.setString(88, piVo.getFamily4Job()       );
			ps.setString(89, piVo.getFamily4Company()   );
			ps.setString(90, piVo.getFamily4Position()  );
			ps.setString(91, piVo.getFamily4Livewith()  );
			ps.setString(92, piVo.getHobby()  );
			ps.setString(93, piVo.getSpecial()  );
			ps.setString(94, piVo.getReligion()  );
			ps.setString(95, piVo.getBoHun()  );
			
			// 자기소개 페이지			
			ps.setString(96, ""  );
			ps.setString(97, ""  );
			ps.setString(98, ""  );
			ps.setString(99, "" );
			
			// photoC, photoS
			ps.setString(100, piVo.getPhotoC());
			ps.setString(101, piVo.getPhotoS());
			ps.setInt(102, piVo.getReview());
			
			int cnt = ps.executeUpdate();
			if (cnt <=0) 	b = false;
		}catch(Exception ex) {
			ex.printStackTrace();
			b = false;
		}
		return b;
	}
	
	
	// introduceUpdate.ap
	public boolean introduceUpdate(ApplyVo iuVo) {
		boolean b = true;
		
		String sql = " update APPLY set "
				   + " SUNGJANG = ?, "
				   + " CHARACT = ?, "
				   + " MOTIVE = ?, "
				   + " FUTURE = ? "
				   + " where EMAIL = ?";
				
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, iuVo.getSungJang());
			ps.setString(2, iuVo.getCharact());
			ps.setString(3, iuVo.getMotive());
			ps.setString(4, iuVo.getFuture());
			ps.setString(5, iuVo.getEmail());
			
			int cnt = ps.executeUpdate();
			if (cnt <=0) 		b=false;
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return b;
		}
	}
	
	// 이력서 삭제
	   public boolean delete(ApplyVo vo) { // 삭제
           boolean b = true;
           String sql = "delete from apply where email = ?";
           
           try {
              PreparedStatement ps = conn.prepareStatement(sql);
              ps.setString(1, vo.getEmail());
              int cnt = ps.executeUpdate();
              
              if(cnt <= 0) {
                 b = false;
              }
           }catch(Exception ex) {
              ex.printStackTrace();
              b = false;
           }finally {
              return b;
           }
        }
	
	
	// 입사지원 미리보기(apply_preview.jsp에서 사용)
	public ApplyVo selectOne(String email) {
		ApplyVo prvVo = null;
		String sql = " select * from apply where email = ? ";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,  email);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				prvVo = new ApplyVo();
				
				prvVo.setaNo(rs.getInt("ANO"));
				prvVo.setEmail(rs.getString("EMAIL"));
				prvVo.setPwd(rs.getString("PWD"));
				prvVo.setName(rs.getString("NAME"));
				prvVo.setField(rs.getString("FIELD"));
				prvVo.setJumin1(rs.getString("JUMIN1"));
				prvVo.setJumin2(rs.getString("JUMIN2"));
				prvVo.setAddr(rs.getString("ADDR"));
				prvVo.setZipCode(rs.getString("ZIPCODE"));

				
				// tel 자르기
				String rsTel;
				String[] arrTel;
				String tel1, tel2, tel3;
				
				rsTel = rs.getString("TEL");
				arrTel = rsTel.split("-");
				
				tel1 = arrTel[0];
				tel2 = arrTel[1];
				tel3 = arrTel[2];
				
				prvVo.setTel1(tel1);
				prvVo.setTel2(tel2);
				prvVo.setTel3(tel3);
				
				
				// mobile 자르기
				String rsMobile;
				String[] arrMobile;
				String mobile1, mobile2, mobile3;
				
				rsMobile = rs.getString("MOBILE");
				arrMobile = rsMobile.split("-");
				
				mobile1 = arrMobile[0];
				mobile2 = arrMobile[1];
				mobile3 = arrMobile[2];
				
				prvVo.setMobile1(mobile1);
				prvVo.setMobile2(mobile2);
				prvVo.setMobile3(mobile3);
				
				
				prvVo.setHighName(rs.getString("HIGH_NAME"));
				prvVo.setHighStart(rs.getString("HIGH_START").substring(0, 10));
				prvVo.setHighFinish(rs.getString("HIGH_FINISH").substring(0, 10));
				prvVo.setHighJolUp(rs.getString("HIGH_JOLUP"));
				
				prvVo.setColName(rs.getString("COL_NAME"));
				prvVo.setColStart(rs.getString("COL_START").substring(0, 10));
				prvVo.setColFinish(rs.getString("COL_FINISH").substring(0, 10));
				prvVo.setColMajor(rs.getString("COL_MAJOR"));
				prvVo.setColGrade(rs.getString("COL_GRADE"));
				prvVo.setColJolUp(rs.getString("COL_JOLUP"));
				
				prvVo.setUnivName(rs.getString("UNIV_NAME"));
				prvVo.setUnivStart(rs.getString("UNIV_START").substring(0, 10));
				prvVo.setUnivFinish(rs.getString("UNIV_FINISH").substring(0, 10));
				prvVo.setUnivMajor(rs.getString("UNIV_MAJOR"));
				prvVo.setUnivGrade(rs.getString("UNIV_GRADE"));
				prvVo.setUnivJolUp(rs.getString("UNIV_JOLUP"));
				
				prvVo.setGradName(rs.getString("GRAD_NAME"));
				prvVo.setGradStart(rs.getString("GRAD_START").substring(0, 10));
				prvVo.setGradFinish(rs.getString("GRAD_FINISH").substring(0, 10));
				prvVo.setGradMajor(rs.getString("GRAD_MAJOR"));
				prvVo.setGradGrade(rs.getString("GRAD_GRADE"));
				prvVo.setGradJolUp(rs.getString("GRAD_JOLUP"));
				
				prvVo.setGunByul(rs.getString("GUN_BYUL"));
				prvVo.setGunByung(rs.getString("GUN_BYUNG"));
				prvVo.setGunGye(rs.getString("GUN_GYE"));
				prvVo.setGunStart(rs.getString("GUN_START").substring(0, 10));
				prvVo.setGunFinish(rs.getString("GUN_FINISH").substring(0, 10));
				prvVo.setGunPil(rs.getString("GUN_PIL"));
				prvVo.setGunMiPilWhy(rs.getString("GUN_MIPILWHY"));
				
				prvVo.setLang1Name(rs.getString("LANG1_NAME"));
				prvVo.setLang1Score(rs.getString("LANG1_SCORE"));
				prvVo.setLang1Date(rs.getString("LANG1_DATE").substring(0, 10));
				prvVo.setLang2Name(rs.getString("LANG2_NAME"));
				prvVo.setLang2Score(rs.getString("LANG2_SCORE"));
				prvVo.setLang2Date(rs.getString("LANG2_DATE").substring(0, 10));
				
				prvVo.setLicense1Name(rs.getString("LICENSE1_NAME"));
				prvVo.setLicense1Date(rs.getString("LICENSE1_DATE").substring(0, 10));
				prvVo.setLicense1Org(rs.getString("LICENSE1_ORG"));
				prvVo.setLicense2Name(rs.getString("LICENSE2_NAME"));
				prvVo.setLicense2Date(rs.getString("LICENSE2_DATE").substring(0, 10));
				prvVo.setLicense2Org(rs.getString("LICENSE2_ORG"));
				
				prvVo.setActivity1Content(rs.getString("ACTIVITY1_CONTENT"));
				prvVo.setActivity1Start(rs.getString("ACTIVITY1_START").substring(0, 10));
				prvVo.setActivity1Finish(rs.getString("ACTIVITY1_FINISH").substring(0, 10));
				prvVo.setActivity1Org(rs.getString("ACTIVITY1_ORG"));
				prvVo.setActivity2Content(rs.getString("ACTIVITY2_CONTENT"));
				prvVo.setActivity2Start(rs.getString("ACTIVITY2_START").substring(0, 10));
				prvVo.setActivity2Finish(rs.getString("ACTIVITY2_FINISH").substring(0, 10));
				prvVo.setActivity2Org(rs.getString("ACTIVITY2_ORG"));
				
				prvVo.setFamily1Rel(rs.getString		("FAMILY1_REL"));
				prvVo.setFamily1Name(rs.getString		("FAMILY1_NAME"));
				prvVo.setFamily1Birth(rs.getString		("FAMILY1_BIRTH").substring(0, 10));
				prvVo.setFamily1Academic(rs.getString	("FAMILY1_ACADEMIC"));
				prvVo.setFamily1Job(rs.getString		("FAMILY1_JOB"));
				prvVo.setFamily1Company(rs.getString	("FAMILY1_COMPANY"));
				prvVo.setFamily1Position(rs.getString	("FAMILY1_POSITION"));
				prvVo.setFamily1Livewith(rs.getString	("FAMILY1_LIVEWITH"));
				
				prvVo.setFamily2Rel(rs.getString		("FAMILY2_REL"));        
				prvVo.setFamily2Name(rs.getString		("FAMILY2_NAME"));       
				prvVo.setFamily2Birth(rs.getString		("FAMILY2_BIRTH").substring(0, 10));      
				prvVo.setFamily2Academic(rs.getString	("FAMILY2_ACADEMIC"));   
				prvVo.setFamily2Job(rs.getString		("FAMILY2_JOB"));        
				prvVo.setFamily2Company(rs.getString	("FAMILY2_COMPANY"));    
				prvVo.setFamily2Position(rs.getString	("FAMILY2_POSITION"));   
				prvVo.setFamily2Livewith(rs.getString	("FAMILY2_LIVEWITH"));   
				
				prvVo.setFamily3Rel(rs.getString		("FAMILY3_REL"));        
				prvVo.setFamily3Name(rs.getString		("FAMILY3_NAME"));       
				prvVo.setFamily3Birth(rs.getString		("FAMILY3_BIRTH").substring(0, 10));      
				prvVo.setFamily3Academic(rs.getString	("FAMILY3_ACADEMIC"));   
				prvVo.setFamily3Job(rs.getString		("FAMILY3_JOB"));        
				prvVo.setFamily3Company(rs.getString	("FAMILY3_COMPANY"));    
				prvVo.setFamily3Position(rs.getString	("FAMILY3_POSITION"));   
				prvVo.setFamily3Livewith(rs.getString	("FAMILY3_LIVEWITH"));   
				
				prvVo.setFamily4Rel(rs.getString		("FAMILY4_REL"));        
				prvVo.setFamily4Name(rs.getString		("FAMILY4_NAME"));       
				prvVo.setFamily4Birth(rs.getString		("FAMILY4_BIRTH").substring(0, 10));      
				prvVo.setFamily4Academic(rs.getString	("FAMILY4_ACADEMIC"));   
				prvVo.setFamily4Job(rs.getString		("FAMILY4_JOB"));        
				prvVo.setFamily4Company(rs.getString	("FAMILY4_COMPANY"));    
				prvVo.setFamily4Position(rs.getString	("FAMILY4_POSITION"));   
				prvVo.setFamily4Livewith(rs.getString	("FAMILY4_LIVEWITH"));   
				
				prvVo.setHobby(rs.getString("HOBBY"));
				prvVo.setSpecial(rs.getString("SPECIAL"));
				prvVo.setReligion(rs.getString("RELIGION"));
				prvVo.setBoHun(rs.getString("BOHUN"));
				
				prvVo.setSungJang(rs.getString("SUNGJANG"));
				prvVo.setCharact(rs.getString("CHARACT"));
				prvVo.setMotive(rs.getString("MOTIVE"));
				prvVo.setFuture(rs.getString("FUTURE"));
				
				prvVo.setPhotoC(rs.getString("PHOTOC"));
				prvVo.setPhotoS(rs.getString("PHOTOS"));
			}
			
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
			prvVo = null;
			
		}finally {
			return prvVo;
			
		}
	}
	
	
	// 프리뷰 페이지에서 이력서 내용 수정하기
		public boolean modify(ApplyVo modVo) {
			boolean b = true;
			String sql =
			  " update APPLY set "
					
			+ " PWD=?, NAME=?, FIELD=?,"
			+ " JUMIN1=?, JUMIN2=?, ADDR=?, ZIPCODE=?, TEL=?, MOBILE=? "
			
/*			+ " HIGH_NAME=?, HIGH_START=?, HIGH_FINISH=?, HIGH_JOLUP=?, "
			+ " COL_NAME, COL_START, COL_FINISH=?, COL_MAJOR=?, COL_GRADE=?, COL_JOLUP=?,  "
			+ " UNIV_NAME=?, UNIV_START=?, UNIV_FINISH=?, UNIV_MAJOR=?, UNIV_GRADE=?, UNIV_JOLUP=?,  "
			+ " GRAD_NAME=?, GRAD_START=?, GRAD_FINISH=?, GRAD_MAJOR=?, GRAD_GRADE=?, GRAD_JOLUP=?   "
		
			+ "	GUN_BYUL=?, GUN_BYUNG=?, GUN_GYE=?, GUN_START=?, GUN_FINISH=?, GUN_PIL=?, GUN_MIPILWHY=?,  "
			+ " LANG1_NAME=?, LANG1_SCORE=?, LANG1_DATE=?,  "
			+ "	LANG2_NAME=?, LANG2_SCORE=?, LANG2_DATE=?,  "
		
			+ "	LICENSE1_NAME=?, LICENSE1_DATE=?, LICENSE1_ORG=?,  "
			+ " LICENSE2_NAME=?, LICENSE2_DATE=?, LICENSE2_ORG=?,  "
		
			+ "	ACTIVITY1_CONTENT=?, ACTIVITY1_START=?, ACTIVITY1_FINISH=?, ACTIVITY1_ORG=?,  "
			+ "	ACTIVITY2_CONTENT=?, ACTIVITY2_START=?, ACTIVITY2_FINISH=?, ACTIVITY2_ORG=?,  "
			
			+ " FAMILY1_REL=?, FAMILY1_NAME=?, FAMILY1_BIRTH=?, FAMILY1_ACADEMIC=?, FAMILY1_JOB=?, FAMILY1_COMPANY=?, FAMILY1_POSITION=?, FAMILY1_LIVEWITH=?,  "
			+ "	FAMILY2_REL=?, FAMILY2_NAME=?, FAMILY2_BIRTH=?, FAMILY2_ACADEMIC=?, FAMILY2_JOB=?, FAMILY2_COMPANY=?, FAMILY2_POSITION=?, FAMILY2_LIVEWITH=?,  "
			+ "	FAMILY3_REL=?, FAMILY3_NAME=?, FAMILY3_BIRTH=?, FAMILY3_ACADEMIC=?, FAMILY3_JOB=?, FAMILY3_COMPANY=?, FAMILY3_POSITION=?, FAMILY3_LIVEWITH=?,  "
			+ "	FAMILY4_REL=?, FAMILY4_NAME=?, FAMILY4_BIRTH=?, FAMILY4_ACADEMIC=?, FAMILY4_JOB=?, FAMILY4_COMPANY=?, FAMILY4_POSITION=?, FAMILY4_LIVEWITH=?,  "
			
			+ "	HOBBY=?, SPECIAL=?, RELIGION=?, BOHUN=?,  "
			+ "	SUNGJANG=?, CHARACT=?, MOTIVE=?, FUTURE=?,  "
			
			+ "	PHOTOC=?, PHOTOS=? "*/
			
			+ " where email=? ";

					
			try {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, modVo.getPwd());
				ps.setString(2, modVo.getName());
				ps.setString(3, modVo.getField());
				
				ps.setString(4, modVo.getJumin1());
				ps.setString(5, modVo.getJumin2());
				ps.setString(6, modVo.getAddr());
				ps.setString(7, modVo.getZipCode());
				ps.setString(8, modVo.getTel());
				ps.setString(9, modVo.getMobile());
				
			/*  ps.setString(10, modVo.getHighName()  );
				ps.setString(11, modVo.getHighStart()  );
				ps.setString(12, modVo.getHighFinish()  );
				ps.setString(13, modVo.getHighJolUp().trim());
				
				ps.setString(14, modVo.getColName()  );
				ps.setString(15, modVo.getColStart()  );
				ps.setString(16, modVo.getColFinish()  );
				ps.setString(17, modVo.getColMajor()  );
				ps.setString(18, modVo.getColGrade() );
				ps.setString(19, modVo.getColJolUp().trim() );
				
				ps.setString(20, modVo.getUnivName() );
				ps.setString(21, modVo.getUnivStart() );
				ps.setString(22, modVo.getUnivFinish() );
				ps.setString(23, modVo.getUnivMajor() );
				ps.setString(24, modVo.getUnivGrade());
				ps.setString(25, modVo.getUnivJolUp().trim() );
				
				ps.setString(26, modVo.getGradName());
				ps.setString(27, modVo.getGradStart() );
				ps.setString(28, modVo.getGradFinish() );
				ps.setString(29, modVo.getGradMajor() );
				ps.setString(30, modVo.getGradGrade() );
				ps.setString(31, modVo.getGradJolUp().trim() );
				
				
				ps.setString(32, modVo.getGunByul() );
				ps.setString(33, modVo.getGunByung() );
				ps.setString(34, modVo.getGunGye() );
				ps.setString(35, modVo.getGunStart() );
				ps.setString(36, modVo.getGunFinish() );
				ps.setString(37, modVo.getGunPil() );
				ps.setString(38, modVo.getGunMiPilWhy() );
				
				ps.setString(39, modVo.getLang1Name() );
				ps.setString(40, modVo.getLang1Score() );
				ps.setString(41, modVo.getLang1Date() );
				ps.setString(42, modVo.getLang2Name() );
				ps.setString(43, modVo.getLang2Score() );
				ps.setString(44, modVo.getLang2Date() );
				
				ps.setString(45, modVo.getLicense1Name() );
				ps.setString(46, modVo.getLicense1Date() );
				ps.setString(47, modVo.getLicense1Org() );
				ps.setString(48, modVo.getLicense2Name() );
				ps.setString(49, modVo.getLicense2Date() );
				ps.setString(50, modVo.getLicense2Org() );
				
				ps.setString(51, modVo.getActivity1Content() );
				ps.setString(52, modVo.getActivity1Start() );
				ps.setString(53, modVo.getActivity1Finish() );
				ps.setString(54, modVo.getActivity1Org() );
				
				ps.setString(55, modVo.getActivity2Content() );
				ps.setString(56, modVo.getActivity2Start() );
				ps.setString(57, modVo.getActivity2Finish() );
				ps.setString(58, modVo.getActivity2Org() );
				
				ps.setString(59, modVo.getFamily1Rel()       );
				ps.setString(60, modVo.getFamily1Name()      );
				ps.setString(61, modVo.getFamily1Birth()        );
				ps.setString(62, modVo.getFamily1Academic()    );
				ps.setString(63, modVo.getFamily1Job()        );
				ps.setString(64, modVo.getFamily1Company()    );
				ps.setString(65, modVo.getFamily1Position()    );
				ps.setString(66, modVo.getFamily1Livewith()   );
				
				ps.setString(67, modVo.getFamily2Rel()       );
				ps.setString(68, modVo.getFamily2Name()      );
				ps.setString(69, modVo.getFamily2Birth()     );
				ps.setString(70, modVo.getFamily2Academic()  );
				ps.setString(71, modVo.getFamily2Job()       );
				ps.setString(72, modVo.getFamily2Company()   );
				ps.setString(73, modVo.getFamily2Position()  );
				ps.setString(74, modVo.getFamily2Livewith()  );
				
				ps.setString(75, modVo.getFamily3Rel()       );
				ps.setString(76, modVo.getFamily3Name()      );
				ps.setString(77, modVo.getFamily3Birth()     );
				ps.setString(78, modVo.getFamily3Academic()  );
				ps.setString(79, modVo.getFamily3Job()       );
				ps.setString(80, modVo.getFamily3Company()   );
				ps.setString(81, modVo.getFamily3Position()  );
				ps.setString(82, modVo.getFamily3Livewith()  );
				
				ps.setString(83, modVo.getFamily4Rel()       );
				ps.setString(84, modVo.getFamily4Name()      );
				ps.setString(85, modVo.getFamily4Birth()     );
				ps.setString(86, modVo.getFamily4Academic()  );
				ps.setString(87, modVo.getFamily4Job()       );
				ps.setString(88, modVo.getFamily4Company()   );
				ps.setString(89, modVo.getFamily4Position()  );
				ps.setString(90, modVo.getFamily4Livewith()  );
				
				ps.setString(91, modVo.getHobby()  );
				ps.setString(92, modVo.getSpecial()  );
				ps.setString(93, modVo.getReligion()  );
				ps.setString(94, modVo.getBoHun()  );
				ps.setString(95, modVo.getSungJang());
				ps.setString(96, modVo.getCharact()  );
				ps.setString(97, modVo.getMotive());
				ps.setString(98, modVo.getFuture() );
				
				ps.setString(99, modVo.getPhotoC());
				ps.setString(100, modVo.getPhotoS());*/
				
				
				
				ps.setString(10, modVo.getEmail());
				
				int cnt = ps.executeUpdate();
				if (cnt <=0) 	b = false;
			}catch(Exception ex) {
				ex.printStackTrace();
				b = false;
			}
			return b;
		}
		
	
	
	// apply_submit.ap(이력서 최종제출)
	public boolean submit(String email) {
		boolean b = true;
		
		String sql = " update APPLY set "
				   + " APPLY_DATE = TO_CHAR(sysdate,'yyyy-mm-dd') "
				   + " where EMAIL = ? ";
				
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			
			int cnt = ps.executeUpdate();
			if (cnt <=0) 		b=false;
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return b;
		}
	}
	
	
	
	/*
	 * Getters and Setters
	 */
	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public PreparedStatement getPs() {
		return ps;
	}

	public void setPs(PreparedStatement ps) {
		this.ps = ps;
	}

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
	
	
	
	
	
	
	
	
	
	
	
	
	
} // End of ApplyDao
