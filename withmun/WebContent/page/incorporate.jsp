<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper">
	<div class="container">
		<div class ="top">
			<a href="./index.jsp" >HOME</a>
			> <a href="./incorporate.do">일반행정</a>
			> <a href="./incorporate.do" class="on">법인설립</a>
		</div>
		
		<div class="toptit">
		    <h2><a href="./incorporate.do">법인설립</a></h2>
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
				<img src="./images/incorporate_topimg.jpg" alt="" style="width:100%;height:100%;">
			</div>
			<div class ="content_second">
				<div>
					<span>1. 비영리사단(재단)법인</span><br>
					비영리법인이란 학술,종교,자선,기예,사교 기타 영리 아닌 사업, 즉 경제적 이익을 도모하는 것이 아닌 사업을 목적으로 하는 사단법인 또는 재단법인을 말합니다.(민법 제32조)<br><br>
				</div>
				<div class ="second">	
				
					<img src="./images/incorporate.jpg" alt="" width="100%"/><br><br>

					<span>2. 협동조합</span><br>
					재화 또는 용역의 구매,생산,판매,제공 등을 협동으로 영위함으로써 조합원의 권익을 향상하고 지역사회에 공헌하고자 하는 사업조직을 말합니다.<br><br>

					<span>3. 사회적협동조합</span><br>
					지역주민들의 권익,복리 증진과 관련된 사업을 수행하거나 취약계층에게 사회서비스 또는 일자리를 제공하는 등 영리를 목적으로 하지 아니하는 협동조합을 말합니다.<br><br>

					<span>4. 비영리민간단체</span><br>
					영리가 아닌 공익활동을 수행하는 것을 주된 목적으로 한정하며 공식단체의 형태를 갖춘 조직을 말합니다.(법인격 유무 불문)<br><br>

				

					하나의 단체를 만들기 위해서는 상당한 준비기간이 소요되고 진행과정 중에 시행착오를 겪게 됩니다.<br>
					위드문 인터내셔널은 효율적인 진행을 위해 법인설립 초기부터 허가까지 고객의 눈높이에 맞춰 세심하게 컨설팅해드립니다. <br>				
				</div>			
			</div><!--}} content_second -->
		</div><!--}} content -->

	</div><!--}} main_wrap -->
</div><!--}} main -->