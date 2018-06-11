<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>



<!DOCTYPE html>
<html>
<body>
<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <!-- 제목 -->
  <header class="w3-container" style="padding-top:22px">
    <h5><b>음료 수정</b></h5>
  </header>


 <div class="w3-container w3-half w3-margin-top">

<div class="w3-container w3-card-4" >

<form method="POST"
         action="${ pageContext.servletContext.contextPath }/admin/modifyDrink"
        enctype="multipart/form-data">


<p>
이름
<input name="name" type="text" class="w3-input" style="width:90%"/>     
</p>

       
<p>


 
HOT <input type="checkbox" name="hot" value="1">
 
ICE <input type="checkbox" name="ice" value="1"><p>
 
 가격<p/>
SMALL  <input type="number" name="smallck" class="w3-input" style="width:90%" value="${drink.small }"/><p>

REGULAR <input type="number" name="regularck" class="w3-input" style="width:90%" value="${drink.regular }"/><p>

LARGE <input type="number" name="largeck" class="w3-input" style="width:90%" value="${drink.large }"/><p>
<input type="hidden" name="small" value="0">
<input type="hidden" name="regular" value="0">
<input type="hidden" name="large" value="0">
CATEGORY
<select name="category"><option value="coffee">COFFEE</option>
<option value="noncoffee">NON-COFFEE</option></select><p>
SHOT 추가 가능  <input type="checkbox" name="shot" value="1"><p>
휘핑크림 추가 가능 <input type="checkbox" name="whip" value="1"><p>
우유 변경 가능 <input type="checkbox" id="milkcheck" name="milk" value="1" onchange="showdiv()" ><p>
<div id="milkdiv" style="display: none;">
가능한 우유 <p>
저지방<input type="checkbox" name="lowpat" value="1"><p>
두유<input type="checkbox" name="soymilk" value="1"><p>
소화잘되는우유<input type="checkbox" name="lactofree" value="1"></div><p>

판매기간<br>

<input type="date" name="sdate"> 부터
<input type="date" name="edate"> 까지
<p>
음료 설명<br>
<textarea name="content" style="width:100%">${drink.content }</textarea><p>
사진
<input type="file" name="file">
<input type="submit" class="w3-button w3-section w3-teal w3-ripple" value="submit"></p>



</form>
</div>
</div>
  <hr>
  

</body>

<script>
function showdiv(){
	if(document.getElementById("milkdiv").style.display=="block")
		{document.getElementById("milkdiv").style.display="none";}
	if(document.getElementById("milkdiv").style.display=="none")
	{document.getElementById("milkdiv").style.display="block";}

	
}

</script>
</html>
