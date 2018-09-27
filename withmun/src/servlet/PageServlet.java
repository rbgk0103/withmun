package servlet;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.MyAuthenticator;

public class PageServlet extends HttpServlet{

   String content ="";
   String index = "index.jsp?content=";
   
   @Override
   protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String jobs = req.getRequestURI();
      req.setCharacterEncoding("utf-8");
      resp.setContentType("text/html;charset=utf-8");

      if (jobs.indexOf("incorporate.do") >= 0) {
         content="./page/incorporate.jsp";
      }
      else if (jobs.indexOf("land_compensation.do") >= 0) {
         content="./page/land_compensation.jsp";
      }
      else if (jobs.indexOf("licensing.do") >= 0) {
         content="./page/licensing.jsp";
      }
      else if (jobs.indexOf("immigration.do") >= 0) {
         content="./page/immigration.jsp";
      }
      else if (jobs.indexOf("suspension.do") >= 0) {
         content="./page/suspension.jsp";
      }
      else if (jobs.indexOf("english_contract.do") >= 0) {
         content="./page/english_contract.jsp";
      }
      else if (jobs.indexOf("professional_translation.do") >= 0) {
         content="./page/professional_translation.jsp";
      }
      else if (jobs.indexOf("acting_translation.do") >= 0) {
         content="./page/acting_translation.jsp";
      }
      else if (jobs.indexOf("aposcertification.do") >= 0) {
         content="./page/aposcertification.jsp";
      }
      else if (jobs.indexOf("overseas.do") >= 0) {
         content="./page/overseas.jsp";
      }
      else if (jobs.indexOf("certificate.do") >= 0) {
         content="./page/certificate.jsp";
      }
      else if (jobs.indexOf("general_translation.do") >= 0) {
         content="./page/general_translation.jsp";
      }
      else if (jobs.indexOf("acting_translation_personal.do") >= 0) {
         content="./page/acting_translation_personal.jsp";
      }
      else if (jobs.indexOf("aposcertification_genenal.do") >= 0) {
         content="./page/aposcertification_genenal.jsp";
      }
      else if (jobs.indexOf("studying_abroad.do") >= 0) {
         content="./page/studying_abroad.jsp";
      }
      else if (jobs.indexOf("about.do") >= 0) {
         content="./page/about.jsp";
      }
      else if (jobs.indexOf("philosophy.do") >= 0) {
         content="./page/philosophy.jsp";
      }
      else if (jobs.indexOf("location.do") >= 0) {
         content="./page/location.jsp";
      }
      else if (jobs.indexOf("about.do") >= 0) {
         content="./page/about.jsp";
      }
      else if (jobs.indexOf("greetings.do") >= 0) {
         content="./page/greetings.jsp";
      }
      else if (jobs.indexOf("employment_notice.do") >= 0) {
         content="./page/employment_notice.jsp";
      }
      else if (jobs.indexOf("service_procedure.do") >= 0) {
         content="./page/service_procedure.jsp";
      }
      else if (jobs.indexOf("site_map.do") >= 0) {
         content="./page/site_map.jsp";
      }
      else if (jobs.indexOf("list.do") >= 0) {
         content ="./page/board/list.jsp";
      }
      else if (jobs.indexOf("mail_result.do") >= 0) {
         mail_result(req,resp);
         content ="./page/location.jsp";

      }else if(jobs.indexOf("faq.do")>=0) {
    	  content = "./page/board/faq.jsp";
      }
      
      RequestDispatcher disp = req.getRequestDispatcher(index + content);
      disp.forward(req, resp);
      
   }

   private void mail_result(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      // TODO Auto-generated method stub
      req.setCharacterEncoding("utf-8");
      String encoding = "utf-8";

      // 메일과 관련된 변수
      String conEmail = "";
      String conSelect = "";
      String conSubject = "";
      String conDoc = "";
      String conAdmin = "";
      String conName ="";
      try{
         conAdmin = "ksnam0817@naver.com"; //관리자
         conEmail = req.getParameter("conEmail");//보내는이메일
         conSelect = req.getParameter("conSelect"); // 받는사람
         conSubject = req.getParameter("conSubject"); // 제목
         conDoc = req.getParameter("conDoc"); // 내용
         conName = req.getParameter("conName"); // 보내는 사람
         
         // -----------------------------------------
         // 메일 전송 알고리즘
         // -----------------------------------------
         String mailServer = "smtp.naver.com";
         
         Properties prop = new Properties();
         prop.put("mail.smtp.starttls.enable", "true");
         prop.put("mail.transport.protocol", "smtp");
         prop.put("mail.smtp.port", "465");
         prop.put("mail.smtp.auth", "true");
         prop.put("mail.smtp.user", conSelect);
         prop.put("mail.smtp.host", mailServer);
         prop.put("mail.smtp.ssl.enable","true"); //ssl 보안연결 활성화
         
         String last_content ="";
         
          last_content = "<h3>보낸이메일 : " + conEmail + "</h3>"
                  + "<h3>보낸 사람  : " + conName + "</h3><br/>"
                  + "<h3>내용</h3> : <br/>" + conDoc;

         // 기본 메시지 설정
         Session mailSession = Session.getInstance(prop, new MyAuthenticator());
         Message message = new MimeMessage(mailSession);
         message.setFrom(new InternetAddress(conAdmin));
         message.setRecipient(Message.RecipientType.TO, new InternetAddress(conSelect));
         message.setSubject(conSubject);
         message.setSentDate(new Date());
         
         // 문자열과 이미지를 동시에 전송
         Multipart part = new MimeMultipart();
         MimeBodyPart text = new MimeBodyPart();
         text.setContent(last_content, "text/html;charset=utf-8");
         part.addBodyPart(text);
         
         message.setContent(part);
         Transport.send(message);
         
      }catch(Exception ex){
         ex.printStackTrace();
      }finally{

      }
   }
}