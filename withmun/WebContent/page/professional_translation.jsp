<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper">
	<div class="container">
		<div class ="top">
			<a href="./index.jsp">HOME</a>
			> <a href="">외국어번역행정</a>
			> <a href="">기업</a>
			> <a href="./professional_translation.do" class="on">전문번역</a>
		</div>
		<div class="toptit">
		    <h2><a href="./professional_translation.do">전문번역</a></h2>
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
		<%@ include file = "../include/left_foreign2.jsp" %>		
		<div class = "content">			
			<div class ="content_first">
				<img src="./images/professional_translation_topimg.jpg" alt="" style="width:100%;height:100%;">
			</div>

			<div class ="content_second">
				<div class ="second">
				
					
					
					번역의 사전적 의미는 어떤 언어로 된 글을 다른 언어의 글로 옮기는 것입니다. 진정한 의미의 번역은 원문을 해체한 후에 원문에
					대응하는 적절한 영어를 찾아내는 일입니다. 원문과 역문의 무게가 동일한지 부족함은 없는지 끊임없이 고민하고 검토하는 절차가
					필요합니다.
					<br><br>	
					번역이란 이러한 고민이 뒷받침되어야 하는 작업입니다.

					

					<img src="./images/new_sub_cu02_01.jpg" alt="" style="width:100%;height:90%;margin-top:60px;">
				</div>
			
			</div>
		</div>
	</div>
</div>