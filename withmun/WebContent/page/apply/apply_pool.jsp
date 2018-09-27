<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="wrapper">
   <div class="container">
      <div class ="top">
         <a href="/" ">HOME</a>
         > <a href="./service_procedure.do" >Other</a>
         > <a href="./apply_enter.ap" >입사지원</a>
         > <a href="./apply_pool.ap" class="on">입사지원서 Pool(관리자용)</a>
      </div>
      <div class="toptit">
          <h2><a href="./apply_pool.ap">입사지원서 Pool(관리자용)</a></h2>
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
function go_review(aNo){
	   var ff = document.apply_frm;
	   ff.aNo_review.value = aNo;
	   
	   alert('aNo_review.value: ' + aNo);
	   
	   ff.action = 'apply_review.ap';
	   ff.submit();
	}

function delEmail(email){   
   var ff = document.apply_frm;
   
   if(confirm('정말 삭제 하시겠습니까?') == true){ 
      alert('삭제되었습니다.'); 
      ff.email_del.value = email;
      }
   
   ff.action = 'delete.ap';
   ff.submit();
   
}

</script>
<style>
table {
   margin: 0 auto;
   margin-top: 10px;
   margin-bottom: 10px;
}

th {
   background-color: skyblue;
   text-align:center;
   
}
th, td {
   border: 1px solid black;
}
#wrap_pool {
   pading: 10px;
}
#serial{}
#apply_field{}
#apply_date{}
#name{}
#eamil{}
#check{}
#delete{}

</style>

<!------------------------------------------------------------------->

<div class ="main">
   <div class="main_wrap">
   <%@ include file = "../../include/left_other.jsp" %>
      <div class = "content" style="margin-top:0;text-align:center">         
         <div class ="content_second" style="margin-top:0;text-align:center">                     
            <!-- 여기에 내용을 넣는다 -->
            <div id='wrap_pool'>
               <div id='pool_list'>
               
			<form name = 'apply_frm' method = 'post' id = 'apply_frm'>

                  <p>입사지원서 Pool(관리자용 목록)</p>

                  <table id='table_list'>
                     <tr>
                        <th id= "serial" style="width:100px;">No</th>
                        <th id ="apply_field"style="width:150px;">지원분야</th>
                        <th id ="apply_date"style="width:150px;">지원날짜</th>
                        <th id ="name"style="width:150px;">이름</th>
                        <th id ="email"style="width:150px;">E-mail</th>
                        <th id ="check"style="width:100px;">검토여부</th>
                        <th id ="delete"style="width:100px;">삭제</th>
                     </tr>
               <c:forEach var="list" items='${list }'>
                     <tr>
                        <td><a href = "apply_review.ap" onclick = "go_review(${list.aNo})">${list.aNo }</a></td>
                        <td>${list.field }</td>
                        <td>${list.applyDate }</td>
                        <td>${list.name }</td>
                        <td>${list.email }</td>
                        <c:choose>
                           <c:when test="${list.review eq 1}">
                        <td>확인</td>
                           </c:when>
                           <c:otherwise>
                        <td>대기중</td>
                           </c:otherwise>
                        </c:choose>
                        <td><a href = "#" onclick = "delEmail('${list.email}')">삭제</a></td>
                     </tr>
               </c:forEach>
                  </table>

         <input type = 'hidden' name = 'email_del'/>
                  <input type = 'hidden' name = 'aNo_review'/>
         <input type = 'hidden' name = 'nowPage' value = '${all.getNowPage() }'/>
         <input type = 'text' name = 'findStr' value = "${param.findStr }"/>
         <input type = 'submit' name = 'btn' id = 'btn' value = '검색'/><br/>
      
      <div id = 'd2'>
         <c:if test = "${all.nowBlock > 1}">
            <input type = 'submit' id = 'b1' onclick = " nowPage.value=1; submit;" name = 'b1' value = '맨앞'/>
            <input type = 'submit' id = 'b2' onclick = "nowPage.value=${all.startPage - 1}; submit;" name = 'b2' value = '앞'/>
         </c:if>
         
         <c:forEach var = 'i' begin = '${all.startPage }' end = '${all.endPage }' step = '1'>
            <input type = 'submit' id = 'b3' name = 'b3' onclick = "nowPage.value=${i }; submit;" value = '${i }'/>
         </c:forEach>
         
         <c:if test = '${all.nowBlock < all.totBlock }'>
            <input type = 'submit' id = 'b6' onclick = "nowPage.value=${all.endPage + 1}; submit;" name = 'b6' value = '뒤'/>
            <input type = 'submit' id = 'b7' onclick = "nowPage.value=${all.totPage}; submit;" name = 'b7' value = '맨뒤'/>
         </c:if>
      </div>
</form>
   </div>
            </div>
            <!-- 내용의 끝 -->               
         </div>   
      </div>
   </div>
</div>

<script>



document.apply_frm.onsubmit = function(){
   var ff = document.apply_frm;
   ff.nowPage.value = 1;
   ff.submit();
}

function movePage(nowPage){
   var ff = document.apply_frm;
   ff.nowPage.value = nowPage;
   ff.submit();
}
</script>