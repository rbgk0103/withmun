<%@page import="bean.MyAuthenticator"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.MimeBodyPart"%>
<%@page import="javax.mail.internet.MimeMultipart"%>
<%@page import="javax.mail.Multipart"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>메일 전송 결과</h2>
<h3>${msg }</h3>
<%
request.setCharacterEncoding("utf-8");
String encoding = "utf-8";

// 메일과 관련된 변수
String conEmail = "";
String conSelect = "";
String conSubject = "";
String conDoc = "";
String conAdmin = "";
String conName ="";
try{
	
	conAdmin = "rlaehdrlehdrl@naver.com"; //관리자
	conEmail = request.getParameter("conEmail");//보내는이메일
	conSelect = request.getParameter("conSelect"); // 받는사람
	conSubject = request.getParameter("conSubject"); // 제목
	conDoc = request.getParameter("conDoc"); // 내용
	conName = request.getParameter("conName"); // 보내는 사람
	
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
	
	// 첨부파일을 메일에 추가

	message.setContent(part);
	Transport.send(message);
	
}catch(Exception ex){
	out.print(ex.toString());
	ex.printStackTrace();
}finally{
	// 임시파일을 삭제
}
%>