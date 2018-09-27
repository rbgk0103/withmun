<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
/*
.main{min-width:1100px; background-color:#d8d8d8;width:100%;margin-top:-15px;}
.left{margin-top:20px;float:left;width:22%;background-color:#FFFFFF;margin-right:20px;}
.content{margin-top:20px;float:left;width:76%;margin-bottom:20px;}
.content_first{height:600px;float:left;margin-right:18px;background-color:#FFFFFF;width:100%;}

#map{margin-top:10px;margin-left:10px;width:97.5%; height:87%;}
.line2{width:80%;height:1px;background-color:#7f7f7f;margin-top:5px;width:93%;}
*/
</style>
<div id="wrapper">
	<div class="container">
		<div class ="top">
			<a href="./index.jsp" >HOME</a>
			> <a href="./service_procedure.do" >Other</a>
			> <a href="./site_map.do" class="on">사이트맵</a>
		</div>
		<div class="toptit">
		    <h2><a href="./site_map.do">사이트맵</a></h2>
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
</script>
<!------------------------------------------------------------------->

<div class ="main">
		<div class="main_wrap">
	<%@ include file = "../include/left_about.jsp" %>
		<div class = "content" >			
			<div class ="content_second" style="margin-top:0">
				<div class="p_sit">
					<div class="article ecp_art site_map1">
						<h3><img src="./images/h3_site01.gif" alt="About 위드문" /></h3>
						<div class="list_menu">
							<ul>
								<li><a href="./greetings.do" >인사말</a></li>
								<li><a href="./philosophy.do" >경영이념</a></li>
								<li><a href="./location.do" >오시는 길</a></li>			
							</ul>
						</div>
					</div>
				
				
					<div class="article site_map2">
						<h3><img src="./images/h3_site02.gif" alt="일반행정" /></h3>
						<div class="list_menu">
							<ul>
								<li><a href="./incorporate.do" >번역</a></li>
								<li><a href="./land_compensation.do" >토지보상</a></li>
								<li><a href="./licensing.do" >사업 인허가</a></li>
								<li><a href="./immigration.do" >출입국관리업무</a></li>
								<li><a href="./suspension.do" >행정심판</a></li>
							</ul>
						</div>
					</div>
					<div class ="site_map_foot">
						<div class="article site_map3">
							<h3><img src="./images/h3_site03.gif" alt="외국어번역행정" /></h3>
					
							<div class="list_menu">
							    <h4> 기업 </h4>
								<ul>
								    <li><a href="./english_contract.do">영문계약서작성</a></li>
									<li><a href="./professional_translation.do">전문번역</a></li>
									<li><a href="./acting_translation.do">번역공증대행</a></li>
									<li><a href="./aposcertification.do">아포스티유 및 대사관 인증</a></li>
									<li><a href="./overseas.do">해외법인(지사/투자)설립</a></li>
											
								</ul><br />	<br />			
											
								<h4>개인 </h4>
								<ul>
								    <li><a href="./certificate.do">번역확인증명서</a></li>
									<li><a href="./general_translation.do">일반번역</a></li>
									<li><a href="./acting_translation_personal.do">번역공증대행</a></li>
									<li><a href="./aposcertification_genenal.do">아포스티유 및 대사관인증</a></li>
									<li><a href="./studying_abroad.do">유학 & 이민서류 관련</a></li>
								</ul>
					
					
							</div>
					
					
						</div>
					
					
					
					
					
						<div class="article site_map4">
							<h3><img src="./images/h3_site04.gif" alt="MY위드문" /></h3>
							<div class="list_menu">
								<ul>
									<li><a href="./service_procedure.do">서비스절차</a></li>
									<li><a href="./employment_notice.do">채용공고</a></li>
									<li><a href="./apply_enter.ap">입사지원</a></li>
									<li><a href="./list.bo">Q & A</a></li>
									<li><a href="./faq.do">F A Q</a></li>
									<li><a href="./site_map.do">사이트맵</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!--div class="article ecp_art">
						<h3><img src="/pc_html/images/guide/h3_site05.gif" alt="회사소개" /></h3>
						<div class="list_menu">
							<ul>
								<li><a href="<?php echo G5_URL ?>/page.php?url=greeting">인사말</a></li>
								<li><a href="<?php echo G5_URL ?>/page.php?url=history">연혁</a></li>
								<li><a href="<?php echo G5_URL ?>/page.php?url=business">사업영역</a></li>
								<li><a href="<?php echo G5_URL ?>/page.php?url=location">찾아오시는 길</a></li>
							</ul>
						</div>
					</div-->
				</div>


			</div>
	
		</div>
	</div>
</div>