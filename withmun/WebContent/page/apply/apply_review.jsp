<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Calendar" %>

<div id="wrapper">
   <div class="container">
      <div class ="top">
         <a href="/" >HOME</a>
         > <a href="./service_procedure.do">Other</a>
         > <a href="./apply_enter.ap">입사지원</a>
         > <a href="./apply_preview.ap">입사지원서 미리보기</a>
      </div>
      
      <div class="toptit">
          <h2><a href="./apply_preview.ap">입사지원서 미리보기</a></h2>
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
   var f = document.frm_preview;
   
   // 자기소개 => 미리보기로 넘어올 때 메시지 뿌려줌
   if ( !('{$requestScope.msg}' == null) && !('${requestScope.msg}' == '')) {
      alert('${requestScope.msg}');
   }
   
   // [Print]버튼 클릭시
   
   
   // [Modify] 버튼 클릭시
   f.btnModify.onclick = function() {
      alert('Modify 버튼을 클릭하셨군!');
      f.action = './apply_modify.ap';
      f.submit();
   }
   
      
   // [Submit]버튼 클릭시 (이력서 검토완료 후 최종지원)   
   f.btnSubmit.onclick = function() {
      alert("[Submit]버튼을 클릭하셨군!");
      f.action = './apply_submit.ap';
      f.submit();
   }   
      
   
   
} // End of pageLoad()



</script>
<!------------------------------------------------------------------->
<style>

.content {
   width:100%;
}

#wrap_preview {
   text-align: left;
   padding: 10px;
   border: 1px solid gray;
   margin: 0 auto;
}
#pic {
   border: 1px solid black;
   background-image: url('http://via.placeholder.com/120x90');
   width: 120px;
   height: 90px;
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


#sign {
   text-align: right;
}

#buttons {
   margin-top: 30px;
   
   margin-ㄹttom: 20px;
   text-align: center;
}

</style>

