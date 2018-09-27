<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
/*
.main{min-width:1100px; background-color:#d8d8d8;width:100%;margin-top:-15px;}
.left{margin-top:20px;float:left;width:22%;background-color:#FFFFFF;margin-right:20px;}
.content{margin-top:20px;float:left;width:76%;margin-bottom:20px;}
.content_first{height:285px;margin-right:18px;background-color:#FFFFFF;width:100%;}
.content_second{padding-bottom:20px;padding-top:20px;margin-top:20px;background-color:#FFFFFF;width:100%;}

.line2{width:80%;height:1px;background-color:#7f7f7f;margin-top:5px;width:93%;}
*/
</style>
<div id="wrapper">
	<div class="container">
		<div class ="top">
			<a href="./index.jsp" >HOME</a>
			> <a href="./about.do" >About WithMUN</a>
			> <a href="./greetings.do" class="on">인사말</a>
		</div>

		<div class="toptit">
		    <h2><a href="./greetings.do">인사말</a></h2>
			<p>위드문 인터내셔널 홈페이지에 방문하신 모든 고객님들께 감사의 마음을 전해드립니다.</p>
		</div>	
	</div>
</div>
<!------------------------------------------------------------------->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$(".jtoggle_up").click(function(){
		$(".toggle_menu").slideDown();
		$(".jtoggle_down").css("display","block");
		$(".jtoggle_up").css("display","none");

		
	});
	$(".jtoggle_down").click(function(){
		$(".toggle_menu").slideUp();
		$(".jtoggle_down").css("display","none");
		$(".jtoggle_up").css("display","block");

	
	});
});
</script>
<!------------------------------------------------------------------->

<div class ="main">
	<div class="main_wrap">
	<%@ include file = "../include/left_about.jsp" %>
		<div class = "content">
			
			<div class ="content_first">
				<img src="./images/greetings_topimg.jpg" alt="" style="width:100%;height:100%;">
			</div>

			<div class ="content_second">
				<div class ="second">	
				
					
					
					<p style="font-size:14px;"><a style="font-size:18px;color:#1f497d;">위드문 인터내셔널 행정사사무소</a> 홈페이지를 방문해주신 고객분들께 감사의 말씀을 드립니다.</p><br>
					
				
				
					<p>당사무소는 행정사법에 의거하여 정식 그리고 전문 행정서비스를 제공하는 공인 행정사 사무소입니다.</p><br />

					<p>고객의 잠재적인 니즈(Needs)까지 부응하고자 이상적이고 전문화된 위드문솔루션시스템(WiTHMUN Solution System)을 통하여 사업인허가, 출입국, 영업정지 및 취소, 국내법인설립 그리고 토지보상 등의 다양한 일반행정업무와 국제화 시대에 발 맞추어 수준 높은 전문번역(법률/기업/행정/특허/해양 등), 영문계약서작성, 번역확인증명서 발급, 번역공증대행, 아포스티유/각국대사관인증, 유학(또는 이민) 및 해외법인(투자/지사/연락사무소)설립에 관한 제반 업무 등의 외국어번역행정업무에 대하여 최상의 고객만족 서비스를 제공하고 있습니다.</p><br />

					<p>믿고 맡겨주신 업무에 대하여 정확성과 신뢰성을 바탕으로 고객에게 최상의 편의를 도모하고 아울러 고객의 소중한 가치를 위하여 무거운 책임감을 가지고 성실히 수행할 것을 약속 드립니다.</p>

				
				
				</div>
				<div style="font-weight:400;color:#404040;font-size:16px;text-align: right;margin-right: 15px;margin-top: 180px;">
					위드문 인터내셔널 행정사사무소
				</div>
			</div>
		</div>
	</div>
</div>
