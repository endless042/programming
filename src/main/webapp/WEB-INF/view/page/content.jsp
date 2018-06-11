<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body>
<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <!-- 제목 -->
  <header class="w3-container" style="padding-top:22px">
    <h5><b>상세 정보 보기</b></h5>
  </header>



 <!-- 사진쪽 div  -->
  <div class="w3-container w3-third w3-cell w3-padding">
  <div class="w3-display-container w3-text-white">
    <img src="<%= request.getContextPath() %>/fileSave/${drink.filename}" alt="사진을표시할수없음" style="width:100%; height:450px;">
 

  </div></div>

<!-- 상세정보쪽 div -->

  <div class="w3-container  w3-cell w3-twothird w3-cell-bottom w3-small " >
   <form method="post" action="${pageContext.servletContext.contextPath}/user/order">
    <table style="width: 90%;"><tr><td class="w3-border-bottom">
    
    <p><b>음료명 : </b>${drink.name }<P/>
    
    	<b>가격 : </b><br>
    	<c:if test="${drink.small!=0 }">SMALL 사이즈 -  ${drink.small } 원<br></c:if>
    	<c:if test="${drink.regular!=0 }">REGULAR 사이즈 - ${drink.regular } 원<br></c:if>
    	<c:if test="${drink.large!=0 }">LARGE 사이즈 - ${drink.large } 원<br></c:if>
    	<P/>
    		<b>분류 : </b>${drink.category }<br>
    	
   </td></tr>
   
 
   <tr><td class="w3-border-bottom"> 
   
      <p><b>판매기간 : </b>${season.sdate }부터 ${season.edate }까지</p>
       
    
   
         
 </td><tr><tr><td class="w3-border-bottom">
    <p><label><b>설명</b></label><p>${drink.content }<br>
    

</td></tr><tr><td class="w3-border-bottom" valign="top">

<p>

<select class="w3-select w3-border " required="required" style="width: 80px; display: inline-block;" name="count">
	<!-- <option  selected="selected" disabled="disabled" >수량 선택</option> -->
	<option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    </select>
    
    <select class="w3-select w3-border " required="required" style="width: 80px; display: inline-block;" name="temp">
	<!-- <option  selected="selected" disabled="disabled" >Hot/Ice</option> -->
	<c:if test="${drink.hot!=0 }"> <option value="hot">HOT</option></c:if>
	<c:if test="${drink.ice!=0 }"> <option value="ice">ICE (+500원)</option></c:if>
    </select>
    
     <select class="w3-select w3-border " required="required" style="width: 80px; display: inline-block;" name="drinksize">
	<!-- <option  selected="selected" disabled="disabled" >사이즈 선택</option> -->
	<c:if test="${drink.small!=0 }"> <option value="small">SMALL</option>
	<%-- <input type="hidden" name="price" value="${drink.small }"> --%>
	</c:if>
	<c:if test="${drink.regular!=0 }"> <option value="regular">REGULAR</option>
	<%-- <input type="hidden" name="price" value="${drink.regular }"> --%>
	</c:if>
	<c:if test="${drink.large!=0 }"> <option value="large">LARGE</option>
	<%-- <input type="hidden" name="price" value="${drink.large }"> --%>
	</c:if>
    </select>
    
     <select  class="w3-select w3-border " required="required" style="width: 80px; display: inline-block;" name="addopt">
	<!-- <option  selected="selected" disabled="disabled" >추가 옵션 선택</option> -->
<c:if test="${drink.shot!=0 }"> <option value="shot">샷추가</option></c:if>
<c:if test="${drink.whip!=0 }"> <option value="whip">휘핑크림추가</option></c:if>
 <c:if test="${(drink.whip==0)&&(drink.shot==0) }">
 <option value="non">옵션 없음</option>
 </c:if>

    </select>
   
    <c:if test="${drink.milk!=0 }">
    <select class="w3-select w3-border " required="required" style="width: 80px; display: inline-block;" name="milk">
	<!-- <option  selected="selected" disabled="disabled" >우유 변경</option> -->
	<c:if test="${milk.lowfat!=0 }"> <option value="lowfat">저지방</option></c:if>
	<c:if test="${milk.soymilk!=0 }"> <option value="soymilk">두유</option></c:if>
	<c:if test="${milk.lactofree!=0 }"> <option value="lactofree">소화 잘되는 우유</option></c:if>
    </select>
    </c:if>

 
</td>
</tr>
<tr><td>

<div class="w3-bar w3-white w3-section">
  
<input  style="width: 100%;" class="w3-button w3-bar-item w3-green  w3-right  w3-border-top w3-border-left w3-border-bottom" type="submit" value="주문하기">



 <input type="hidden" name="dnum" value="${drink.dnum }">
   <input type="hidden" name="userid" value="${sessionScope.userid}">
   
</div>

</td></tr>
</table>
</form>
</div>



  
  </div>
  </div>
  <hr>
  
  
</body>
</html>
 
