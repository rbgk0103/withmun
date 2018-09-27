<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper">
	<div class="container">
		<div class ="top">
			<a href="./index.jsp" >HOME</a>
			> <a href="./incorporate.do">일반행정</a>
			> <a href="./land_compensation.do" class="on">토지보상</a>
		</div>
		<div class="toptit">
		    <h2><a href="./incorporate.do">토지보상</a></h2>
			<p>최상의 상품제공 및 서비스를 통하여 고객님께서 다시 찾으실 수 있도록 최선을 다하겠습니다.</p>
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

	$(".jtoggle_up2").click(function(){
		$(".toggle_menu2").slideDown();
		$(".jtoggle_down2").css("display","block");
		$(".jtoggle_up2").css("display","none");
	});
	$(".jtoggle_down2").click(function(){
		$(".toggle_menu2").slideUp();
		$(".jtoggle_down2").css("display","none");
		$(".jtoggle_up2").css("display","block");	
	});
});
</script>
<!------------------------------------------------------------------->

<div class ="main">
		<div class="main_wrap">
		<%@ include file = "../include/left_general.jsp" %>
		
		<div class = "content">
			
			<div class ="content_first">
				<img src="./images/land_compensation_topimg.jpg" alt="" style="width:100%;height:100%;">
			</div>

			<div class ="content_second">
				<div class ="second">						
					<span>&#60;보상의 법적근거&#62;</span><br><br>

					헌법 제23조 제3항<br>
					공공필요에 의한 재산권의 수용,사용 또는 제한 및 그에 대한 보상은 법률로써 하되 정당한 보상을 지급하여야 한다.<br><br>

					공익사업을 위한 토지 등의 취득 및 보상에 관한 법률과 개별사업법 <br><br>


					<img src="./images/land_compensation.jpg" style="width:100%;height:100%;" alt="토지보상 절차도" /><br><br>


					토지보상의 법적근거를 토대로 국민의 재산권행사를 위한 의견서 제출, 수용재결 신청(이의재결신청), 잔여지보상(가치하락보상 등), 지장물 보상, 생활 보상 등의 다양한 방법으로 고객의 권리를 지켜드립니다.<br> 
					
				</div>
			
			</div>
		</div>
	</div>
</div>