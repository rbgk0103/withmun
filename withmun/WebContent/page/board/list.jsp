<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="wrapper">
	<div class="container">
		<div class="top">
			<a href="/">HOME</a> > <a href="./service_procedure.do">Other</a> > 
			<a href="./list.bo">Q & A</a>
		</div>
		<div class="toptit">
			<h2>
				<a href="./list.bo">Q & A</a>
			</h2>
			<p>최상의 상품제공 및 서비스를 통하여 고객님께서 다시 찾으실 수 있도록 최선을 다하겠습니다.</p>
		</div>
	</div>
</div>
<!------------------------------------------------------------------->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
   $(document).ready(function() {
      $(".jtoggle_up").click(function() {
         $(".toggle_menu").slideDown();
         $(".jtoggle_down").css("display", "block");
         $(".jtoggle_up").css("display", "none");
      });
      $(".jtoggle_down").click(function() {
         $(".toggle_menu").slideUp();
         $(".jtoggle_down").css("display", "none");
         $(".jtoggle_up").css("display", "block");
      });

      $(".jtoggle_up2").click(function() {
         $(".toggle_menu2").slideDown();
         $(".jtoggle_down2").css("display", "block");
         $(".jtoggle_up2").css("display", "none");
      });
      $(".jtoggle_down2").click(function() {
         $(".toggle_menu2").slideUp();
         $(".jtoggle_down2").css("display", "none");
         $(".jtoggle_up2").css("display", "block");
      });
   });
</script>
<!------------------------------------------------------------------->
<style>
#btnPage:hover, #btnPage:focus {
	border: 1px solid #0e3e7d;
	background-color: #0e3e7d;
	color: #fff;
}
</style>
<div class="main">
	<div class="main_wrap">
		<%@ include file="../../include/left_other.jsp"%>
		<div class="content">
			<div class="container_list">
				<section class="subContents">
					<section class="contents">
					<section class="con">
						<form id="frontBoardVo" name="frontBoardVo" method="post">
							<section class="simplecomment write">
								<strong>궁금한 점 물어봐주세요.</strong>
								<strong_qna_id>이름</strong_qna_id>
									<input type='text' name='qna_name' class='form-control' id='list_id' />
								<strong_qna_pw>PW</strong_qna_pw>
									<input type='password' name='qna_pwd' class='form-control' id='list_pw' size=10px />
									<div class="remaining">
										<textarea rows="3" class='form-control' cols="50" name="document" id="document" onkeyup="chkByte(this,300)"></textarea>
										<input type="button" value="작성" onclick="writeBox()" /> 
										<input type='hidden' name='nowPage' value='${empty param.nowPage ? 1 : param.nowPage }' />
									</div>
							</section>
						</form>
						<div id='list_word_count'>
							<input type="text" id="writeNow" value="0" readOnly style="border: 0; width: 21px; text-align: right; height: 17px;" />
							/300자
						</div>
						<p class="simplecomment state">
							<span>ㆍ</span> <strong>${dao.totSize}</strong>개의 게시물이 있습니다.
						</p>
					</section>
					</section>
				</section>
			</div>

			<!-- 작성글 and 답변 -->
			<c:forEach var="list" items="${list }">
				<c:if test="${list.reply eq 1 or list.reply eq 2 }">
					<ul class="simplecomment">
						<li>
							<div class="reply_div">
								<div>
									<strong>${list.name }</strong> 
									<span class="bar">|</span> 
									<span class="date">${list.bdate }</span>
								</div>
								<p style="width: 88%;">
									${list.doc }
								</p>
								<div class="btn">
									<c:choose>
										<c:when test="${empty id}">
										</c:when>
										<c:when test="${list.reply eq 2}">
											<strong>답변 완료</strong>
										</c:when>
										<c:otherwise>
											<input type='button' class="reply"
												onclick='reply_show(${list.serial})' value='답변'>
										</c:otherwise>
									</c:choose>
									<input type='button' class="delete" onclick='list_delete(${list.serial})' value='삭제'>
								</div>
								<input type='hidden' name='hidden_serial' value='${list.serial }' /> 
								<input type='hidden' name='hidden_reply' value='${list.reply }' />

								<!-- 답변 내용 -->
								<div class="hidden_reply" id="hidden_reply${list.serial }" style="display: none;">
									<textarea rows="2" cols="50" id="reply_ta${list.serial }" name="reply_ta${list.serial }"></textarea>
									<p>
										<input type='button' onclick='list_reply(${list.serial})' value='등 록'> 
										<input type='button' onclick='list_reply_close(${list.serial})' value='닫  기'>
									</p>
								</div>
							</div>
						</li>
					</ul>
				</c:if>
				<c:if test="${list.reply eq 3 }">
					<div class="reply" style="background-color: #CCEEFF;">
						<div>
							<strong>
							<span class="glyphicon glyphicon-share-alt reply_icon" ></span>관리자
							</strong> 
							<span class="bar">|</span> 
							<span class="date">${list.bdate }</span>
						</div>
						<div class="reply_text">
							<p>${list.doc }</p>
						</div>
						<c:if test="${not empty id}">
							<div class='btn_reply'>
								<input type='button' class="reply" onclick='list_delete(${list.serial})' value='삭제'>
							</div>
						</c:if>
					</div>
				</c:if>
			</c:forEach>
			<!-- 답변 끝 -->
			<form name='list_frm'>
				<input type='hidden' name='nowPage' value='${dao.nowPage}' /> 
				<input type='hidden' name='hidden_serial' /> \
				<input type='hidden' name='hidden_prompt' /> 
				<input type='hidden' name='hidden_reply_ta' />
			</form>

			<!-- 페이징 -->
			<div id='buttons'>
				<c:if test='${dao.nowPage>1}'>
					<input type='button' value='맨첨' onclick='movePage(1)' id='btnPage' class='buttonP' />
					<input type='button' value='이전' onclick='movePage(${dao.nowPage-1 })' id='btnPage' class='buttonP' />
				</c:if>
				<c:forEach var='p' begin='${dao.startPage }' end='${dao.endPage}'>
					<c:set var='here' value='' />
					<c:if test='${p == dao.nowPage }'>
						<c:set var='here' value="here" />
					</c:if>
					<input type='button' value='${p }' class='${here }' onclick='movePage(${p})' id='btnPage' />
				</c:forEach>
				<c:if test='${dao.nowBlock < dao.totBlock}'>
					<input type='button' value='다음' onclick='movePage(${dao.endPage+1})' id='btnPage' class='buttonP' />
					<input type='button' value='맨끝' onclick='movePage(${dao.totPage})'   id='btnPage' class='buttonP' />
				</c:if>
			</div>
			<form name='list_find'>
				<fieldset class="search2">
					<input type="text" id='list_findStr' class="form-control" name="findStr" value="${param.findStr }" 
						title="검색어 입력" onkeydown="if(event.keyCode==13){return false;}" /> 
					<input type="submit" id='list_submit' class="qna_submit btn btn-primary btn-sm" name="findFind" value='검색' />
				</fieldset>
			</form>
			
			<!-- 공백 알림  script -->
