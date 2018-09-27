<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="about">
	<div id="wrapper">
		<div class="container">
			<div class ="top">
				<a href="./index.jsp" >HOME</a>
				> <a href="./about.do" >About WithMUN</a>
			</div>
				<div class="toptit">
			    <h2><a href="./about.do">About WithMUN</a></h2>
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
				
				<div class ="ab_first">
					<a href="./greetings.do"><img src="./images/greetings_topimg.jpg" alt="" ></a>
				</div>
				
				<a href="./greetings.do">
				<div class ="ab_first_div">
					<div id ="ab_first_title">
						<span style="">인사말</span>
					</div>
					<div id = "ab_first_text">
						위드문 인터내셔널 행정사사무소 홈페이지를 방문해주신 고객분들께 감사의
						말씀을 드립니다.</br></br>
						당사는 행정사법에 의거 국가자격시험을 거친 국가공인자격사가 행정서비스를 제공하는
						전문사무소입니다.</br></br>
						국제화 시대에 발맞추어 고객의 니즈(Needs)에 부응하기 위하여 전문적인 지식을 바탕으로
						행정 인허가, 출입국업무, 토지보상 업무 등의 일반 행정과 수준높은.. 
					</div>
				
	
				</div></a>
				
				
				
			
				<div class ="ab_second">
				    <a href="./philosophy.do">
					<img src="./images/ab_left01.jpg" alt="">
					<div id = "ab_second_title">
						<span style="">경영이념</span>
					</div>
					<div id= "ab_second_text">
							신뢰, 소통, 세계화를 경영의 기초로 하여 고객 한분 한분의 소중한 인연을 지키기 위하
							여...
					</div>
					</a>
	
				</div>
				<a href="./greetings.do">
				<div class ="ab_third">
					<div id ="ab_third_title">
						<span style="">인사말</span>
					</div>
					<div id = "ab_third_text">
						위드문 인터내셔널 행정사사무소 홈페이지를 방문해주신 고객분들께 감사의
						말씀을 드립니다.</br></br>
						당사는 행정사법에 의거 국가자격시험을 거친 국가공인자격사가 행정서비스를 제공하는
						전문사무소입니다.</br></br>
						국제화 시대에 발맞추어 고객의 니즈(Needs)에 부응하기 위하여 전문적인 지식을 바탕으로
						행정 인허가, 출입국업무, 토지보상 업무 등의 일반 행정과 수준높은.. 
					</div>
				
	
				</div></a>
				<div class ="ab_fourth">
				    <a href="./location.do">
					<img src="./images/ab_left02.jpg" alt="">
					<div id="ab_fourth_title">
						<span style="">오시는길</span>
					</div>			
					<div id ="ab_fourth_text">
						위드문 인터내셔널 행정사사무소는 고객 여러분의 방문을 언제나 환영합니다.					
					</div>
					</a>
	
				</div>
				
			</div>
		</div>
	</div>
</div>