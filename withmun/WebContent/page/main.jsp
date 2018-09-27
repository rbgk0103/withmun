<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#main_bn .bn_ul li{height:460px;float: left;}
</style>
<!-- 콘텐츠 시작 { -->
<div id="idx_wrapper" style="background-color:#f1f1f1;">



 <!-- #mainvisual --> 
	<div id="mainvisual">
		<div class="mainthumwrap">		
			<ul class="mainthum">
			<li><img src="./images/common/thum_on.png"  alt="1" /></li>
			<li><img src="./images/common/thum_off.png" alt="2" /></li>
			<li><img src="./images/common/thum_off.png" alt="3" /></li>
			</ul>
		</div>
		<div class="visWrap">
				<!-- //#v1 -->
				<div class="v1 bg1">
					<ul class="v1motion">
						<li class="v1text visTxt">
						<ul>
							<li><a href="#">Trust & Sharing</a></li>
							<li><a href="#">신뢰와 나눔속에</a></li>	
							<li><a href="#">사랑받는 기업으로</a></li>
						</ul>
						</li>
					</ul>
				</div>
				<!-- //#v1 -->


				<!-- //#v2 -->
				<div class="v1 bg2" style="display:none;">
					<ul class="v1motion">
						<li class="v1text visTxt">
						<ul>
							<li><a href="#">고객분의 잠재적인 니즈(Needs)까지</a></li>
							<li><a href="#">최선 그리고 최고의</a></li>	
							<li><a href="#">파트너가 되겠습니다.</a></li>		
						</ul>
						</li>
					</ul>
				</div>
				<!-- //#v2 -->


				<!-- //#v3 -->
				<div class="v1 bg3" style="display:none;">
						<ul class="v1motion">
						<li class="v1text visTxt">
						<ul>
							<li><a href="#">Ideal and Professional Solution</a></li>
							<li><a href="#">전문적이고 이상적인</a></li>	
							<li><a href="#">행정서비스 솔루션 제공</a></li>
						</ul>
						</li>
					</ul>
				</div>
				<!-- //#v3 -->
		   </div>
	</div>
<!-- //#mainvisual -->
<script type="text/javascript">
var visNum = 0, visOldNum = 0;
$(function(){
	$(".visWrap").children("div").eq(visNum).find(".visImg").fadeIn("slow");
	for(var i = 0; i < $(".visWrap").children("div").eq(visNum).find(".visTxt").find("li").size(); i++){
		$(".visWrap").children("div").eq(visNum).find(".visTxt").find("li").eq(i).delay(200*(1+i)).animate({
			"margin-left":0
		},function(){
			if($(this).index() == $(".visWrap").children("div").eq(visNum).find(".visTxt").find("li").size() - 1){
				visAuto = setTimeout(visAdd,4500);
				$(".mainthum").find("li").bind("click",function(){
					if($(this).index() != visNum){
						visNum = $(this).index();
						visAct();
					}
				})
			}
		});
	}
})
function visAdd(){
	visNum++;
	if(visNum >= $(".visWrap").children("div").size()){
		visNum = 0;
	}
	visAct();
}
function visAct(){
	clearTimeout(visAuto);
	$(".mainthum").find("li").unbind("click");
	// 이미지를 OFF에서 on으로 변경한다
	$(".mainthum").find("li").eq(visNum).children().attr("src", $(".mainthum").find("li").eq(visNum).children().attr("src").replace(/_off/gi, "_on"));
	$(".mainthum").find("li").eq(visOldNum).children().attr("src", $(".mainthum").find("li").eq(visOldNum).children().attr("src").replace(/_on/gi, "_off"));  
     
	 // 이미지를 텍스트 처리를 할려고 함 어렵네...



	$(".visWrap").children("div").eq(visOldNum).fadeOut();
	$(".visWrap").children("div").eq(visNum).fadeIn("",function(){
		$(".visWrap").children("div").eq(visNum).find(".visImg").fadeIn("slow");
		for(var i = 0; i < $(".visWrap").children("div").eq(visNum).find(".visTxt").find("li").size(); i++){
			$(".visWrap").children("div").eq(visNum).find(".visTxt").find("li").eq(i).delay(200*(1+i)).animate({
				"margin-left":0
			},function(){
				if($(this).index() == $(".visWrap").children("div").eq(visNum).find(".visTxt").find("li").size() - 1){
					$(".visWrap").children("div").eq(visOldNum).find(".visImg").hide();
					$(".visWrap").children("div").eq(visOldNum).find(".visTxt").find("li").css("margin-left",40);
					visOldNum = visNum;
					$(".mainthum").find("li").bind("click",function(){
						if($(this).index() != visNum){
							visNum = $(this).index();
							visAct();
						}
					})
					visAuto = setTimeout(visAdd,4500);
				}
			});
		}
	})
}
</script>



     <div id="idx_container">


        <a href="./licensing.do">
		<div id="idx_container_first">
			<div id ="idx_container_first_up">
				<div id ="idx_container_first_up_color">
					<p>사업 인허가</p>
				</div>
				<div id ="idx_container_first_up_img">
					<img src="./images/newmain_img1.jpg" alt="">
				</div>
				<div id ="idx_container_first_up_color_mini">
					<p>사업 인허가</p>
				</div>
			</div>
			<div id = "idx_container_first_down">
				<p>&nbsp;&nbsp;화장품제조업(제조판매업), 민간자격등록, 식품제조업, 개발행위허가 등의 사업을 하기 위해서는 인가 또는 허가를 필요로 하며, 사업의 종류에 따라 필수 요건을 갖추어야 합니다.</p>
				<p>위드문 인터내셔널은 해당 사업인허가를 위해 알아야할 절차와 서류준비, 법령에서...</p>
			</div>

		</div>
		</a>


       <a href="./immigration.do">
		<div id="idx_container_second" >
			<div id="idx_container_second_up">
				<img src="./images/newmain_img2.jpg" alt="">
			</div>
			<div id="idx_container_second_down">
				외국인투자기업(D-8)
			</div>
			<div id="idx_container_second_down_text">
				<span>「외국인투자촉진법」에 따른 외국인투자기업<br> 대한민국 법인의 경영 관리 또는 생산 기술 분야에 종사하려는 필수 전문인...</span>
			</div>
	
		</div>
        </a>

		<div id="idx_container_third" >
			<div id="idx_container_third_color">
				<div id="idx_container_third_head">
					<h3 style ="">Quick Menu 
					<span style="">>>></span></h3>
				</div>

				<div id="idx_container_third_line"></div>
                <a href="./professional_translation.do">
					<div class="idx_container_third_photo">
						<img src="./images/new_main_but12.jpg">
					</div>
					<div class ="idx_container_third_text">
						전문번역
					</div>
				</a>
				<a href="./service_procedure.do">
					<div class="idx_container_third_photo">
						<img src="./images/newmain_img5.jpg">
					</div>
					<div class ="idx_container_third_text">
						번역서비스절차 <span style="font-size:11.5px;">(외국어번역행정사업부)</span>
					</div>
				</a>
				<a href="./employment_notice.do">
					<div class="idx_container_third_photo">
						<img src="./images/newmain_img6.jpg" alt="">
					</div>
					<div class ="idx_container_third_text">
						채용공고
					</div>
				</a>
	
			</div>
		</div>
		
		<style>

		</style>
		<a href="./acting_translation.do">
		<div id="idx_container_fourth" >
			<div id ="idx_container_fourth_up">
				<img src="./images/newmain_img3.jpg"" alt="">
			</div>	
			<div id="idx_container_fourth_down">
				번역공증대행
			</div>
			<div id = "idx_container_fourth_down_text">
			    <span>&nbsp;&nbsp;번역문서의 진실성과 관련하여 일정한 자격이 있는 자(공인외국어번역행정사 등)가 본 번역문이 원문과 상위 없음을 진술 및 확약하고 이에 공증인이 인증하...</span>				
			</div>
		</div>
        </a>

       <a href="./overseas.do">
		<div id="idx_container_fifth" >
			<div id="idx_container_fifth_up">
				<div id="idx_container_fifth_up_color">
					<p style="">해외법인(지사/투자)설립</p>
				</div>
				<div id="idx_container_fifth_up_img">
					<img src="./images/newmain_img4.jpg"" alt="">
				</div>
				<div id ="idx_container_fifth_up_color_mini">
					<p>사업 인허가</p>
				</div>
			</div>
			<div id="idx_container_fifth_down">
				&nbsp;&nbsp;우리나라는 수출주도형 경제성장정책(모델)에 의한 정책적인 관리와 지원으로 고도의 성장을 거듭해가고 있습니다.<br>
				부족자원이 빈약하고 대한민국 시장 규모가 협소한 우리나라의 경제현실상 당연하고 필연적인 선택이...
			</div>
		</div>
		</a>

	
	
	 </div>
</div>