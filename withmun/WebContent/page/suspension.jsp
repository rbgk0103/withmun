<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper">
	<div class="container">
		<div class ="top">
			<a href="./index.jsp" >HOME</a>
			> <a href="./new_page.html?co_id=incorporate">일반행정</a>
			> <a href="./new_page.html?co_id=suspension" class="on">행정심판</a>
		</div>
		<div class="toptit">
		    <h2><a href="./new_page.html?co_id=incorporate">행정심판</a></h2>
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
				<img src="./images/suspension_topimg.jpg" alt="" style="width:100%;height:100%;">
			</div>

			<div class ="content_second">
				<div class ="second">	

<p>행정심판이란 행정청의 위법ㆍ부당한 행정처분이나 기타 공권력의 행사ㆍ불행사로 인하여 자신의 권리나 이익을 침해받은 자가 행정기관에 대하여 시정을 구하는 절차를 말합니다.</p><br />

<h2>[행정심판 청구 유형]</h2><br />

<h3>- 식품접객업(휴게음식점, 일반음식점영업, 단란주점영업, 유흥주점영업, 위탁급식영업, 제과점영업)</h3>
<ul>
<li>ㆍ청소년에게 주류를 제공한 경우</li>
<li>ㆍ청소년유해업소에 청소년을 고용한 경우</li>
<li>ㆍ청소년유해업소에 청소년을 출입하게 한 경우</li>
<li>ㆍ청소년을 유흥접객원으로 고용하여 유흥행위를 하게 한 경우</li>
<li>ㆍ영업시간제한을 위반한 경우</li>
<li>ㆍ일반음식점의 객실 안에 무대장치, 음향 및 반주시설, 특수조명시설을 설치한 경우</li>
</ul><br />

<h3>- 식품제조ㆍ가공업, 즉석판매제조ㆍ가공업, 식품첨가물제조업, 식품소분업 등</h3>
<ul>
 <li>ㆍ위해식품 등을 판매한 경우</li>
 <li>ㆍ안정성 평가를 받지 않거나 부적합한 식품을 수입, 개발, 생산하는 경우</li>
 <li>ㆍ표시사항의 기준을 위반한 경우</li>
</ul><br />

<h3>- 노래연습장</h3>
<ul>
  <li>ㆍ주류를 판매ㆍ제공한 경우
  <li>ㆍ손님과 함께 술을 마시거나 노래 또는 춤으로 유흥을 돋구는 접객행위를 하는 경우
  <li>ㆍ유흥접객원(도우미)을 알선하는 경우
</ul><br />

<h3>- 숙박업</h3>
<ul>
 <li>ㆍ청소년에 대하여 이성혼숙을 하게 하는 등 영업행위를 하거나 그를 목적으로 장소를 제공한 경우</li>
</ul><br />
<h3>- 화물자동차 운송업</h3>
<ul>
 <li>ㆍ유가보조금을 부정수급한 경우</li>
</ul><br />

 <h3>- 그 외에도 행정청의 처분을 받은 경우 행정심판을 청구 할 수 있습니다.</h3><br /><br />

<p>위드문 인터내셔널은 행정청의 위법ㆍ부당한 행정처분에 대해 행정심판을 청구하고자 하는 고객들의 편의를 위해 행정심판 과정(재결례ㆍ법리해석 등을 통한 청구서 및 답변서 작성 등)에 전문적인 행정서비스를 제공하고 있습니다.</p><br />

<p>위드문 인터내셔널은 고객의 어려움을 충분히 이해하고 억울한 부분이 없도록 최선을 다하겠습니다.</p>

	</div>
			
			</div>
		</div>
	</div>
</div>