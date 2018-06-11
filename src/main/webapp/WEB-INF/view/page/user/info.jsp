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
    <h5><b>회원 정보 수정</b></h5>
  </header>


 <div class="w3-container w3-half w3-margin-top">

<div class="w3-container w3-card-4" >
 
<form:form 
         modelAttribute="userVO" 
         method="POST"
         action="${ pageContext.servletContext.contextPath }/user/info">
        

<p>
<form:input path="userid" type="text" class="w3-input" style="width:90%" value="${user.userid }" disabled="disabled"/>     
<label>Id</label></p>
  <form:errors path="userid" />
<p>
<form:input path="passwd" class="w3-input" id="pwd1" style="width:90%" type="password"/>
<label>Password</label></p>
 <form:errors path="passwd" />
 <p>
<input id="pwd2" class="w3-input" style="width:90%" type="password" onblur="return checkPwd();">
<label>Password Check</label></p>
<span id="pwdckmessage"></span>
<p>
<p>
<form:input path="email" type="text" class="w3-input" style="width:90%" value="${user.email }"/>
<label>Email</label></p>
 <form:errors path="email" />


<p>
<button type="submit" class="w3-button w3-teal">submit</button>
<a class="w3-button w3-teal" href="${pageContext.servletContext.contextPath}/page/main">cancel</a>
<a class="w3-button w3-red w3-right" href="${pageContext.servletContext.contextPath}/user/leave">leave</a>
<p/>
</form:form>
</div>
</div>
  <hr>
  
<script>
 
  function checkPwd(){
if (document.getElementById("pwd1").value != document.getElementById("pwd2").value)
  {
	 document.getElementById("pwdckmessage").innerHTML="비밀번호가 일치하지 않습니다.";
   //alert("비밀번호가 일치하지 않습니다.")    
    document.getElementById("pwd1").value="";
   document.getElementById("pwd2").value="";
   document.getElementById("pwd1").focus();
   return false;
  }else{
	  document.getElementById("pwdckmessage").innerHTML="";
  }
  }
</script>
</body>
</html>