<script>
function writeBox(){
  
   ff = document.frontBoardVo;
   
   ff.action = "insert.bo";
   ff.submit(); 
       
}       

// 페이징 script 

document.frontBoardVo.onsubmit = function(){
   var ff = document.frmList;
   
   ff.submit();
}

function movePage(nowPage){
   var ff = document.frontBoardVo;
   ff.nowPage.value = nowPage;
   ff.action='list.bo?nowPage='+nowPage;
   ff.submit();
}



//  답글 script  

var ff = document.list_frm;
function reply_show(serial){
   document.getElementById("hidden_reply"+serial).style.display='block';
}

function list_reply_close(serial){
   document.getElementById("hidden_reply"+serial).style.display='none';
}

function list_reply(serial){
   ff.hidden_serial.value = serial;
   var text = $("textarea#reply_ta"+serial).val();
   ff.hidden_reply_ta.value = text;
   
   ff.action = 'reply.bo';
   ff.submit();
}

// 삭제script 
function list_delete(serial){
   var ff = document.list_frm;
   ff.hidden_serial.value = serial;
   var prom = prompt('비밀번호를 입력해주세요.','PassWord');
   ff.hidden_prompt.value = prom;
   ff.action = 'delete.bo';
   ff.submit();
}   
   
// 실시간 문자수 script 

function chkByte(name, msgMax) {

var msgList = name.value;  // 글자가 입력되는 이벤트가 발생되는 value 값
var msgListLength = msgList.length;  // 입력 되는 글자의 전체 길이

var limitSize = msgMax;  // 제한 할 글자 길이
var charOne = "";  // 한 글자씩 검사하기 위한 변수
var charByte = 0;  // 입력 되고 있는 문자의 길이(바이트) 를 저장할 변수
var msgLen = 0;  // 입력 내용을 담아 subString 할 변수
var msgLast = "";  // 글자수가 초과 할 경우, 제한 할 마지막 글자 까지 보여준다
 
for(var i = 0; i < msgListLength; i++) {  // 입력 되고 있는 글자의 전체길이를 루프를 돈다.
  charOne = msgList.charAt(i);  // 한글자씩 읽음
 
// 한글은 2byte 이므로, 한글이 입력 되고 있을 경우 2를 더한다.
if(escape(charOne).length > 4) {
  charByte += 1;
 }  else {
  charByte +=1 ;  // 그 외에 경우에는 1byte. 1을 더한다.
} 
 
if(charByte <= limitSize) {  // 전체 크기가 제한 글자 길이를 넘지 않는다면..
 msgLen = i + 1;
 	}
}
 
if(charByte > limitSize) {
 alert(limitSize + " 글자를 초과 입력 할 수 없습니다.");
 msgLast = msgList.substr(0, msgLen);
 name.value = msgLast;
 charByte = limitSize;
}
 
 document.getElementById('writeNow').value = charByte;
 
}
</script>

		</div>
	</div>
</div>