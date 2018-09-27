package servlet;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.ApplyDao;
import bean.ApplyVo;

public class ApplyServlet extends HttpServlet {

	/*
	 * 필드
	 */
	
	// 작업처리결과를 넣어줄 msg 변수
	String msg = "";
	
	// 파일 업로드 처리
	MultipartRequest multi = null;
//	String uploadDir = "D:/withmun_upload"; 	// 경로 수정 전
	String uploadDir = "C:/Users/JHTA/git/withmun/withmun/WebContent/upload/"; 	// 경로 수정 후
	String encType="UTF-8";
	int fileSize = 1024*1024*10;				// 용량제한 10MB
	
	
	// jsp에 파라미터로 include 페이지 전달
	String content ="";
	
	
	// Get, Post요청을 모두 여기서 처리
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String jobs = req.getRequestURI();
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		
		
		// 입사지원 첫페이지
		if (jobs.indexOf("apply_enter.ap") >= 0) {
			content="./page/apply/apply_enter.jsp";
		}
		
		// 개인정보 동의
		else if (jobs.indexOf("apply_privacy.ap") >= 0) {
			content="./page/apply/apply_privacy.jsp";
		}
		
		// 입사지원 새로하기
		else if (jobs.indexOf("apply_write.ap") >= 0) {
			content="./page/apply/apply_write.jsp";
		}
		
		else if (jobs.indexOf("apply_profile.ap") >= 0) {
			content="./page/apply/apply_profile.jsp";
			
			// apply_write.jsp에서 받아서
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String pwd = req.getParameter("pwd");
			
			// apply_profile.jsp로 넘긴다
			HttpSession session = req.getSession();
			
			// email은 session 영억으로 보낸다
			session.setAttribute("email", email);
			
			// name, pwd는 requestScope로 보낸다 
			req.setAttribute("name", name);
			req.setAttribute("pwd", pwd);
			
		}
		
		// 입사지원 - 자기소개
		else if (jobs.indexOf("apply_introduce.ap") >= 0) {
			content="./page/apply/apply_introduce.jsp";
		
			ApplyVo piVo = null;	// profileInsertVo
			ApplyDao piDao = null;	// profileInsertDao
			
			try {
				// <form encType='multipart/form-data'> 으로부터 넘오는 값 받기 위해
				multi = new MultipartRequest(req, uploadDir, fileSize, encType, new DefaultFileRenamePolicy());
				
				piVo = piSetVo(multi);
				piDao = new ApplyDao();
				
			}catch(Exception ex) {
				ex.printStackTrace();
			}
			
			if (piDao.profileInsert(piVo)) {
				msg = "정상적으로 applyProfile 페이지 내용이 저장되었습니다";
			}else {
				msg = "applyProfile페이지 저장 중 에러 발생!";
			}
			
			req.setAttribute("msg", msg);
			req.setAttribute("piVo", piVo);
			
			
		}
		
		// 입사지원 - 미리보기
		else if (jobs.indexOf("apply_preview.ap") >= 0)	{
			content = "./page/apply/apply_preview.jsp";

			// 자기소개서 Update
			ApplyVo iuVo = iuSetVo(req);
			ApplyDao iuDao = new ApplyDao();
						
			if (iuDao.introduceUpdate(iuVo)) {
				msg = "정상적으로 자기소개페이지 update 완료";
			}else {
				msg = "자기소개페이지 update 중 에러 발생";
			}
						
			req.setAttribute("msg", msg);
			req.setAttribute("iuVo", iuVo);

			// '입사지원서 미리보기(apply_preview.jsp)'에 뿌릴 데이터 가져오기
			String email = (String)req.getSession().getAttribute("email");
			ApplyDao prvDao = new ApplyDao();
						
			// 해당 email에 해당하는 상세정보를 받아와서 prvVo에 담음
			ApplyVo prvVo = prvDao.selectOne(email);
			req.setAttribute("prvVo", prvVo);
						
			// 사진정보(photoS) 뿌리기
			String photoS = "/withmun/upload/" + prvVo.getPhotoS();
			req.setAttribute("photoS", photoS);
		}
		
