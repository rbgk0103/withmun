<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="wrapper" >
	<div class="container">
		<div class ="top">
			<a href="./index.jsp" >HOME</a>
			> <a href="" >About WithMUN</a>
			> <a href="./philosophy.do" class="on">경영이념</a>
		</div>
		<div class="toptit">
		    <h2><a href="./greetings.do">경영이념</a></h2>
			<p>신뢰와 나눔속에 사랑받는 기업으로 기억되고자 합니다.</p>
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
				<img src="./images/philosophy_topimg.jpg" alt="" alt="" style="width:100%;height:100%;">
			</div>

			<div class ="content_second" s>
				<div class ="second">
				
				
					<p style="font-size:14px;"><a style="font-size:18px;color:#1f497d;">위드문 인터내셔널 행정사사무소</a>는 고객 한분 한분의 소중한 인연을 이어나가고 고객과 함께 발전, 성장하는 회사가 되기 위하여 끊임 없이 노력합니다.</p><br><br>
					<center><p><img src="./images/philosophy.jpg" alt="" alt="" style="width:500px;"></p></center><br><br>
				
					
					<p>신뢰, 소통 그리고 세계화를 기본 철학으로 고객의 입장에서 기준을 정하고, 세계화 수준에 맞는 가치를 실현하여 국제적 수준의 일반행정 및 외국어번역행정 서비스를 제공해 드릴 것을 약속합니다.</p><br><br>


					<p>앞으로도 변함없는 관심과 사랑을 부탁드립니다.</p>
				
				</div>
			
			</div>
		</div>
	</div>
</div>