<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class = "left">
	<div style="margin-left:10px;margin-top:20px;margin-bottom:20px;">
		<div style="font-size:23px;color:#1f497d;">
			Other
		</div>				
		
		<div class="toggle_menu" style="margin-bottom:30px;margin-top:20px;width:95%;font-size:14px;color:#404040;font-weight:400;margin-left:10px;">
			<div>
				<a style="color:#404040;" href="./service_procedure.do">
				서비스절차(외국어번역행정)
				</a>
				<div class="line2"></div>
			</div>
			
			<!-- 채용공고  -->
			<div  style="margin-top:20px;">
				<a style="color:#404040;" href="./employment_notice.do">
				채용공고
				</a>
				<div class="line2"></div>
			</div>
			
			<%-- <!-- 입사지원 -->
			<div  style="margin-top:20px;">
				<c:choose>
					<c:when test="${empty id}">
						<a style="color: #404040;" href="./apply_enter.ap">입사지원</a>
					</c:when>
					<c:otherwise>
						<a style="color: #404040;" href="./apply_pool.ap">입사관리</a>
					</c:otherwise>
				</c:choose>
				<div class="line2"></div>
			</div>
			
			 --%>
			 <!-- Q & A -->
			
			<div  style="margin-top:20px;">
				<a style="color:#404040;" href="./list.bo">
				Q & A
				</a>
				<div class="line2"></div>
			</div>
			
			<!-- F A Q -->
			
			<div  style="margin-top:20px;">
				<a style="color:#404040;" href="./faq.do">
				F A Q
				</a>
				<div class="line2"></div>
			</div>
			
			<!-- 사이트맵 -->
			<div  style="margin-top:20px;">
				<a style="color:#404040;" href="./site_map.do">
				사이트맵
				</a>
				<div class="line2"></div>
			</div>	
		
		</div>
	</div>
</div>
