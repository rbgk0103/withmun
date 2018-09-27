<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper">
	<div class="container">
		<div class ="top">
			<a href="/" ">HOME</a>
			> <a href="./service_procedure.do" >Other</a>
			> <a href="./apply_enter.ap" >입사지원</a>
			> <a href="./apply_manage.ap" class="on">입사지원서 관리</a>
		</div>
		<div class="toptit">
		    <h2><a href="./apply_manage.ap">입사지원서 관리</a></h2>
			<p>능력있는 인재들의 많은 지원 바랍니다.</p>
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
</script>
<style>
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

.content {
	width: 100%;
}

#wrap_manage {
	pading: 10px;
	border: 1px solid gray;
}
</style>

<!------------------------------------------------------------------->


<div class="main">
	<div class="main_wrap">
		<div class="content">
			<div class="content_second" style="width:100%;margin-top: 0; text-align: center">
				
				<!-- 여기에 내용을 넣는다 -->
				
				<div id='wrap_manage'>
			     	<!-- '입사지원서 관리' 로그인이 안된 경우 -->
						<form name='frm_manage'>
						
							<p>
							입사지원서 관리<br/>
							이력서 관리를 위해 먼저 로그인 하셔야 합니다. 
							</p>
							<table>
								<tr>
									<th>이메일</th>
									<td><input type='email' name='email' /></td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td><input type='password' name='pwd' /></td>
								</tr>
							</table>
							<a href='./apply_profile.ap'><input type='button' name='btnLogin' value='로그인' /></a>
						</form>
						
					<!-- '입사지원서 관리' 로그인이 된 경우 -->
					<div id='manage_list'>
						<p>
							입사지원서 관리<br /> 이봉기 님께서 작성하신 이력서 목록입니다.
						</p>

						<table id='table_list'>
							<tr>
								<th>모집분야</th>
								<th>모집기한</th>
								<th>작성일자</th>
								<th>최종제출여부</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
							<tr>
								<td><input type='text' name='field' value='[경력] IT 개발자 채용 - ATO 본부' /></td>
								<td><input type='text' name='recruitDate' value='7/27/2018' /></td>
								<td><input type='text' name='writeDate' value='2018-07-18' /></td>
								<td><input type='text' name='submitYN' value='미제출' /></td>
								<td><input type='button' name='btnModify' value='수정' /></td>
								<td><input type='button' name='btnDelete' value='삭제' /></td>
							</tr>

						</table>


					</div>
				</div>
				<!-- 내용의 끝 -->
				
			</div>
		</div>
	</div>
</div>	


<div class ="main">
<div class="main_wrap">
		<div class = "content">			
			<div class ="content_second" style="margin-top:0;text-align:center">
			     <div class ="second">
			     

						
				</div>
			</div>	
		</div>
	</div>
</div>