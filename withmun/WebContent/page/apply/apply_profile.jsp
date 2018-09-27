<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>    
    
    
<div id="wrapper">
	<div class="container">
		<div class ="top">
			<a href="/" >HOME</a>
			> <a href="./service_procedure.do">Other</a>
			> <a href="./apply_enter.ap">입사지원</a>
			> <a href="./apply_profile.ap">지원서 작성</a>
		</div>
		
		<div class="toptit">
		    <h2><a href="./apply_profile.ap">지원서 작성</a></h2>
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
	var f = document.frm_profile;
	
	
	// [input file]이 변경되면
	f.file.onchange = function(event) {
		var file = event.srcElement;	// 이벤트가 발생한 태그
		var url = file.files[0];		// 선택된 이미지의 경로
		
		var reader = new FileReader();	// FileReader객체를 가져온다
		
		// 사진파일이 로딩되면
		reader.onload = function(e) {	
			f.photo.src = e.target.result;	// 로딩된 결과를 뿌려준다
		}
		reader.readAsDataURL(url);		
	}
	
	
	// [저장하고 다음으로] 버튼 클릭시
	f.btnNext.onclick = function() {
		f.submit();
	}	
	
} // End of pageLoad()

</script>
<style>


#wrap_profile {
	padding: 10px;
	border: 1px solid gray;
	width: 100%;
	margin: 0 auto;
	text-align: left;
}

#div_photo {
	border: 1px solid olive;
}

.sectionTitle {
	margin-top: 16px;
	margin-bottom: 4px;
}

table {
	display: inline-block;
	border: 1px solid gray;
}

th {
	background-color: skyblue;
}

th, td {
	border: 1px solid black;
}

#buttons {
	margin-top: 30px;
	
	margin-ㄹttom: 20px;
	text-align: center;
}
.content{width:100%;}

</style>
<!------------------------------------------------------------------->

