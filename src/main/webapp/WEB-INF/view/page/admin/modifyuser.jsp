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
    <h5><b>회원 정보 수정</b></h5>
  </header>


 <div class="w3-container w3-half w3-margin-top">

<div class="w3-container w3-card-4" >
 
<form method="post" action="${ pageContext.servletContext.contextPath }/admin/modifyuser">
        

<p>
<input type="text" class="w3-input" style="width:90%" value="${user.userid }" disabled="disabled"/>     
<input type="hidden" name="userid" value="${user.userid }">
<label>Id</label></p>
 
<p>

<input name="email" type="text" class="w3-input" style="width:90%" value="${user.email }"/>
<label>Email</label></p>


<p>
<button type="submit" class="w3-button w3-teal">submit</button>
<a class="w3-button w3-teal" href="${pageContext.servletContext.contextPath}/admin/userlist">cancel</a></p>

</form>

</div>
</div>
  <hr>
 
</body>
</html>
