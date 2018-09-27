<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper" >
	<div class="container">
		<div class ="top">
			<a href="./index.jsp" >HOME</a>
			> <a href="./service_procedure.do" >Other</a>
			> <a href="./service_procedure.do" class="on">서비스절차(외국어번역행정)</a>
		</div>
		<div class="toptit">
		    <h2><a href="./service_procedure.do">서비스절차(외국어번역행정)</a></h2>
			<p>신뢰와 나눔속에 사랑받는 기업으로 기억되고자 합니다.</p>
		</div>
	</div>
</div>
<!------------------------------------------------------------------->

<script>
$(document).ready(function(){
	$(".jtoggle_up").click(function(){
		$(".toggle_menu").slideDown();
		$(".jtoggle_down").css("display","block");
		$(".jtoggle_up").css("display","none");
		$(".line2").css("display","block");
		
	});
	$(".jtoggle_down").click(function(){
		$(".toggle_menu").slideUp();
		$(".jtoggle_down").css("display","none");
		$(".jtoggle_up").css("display","block");
		$(".line2").css("display","none");
	
	});
});

//개인정보 동의 관련
function check() {
	var f = document.frm_privacy;

	// [동의] 버튼 클릭시
	f.btnAgree.onclick = function() {
		if (!f.chk_item.checked) {
			alert('[수집하는 개인정보 항목]에 동의해주세요');
			return false;

		} else if (!f.chk_collect.checked) {
			alert('[개인정보 수집 및 이용목적]에 동의해주세요');
			return false;
		} else if (!f.chk_save.checked) {
			alert('[개전정보 보유, 정정, 삭제 및 반환]에 동의해주세요');
			return false;

		} else if (!f.chk_right.checked) {
			alert('[개인정보 수집 시 동의 거부 권리]에 동의해주세요');
			return false;
		}
	}

}

</script>
<style>

#div_info {
	margin-bottom: 20px;
}
#wrap_privacy {
	padding: 10px;
	border: 1px solid gray;
	width: 100%;
	margin: 0 auto;
}

#title {
	text-align: center;
}

.content_title {
	margin-bottom: 0px;
	display: block;
	text-align: left;
}

.content_privacy {
	width: 100%;
	padding: 3px;
	background-color: lightgray;
	text-align: left;
}

#buttons {
	margin-top: 30px;
	margin-bottom: 20px;
	text-align: center;
}

.agree{
	text-align: left;
	margin-top: 3px;
	margin-bottom: 16px;
}

</style>

<!------------------------------------------------------------------->

<div class ="main">
	<div class="main_wrap">
	<%@ include file = "../../include/left_other.jsp" %>
		<div class = "content" style="margin-top:0;text-align:center">			
			<div class ="content_second" style="margin-top:0;text-align:center">							
				
				<!-- 내용 시작 -->
				<div id='wrap_privacy'>
						<form name='frm_privacy' method='post' action='./apply_profile.ap'>
							<h3 id='title'>개인정보 수집 및 이용에 대한 동의 안내</h3>
							<div id='div_info'>
								<p class='content_privacy'>위드문은 귀하의 개인정보 보호를 위하여 최선의 노력을 다하고 있습니다.
									아래의 개인정보 수집 및 이용에 대한 내용은 위드문 채용 절차의 진행을 위한 규정사항 입니다. 반드시 읽어 보시고
									동의를 하셔야 위드문 온라인 입사 지원을 하실 수 있습니다.</p>
							</div>

							<div id='div_item'>
								<h5 class='content_title'>1. 수집하는 개인정보의 항목</h5>
								<p class='content_privacy'>위드문은 아래와 같은 개인정보 항목을 수집합니다. 주소, 이름,
									주민등록번호, 사진, 전화번호, 휴대전화번호, E-mail, 학력사항, 병역사항, 외국어 및 자격면허, 동아리 및
									사회봉사활동, 가족사항, 기타사항</p>
								<p class='agree'><input type='checkbox' name='chk_item' checked /> 수집하는 개인정보 항목에 동의합니다.</p>
							</div>

							<div id='div_collect'>
								<h5 class='content_title'>2. 개인정보의 수집 및 이용 목적</h5>
								<p class='content_privacy'>위드문 채용사이트에서는 다음과 같은 목적을 위하여 지원자의 개인정보를
									수집합니다. - 채용절차를 위한 개인별 식별 - 입사지원자의 서비스제공(본인확인 및 전형결과 통보, 채용관련 최신
									정보안내 등)</p>
								<p class='agree'><input type='checkbox' name='chk_collect' checked /> 개인정보 수집 및 이용목적에 동의합니다.</p>
							</div>

							<div id='div_save'>
								<h5 class='content_title'>3. 개인정보 보유, 정정 및 삭제, 반환</h5>
								<p class='content_privacy'>위드문는 수집된 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이
									달성되면 지체 없이 파기합니다. 또한, 지원자가 개인정보의 삭제를 원하는 경우, 즉시 또는 기타 법령 및 KPMG
									내부지침이 정하는 경우에는 별도 정해진 기간(1년)까지 보관 후 재생될 수 없는 방법을 통해 삭제처리 됩니다.
									추후 지원자가 개인정보의 오류에 대한 정정을 요청하신 경우에는 회사가 정정을 완료하기 전까지 당해 개인정보를
									이용하지 않습니다. 채용과정에서 직접 제출하신 서류 및 자료 일체는 최종 합격자 발표 이후 180일 이내 반환
									가능합니다. (채용절차의 공정화에 관한 법률 시행규칙. 고용노동부령 제 119호)</p>
								<p class='agree'><input type='checkbox' name='chk_save' checked /> 개인정보 보유, 정정 및 삭제내용에 대해 동의합니다.</p>
							</div>

							<div id='div_dis'>
								<h5 class='content_title'>4. 개인정보 수집 시 동의 거부 권리</h5>
								<p class='content_privacy'>위드문는 수집된 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이
									달성되면 지체 없이 파기합니다. 또한, 지원자가 개인정보의 삭제를 원하는 경우, 즉시 또는 기타 법령 및 KPMG
									내부지침이 정하는 경우에는 별도 정해진 기간(1년)까지 보관 후 재생될 수 없는 방법을 통해 삭제처리 됩니다.
									추후 지원자가 개인정보의 오류에 대한 정정을 요청하신 경우에는 회사가 정정을 완료하기 전까지 당해 개인정보를
									이용하지 않습니다. 채용과정에서 직접 제출하신 서류 및 자료 일체는 최종 합격자 발표 이후 180일 이내 반환
									가능합니다. (채용절차의 공정화에 관한 법률 시행규칙. 고용노동부령 제 119호)</p>
								<p class='agree'><input type='checkbox' name='chk_right' checked /> 해당내용에 대해 충분히 이해하였으며, 이에 동의합니다.</p>
							</div>


							<div id='buttons'>
								<a href='./apply_write.ap'><input type='button' name='btnAgree' value='동의' /></a>
								<input type='submit' name='btnDisAgree' value='동의안함' />
							</div>
						</form>
					</div>
				<!-- 내용 시작 -->
								
			</div>	
		</div>
	</div>
</div>

<script>
check();
</script>