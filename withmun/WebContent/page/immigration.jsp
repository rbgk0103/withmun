<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper">
	<div class="container">
		<div class ="top">
			<a href="./index.jsp" >HOME</a>
			> <a href="./incorporate.do">일반행정</a>
			> <a href="./immigration.do">출입국관리업무</a>
		</div>
			<div class="toptit">
		    <h2><a href="./immigration.do">출입국관리업무</a></h2>
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
				<img src="./images/immigration_topimg.jpg" alt="" style="width:100%;height:100%;">
			</div>

			<div class ="content_second">
				<div class ="second">	
					<span>기업투자 (D-8)</span><br>					
				
					1. D-8-1 : 「외국인투자촉진법」에 따른 외국인투자기업 대한민국 법인의 경영·관리 또는 생산·기술 분야에 종사하려는 필수 전문인력 (설립중인 법인을 포함)<br>
					2. D-8-2 : 지식재산권을 보유하는 등 우수한 기술력으로 「벤처 기업육성에 관한 특별조치법」에 따른 벤처기업을 설립한 사람 중 벤처기업 확인을 받은 기업의 대표자 또는 기술성이 우수한 것으로 평가를 받은 기업의 대표자 <br>
					3. D-8-3 : 「외국인투자촉진법」에 따른 외국인 투자기업인 대한민국 국민(개인)이 경영하는 기업의 경영 관리 또는 생산 기술 분야에 종사하려는 필수 전문인력<br>
					4. D-8-4 : 국내전문학사 이상 또는 외국 학사 이상의 학위를 가진 사람으로서 지식재산권을 보유하거나 이에 준하는 기술력 등을 가진 법인 창업자
					<br><br>


                    <img src="./images/immigration.jpg" alt="" style="width:100%;height:100%;" /><br><br>



					<span>출입국관리업무</span><br>
					
					
					국제화 시대의 흐름에 따라 우리나라에도 많은 외국인들이 체류하고 있습니다.<br>
					우리나라에 들어오려는 이유는 다양하지만 외국인들이 공통적으로 필요로 하는 것은 사증(VISA)발급입니다.<br>
					사증(VISA)은 종류별로 다양하고 세분화되어 있기 때문에 그에 맞는 요건을 충족해야 하며 필요서류를 구비하여야 합니다.<br>
					따라서 외국인들이 사증(VISA)발급, 연장, 변경 등을 준비하기에는 많은 어려움이 있습니다.<br><br>

					위드문 인터내셔널은 법무부에 등록된 정식대행기관으로서 출입국업무와 관련된 사항에 대하여 고객님들의 어려움을 해결해드리고자 최선을 다하고 있습니다.


				


				</div>
			
			</div>
		</div>
	</div>
</div>