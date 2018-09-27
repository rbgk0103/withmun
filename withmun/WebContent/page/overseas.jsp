<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper">
	<div class="container">
		<div class ="top">
			<a href="./index.jsp">HOME</a>
			> <a href="">외국어번역행정</a>
			> <a href="">기업</a>
			> <a href="./overseas.do" class="on">해외법인(지사/투자)설립</a>
		</div>
		<div class="toptit">
		    <h2><a href="./overseas.do">해외법인(지사/투자)설립</a></h2>
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
				<img src="./images/overseas_topimg.jpg"  alt="" style="width:100%;height:100%;">
			</div>

			<div class ="content_second">							
					<p style="font-size:22px">기업 고객분의 잠재적인 니즈(Needs)까지 파악하여</p>
                    <p style="font-size:22px; color:#309ddb; margin-top:9px; font-weight:500">최선 그리고 최고의 파트너가 되겠습니다.</p><br />

<p>우리 대한민국은 수출주도형 경제성장정책(Model)에 의한 정책적인 관리와 자원으로 고도의 성장을 거듭해가고 있습니다.
자원이 빈약하고 국내시장 규모가 협소한 우리나라의 경제현실 상 너무나 당연하고 필연적인 선택이었습니다.</p><br />

<p>그러한 결과로 우리나라의 많은 기업은 내수를 통한 성장만이 아닌 해외진출을 통해 많은 성장을 이룩하고 있습니다.</p><br />

<p>위드문 인터내셔널은 그것에 발 맞추어 해외진출(해외법인/지사/연락사무소 및 해외수주계약 등)을 계획하시는 또는 진행중인 기업고객이 해외 현지에 제출하기 전 국내에서 준비해야 하는 법인정관, 법인등기부등본(등기사항전부증명서), 재무제표, 사업자등록증, 인감증명서, 주주총회의사록, 이사회의사록, 위임장, 잔액증명서, 대표이사 여권, 현지법인장 여권 등 모든 서류에 대해 번역(해당국가언어) -> 공증 -> 아포스티유 (또는 각국 대사관인증) 및 그 외의 절차 등을 Non-Stop Service을 제공해 드리고 있습니다.</p><br />

<p>위드문 인터내셔널은 고객업체등록 시스템을 통하여 1회성이 아닌 앞으로 귀사의 소중한 한 부서처럼 잠재적인 니즈(Needs)까지 파악하여 최선 그리고 최고의 파트너가 되겠습니다.</p><br /><br />


<p>감사합니다. </p>

			</div>
		</div>
	</div>
</div>