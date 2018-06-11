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
    <h5><b>회원가입</b></h5>
  </header>


 <div class="w3-container w3-half w3-margin-top">

<div class="w3-container w3-card-4" >

<form:form 
         modelAttribute="userVO"
         method="POST"
         action="${ pageContext.servletContext.contextPath }/user/join"
        onsubmit="return check()">
         
         

<p>
<form:input path="userid" type="text" class="w3-input" id="userid" style="width:90%" onblur="confirmId()"/>     

<label>Id</label></p>
<span id="idckmessage"></span>
 <form:errors path="userid" />
<!-- 관례적으로 앞글자를 소문자로(userVO) -->
        
<p>
<form:input path="passwd" class="w3-input" id="pwd1" style="width:90%" type="password"/>
<label>Password</label></p>

 <form:errors path="passwd" />
 <p>
<input id="pwd2" class="w3-input" style="width:90%" type="password" onblur="return checkPwd();">
<label>Password Check</label></p>
<span id="pwdckmessage"></span>
<p>
<form:input path="email" type="text" class="w3-input" style="width:90%"/>
<label>Email</label></p>
 <form:errors path="email" />

<p>
<input type="submit" class="w3-button w3-section w3-teal w3-ripple" value="submit"  onclick="return check();"></p>



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
//id중복검사 통과여부
	var idcheck = false;


	function confirmId() {
		
		val = document.getElementById("userid").value;
		idckmessage = document.getElementById("idckmessage");

		$.ajax({
			url : '${pageContext.servletContext.contextPath}'+'/user/idcheck',
			data : {
				'userid' : val
			},
			dataType : 'json',
			success : function(data) {
				if ((data.result == true) &&(val!="") ) {
					idckmessage.innerHTML = "사용이 가능한 아이디 입니다.<br>";
					idckmessage.style.color = 'blue';
					idcheck = true;
				}
				
				else if((data.result == false) &&(val!="")){
					idckmessage.innerHTML = "이미 가입된 아이디입니다.<br>";
					idckmessage.style.color = 'red';
					idcheck = false;
				}
			}
		});
	}
		
		function check(){
			
			if(idcheck==false){
				document.getElementById("idckmessage").innerHTML =
					"아이디 중복 검사를 통과하지 못했습니다.";
				document.getElementById("idckmessage").style.color=
					'red';
				document.getElementById("userid").focus();
				
				return false;
			}

	}
		
	
</script>
  
</body>
</html>
