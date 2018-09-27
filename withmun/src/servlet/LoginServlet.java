package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DBConnection;
import bean.loginDao;
import bean.loginVo;

public class LoginServlet extends HttpServlet{
	Connection conn;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String jobs = req.getRequestURI();
		resp.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8");

		if(jobs.indexOf("loginR.login") >= 0) {
			String msg = "";
			String count = "a";
			loginDao dao = new loginDao();
			loginVo v = setVo(req);
			
			if(dao.log(v.getId(), v.getPwd()) == true) { // 로그인 성공
				String id = req.getParameter("mid");
				
				req.setAttribute("id", id);
				req.setAttribute("count", count);
				String pwd = req.getParameter("pwd");
				req.setAttribute("pwd", pwd);
				HttpSession se = req.getSession();
				se.setAttribute("id", id);
				RequestDispatcher disp = req.getRequestDispatcher("index.jsp");
				disp.forward(req, resp);
				
			}else if (dao.log(v.getId(), v.getPwd()) == false){ // 로그인 실패
				String nav = req.getParameter("nav");
				msg = "아이디가 틀렸습니다.";
				req.setAttribute("msg", msg);
				RequestDispatcher disp = req.getRequestDispatcher("login.jsp");
				disp.forward(req, resp);
			}
			
		}
		
		else if(jobs.indexOf("logoutR.login") >= 0) {
			HttpSession se = req.getSession();
			String count = "b";
			se.removeAttribute("id");
			req.setAttribute("count", count);
			String nav = req.getParameter("nav");
			RequestDispatcher disp = req.getRequestDispatcher("index.jsp");
			disp.forward(req, resp);
		}
		
			
	}
	public loginVo setVo(HttpServletRequest req) {
		loginVo v = new loginVo();
		v.setId(req.getParameter("mid"));
		v.setPwd(req.getParameter("pwd"));
		
		return v;
	}
	
	
}