<div class="main">
   <div class="main_wrap">
      <div class="content">
         <div class="content_second" style="width:100%;margin-top: 0; text-align: center">
            
            <!-- 여기에 내용을 넣는다 -->
            <div id='wrap_preview'>
               
                     <!-- 프로필 프리뷰 시작 -->
                     <div id='wrap_profile'>
                     <h1>입사지원서</h1>
                        <form name='frm_preview' method='post' encType='multipart/form-data' >
                           
                                                
                           <div id='div_photo'>
                           <img name='photo' id='photo' src='${photoS}' name='photo' width='90' height='120' />
                           <input type='file' name='file' id='file' />
                           </div>
                           
                           <h5 class='sectionTitle'>지원정보</h5>
                           <table>
                              <tr>
                                 <th>지원분야</th>
                                 <td><input type='text' name='field'  value='${prvVo.field}'  /><br></td>
                                 <th>이름</th>
                                 <td><input type='text' name='name' value='${prvVo.name}' /></td>   
                              </tr>   
                              <tr>
                                 <th>주민등록번호</th>
                                 <td><input type='text' name='jumin1' value='${prvVo.jumin1 }' size='6'/> -
                                     <input type='text' name='jumin2' value='${prvVo.jumin2 }' size='7'/></td>
                                 <th>E-Mail</th>
                                 <td><input type='email' name='email' value='${prvVo.email }' /></td>
                              </tr>
                              <tr>
                                 <th>암호</th>
                                 <td><input type='text' name='pwd' value='${prvVo.pwd }' /></td>
                                 <th>암호확인</th>
                                 <td><input type='text' name='pwdCheck' value='${prvVo.pwd }' /></td>
                              </tr>
                           </table>
                           
                           <h5 class='sectionTitle'>연락처</h5>
                           <table id='tbl_contact'>
                              <tr>
                                 <th>주소</th>
                                 <td colspan='5'><input type='text' name='addr' value='${prvVo.addr }' /></td>
                              </tr>
                              <tr>
                                 <th>우편번호</th>
                                 <td><input type='text' name='zipCode' value='${prvVo.zipCode }'/></td>
                                 <th>전화번호</th>
                                 <td>
                                    <input type='text' name='tel1' size='3' value='${prvVo.tel1 }' />-
                                    <input type='text' name='tel2' size='4' value='${prvVo.tel2 }'/>-
                                    <input type='text' name='tel3' size='4' value='${prvVo.tel3 }'/>
                                 </td>
                                 <th>휴대전화</th>
                                 <td>
                                    <input type='text' name='mobile1' size='3' value='${prvVo.mobile1 }' />-
                                    <input type='text' name='mobile2' size='4' value='${prvVo.mobile2 }'/>-
                                    <input type='text' name='mobile3' size='4' value='${prvVo.mobile3 }'/>
                                    
                                 </td>
                              </tr>
                           </table>
                           
                           
                           <h5 class='sectionTitle'>학력사항</h5>
                           <table id='tbl_study'>
                              <tr>
                              <th>기간</th><th>학교명      </th><th>전공</th><th>평점</th><th>졸업여부</th>
                              
                              <tr>
                                 <td><input type='date' name='highStart' value='${prvVo.highStart }'> -
                                 <input type='date' name='highFinish' value='${prvVo.highFinish }'></td>
                                 <td><input type='text' name='highName' value='${prvVo.highName }' size='6'/>고등학교</td>
                                 <td>-</td><td>- </td>
                                 
                                 
                                 <td>
                                 <c:choose>
                                    <c:when test="${prvVo.highJolUp eq '1' }">                        
                                       <input type='radio' name='radioHighJolUp' value='1' checked  />졸업
                                       <input type='radio' name='radioHighJolUp' value='0' />졸업예정
                                    </c:when>
                                    <c:otherwise>
                                       <input type='radio' name='radioHighJolUp' value='1'  />졸업
                                       <input type='radio' name='radioHighJolUp' value='0' checked />졸업예정
                                    </c:otherwise>
                                 </c:choose>
                                 </td>
                              </tr>
                              
                              <tr>
                                 <td><input type='date' name='colStart' value='${prvVo.colStart }'> -
                                 <input type='date' name='colFinish' value='${prvVo.colFinish }'></td>
                                 <td><input type='text' name='colName' size='6' value='${prvVo.colName }' />대학</td>
                                 <td><input type='text' name='colMajor' size='6' value='${prvVo.colMajor }'/></td>
                                 <td><input type='text' name='colGrade' size='6' value='${prvVo.colGrade }' /></td>
                                 
                                 <td>
                                 <c:choose>
                                    <c:when test="${prvVo.colJolUp eq '1' }">
                                       <input type='radio' name='radioColJolUp' value='1' checked />졸업
                                       <input type='radio' name='radioColJolUp' value='0 '/>졸업예정
                                    </c:when>
                                    <c:otherwise>
                                       <input type='radio' name='radioColJolUp' value='1'  />졸업
                                       <input type='radio' name='radioColJolUp' value='0 'checked />졸업예정
                                    </c:otherwise>
                                 </c:choose>
                                 </td>
                              </tr>
                              
                              <tr>
                                 <td><input type='date' name='univStart' value='${prvVo.univStart }'> -
                                 <input type='date' name='univFinish' value='${prvVo.univStart }'></td>
                                 <td><input type='text' name='univName' size='6' value='${prvVo.univStart }' />대학교</td>
                                 <td><input type='text' name='univMajor' size='6' value='${prvVo.univStart }' /></td>
                                 <td><input type='text' name='univGrade' size='6' value='${prvVo.univStart }' /></td>
                                 <td>
                                 <c:choose>
                                    <c:when test="${prvVo.univJolUp eq '1' }">
                                       <input type='radio' name='radioUnivJolUp' value='1' checked />졸업
                                       <input type='radio' name='radioUnivJolUp' value='0 '/>졸업예정
                                    </c:when>
                                    <c:otherwise>
                                       <input type='radio' name='radioUnivJolUp' value='1'  />졸업
                                       <input type='radio' name='radioUnivJolUp' value='0' checked />졸업예정
                                    </c:otherwise>
                                 </c:choose>
                                 </td>
                              </tr>
                              
                              <tr>
                                 <td><input type='date' name='gradStart' value='${prvVo.gradStart }'> -
                                 <input type='date' name='gradFinish' value='${prvVo.gradStart }'></td>
                                 <td><input type='text' name='gradName' size='6' value='${prvVo.gradStart }' />대학원</td>
                                 <td><input type='text' name='gradMajor' size='6' value='${prvVo.gradStart }' /></td>
                                 <td><input type='text' name='gradGrade' size='6'value='${prvVo.gradStart }' /></td>
                                 <td>
                                 <c:choose>
                                    <c:when test="${prvVo.gradJolUp eq '1' }">
                                       <input type='radio' name='radioGradJolUp' value='1' checked  />졸업
                                       <input type='radio' name='radioGradJolUp' value='0'   />졸업예정
                                    </c:when>
                                    <c:otherwise>
                                       <input type='radio' name='radioGradJolUp' value='1'  />졸업
                                       <input type='radio' name='radioGradJolUp' value='0' checked   />졸업예정
                                    </c:otherwise>
                                 </c:choose>
                                 </td>
                              </tr>
                           </table>
               
                           <h5 class='sectionTitle'>병역</h5>   
                           <table id='tbl_military'>
                              <tr>
                                 <th>군별</th><th>병과</th><th>계급</th><th>복무기간</th><th>제대구분</th><th>미필사유</th>
                              </tr>
                              <tr>
                                 <td><input type='text' name='gunByul' size='6' value='${prvVo.gunByul }' /></td>
                                 <td><input type='text' name='gunByung' size='6' value='${prvVo.gunByung }' /></td>
                                 <td><input type='text' name='gunGye' size='6' value='${prvVo.gunGye }' /></td>
                                 <td>
                                    <input type='date' name='gunStart' value='${prvVo.gunStart }' /> ~
                                    <input type='date' name='gunFinish' value='${prvVo.gunFinish }' />
                                 </td>
                                 <td>
                                 <c:choose>
                                    <c:when test="${prvVo.gunPil eq '1' }">
                                       <input type='radio' name='radioGunPil' value='1' checked   /> 필  
                                       <input type='radio' name='radioGunPil' value='0' /> 미필
                                    </c:when>
                                    <c:otherwise>
                                       <input type='radio' name='radioGunPil' value='1'  /> 필  
                                       <input type='radio' name='radioGunPil' value='0' checked /> 미필
                                    </c:otherwise>
                                 </c:choose>                                 

                                 
                                 
                                 </td>
                                 <td><input type='text' name='gunMiPilWhy' size='10' value='${prvVo.gunMiPilWhy }' /></td>
                              </tr>               
                           </table>
                           
                           <h5 class='sectionTitle'>외국어/자격면허</h5>
                           <table id='tbl_lang'>
                              <tr>
                                 <th>외국어시험명</th><th>공인점수</th><th>시험일</th>
                              </tr>
                              <tr>
                                 <td><input type='text' name='lang1Name' size='6' value='${prvVo.lang1Name }'/></td>
                                 <td><input type='text' size='3' name='lang1Score' value='${prvVo.lang1Score }'/>점</td>
                                 <td><input type='date' name='lang1Date' value='${prvVo.lang1Date }' /></td>
                                 
                              </tr>
                              <tr>
                                 <td><input type='text' name='lang2Name' size='6' value='${prvVo.lang2Name }'/></td>
                                 <td><input type='text' size='3' name='lang2Score' value='${prvVo.lang2Score }' />점</td>
                                 <td><input type='date' size='3' name='lang2Date' value='${prvVo.lang2Date }'/></td>
                              </tr>
                           </table>      
                           
                           <table id='tbl_license'>
                              <tr>
                                 <th>자격명</th><th>취득일</th><th>시행처</th>
                              </tr>
                              <tr>
                                 <td><input type='text' name='license1Name' value='${prvVo.license1Name }'/></td>
                                 <td><input type='date' name='license1Date' value='${prvVo.license1Date }' /></td>
                                 <td><input type='text' name='license1Org' value='${prvVo.license1Org }' /></td>                  
                              </tr>
                              <tr>
                                 <td><input type='text' name='license2Name' value='${prvVo.license2Name }'/></td>
                                 <td><input type='date' name='license2Date' value='${prvVo.license2Date }' /></td>
                                 <td><input type='text' name='license2Org' value='${prvVo.license2Org }'/></td>   
                              </tr>
                           </table>   
                           
                           <h5 class='sectionTitle'>동아리 및 사회봉사활동</h5>
                           <table id='tbl_activity'>
                              <tr>
                                 <th>활동기관(단체)</th><th>활동기간</th><th>활동내용</th>
                              </tr>
                              <tr>
                                 <td><input type='text' name='activity1Org' size='10' value='${prvVo.activity1Org }'></td>
                                 <td>
                                    <input type='date' name='activity1Start' value='${prvVo.activity1Start }' /> ~
                                    <input type='date' name='activity1Finish' value='${prvVo.activity1Finish }' />
                                 </td>
                                 <td>
                                 <input type='text' name='activity1Content' value='${prvVo.activity1Content }'/>
                                 </td>
                              </tr>
                              <tr>
                                 <td><input type='text' name='activity2Org' size='10' value='${prvVo.activity2Org }'></td>
                                 <td>
                                    <input type='date' name='activity2Start' value='${prvVo.activity2Start }' /> ~
                                    <input type='date' name='activity2Finish' value='${prvVo.activity2Finish }' />
                                 </td>
                                 <td>
                                 <input type='text' name='activity2Content' value='${prvVo.activity2Content }'/>
                                 </td>
                              </tr>
                           </table>
                           
                           
                           <h5 class='sectionTitle'>가족사항</h5>
                           <table id='tbl_family'>
                              <tr>
                                 <th>관계</th><th>성명</th><th>생년월일</th><th>최종학력</th><th>직업</th><th>회사명</th><th>직위</th><th>동거여부</th>
                              </tr>
                              <tr>
                                 <td><input type='text' name='family1Rel'       value='${prvVo.family1Rel }'           size='4' /></td>
                                 <td><input type='text' name='family1Name'       value='${prvVo.family1Name }'          size='4' /> </td>
                                 <td><input type='date' name='family1Birth'       value='${prvVo.family1Birth }'            />   </td>
                                 <td><input type='text' name='family1Academic'    value='${prvVo.family1Academic }'             size='6' /></td>
                                 <td><input type='text' name='family1Job'        value='${prvVo.family1Job }'          size='6'></td>
                                 <td><input type='text' name='family1Company'    value='${prvVo.family1Company }'             size='6'></td>
                                 <td><input type='text' name='family1Position'   value='${prvVo.family1Position }'             size='6'></td>
                                 <td>
                                 <c:choose>
                                    <c:when test="${prvVo.family1Livewith eq '1' }">
                                       <input type='radio' name='radioFamily1Livewith' value='1' checked />Y
                                       <input type='radio' name='radioFamily1Livewith' value='0' />N
                                    </c:when>
                                    <c:otherwise>
                                       <input type='radio' name='radioFamily1Livewith' value='1' />Y
                                       <input type='radio' name='radioFamily1Livewith' value='0' checked />N
                                    </c:otherwise>
                                 </c:choose>                                    
                                 
                                 
                                 
                                 </td>
                              </tr>
                              <tr>
                                 <td><input type='text' name='family2Rel'       value='${prvVo.family2Rel }'                     size='4' /></td>
                                 <td><input type='text' name='family2Name'       value='${prvVo.family2Name }'                 size='4' /> </td>
                                 <td><input type='date' name='family2Birth'      value='${prvVo.family2Birth }'            ></td>
                                 <td><input type='text' name='family2Academic'    value='${prvVo.family2Academic }'            size='6' /></td>
                                 <td><input type='text' name='family2Job'        value='${prvVo.family2Job }'                size='6'></td>
                                 <td><input type='text' name='family2Company'    value='${prvVo.family2Company }'                size='6'></td>
                                 <td><input type='text' name='family2Position'    value='${prvVo.family2Position }'          size='6'></td>
                                 <td>
                                 <c:choose>
                                    <c:when test="${prvVo.family2Livewith eq '1' }">
                                       <input type='radio' name='radioFamily2Livewith' value='1' checked  />Y
                                       <input type='radio' name='radioFamily2Livewith' value='0' />N
                                    </c:when>
                                    <c:otherwise>
                                       <input type='radio' name='radioFamily2Livewith' value='1' />Y
                                       <input type='radio' name='radioFamily2Livewith' value='0' checked />N
                                    </c:otherwise>
                                 </c:choose>                                    
                                 
                                 </td>
                              </tr>
                              <tr>
                                 <td><input type='text' name='family3Rel'      value='${prvVo.family3Rel }'                      size='4' /></td>
                                 <td><input type='text' name='family3Name'       value='${prvVo.family3Name }'                    size='4' /> </td>
                                 <td><input type='date' name='family3Birth'      value='${prvVo.family3Birth }'            ></td>
                                 <td><input type='text' name='family3Academic'   value='${prvVo.family3Academic }'                size='6' /></td>
                                 <td><input type='text' name='family3Job'       value='${prvVo.family3Job }'                 size='6'></td>
                                 <td><input type='text' name='family3Company'    value='${prvVo.family3Company }'                size='6'></td>
                                 <td><input type='text' name='family3Position'    value='${prvVo.family3Position }'          size='6'></td>
                                 <td>
                                 <c:choose>
                                    <c:when test="${prvVo.family3Livewith eq '1' }">
                                       <input type='radio' name='radioFamily3Livewith' value='1' checked  />Y
                                       <input type='radio' name='radioFamily3Livewith' value='0' />N
                                    </c:when>
                                    <c:otherwise>
                                       <input type='radio' name='radioFamily3Livewith' value='1' />Y
                                       <input type='radio' name='radioFamily3Livewith' value='0' checked />N
                                    </c:otherwise>
                                 </c:choose>   
                                 </td>
                              </tr>
                              <tr>
                                 <td><input type='text' name='family4Rel'      value='${prvVo.family4Rel }'                   size='4' /></td>
                                 <td><input type='text' name='family4Name'      value='${prvVo.family4Name }'               size='4' /> </td>
                                 <td><input type='date' name='family4Birth'      value='${prvVo.family4Birth }'         ></td>
                                 <td><input type='text' name='family4Academic'   value='${prvVo.family4Academic }'                size='6' /></td>
                                 <td><input type='text' name='family4Job'        value='${prvVo.family4Job }'                size='6'></td>
                                 <td><input type='text' name='family4Company'    value='${prvVo.family4Company }'             size='6'></td>
                                 <td><input type='text' name='family4Position'    value='${prvVo.family4Position }'          size='6'></td>
                                 <td>
                                 <c:choose>
                                    <c:when test="${prvVo.family4Livewith eq '1' }">
                                       <input type='radio' name='radioFamily4Livewith' value='1' checked  />Y
                                       <input type='radio' name='radioFamily4Livewith' value='0' />N
                                    </c:when>
                                    <c:otherwise>
                                       <input type='radio' name='radioFamily4Livewith' value='1'  />Y
                                       <input type='radio' name='radioFamily4Livewith' value='0' checked  />N
                                    </c:otherwise>
                                 </c:choose>                                 
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
                                    <input type='text' name='hobby' value='${prvVo.hobby }' />
                                 </td>
                                 <td>
                                    <input type='text' name='special' value='${prvVo.special }'/>
                                 </td>
                                 <td>
                                    <input type='text' name='religion' value='${prvVo.religion }' />
                                 </td>
                                 <td>
                                 <c:choose>
                                    <c:when test="${prvVo.boHun eq '1' }">
                                       <input type='radio' name='radioBoHun' value='1' checked />Y
                                       <input type='radio' name='radioBoHun' value='0'  />N
                                    </c:when>
                                    <c:otherwise>
                                       <input type='radio' name='radioBoHun' value='1'  />Y
                                       <input type='radio' name='radioBoHun' value='0' checked />N
                                    </c:otherwise>
                                 </c:choose>                                    
                                 </td>
                              </tr>
                              
                           </table>
                           
               
                     </div>
                     <!-- 프로필 프리뷰 끝 -->
               
                     <!-- 자기소개 프리뷰 시작 -->
                     <div id='wrap_introduce'>
                        <h1>자기소개</h1>
                           <h5 class='taTitle'>성장과정(1,000자 이내)</h5>
                           <textarea name='sungJang' rows='8' cols='137'>
                           ${prvVo.sungJang }
                           </textarea>
                              
                           <h5 class='taTitle'>성격 및 장단점(1,000자 이내)</h5>            
                           <textarea name='charact' rows='8' cols='137'>
                           ${prvVo.charact }
                           </textarea>
                           
                           <h5 class='taTitle'>지원동기(1,000자 이내)</h5>
                           <textarea name='motive' rows='8' cols='137'>
                           ${prvVo.motive }
                           </textarea>
                           
                           <h5 class='taTitle'>입사 후 포부(1,000자 이내)</h5>
                           <textarea name='future' rows='8' cols='137'>
                           ${prvVo.future }
                           </textarea>
                     </div>
                     <!-- 자기소개 프리뷰 끝 -->
                        
                     <!-- 하부  시작 -->   
                     <%
                        Calendar cal = Calendar.getInstance();
                     %>
                     
                     <div id='sign'>
                        <p>지원서의 모든 기재사항은 사실과 다름이 없음을 확인합니다. </p>
                        <p><%=cal.get(Calendar.YEAR)%>      년
                           <%=cal.get(Calendar.MONTH)+1%>   월
                           <%=cal.get(Calendar.DATE)%>      일 </p>
                        <p>지원자:   ${prvVo.name} </p>
                     </div>
                        
            
                     <div id='buttons'>
                        <input type='button' name='btnPrint' value='Print' />
                        <input type='button' name='btnModify' value='Modify' />
                        <input type='button' name='btnSubmit' value='Submit' />
                     </div>         
                     <!-- 하부 끝 -->   
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

