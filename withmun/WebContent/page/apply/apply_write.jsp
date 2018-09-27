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


function check() {
	var f = document.frm_write;

	// [Login] 버튼 클릭시
	f.btnLogin.onclick = function() {
		if (f.name.value == null || f.name.value == '') {
			alert('성명을 입력해주세요');
			f.name.focus();
			return false;
			
		} else if (f.email.value == null || f.email.value == '') {
			alert('이메일을 입력해주세요');
			f.email.focus();
			return false;
			
		} else if (f.pwd.value == null || f.pwd.value == '') {
			alert('비밀번호를 입력하세요');
			f.pwd.focus();
			return false;

		} else if (f.pwd.value != f.pwdCheck.value) {
			alert('비밀번호를 정확히 다시 입력해주세요');
			f.pwd.focus();
			return false;
		}
		
		f.submit();
	}

}

</script>
<style>

#wrap_write {
	border: 1px solid gray;
	padding: 10px;
}

table {
	margin: 0 auto;
	border: 1px solid gray;
	
	margin-top: 10px;
	margin-bottom: 10px;
	
}

th {
	background-color: skyblue;
}
th, td {
	border: 1px solid black;
}

</style>

<!------------------------------------------------------------------->

<div class ="main">
	<div class="main_wrap">
	<%@ include file = "../../include/left_other.jsp" %>
		<div class = "content" style="margin-top:0;text-align:center">			
			<div class ="content_second" style="margin-top:0;text-align:center">							
				
			     	<!-- 본문 시작-->
			     	<div id='wrap_write'>
						<form name='frm_write' method='post' action='./apply_profile.ap'>
						
							<p>
							입사지원서 작성을 시작 합니다.
							제출하신 이력서는 이메일과 비밀번호를 통하여 관리하실 수 있으며,
							아래에 입력하신 이메일과 비밀번호를 분실하지 않도록 유의하시기 바랍니다.
							성명과 이메일 주소, 그리고 비밀번호를 입력하세요. 
							</p>
							<table>
								<tr>
									<th>성명</th>
									<td><input type='text' name='name' /></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><input type='email' name='email' /></td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td><input type='password' name='pwd' /></td>
								</tr>
								<tr>
									<th>비밀번호 확인</th>
									<td><input type='password' name='pwdCheck' /></td>
								</tr>
							</table>
							<input type='reset' name='btnReset' value='Reset' />&nbsp;
							<input type='button' name='btnLogin' value='Login' />
						</form>
					</div>	
					<!-- 본문 끝-->
								
			</div>	
		</div>
	</div>
</div>

<script>
check();
</script>