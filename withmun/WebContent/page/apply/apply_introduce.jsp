<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper">
	<div class="container">
		<div class ="top">
			<a href="/" >HOME</a>
			> <a href="./service_procedure.do">Other</a>
			> <a href="./apply_enter.ap">입사지원</a>
			> <a href="./apply_introduce.ap">자기소개</a>
		</div>
		
		<div class="toptit">
		    <h2><a href="./apply_introduce.ap">자기소개</a></h2>
			<p>능력있는 인재들의 지원을 기다립니다.</p>
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

// 페이지가 로딩되면 실행됨
function pageLoad() {
	var f = document.frm_introduce;
	
	// [Save and Next Page] 버튼 클릭시
	f.btnNext.onclick = function() {
		f.submit();
	}
	
	
	/* if ( !('{$requestScope.msg}' == null) && !('${requestScope.msg}' == '')) {
		alert('${requestScope.msg}');
	} */
	
	
} // End of pageLoad()

</script>
<!------------------------------------------------------------------->
<style>

.content {
	width: 100%;
}


#wrap_introduce {
	text-align: left;
	padding: 10px;
	border: 1px solid gray;
	margin: 0 auto;
}

#buttons {
	margin-top: 30px;
	margin-bottom: 20px;
	text-align: center;
}

.taTitle {
	margin-top: 16px;
	margin-bottom: 4px;
}

textarea {
	background-color: lightgray;
	resize: none;
}

</style>


	
	
<div class="main">
	<div class="main_wrap">
		<div class="content">
			<div class="content_second" style="width:100%;margin-top: 0; text-align: center">
				
				<!-- 여기에 내용을 넣는다 -->
				<div id='wrap_introduce'>
				
					<h1>자기소개</h1>
					<form name='frm_introduce' method='post' action='./apply_preview.ap'>
						
							
						<h5 class='taTitle'>성장과정(1,000자 이내)</h5>
						<textarea name='sungJang' rows='8' cols='137'>
						</textarea>
							
						<h5 class='taTitle'>성격 및 장단점(1,000자 이내)</h5>				
						<textarea name='charact' rows='8' cols='137'>
						</textarea>
						
						<h5 class='taTitle'>지원동기(1,000자 이내)</h5>
						<textarea name='motive' rows='8' cols='137'>
						</textarea>
						
						<h5 class='taTitle'>입사 후 포부(1,000자 이내)</h5>
						<textarea name='future' rows='8' cols='137'>
						</textarea>
						
						<div id='buttons'>
							<a href='./apply_profile.ap'><input type='button' name='btnPrev' value='&lt;&lt; Previous Page' /></a>
							<input type='button' name='btnNext' value='Save and Next Page &gt;&gt;' />
						</div>
					</form>
					
				</div>
				<!-- 내용의 끝 -->
				
			</div>
		</div>
	</div>
</div>	
	
	
<script>
pageLoad();
</script>