<div class="main">
	<div class="main_wrap">
		<div class="content">
			<div class="content_second" style="width:100%;margin-top: 0; text-align: center">
				
				<!-- 내용 시작 -->
				<div id='wrap_profile'>
				<h1>입사지원서</h1>
					<form name='frm_profile' method='post' encType='multipart/form-data' action='./apply_introduce.ap'>
							<div id='div_photo'>
							<img src='http://placehold.it/90x120' name='photo' width='90' height='120' />
							<input type='file' name='file' id='file' />
							</div>
							
							<h5 class='sectionTitle'>지원정보</h5>
							<table>
								<tr>
									<th>지원분야</th>
									<td><input type='text' name='field'  value='번역' /><br></td>
									<th>이름</th>
									<td><input type='text' name='name' value='${requestScope.name }' /></td>	
								</tr>	
								<tr>
									<th>주민등록번호</th>
									<td><input type='text' name='jumin1' value='111111' size='6'/> - <input type='text' name='jumin2' value='1111111' size='7'/></td>
									<th>E-Mail</th>
									<td><input type='email' name='email' value='${sessionScope.email }' /></td>
								</tr>
								<tr>
									<th>암호</th>
									<td><input type='text' name='pwd' value='${requestScope.pwd }' /></td>
									<th>암호확인</th>
									<td><input type='text' name='pwdCheck' value='${requestScope.pwd }' /></td>
								</tr>
							</table>
							
							<h5 class='sectionTitle'>연락처</h5>
							<table id='tbl_contact'>
								<tr>
									<th>주소</th>
									<td colspan='5'><input type='text' name='addr' value='동작구' /></td>
								</tr>
								<tr>
									<th>우편번호</th>
									<td><input type='text' name='zipCode' value='11111'/></td>
									<th>전화번호</th>
									<td>
										<input type='text' name='tel1' size='3' value='02' />-
										<input type='text' name='tel2' size='4' value='123'/>-
										<input type='text' name='tel3' size='4' value='4567'/>
									</td>
									<th>휴대전화</th>
									<td>
										<input type='text' name='mobile1' size='3' value='010' />-
										<input type='text' name='mobile2' size='4' value='1111'/>-
										<input type='text' name='mobile3' size='4' value='2222'/>
										
									</td>
								</tr>
							</table>
							
							
							<h5 class='sectionTitle'>학력사항</h5>
							<table id='tbl_study'>
								<tr>
								<th>기간</th><th>학교명		</th><th>전공</th><th>평점</th><th>졸업여부</th>
								
								<tr>
									<td><input type='date' name='highStart' value='2000-01-01'> -
									<input type='date' name='highFinish' value='2000-01-01'></td>
									<td><input type='text' name='highName' value='JHTA' size='6'/>고등학교</td>
									<td>-</td><td>- </td>
									<td><input type='radio' name='radioHighJolUp' value='1' checked />졸업
										<input type='radio' name='radioHighJolUp' value='0' />졸업예정
									</td>
								</tr>
								
								<tr>
									<td><input type='date' name='colStart' value='2000-01-01'> -
									<input type='date' name='colFinish' value='2000-01-01'></td>
									<td><input type='text' name='colName' size='6' value='JHTA' />대학</td>
									<td><input type='text' name='colMajor' size='6' value='Java'/></td>
									<td><input type='text' name='colGrade' size='6' value='3.0' /></td>
									<td><input type='radio' name='radioColJolUp' value='1' checked/>졸업
										<input type='radio' name='radioColJolUp' value='0 '/>졸업예정
									</td>
								</tr>
								
								<tr>
									<td><input type='date' name='univStart' value='2000-01-01'> -
									<input type='date' name='univFinish' value='2000-01-01'></td>
									<td><input type='text' name='univName' size='6' value='JHTA' />대학교</td>
									<td><input type='text' name='univMajor' size='6' value='Java' /></td>
									<td><input type='text' name='univGrade' size='6' value='3.0' /></td>
									<td><input type='radio' name='radioUnivJolUp' value='1'  checked />졸업
										<input type='radio' name='radioUnivJolUp' value='0' />졸업예정
									</td>
								</tr>
								
								<tr>
									<td><input type='date' name='gradStart' value='2000-01-01'> -
									<input type='date' name='gradFinish' value='2000-01-01'></td>
									<td><input type='text' name='gradName' size='6' value='JHTA' />대학원</td>
									<td><input type='text' name='gradMajor' size='6' value='JSP' /></td>
									<td><input type='text' name='gradGrade' size='6'value='3.0' /></td>
									<td><input type='radio' name='radioGradJolUp' value='1' checked />졸업
										<input type='radio' name='radioGradJolUp' value='0'  checked />졸업예정
									</td>
								</tr>
							</table>
			
							<h5 class='sectionTitle'>병역</h5>	
							<table id='tbl_military'>
								<tr>
									<th>군별</th><th>병과</th><th>계급</th><th>복무기간</th><th>제대구분</th><th>미필사유</th>
								</tr>
								<tr>
									<td><input type='text' name='gunByul' size='6' value='JHTA' /></td>
									<td><input type='text' name='gunByung' size='6' value='L1' /></td>
									<td><input type='text' name='gunGye' size='6' value='반장' /></td>
									<td>
										<input type='date' name='gunStart' value='2018-04-16' /> ~
										<input type='date' name='gunFinish' value='2018-10-23' />
									</td>
									<td>
										<input type='radio' name='radioGunPil' value='1' checked /> 필  
										<input type='radio' name='radioGunPil' value='0' /> 미필
									</td>
									<td><input type='text' name='gunMiPilWhy' size='10' value='ㅌㅌㅌ' /></td>
								</tr>					
							</table>
							
							<h5 class='sectionTitle'>외국어/자격면허</h5>
							<table id='tbl_lang'>
								<tr>
									<th>외국어시험명</th><th>공인점수</th><th>시험일</th>
								</tr>
								<tr>
									<td><input type='text' name='lang1Name' size='6' value='TOEIC'/></td>
									<td><input type='text' size='3' name='lang1Score' value='990'/>점</td>
									<td><input type='date' name='lang1Date' value='2000-01-01' /></td>
									
								</tr>
								<tr>
									<td><input type='text' name='lang2Name' size='6' value='IELTS'/></td>
									<td><input type='text' size='3' name='lang2Score' value='6.5' />점</td>
									<td><input type='date' size='3' name='lang2Date' value='2000-01-01'/></td>
								</tr>
							</table>		
							
							<table id='tbl_license'>
								<tr>
									<th>자격명</th><th>취득일</th><th>시행처</th>
								</tr>
								<tr>
									<td><input type='text' name='license1Name' value='OCJP'/></td>
									<td><input type='date' name='license1Date' value='2000-01-01' /></td>
									<td><input type='text' name='license1Org' value='Oracle' /></td>						
								</tr>
								<tr>
									<td><input type='text' name='license2Name' value='정보처리기사'/></td>
									<td><input type='date' name='license2Date' value='2000-01-01' /></td>
									<td><input type='text' name='license2Org' value='산업인력공단'/></td>	
								</tr>
							</table>	
							
							<h5 class='sectionTitle'>동아리 및 사회봉사활동</h5>
							<table id='tbl_activity'>
								<tr>
									<th>활동기관(단체)</th><th>활동기간</th><th>활동내용</th>
								</tr>
								<tr>
									<td><input type='text' name='activity1Org' size='10' value='UN'></td>
									<td>
										<input type='date' name='activity1Start' value='2000-01-01' /> ~
										<input type='date' name='activity1Finish' value='2000-01-01' />
									</td>
									<td>
									<input type='text' name='activity1Content' value='구호활동'/>
									</td>
								</tr>
								<tr>
									<td><input type='text' name='activity2Org' size='10' value='JHTA'></td>
									<td>
										<input type='date' name='activity2Start' value='2000-01-01' /> ~
										<input type='date' name='activity2Finish' value='2000-01-01' />
									</td>
									<td>
									<input type='text' name='activity2Content' value='반장'/>
									</td>
								</tr>
							</table>
							
							
							<h5 class='sectionTitle'>가족사항</h5>
							<table id='tbl_family'>
								<tr>
									<th>관계</th><th>성명</th><th>생년월일</th><th>최종학력</th><th>직업</th><th>회사명</th><th>직위</th><th>동거여부</th>
								</tr>
								<tr>
									<td><input type='text' name='family1Rel' 		value='아버지'	 	 	size='4' /></td>
									<td><input type='text' name='family1Name' 		value='홍길동'	 		size='4' /> </td>
									<td><input type='date' name='family1Birth' 		value='2000-01-01'				/>	</td>
									<td><input type='text' name='family1Academic' 	value='대졸' 				size='6' /></td>
									<td><input type='text' name='family1Job'  		value='공무원' 			size='6'></td>
									<td><input type='text' name='family1Company' 	value='구청'				 size='6'></td>
									<td><input type='text' name='family1Position'   value='과장'				 size='6'></td>
									<td>
									<input type='radio' name='radioFamily1Livewith' value='1' checked/>Y
									<input type='radio' name='radioFamily1Livewith' value='0' />N
									</td>
								</tr>
								<tr>
									<td><input type='text' name='family2Rel' 		value='아버지'	 	 				size='4' /></td>
									<td><input type='text' name='family2Name' 		value='홍길동'	 				size='4' /> </td>
									<td><input type='date' name='family2Birth'		value='2000-01-01'			></td>
									<td><input type='text' name='family2Academic' 	value='대졸' 				size='6' /></td>
									<td><input type='text' name='family2Job'  		value='공무원' 			size='6'></td>
									<td><input type='text' name='family2Company' 	value='구청'					 size='6'></td>
									<td><input type='text' name='family2Position' 	value='과장'				 size='6'></td>
									<td>
									<input type='radio' name='radioFamily2Livewith' value='1' checked />Y
									<input type='radio' name='radioFamily2Livewith' value='0' />N
									</td>
								</tr>
								<tr>
									<td><input type='text' name='family3Rel'		value='아버지'	 	 				 size='4' /></td>
									<td><input type='text' name='family3Name' 		value='홍길동'	 					size='4' /> </td>
									<td><input type='date' name='family3Birth'		value='2000-01-01'			></td>
									<td><input type='text' name='family3Academic'	value='대졸' 					 size='6' /></td>
									<td><input type='text' name='family3Job' 		value='공무원' 			 size='6'></td>
									<td><input type='text' name='family3Company' 	value='구청'					 size='6'></td>
									<td><input type='text' name='family3Position' 	value='과장'				 size='6'></td>
									<td>
									<input type='radio' name='radioFamily3Livewith' value='1' checked/>Y
									<input type='radio' name='radioFamily3Livewith' value='0' />N
									</td>
								</tr>
								<tr>
									<td><input type='text' name='family4Rel'		value='아버지'	 	 			 size='4' /></td>
									<td><input type='text' name='family4Name'		value='홍길동'	 			 size='4' /> </td>
									<td><input type='date' name='family4Birth'		value='2000-01-01'		></td>
									<td><input type='text' name='family4Academic'	value='대졸' 					 size='6' /></td>
									<td><input type='text' name='family4Job'  		value='공무원' 			size='6'></td>
									<td><input type='text' name='family4Company' 	value='구청'				 size='6'></td>
									<td><input type='text' name='family4Position' 	value='과장'				 size='6'></td>
									<td>
									<input type='radio' name='radioFamily4Livewith' value='1' checked />Y
									<input type='radio' name='radioFamily4Livewith' value='0' />N
									</td>
								</tr>
							
							</table>
							
							<h5 class='sectionTitle'>기타사항</h5>
							<table id='tbl_etc'>
								<tr>
									<th>취미</th><th>특기</th><th>종교</th><th>보훈대상</th>
								</tr>
								
								<tr>	
									<td>
										<input type='text' name='hobby' value='롤' />
									</td>
									<td>
										<input type='text' name='special' value='노래'/>
									</td>
									<td>
										<input type='text' name='religion' value='천주교' />
									</td>
									<td>
										<input type='radio' name='radioBoHun' value='1' />Y
										<input type='radio' name='radioBoHun' value='0' checked />N
									</td>
								</tr>
								
							</table>
							
			
						<div id='buttons'>
							<input type='reset' name='btnReset' value='Reset' />
							<input type='button' name='btnNext' value='저장하고 다음으로' />
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


