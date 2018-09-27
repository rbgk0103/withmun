<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper" >
	<div class="container">
		<div class ="top">
			<a href="./index.jsp" >HOME</a>
			> <a href="./service_procedure.do" >Other</a>
			> <a href="./service_procedure.do" class="on">서비스절차(외국어번역행정)</a>
		</div>
		<div class="toptit">
		    <h2><a href="./service_procedure.do">서비스절차(외국어번역행정)</a></h2>
			<p>신뢰와 나눔속에 사랑받는 기업으로 기억되고자 합니다.</p>
		</div>
	</div>
</div>
<!------------------------------------------------------------------->

<script>
$(document).ready(function(){
	$(".jtoggle_up").click(function(){
		$(".toggle_menu").slideDown();
		$(".jtoggle_down").css("display","block");
		$(".jtoggle_up").css("display","none");
		$(".line2").css("display","block");
		
	});
	$(".jtoggle_down").click(function(){
		$(".toggle_menu").slideUp();
		$(".jtoggle_down").css("display","none");
		$(".jtoggle_up").css("display","block");
		$(".line2").css("display","none");
	
	});
});
</script>
<!------------------------------------------------------------------->

<div class ="main">
	<div class="main_wrap">
	<%@ include file = "../../include/left_other.jsp" %>
		<div class = "content" style="margin-top:0;text-align:center">			
			<div class ="content_second" style="margin-top:0;text-align:center">							
				
				<!-- 본문 시작 -->
			    <div id='wrap_enter'>				
					<form name='frm_enter'>
							
						<a href='./apply_privacy.ap'><input type='button' name='btnNew' value='이력서 작성' /></a>&nbsp;
						<a href='./apply_manage.ap'><input type='button' name='btnManage' value='이력서 관리' /></a>&nbsp;
						
					</form>
				</div>
				<!-- 본문 끝 -->
								
			</div>	
		</div>
	</div>
</div>