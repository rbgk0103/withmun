package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import bean.ListDao;
import bean.ListVo;

public class BoardServlet extends HttpServlet{
   
   String method;

   @Override
   protected void service(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
      
      req.setCharacterEncoding("utf-8");
      resp.setContentType("text/html;charset=utf-8");
      
      String jobs = req.getRequestURI();
      
      
      if(jobs.indexOf("list.bo") >= 0) {
    	 String findStr = "";
         ListDao dao = new ListDao();
         int nowPage = 1;
         
         if(req.getParameter("nowPage") != null) {
            nowPage = Integer.parseInt(req.getParameter("nowPage"));
         }
         
         if (req.getParameter("findStr") != null) {
               findStr = req.getParameter("findStr");
         }
        dao.setNowPage(nowPage);
        List<ListVo> list = dao.select(findStr);
        req.setAttribute("list", list);
        req.setAttribute("dao", dao);

        RequestDispatcher disp = req.getRequestDispatcher("index.jsp?content=./page/board/list.jsp");
        disp.forward(req,resp);
            
      }
      else if(jobs.indexOf("insert.bo")>=0){ 
         ListDao dao = new ListDao();
         ListVo vo = setVo(req);
         int nowPage = 1;
         
         String msg="";
         if(dao.insert(vo)) {
            msg = "등록하였습니다.";
         }else {
            msg = "등록에 실패하셧습니다..";
         }
         
         req.setAttribute("nowPage", nowPage);
         req.setAttribute("msg", msg);
         RequestDispatcher disp = req.getRequestDispatcher("./page/gongPage.jsp");
         disp.forward(req,resp);
         
      }

      
      else if(jobs.indexOf("delete.bo")>=0) {
         String msg = "";
         int nowPage = 0;
         ListDao dao = new ListDao();
         ListVo vo = setVo2(req);
         if(req.getParameter("nowPage") != null) {
            nowPage = Integer.parseInt(req.getParameter("nowPage"));
         }
         
         HttpSession se = req.getSession();
         String session_id = (String) se.getAttribute("id");
         
         //일반유저 세션없을때
         if(session_id==null) {
        	 if(dao.delete(vo)) {
            	dao.deleteReply(vo);
                msg = "삭제 되었습니다.";
             }else {
                msg = "삭제에 실패하였습니다.";
             }
         }
         //관리자 세션이 존재할때
         else {
        	
        	 if(dao.updateReplyStatus(vo)) {
        		 System.out.println("업데이트성공");
        	 }else {
        		 System.out.println("업데이트 실패");
        	 }
        	 if(dao.deleteAdm(vo)) {
        		dao.deleteAdmReply(vo);
                msg = "삭제 되었습니다.";
              }else {
                 msg = "삭제에 실패하였습니다.";
              }
         }
         
         req.setAttribute("nowPage", nowPage);
         req.setAttribute("msg", msg);
         RequestDispatcher disp = req.getRequestDispatcher("./page/gongPage.jsp?nowPage="+nowPage);
         disp.forward(req,resp);
      }
      
      else if(jobs.indexOf("reply.bo") >= 0) {
    	 int nowPage = 0;
    	 String msg = "";
         ListDao dao = new ListDao();
         ListVo vo = setVo3(req);
         dao.rep(vo);
         if(dao.repUpdate(vo)) {
        	 msg = "답변 등록이 완료 되었습니다.";
         }
         else {
        	 msg = "답변 등록을 실패하셨습니다.";
         }
         req.setAttribute("nowPage", nowPage);
         req.setAttribute("msg", msg);
         RequestDispatcher disp = req.getRequestDispatcher("./page/gongPage.jsp?nowPage="+nowPage);
         disp.forward(req,resp);
      }
   }

   public ListVo setVo(HttpServletRequest req) {
      
      ListVo vo = new ListVo();
      
      vo.setName(req.getParameter("qna_name"));
      vo.setPwd(req.getParameter("qna_pwd"));
      vo.setDoc(req.getParameter("document"));

      return vo;   
   }
   
   public ListVo setVo2(HttpServletRequest req) {
      
      ListVo vo = new ListVo();

      
      vo.setSerial(Integer.parseInt(req.getParameter("hidden_serial")));
      vo.setPwd(req.getParameter("hidden_prompt"));

      return vo;   
   }
   public ListVo setVo3(HttpServletRequest req) {
      
      ListVo vo = new ListVo();
      vo.setSerial(Integer.parseInt(req.getParameter("hidden_serial")));
      vo.setDoc(req.getParameter("hidden_reply_ta"));
      return vo;   
   }
   
}