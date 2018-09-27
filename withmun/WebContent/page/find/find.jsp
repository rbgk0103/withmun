<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="wrapper">
	<div class="container">
		<div class ="top">
			<a href="/" >HOME</a>

			> <a href="./find.fd" class="on">검색</a>
		</div>
		<div class="toptit">
		    <h2><a href="./acting_translation_personal.do">검 색</a></h2>
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
<style>

</style>

<div class ="main">
	<div class="main_wrap">
	<%@ include file = "../../include/left_search.jsp" %>		
		<div class = "content">			

			<c:choose>
				<c:when test = "${0 eq count }">
				<div class=" content_not_find" >
					<div id="content_not_find_head">
					검색하신  '${findStr}' 과(와) 일치하는 문서를 찾을수 없습니다.
					</div>
					<div id="content_not_find_text" >
					<p>제안</p>
					<p>-모든 단어의 철자가 맞는지 확인해주세요.</p>
					<p>-다른 키워드를 입력해주세요.</p>
					<p>-보다 일반적인 키워드로 다시 검색해 보십시오.</p>
					</div>
				</div>
				</c:when>
				<c:otherwise>
				<div id ="content_head">
					<span id = "content_head_text">${count } 건의 검색 결과 : ${findStr }</span>
				</div>
				</c:otherwise>
			</c:choose>
		</div>
	
	
		<div class = "content">			
			<c:forEach var = "i" items="${list }">
			<a href="./${i.page }.do">
				<div class ="content_find">
					<div class="col-xs-12" id="content_find_div">
						<div class="col-xs-5" id = "content_find_img">
							<img src="${i.img}">
						</div>
						<div class="col-xs-7" id="content_find_text">
							<p class="content_find_text_pagename">${i.pagename }</p>
							<p class="content_find_text_group">${i.grp }</p>
							<p class="content_find_text_oneline">${i.oneline }</p>
						</div>
					</div>
				</div>
			</a>
			</c:forEach>

		</div>
	</div>
</div>