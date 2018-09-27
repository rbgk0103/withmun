<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper">
   <div class="container">
      <div class ="top">
         <a href="./index.jsp" ">HOME</a>
         > <a href="./service_procedure.do" >Other</a>
         > <a href="./faq.do" class="on">F A Q</a>
      </div>
      <div class="toptit">
          <h2><a href="./faq.do">F A Q</a></h2>
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
<!-- style---------------------------------------------------------->
<style>
.content{
   background:#ffffff;
   padding:20px;
   
}
.panel-group{
   margin:-4px;
}
/****************************아코디언***************************************/
.panel-body{color:#666666;font-size:13px;line-height: 20px;}
.panel-title{padding:10px 0;}
.panel-title a{width: 100%; }

/*****************index*******************/
</style>
<!------------------------------------------------------------------>
         <div class ="main">
            <div class="main_wrap">
               <%@ include file = "../../include/left_other.jsp" %>
            
            <div class = "content">   
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
              <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                  <div class="panel-title">
                    <div data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                 	        아포스티유란?
                    </div>
                  </div>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                  <div class="panel-body">
                     한 국가의 문서가 다른 국가에서 인정받기 위해 확인을 받는 절차로 해외공관원(대사관)의 영사확인 절차에 대한 불편함을 해소하기 위해 
                     아포스티유 협약 가입국 간 추가적 확인없이 아포스티유 확인만으로 문서를 직접 사용할 수 있도록 인정하는 제도      
                 </div>
                </div>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                  <div class="panel-title">
                    <div class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                         대사관 영사확인이란?
                    </div>
                  </div>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                  <div class="panel-body">
                     한 국가의 문서가 다른 국가에서 인정을 받기 위해 문서접수국의 해외공간(대사관)에서 해당 문서에 대한 확인을 받는 절차      
                 </div>
                </div>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingThree">
                  <div class="panel-title">
                    <div class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                     외교부 영사확인이란?        
                  </div>
                  </div>
                </div>
                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                  <div class="panel-body">
                     각국 해외공간(대사관)에서 영사확인을 받기 전 해당 대사관 측에서 요청하는 절차로 우리나라 외교부의 영사확인 받는 절차      
                 </div>
                </div>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingFour">
                  <div class="panel-title">
                    <div class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                     대사관 영사확인을 위해서는 외교부 영사확인이 꼭 필요한가요?        
                  </div>
                  </div>
                </div>
                <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                  <div class="panel-body">
                     우리나라 발행 문서를 해외에서 사용할 경우 한국 주재의 해당 대사관에서 영사확인을 받아야 합니다. 이때 대사관은 먼저 우리나라 외교부의 영사확인을 받아오도록 요청하고 있어 외교부 영사확인은 필수 절차입니다.      
                 </div>
                </div>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingFive">
                  <div class="panel-title">
                    <div class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                     공문서가 아닌 사문서도 아포스티유 또는 영사확인이 가능한가요?        
                  </div>
                  </div>
                </div>
                <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
                  <div class="panel-body">
                     영문으로 발급 가능한 공문서의 경우 번역공증의 절차 없이 아포스티유 또는 영사확인이 가능한 것이 일반적입니다. 
                     국문 공문서 및 사문서의 경우에는 번역공증의 절차를 거쳐 아포스티유 또는 영사확인을 받을 수 있는 것이 일반적이지만 문서의 내용, 
                     대사관에서의 요청 따라 달라지는 경우가 있기 때문에 확실한 확인을 위해서는 당 사무소에 연락을 주시기 바랍니다.       
                 </div>
                </div>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingSix">
                  <div class="panel-title">
                    <div class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                     번역공증이란?        
                  </div>
                  </div>
                </div>
                <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
                  <div class="panel-body">
                     번역공증이란 일정한 자격이 있는 자가 공증인 앞에서 해당 문서의 원문과 번역본이 상이 없음을 확약하는 것을 말합니다.      
                 </div>
                </div>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingSeven">
                  <div class="panel-title">
                    <div class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
                     번역확인증명서란?        
                  </div>
                  </div>
                </div>
                <div id="collapseSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSeven">
                  <div class="panel-body">
                     국가공인 외국어 번역 행정사의 고유업무로 외국어 번역 행정사가 직접 번역을 하였고 해당 번역이 원문과 동일함을 인증하는 증명서를 말합니다.      
                 </div>
                </div>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingEight">
                  <div class="panel-title">
                    <div class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEight" aria-expanded="false" aria-controls="collapseE">
                     외국어번역 행정사 사무소와 일반 번역회사는 어떻게 다른거죠?        
                  </div>
                  </div>
                </div>
                <div id="collapseEight" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingEight">
                  <div class="panel-body">
                     외국어번역 행정사 사무소는 국가로부터 공인자격시험을 통해 법률지식 및 외국어능력을 공인받은 외국어번역행정사가 운영하는 사무소입니다. 
                     국가로부터 법률 및 외국어 지식과 능력에 대하여 공인받은 만큼 신뢰할 수 있는 번역 전문 사무소입니다.      
                 </div>
                </div>
              </div>
            </div>
         </div>
      </div>
   </div>