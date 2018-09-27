package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.FindDao;
import bean.FindVo;
import bean.ListDao;
import bean.ListVo;

public class FindServlet extends HttpServlet {
	String content ="";
	String grp="";
	String findStr="";
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String jobs = req.getRequestURI();
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");

		if (jobs.indexOf("find.fd") >= 0) {
			find(req,resp);
			content="./page/find/find.jsp";
		}
	
		RequestDispatcher disp = req.getRequestDispatcher("index.jsp?content="+content);
		disp.forward(req, resp);
		
		
	}
	private void find(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String grp="";
		String findStr="";
		
		
		if(req.getParameter("findStr") != null) {
			findStr = req.getParameter("findStr");
		}

		if(req.getParameter("grp") != null) {
			grp = req.getParameter("grp");
		}
		
		System.out.println(findStr);
		FindDao dao = new FindDao();
		List<FindVo> list = dao.select(findStr, grp);
		
		req.setAttribute("findStr", findStr);
		req.setAttribute("count", dao.getCount());
		req.setAttribute("list", list);
		req.setAttribute("dao", dao);
		
		
		
	}
}