		// '이력서 미리보기'페이지에서 [수정] 할 때
		else if (jobs.indexOf("apply_modify.ap") >= 0) {
			content="./page/apply/apply_preview.jsp";
			
			// 어떤 email에 해당하는 이력서를 수정할지 받아야 하잖아
			String email = (String)req.getSession().getAttribute("email");
			
			// 자기소개서 프리뷰 페이지에서 [수정]
			ApplyVo modVo = null;
			ApplyDao modDao = null;
			
			try {
				// <form encType='multipart/form-data'> 으로부터 넘오는 값 받기 위해
				multi = new MultipartRequest(req, uploadDir, fileSize, encType, new DefaultFileRenamePolicy());
				
				
		/*		System.out.println("---multi.getRequest테스트");
				System.out.println("지원정보: ");
				System.out.println(multi.getParameter("field"));
				System.out.println(multi.getParameter("name"));
				System.out.println(multi.getParameter("email"));
				
				System.out.println(multi.getParameter("jumin1"));
				System.out.println(multi.getParameter("jumin2"));
				System.out.println(multi.getParameter("pwd"));
				System.out.println(multi.getParameter("pwdCheck"));
				
				System.out.println("연락처: ");
				System.out.println(multi.getParameter("addr"));
				System.out.println(multi.getParameter("zipCode"));
				System.out.println(multi.getParameter("tel1"));
				System.out.println(multi.getParameter("tel2"));
				System.out.println(multi.getParameter("tel3"));
				System.out.println(multi.getParameter("mobile1"));
				System.out.println(multi.getParameter("mobile2"));
				System.out.println(multi.getParameter("mobile3"));
				
				System.out.println("학력사항1: ");
				System.out.println(multi.getParameter("highStart"));
				System.out.println(multi.getParameter("highFinish"));
				System.out.println(multi.getParameter("highName"));
				System.out.println(multi.getParameter("radioHighJolUp"));
				
				System.out.println("학력사항2: ");
				System.out.println(multi.getParameter("colStart"));
				System.out.println(multi.getParameter("colFinish"));
				System.out.println(multi.getParameter("colName"));
				System.out.println(multi.getParameter("colMajor"));				
				System.out.println(multi.getParameter("colGrade"));				
				System.out.println(multi.getParameter("radioColJolUp"));				
				
				System.out.println("학력사항3: ");
				System.out.println(multi.getParameter("univStart"));
				System.out.println(multi.getParameter("univFinish"));
				System.out.println(multi.getParameter("univName"));
				System.out.println(multi.getParameter("univMajor"));				
				System.out.println(multi.getParameter("univGrade"));				
				System.out.println(multi.getParameter("radioUnivJolUp"));				
				
				System.out.println("학력사항4: ");
				System.out.println(multi.getParameter("gradStart"));
				System.out.println(multi.getParameter("gradFinish"));
				System.out.println(multi.getParameter("gradName"));
				System.out.println(multi.getParameter("gradMajor"));				
				System.out.println(multi.getParameter("gradGrade"));				
				System.out.println(multi.getParameter("radioGradJolUp"));	*/			
				
				modVo = modSetVo(multi,email);
				modDao = new ApplyDao();
				
				
			}catch(Exception ex) {
				ex.printStackTrace();
			}
			
			
			System.out.println("---modVo 테스트---");
			System.out.println("modVo.getPwd()        " +    modVo.getPwd()                      );
			System.out.println("modVo.getName()       " +    modVo.getName()                     );
			System.out.println(                                                               );
			System.out.println("modVo.getField()      " +    modVo.getField()                    );
			System.out.println("modVo.getJumin1()     " +    modVo.getJumin1()                   );
			System.out.println("modVo.getJumin2()     " +    modVo.getJumin2()                   );
			System.out.println("modVo.getAddr()       " +    modVo.getAddr()                     );
			System.out.println("modVo.getZipCode()    " +    modVo.getZipCode()                  );
			System.out.println(                                                               );
			System.out.println("modVo.getTel()        " +    modVo.getTel()                      );
			System.out.println("modVo.getMobile()     " +    modVo.getMobile()                   );
			System.out.println(                                                               );
			System.out.println("modVo.getHighName()   " +    modVo.getHighName()                 );
			System.out.println("modVo.getHighStart()  " +    modVo.getHighStart()                );
			System.out.println("modVo.getHighFinish() " +    modVo.getHighFinish()               );
			System.out.println("modVo.getHighJolUp()  " +    modVo.getHighJolUp()                );
			System.out.println(                                                               );
			System.out.println("modVo.getColName()    " +    modVo.getColName()                  );
			System.out.println("modVo.getColStart()   " +    modVo.getColStart()                 );
			System.out.println("modVo.getColFinish()  " +    modVo.getColFinish()                );
			System.out.println("modVo.getColMajor()   " +    modVo.getColMajor()                 );
			System.out.println("modVo.getColGrade()   " +    modVo.getColGrade()                 );
			System.out.println("modVo.getColJolUp()   " +    modVo.getColJolUp()                 );
			System.out.println(                                                               );
			System.out.println("modVo.getUnivName()   " +    modVo.getUnivName()                 );
			System.out.println("modVo.getUnivStart()  " +    modVo.getUnivStart()                );
			System.out.println("modVo.getUnivFinish() " +    modVo.getUnivFinish()               );
			System.out.println("modVo.getUnivMajor()  " +    modVo.getUnivMajor()                );
			System.out.println("modVo.getUnivGrade()  " +    modVo.getUnivGrade()                );
			System.out.println("modVo.getUnivJolUp()  " +    modVo.getUnivJolUp()                );
			System.out.println(                                                               );
			System.out.println("modVo.getGradName()   " +    modVo.getGradName()                 );
			System.out.println("modVo.getGradStart()  " +    modVo.getGradStart()                );
			System.out.println("modVo.getGradFinish() " +    modVo.getGradFinish()               );
			System.out.println("modVo.getGradMajor()  " +    modVo.getGradMajor()                );
			System.out.println("modVo.getGradGrade()  " +    modVo.getGradGrade()                );
			System.out.println("modVo.getGradJolUp()  " +    modVo.getGradJolUp()                );
			System.out.println(                                                               );
			System.out.println("modVo.getGunByul()    " +    modVo.getGunByul()                 );
			System.out.println("modVo.getGunByung()   " +    modVo.getGunByung()                );
			System.out.println("modVo.getGunGye()     " +    modVo.getGunGye()                   );
			System.out.println("modVo.getGunStart()   " +    modVo.getGunStart()                 );
			System.out.println("modVo.getGunFinish()  " +    modVo.getGunFinish()                );
			System.out.println("modVo.getGunPil()     " +    modVo.getGunPil()                  );
			System.out.println("modVo.getGunMiPilWhy()" +    modVo.getGunMiPilWhy()              );
			System.out.println(                                                                );
			System.out.println(	"modVo.getLang1Name()   " +    modVo.getLang1Name()                );
			System.out.println(	"modVo.getLang1Score()  " +    modVo.getLang1Score()               );
			System.out.println(	"modVo.getLang1Date()   " +    modVo.getLang1Date()                );
			System.out.println(	"modVo.getLang2Name()   " +    modVo.getLang2Name()                );
			System.out.println(	"modVo.getLang2Score()  " +    modVo.getLang2Score()               );
			System.out.println(	"modVo.getLang2Date()   " +    modVo.getLang2Date()                );
			System.out.println(                                                             );
			System.out.println(	"modVo.getLicense1Name()" +  modVo.getLicense1Name()             );
			System.out.println(	"modVo.getLicense1Date()" +  modVo.getLicense1Date()             );
			System.out.println(	"modVo.getLicense1Org() " +  modVo.getLicense1Org()              );
			System.out.println(	"modVo.getLicense2Name()" +  modVo.getLicense2Name()             );
			System.out.println(	"modVo.getLicense2Date()" +  modVo.getLicense2Date()             );
			System.out.println(	"modVo.getLicense2Org() " +  modVo.getLicense2Org()              );
			System.out.println(                                                                );
			System.out.println("modVo.getActivity1Content()"+	modVo.getActivity1Content()         );
			System.out.println("modVo.getActivity1Start()"  +	modVo.getActivity1Start()          );
			System.out.println("modVo.getActivity1Finish()" +	modVo.getActivity1Finish()          );
			System.out.println("modVo.getActivity1Org()"    +	modVo.getActivity1Org()           );
			System.out.println("modVo.getActivity2Content()"+	modVo.getActivity2Content()         );
			System.out.println("modVo.getActivity2Start()"  +	modVo.getActivity2Start()          );
			System.out.println("modVo.getActivity2Finish()" +	modVo.getActivity2Finish()          );
			System.out.println("modVo.getActivity2Org()"    +	modVo.getActivity2Org()             );
			System.out.println(                                                                );
			System.out.println("modVo.getFamily1Rel()      	"+	modVo.getFamily1Rel()               );
			System.out.println("modVo.getFamily1Name()     	"+	modVo.getFamily1Name()              );
			System.out.println("modVo.getFamily1Birth()    	"+	modVo.getFamily1Birth()             );
			System.out.println("modVo.getFamily1Academic() 	"+	modVo.getFamily1Academic()          );
			System.out.println("modVo.getFamily1Job()      	"+	modVo.getFamily1Job()               );
			System.out.println("modVo.getFamily1Company() 	"+	modVo.getFamily1Company()           );
			System.out.println("modVo.getFamily1Position() 	"+	modVo.getFamily1Position()          );
			System.out.println("modVo.getFamily1Livewith()	"+	modVo.getFamily1Livewith()          );
			System.out.println(                                                                );
			System.out.println(                                         );
			System.out.println("modVo.getFamily2Rel()  "    	+	modVo.getFamily2Rel()               );
			System.out.println("modVo.getFamily2Name()  "   	+	modVo.getFamily2Name()              );
			System.out.println("modVo.getFamily2Birth()  "  	+	modVo.getFamily2Birth()             );
			System.out.println("modVo.getFamily2Academic()" 	+	modVo.getFamily2Academic()          );
			System.out.println("modVo.getFamily2Job()  "   	+	modVo.getFamily2Job()               );
			System.out.println("modVo.getFamily2Company() "	+	modVo.getFamily2Company()           );
			System.out.println("modVo.getFamily2Position() "	+	modVo.getFamily2Position()          );
			System.out.println("modVo.getFamily2Livewith()	"+	modVo.getFamily2Livewith()          );
			System.out.println(                                                                );
			System.out.println(                                                                );
			System.out.println("modVo.getFamily3Rel()    	" +	modVo.getFamily3Rel()              );
			System.out.println("modVo.getFamily3Name()    	" +	modVo.getFamily3Name()             );
			System.out.println("modVo.getFamily3Birth()   	" +	modVo.getFamily3Birth()             );
			System.out.println("modVo.getFamily3Academic() 	"+	 modVo.getFamily3Academic()          );
			System.out.println("modVo.getFamily3Job()     	"+	 modVo.getFamily3Job()               );
			System.out.println("modVo.getFamily3Company()  	"+	 modVo.getFamily3Company()           );
			System.out.println("modVo.getFamily3Position()	"+	 modVo.getFamily3Position()          );
			System.out.println("modVo.getFamily3Livewith() 	"+	 modVo.getFamily3Livewith()          );
			System.out.println(                                          );
			System.out.println("modVo.getFamily4Rel()      	"+	modVo.getFamily4Rel()               );
			System.out.println("modVo.getFamily4Name()     	"+	modVo.getFamily4Name()             );
			System.out.println("modVo.getFamily4Birth()    	"+	modVo.getFamily4Birth()             );
			System.out.println("modVo.getFamily4Academic() 	"+	modVo.getFamily4Academic()          );
			System.out.println("modVo.getFamily4Job()      	"+	modVo.getFamily4Job()               );
			System.out.println("modVo.getFamily4Company()  	"+	modVo.getFamily4Company()           );
			System.out.println("modVo.getFamily4Position() 	"+	modVo.getFamily4Position()          );
			System.out.println("modVo.getFamily4Livewith() 	"+	modVo.getFamily4Livewith()          );
			System.out.println(                                                                );
			System.out.println("modVo.getHobby()"          +	modVo.getHobby()                   );
			System.out.println("modVo.getSpecial()"        +	modVo.getSpecial()                 );
			System.out.println("modVo.getReligion()"       +	modVo.getReligion()                 );
			System.out.println("modVo.getBoHun()"          +	modVo.getBoHun()                   );
			System.out.println(                                   );
			System.out.println("modVo.getEmail()"          +	modVo.getEmail()                    );
			System.out.println("modVo.getPhotoC()"         +	modVo.getPhotoC()                   );
			System.out.println("modVo.getPhotoS()"         +	modVo.getPhotoS()                  );

			
			if (modDao.modify(modVo)) {
				msg = "입사지원서 수정 완료!";
			}else {
				msg = "입사지원서 수정 중 오류 발생";
			}
			
			System.out.println(msg);
			req.setAttribute("msg", msg);
		}		
		
		
		// '이력서 미리보기'페이지에서 '최종지원' 할 때
		else if (jobs.indexOf("apply_submit.ap") >= 0) {
			content="./page/apply/apply_enter.jsp";
			
			// 어떤 email에 해당하는 이력서를 가져올지 받아야 하잖아
			String email = (String)req.getSession().getAttribute("email");
			
			// 자기소개서 최종제출 처리
			ApplyDao submitDao = new ApplyDao();
			
			if (submitDao.submit(email)) {
				msg = "입사지원서 정상적으로최종제출 완료!";
			}else {
				msg = "입사지원서 최종제출 중 오류 발생";
			}
			
			req.setAttribute("msg", msg);
			
		}
		else if (jobs.indexOf("apply_manage.ap") >= 0) {
			content="./page/apply/apply_manage.jsp";
		}
		else if (jobs.indexOf("apply_pool.ap") >= 0) {
	         
	         String findStr = "";
	         ApplyDao dao = new ApplyDao();
	         int nowPage = 1;
	         
	         if(req.getParameter("nowPage") != null) {
	            nowPage = Integer.parseInt(req.getParameter("nowPage"));
	         }
	         
	         if (req.getParameter("findStr") != null) {
	               findStr = req.getParameter("findStr");
	         }
	            dao.pageCompute(findStr);
	            req.setAttribute("findStr", findStr);
	            
	            req.setAttribute("all", dao);
	            
	            dao.setNowPage(nowPage);
	            req.setAttribute("nowPage", nowPage);
	            
	            List<ApplyVo> list = dao.selectList(findStr);
	            req.setAttribute("list", list);
	         
	         content="./page/apply/apply_pool.jsp";
	      }
		else if (jobs.indexOf("apply_review.ap") >= 0) {
			
			System.out.println("aNo_review: " + req.getParameter("aNo_review").trim());
			
			int aNo = Integer.parseInt(req.getParameter("aNo_review"));
	         ApplyDao dao = new ApplyDao();
	          ApplyVo vo = dao.viewApply(aNo);
	         req.setAttribute("prvVo", vo);         
	         content="./page/apply/apply_review.jsp";
		}

		
		// 삭제
		else if (jobs.indexOf("delete.ap") >= 0) {
	         ApplyDao dao = new ApplyDao();
	         ApplyVo vo = delSetVo(req);
	         content="./page/pool.jsp";
	         dao.delete(vo);
	               
	      }
		
		
		RequestDispatcher disp = req.getRequestDispatcher("index.jsp?content="+content);
		disp.forward(req, resp);
		
	} // End of Service()
	
	
	
	/*
	 * 사용자 정의 메소드
	 */
	
	
	// <form enctype='multipart/form-data'> 를 위한 setVo 오버로딩
	//request.getParameter() 기능을 multi가 대신 처리
	public ApplyVo piSetVo(MultipartRequest multi) {
		ApplyVo piVo = new ApplyVo();
		
		
		// 기본사항
		piVo.setaNo(0);
		piVo.setEmail(multi.getParameter("email"));
		piVo.setPwd(multi.getParameter("pwd"));
		piVo.setName(multi.getParameter("name"));
		
		piVo.setField(multi.getParameter("field"));
		piVo.setJumin1((multi.getParameter("jumin1")));
		piVo.setJumin2((multi.getParameter("jumin2")));
		piVo.setAddr(multi.getParameter("addr"));
		piVo.setZipCode(multi.getParameter("zipCode"));
		
		piVo.setTel(multi.getParameter("tel1") + "-" + multi.getParameter("tel2") + "-" + multi.getParameter("tel3"));
		piVo.setMobile(multi.getParameter("mobile1") + "-" + multi.getParameter("mobile2") + "-" + multi.getParameter("mobile3"));
		
		// 학업사항
		piVo.setHighName(multi.getParameter("highName"));
		piVo.setHighStart(multi.getParameter("highStart"));
		piVo.setHighFinish(multi.getParameter("highFinish"));
		piVo.setHighJolUp((multi.getParameter("radioHighJolUp")));
		
		piVo.setColName(multi.getParameter("colName"));
		piVo.setColStart(multi.getParameter("colStart"));
		piVo.setColFinish(multi.getParameter("colFinish"));
		piVo.setColMajor(multi.getParameter("colMajor"));
		piVo.setColGrade((multi.getParameter("colGrade")));
		piVo.setColJolUp((multi.getParameter("radioColJolUp")));
		
		piVo.setUnivName(multi.getParameter("univName"));
		piVo.setUnivStart(multi.getParameter("univStart"));
		piVo.setUnivFinish(multi.getParameter("univFinish"));
		piVo.setUnivMajor(multi.getParameter("univMajor"));
		piVo.setUnivGrade((multi.getParameter("univGrade")));
		piVo.setUnivJolUp((multi.getParameter("radioUnivJolUp")));
		
		piVo.setGradName(multi.getParameter("gradName"));
		piVo.setGradStart(multi.getParameter("gradStart"));
		piVo.setGradFinish(multi.getParameter("gradFinish"));
		piVo.setGradMajor(multi.getParameter("gradMajor"));
		piVo.setGradGrade((multi.getParameter("gradGrade")));
		piVo.setGradJolUp((multi.getParameter("radioGradJolUp")));
		
		// 병역사항
		piVo.setGunByul(multi.getParameter("gunByul"));
		piVo.setGunByung(multi.getParameter("gunByung"));
		piVo.setGunGye(multi.getParameter("gunGye"));
		piVo.setGunStart(multi.getParameter("gunStart"));
		piVo.setGunFinish(multi.getParameter("gunFinish"));
		piVo.setGunPil((multi.getParameter("radioGunPil")));
		piVo.setGunMiPilWhy(multi.getParameter("gunMiPilWhy"));
		
		
		// 외국어
		piVo.setLang1Name(multi.getParameter("lang1Name"));
		piVo.setLang1Score((multi.getParameter("lang1Score")));
		piVo.setLang1Date(multi.getParameter("lang1Date"));
		piVo.setLang2Name(multi.getParameter("lang2Name"));
		piVo.setLang2Score((multi.getParameter("lang2Score")));
		piVo.setLang2Date(multi.getParameter("lang2Date"));
		
		// 자격면허
		piVo.setLicense1Name(multi.getParameter("license1Name"));
		piVo.setLicense1Date(multi.getParameter("license1Date"));
		piVo.setLicense1Org(multi.getParameter("license1Org"));
		piVo.setLicense2Name(multi.getParameter("license2Name"));
		piVo.setLicense2Date(multi.getParameter("license2Date"));
		piVo.setLicense2Org(multi.getParameter("license2Org"));
		
		// 동아리 및 봉사활동
		piVo.setActivity1Content(multi.getParameter("activity1Content"));
		piVo.setActivity1Start(multi.getParameter("activity1Start"));
		piVo.setActivity1Finish(multi.getParameter("activity1Finish"));
		piVo.setActivity1Org(multi.getParameter("activity1Org"));
		piVo.setActivity2Content(multi.getParameter("activity2Content"));
		piVo.setActivity2Start(multi.getParameter("activity2Start"));
		piVo.setActivity2Finish(multi.getParameter("activity2Finish"));
		piVo.setActivity2Org(multi.getParameter("activity2Org"));		
		
		// 가족관계
		piVo.setFamily1Rel(multi.getParameter("family1Rel"));
		piVo.setFamily1Name(multi.getParameter("family1Name"));
		piVo.setFamily1Birth(multi.getParameter("family1Birth"));
		piVo.setFamily1Academic(multi.getParameter("family1Academic"));
		piVo.setFamily1Job(multi.getParameter("family1Job"));
		piVo.setFamily1Company(multi.getParameter("family1Company"));
		piVo.setFamily1Position(multi.getParameter("family1Position"));
		piVo.setFamily1Livewith(multi.getParameter("radioFamily1Livewith").trim());

		
		piVo.setFamily2Rel(multi.getParameter("family2Rel"));
		piVo.setFamily2Name(multi.getParameter("family2Name"));
		piVo.setFamily2Birth(multi.getParameter("family2Birth"));
		piVo.setFamily2Academic(multi.getParameter("family2Academic"));
		piVo.setFamily2Job(multi.getParameter("family2Job"));
		piVo.setFamily2Company(multi.getParameter("family2Company"));
		piVo.setFamily2Position(multi.getParameter("family2Position"));
		piVo.setFamily2Livewith(multi.getParameter("radioFamily2Livewith").trim());
		
		
		piVo.setFamily3Rel(multi.getParameter("family3Rel"));
		piVo.setFamily3Name(multi.getParameter("family3Name"));
		piVo.setFamily3Birth(multi.getParameter("family3Birth"));
		piVo.setFamily3Academic(multi.getParameter("family3Academic"));
		piVo.setFamily3Job(multi.getParameter("family3Job"));
		piVo.setFamily3Company(multi.getParameter("family3Company"));
		piVo.setFamily3Position(multi.getParameter("family3Position"));
		piVo.setFamily3Livewith(multi.getParameter("radioFamily3Livewith").trim());
		
		piVo.setFamily4Rel(multi.getParameter("family4Rel"));
		piVo.setFamily4Name(multi.getParameter("family4Name"));
		piVo.setFamily4Birth(multi.getParameter("family4Birth"));
		piVo.setFamily4Academic(multi.getParameter("family4Academic"));
		piVo.setFamily4Job(multi.getParameter("family4Job"));
		piVo.setFamily4Company(multi.getParameter("family4Company"));
		piVo.setFamily4Position(multi.getParameter("family4Position"));
		piVo.setFamily4Livewith(multi.getParameter("radioFamily4Livewith").trim());
		
		// 취미 등 기타사항
		piVo.setHobby(multi.getParameter("hobby"));
		piVo.setSpecial(multi.getParameter("special"));
		piVo.setReligion(multi.getParameter("religion"));
		piVo.setBoHun(multi.getParameter("radioBoHun").trim());
		
		// 사진
		// file태그명과 원본파일명, 변경된 파일명의 정보
		Enumeration tags = multi.getFileNames();
		while(tags.hasMoreElements()) {
			String tag = (String)tags.nextElement();
			
			System.out.println("tag: " + tag);
			System.out.println("original: " + multi.getOriginalFileName(tag));
			System.out.println("getFileSystem: " + multi.getFilesystemName(tag));
			
			piVo.setPhotoC(multi.getOriginalFileName(tag));
			piVo.setPhotoS(multi.getFilesystemName(tag));
		}
		return piVo;
		
	} // End of piSetVo()
	
	
	// '프리뷰' 페이지에서 수정하기
	// request.getParameter() 기능을 multi가 대신 처리
	public ApplyVo modSetVo(MultipartRequest multi, String email) {
		ApplyVo modVo = new ApplyVo();
		
		// 기본사항
		modVo.setPwd(multi.getParameter("pwd"));
		modVo.setName(multi.getParameter("name"));
		
		modVo.setField(multi.getParameter("field"));
		modVo.setJumin1((multi.getParameter("jumin1")));
		modVo.setJumin2((multi.getParameter("jumin2")));
		modVo.setAddr(multi.getParameter("addr"));
		modVo.setZipCode(multi.getParameter("zipCode"));
		
		modVo.setTel(multi.getParameter("tel1") + "-" + multi.getParameter("tel2") + "-" + multi.getParameter("tel3"));
		modVo.setMobile(multi.getParameter("mobile1") + "-" + multi.getParameter("mobile2") + "-" + multi.getParameter("mobile3"));
		
		// 학업사항
		modVo.setHighName(multi.getParameter("highName"));
		modVo.setHighStart(multi.getParameter("highStart"));
		modVo.setHighFinish(multi.getParameter("highFinish"));
		modVo.setHighJolUp((multi.getParameter("radioHighJolUp")));
		
		modVo.setColName(multi.getParameter("colName"));
		modVo.setColStart(multi.getParameter("colStart"));
		modVo.setColFinish(multi.getParameter("colFinish"));
		modVo.setColMajor(multi.getParameter("colMajor"));
		modVo.setColGrade((multi.getParameter("colGrade")));
		modVo.setColJolUp((multi.getParameter("radioColJolUp")));
		
		modVo.setUnivName(multi.getParameter("univName"));
		modVo.setUnivStart(multi.getParameter("univStart"));
		modVo.setUnivFinish(multi.getParameter("univFinish"));
		modVo.setUnivMajor(multi.getParameter("univMajor"));
		modVo.setUnivGrade((multi.getParameter("univGrade")));
		modVo.setUnivJolUp((multi.getParameter("radioUnivJolUp")));
		
		modVo.setGradName(multi.getParameter("gradName"));
		modVo.setGradStart(multi.getParameter("gradStart"));
		modVo.setGradFinish(multi.getParameter("gradFinish"));
		modVo.setGradMajor(multi.getParameter("gradMajor"));
		modVo.setGradGrade((multi.getParameter("gradGrade")));
		modVo.setGradJolUp((multi.getParameter("radioGradJolUp")));
		
		// 병역사항
		modVo.setGunByul(multi.getParameter("gunByul"));
		modVo.setGunByung(multi.getParameter("gunByung"));
		modVo.setGunGye(multi.getParameter("gunGye"));
		modVo.setGunStart(multi.getParameter("gunStart"));
		modVo.setGunFinish(multi.getParameter("gunFinish"));
		modVo.setGunPil((multi.getParameter("radioGunPil")));
		modVo.setGunMiPilWhy(multi.getParameter("gunMiPilWhy"));
		
		
		// 외국어
		modVo.setLang1Name(multi.getParameter("lang1Name"));
		modVo.setLang1Score((multi.getParameter("lang1Score")));
		modVo.setLang1Date(multi.getParameter("lang1Date"));
		modVo.setLang2Name(multi.getParameter("lang2Name"));
		modVo.setLang2Score((multi.getParameter("lang2Score")));
		modVo.setLang2Date(multi.getParameter("lang2Date"));
		
		// 자격면허
		modVo.setLicense1Name(multi.getParameter("license1Name"));
		modVo.setLicense1Date(multi.getParameter("license1Date"));
		modVo.setLicense1Org(multi.getParameter("license1Org"));
		modVo.setLicense2Name(multi.getParameter("license2Name"));
		modVo.setLicense2Date(multi.getParameter("license2Date"));
		modVo.setLicense2Org(multi.getParameter("license2Org"));
		
		// 동아리 및 봉사활동
		modVo.setActivity1Content(multi.getParameter("activity1Content"));
		modVo.setActivity1Start(multi.getParameter("activity1Start"));
		modVo.setActivity1Finish(multi.getParameter("activity1Finish"));
		modVo.setActivity1Org(multi.getParameter("activity1Org"));
		modVo.setActivity2Content(multi.getParameter("activity2Content"));
		modVo.setActivity2Start(multi.getParameter("activity2Start"));
		modVo.setActivity2Finish(multi.getParameter("activity2Finish"));
		modVo.setActivity2Org(multi.getParameter("activity2Org"));		
		
		// 가족관계
		modVo.setFamily1Rel(multi.getParameter("family1Rel"));
		modVo.setFamily1Name(multi.getParameter("family1Name"));
		modVo.setFamily1Birth(multi.getParameter("family1Birth"));
		modVo.setFamily1Academic(multi.getParameter("family1Academic"));
		modVo.setFamily1Job(multi.getParameter("family1Job"));
		modVo.setFamily1Company(multi.getParameter("family1Company"));
		modVo.setFamily1Position(multi.getParameter("family1Position"));
		modVo.setFamily1Livewith(multi.getParameter("radioFamily1Livewith").trim());

		
		modVo.setFamily2Rel(multi.getParameter("family2Rel"));
		modVo.setFamily2Name(multi.getParameter("family2Name"));
		modVo.setFamily2Birth(multi.getParameter("family2Birth"));
		modVo.setFamily2Academic(multi.getParameter("family2Academic"));
		modVo.setFamily2Job(multi.getParameter("family2Job"));
		modVo.setFamily2Company(multi.getParameter("family2Company"));
		modVo.setFamily2Position(multi.getParameter("family2Position"));
		modVo.setFamily2Livewith(multi.getParameter("radioFamily2Livewith").trim());
		
		
		modVo.setFamily3Rel(multi.getParameter("family3Rel"));
		modVo.setFamily3Name(multi.getParameter("family3Name"));
		modVo.setFamily3Birth(multi.getParameter("family3Birth"));
		modVo.setFamily3Academic(multi.getParameter("family3Academic"));
		modVo.setFamily3Job(multi.getParameter("family3Job"));
		modVo.setFamily3Company(multi.getParameter("family3Company"));
		modVo.setFamily3Position(multi.getParameter("family3Position"));
		modVo.setFamily3Livewith(multi.getParameter("radioFamily3Livewith").trim());
		
		modVo.setFamily4Rel(multi.getParameter("family4Rel"));
		modVo.setFamily4Name(multi.getParameter("family4Name"));
		modVo.setFamily4Birth(multi.getParameter("family4Birth"));
		modVo.setFamily4Academic(multi.getParameter("family4Academic"));
		modVo.setFamily4Job(multi.getParameter("family4Job"));
		modVo.setFamily4Company(multi.getParameter("family4Company"));
		modVo.setFamily4Position(multi.getParameter("family4Position"));
		modVo.setFamily4Livewith(multi.getParameter("radioFamily4Livewith").trim());
		
		// 취미 등 기타사항
		modVo.setHobby(multi.getParameter("hobby"));
		modVo.setSpecial(multi.getParameter("special"));
		modVo.setReligion(multi.getParameter("religion"));
		modVo.setBoHun(multi.getParameter("radioBoHun").trim());
		
		// where절에 넣을 e-mail (from session)
		modVo.setEmail(email);
		
		// 사진
		// file태그명과 원본파일명, 변경된 파일명의 정보
		Enumeration tags = multi.getFileNames();
		while(tags.hasMoreElements()) {
			String tag = (String)tags.nextElement();
			
			System.out.println("tag: " + tag);
			System.out.println("original: " + multi.getOriginalFileName(tag));
			System.out.println("getFileSystem: " + multi.getFilesystemName(tag));
			
			modVo.setPhotoC(multi.getOriginalFileName(tag));
			modVo.setPhotoS(multi.getFilesystemName(tag));
		}
		return modVo;
		
	} // End of modSetVo()
	
	
	// introduceUpdate.ap
	public ApplyVo iuSetVo(HttpServletRequest req) {
		
		ApplyVo iuVo = new ApplyVo();
		
		iuVo.setSungJang(req.getParameter("sungJang"));
		iuVo.setCharact(req.getParameter("charact"));
		iuVo.setMotive(req.getParameter("motive"));
		iuVo.setFuture(req.getParameter("future"));
		iuVo.setEmail((String)req.getSession().getAttribute("email"));
		
		return iuVo;
	}
	  public ApplyVo delSetVo(HttpServletRequest req) {
	      
	      ApplyVo delVo = new ApplyVo();

	      delVo.setEmail(req.getParameter("email_del"));

	      //iuVo.setEmail((String)req.getSession().getAttribute("email"));
	      
	      return delVo;
	   }
	
} // End of ApplyServlet()
