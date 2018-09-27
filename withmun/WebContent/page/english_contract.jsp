<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
</style>
<div id="wrapper">
	<div class="container">
		<div class ="top">
			<a href="./index.jsp" >HOME</a>
			> <a href="">외국어번역행정</a>
			> <a href="">기업</a>
			> <a href="./english_contract.do" class="on">영문계약서작성</a>
		</div>
		<div class="toptit">
		    <h2><a href="./english_contract.do">영문계약서작성</a></h2>
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
				<img src="./images/english_contract_topimg.jpg" alt="" style="width:100%;height:100%;">
			</div>

			<div class ="content_second">
				<div class ="second">							
					<p style="font-size:20px;">국제 거래가 많아지면서 영문계약서의 중요성이 커지고 있습니다.</p><br>
					
					
					계약서의 형식과 내용은 계약자유의 원칙에 따라 계약당사자간에 자유롭게 정 할수 있습니다.<br>
					계약서는 상호간의 신뢰를 바탕으로 작성되는 문서이기 때문에 계약당사자들의 의사를 얼마나 정확하게 표현해낼 수 있는지가 영문계약서의 중요한 문제입니다.<br><br> 

					계약당사자 뿐만 아니라 제 3자의 입장에서도 이해할 수 있는 수준의 내용으로 작성되어야 분쟁의 소지를 줄 일수 있기 때문에 그 내용은 간결하고 정확한 문장으로 표현되어야 합니다.<br><br>

					위드문 인터내셔널 행정사사무소는 많은 경험과 고객과의 소통을 통해 법률에 위반되는 사항이 있는지 거래 통념에 반하는 내용이 있는지 면밀히 검토하여 계약서의 초안 작성부터 원본에 부합하는 정확한 영문계약서 작성까지 NON-STOP으로 서비스를 제공하고 있습니다.<br><br>

				</div>
				<div style="font-weight:400; color:#404040;text-align: right;margin-right: 15px;margin-top: 180px;">
					위드문 인터내셔널 행정사사무소
				</div>
			</div>
		</div>
	</div>
</div>