<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper">
	<div class="container">
		<div class ="top">
			<a href="./index.jsp" >HOME</a>
			> <a href="">외국어번역행정</a>
			> <a href="">개인</a>
			> <a href="./acting_translation_personal.do" class="on">번역공증대행</a>
		</div>
		<div class="toptit">
		    <h2><a href="./acting_translation_personal.do">번역공증대행</a></h2>
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
	<%@ include file = "../include/left_foreign.jsp" %>		
		<div class = "content">			
			<div class ="content_first">
				<img src="./images/acting_translation_personal_topimg.jpg" alt="" style="width:100%;height:100%;">
			</div>

			<div class ="content_second">
				<p>번역문서의 진실성과 관련하여 일정한 자격이 있는 자(공인외국어번역행정사 등)가 본 번역문이 원문과 상위 없음을 진술 및 확약하고 공증인이 이에 대해 인증하는 절차를 말합니다.</p><br />

					<p>국문 문서를 영문 또는 기타 언어(영문 또는 기타언어를 국문으로)로 번역하여 본 번역이 정확히 원문과 상위 없음을 공인외국어번역행정사 또는 일정한 자격이 있는 자가 서명 및 서약하고 이에 공증인의 확인 및 서명날인이 포함된 인증문(Notary Certificate)을 발급합니다.</p><br />

					<p>예전에는 번역공증을 위한 번역본을 누구나 제출하고 공증인 앞에서 원문가 상위 없음을 확약 및 서명날인 할 수 있었으나 이제는 번역공증을 받고 자 하는 번역본에 대해서는 앞서 설명한 바와 같이 일정한 자격(공인외국어번역행정사 등)이 있어야만 공증변호사 앞에서 본 번역문이 원문과 상이 없음을 확약할 수 있습니다.</p><br />

					<p>해당번역업체가 고객에게 위탁 받은 일에 대해 불법적인 번역공증관행을 통하여 진행하는지 등을 고려하지 않고 단순히 소소한 금액차이를 통해 1회성 업체를 선정하는 것 보다 믿고 맡길 수 있는 위드문 인터내셔널 행정사사무소에 많은 문의를 주시기 바랍니다.</p>
			</div>
		</div>
	</div>
</div>