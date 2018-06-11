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
    <h5><b>로그인</b></h5>
  </header>


 <div class="w3-container w3-half w3-margin-top">

<form id="loginform" class="w3-container w3-card-4" method="post" action="${pageContext.servletContext.contextPath}/user/loginprocess">
<!-- 인터셉터 실행  -->
<p>
<input class="w3-input" type="text" style="width:90%" required name="userid" id="userid">
<label>Id</label></p>
<p>
<input class="w3-input" type="password" style="width:90%" required name="passwd" id="passwd">
<label>Password</label></p>

<span id="loginckmessage"></span>

<p>

<input type="submit" class="w3-button w3-section w3-teal w3-ripple" value="Log in" onclick="return logincheck();" > 
<a href="${pageContext.servletContext.contextPath}/user/join" class="w3-button w3-section w3-teal w3-ripple">Join</a>
</form>

</div>
  <hr>
<script>
var ck=false;
	function logincheck() {
		
	   	
	   	    
		$.ajax({

			url: '${pageContext.servletContext.contextPath}'+'/user/logincheck',

			type: "POST",
			async:false,
			dataType: "json",

			data: {"userid":document.getElementById("userid").value,
				"passwd":document.getElementById("passwd").value},

			success: function(result){
				
				ck=result.result;
			
			}

			         });
		
		
		if(ck==true){
			alert("성공적으로 로그인하였습니다.");
			return true;
		}else{
			alert("로그인에 실패하였습니다.");
			return false;
		}
	

	}
	
	
	
		</script>
</body>
</html>
