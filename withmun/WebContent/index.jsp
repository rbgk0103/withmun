<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "./include/new_head.jsp" %>
<%
String content = "./page/main.jsp";


if(request.getParameter("content") !=null){
	content = request.getParameter("content");  
}
%>
  
<jsp:include page="<%=content %>"/>
<%@ include file = "./include/new_tail.jsp" %>