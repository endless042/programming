<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>L카페 주문 시스템</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style>
<body class="w3-light-grey">

<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
  <span class="w3-bar-item w3-right">L카페 주문 시스템</span>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container w3-row">
   
    <div class="w3-col s8 w3-bar">
    <c:if test="${sessionScope.userid!=null }">
      <span>환영합니다, <strong>${sessionScope.userid }</strong>님<br>
      <c:if test="${sessionScope.level==0 }">[관리자]</c:if>
        <c:if test="${sessionScope.user.grade==1 }">[기본회원]</c:if>
         <c:if test="${sessionScope.user.grade==2 }">[Silver회원]</c:if>
          <c:if test="${sessionScope.user.grade==3 }">[Gold회원]</c:if>
         <c:if test="${sessionScope.user.grade==4 }">[VIP회원]</c:if>
      </span><br>
      <a href="${pageContext.servletContext.contextPath}/user/info?userid=${sessionScope.userid}" class="w3-button">내정보</a>
      <a href="${pageContext.servletContext.contextPath}/user/logout" class="w3-button">로그아웃</a>
      </c:if>
      <c:if test="${sessionScope.userid==null }">
      <p>회원으로 주문시 등급 혜택이 있습니다.</p>
       <a href="${pageContext.servletContext.contextPath}/user/loginpage" class="w3-bar-item w3-button w3-padding">로그인</a>
    <a href="${pageContext.servletContext.contextPath}/user/join" class="w3-bar-item w3-button w3-padding">회원가입</a>
      </c:if>
    </div>
  </div>
  <hr>
  <div class="w3-container">
    <h5>메뉴</h5>
  </div>
  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
     <a href="${pageContext.servletContext.contextPath}/page/main?pageNum=1" class="w3-bar-item w3-button w3-padding">전체 메뉴 보기</a>
      <a href="${pageContext.servletContext.contextPath}/page/main?option=category&keyword=coffee" class="w3-bar-item w3-button w3-padding">COFFEE</a>
      <a href="${pageContext.servletContext.contextPath}/page/main?option=category&keyword=noncoffee" class="w3-bar-item w3-button w3-padding">NON-COFFEE</a>
     <%-- <a href="${pageContext.servletContext.contextPath}/page/search" class="w3-bar-item w3-button w3-padding">도서 검색</a> --%>
     <c:if test="${sessionScope.userid!=null }">
     <c:if test="${sessionScope.level==1 }">
   
    <a href="${pageContext.servletContext.contextPath}/user/orderlist" class="w3-bar-item w3-button w3-padding">내 주문 내역</a>
    </c:if>
    <c:if test="${sessionScope.level==0 }">
    <a href="${pageContext.servletContext.contextPath}/admin/userlist" class="w3-bar-item w3-button w3-padding"><font color="red">회원 관리</font></a>
      <a href="${pageContext.servletContext.contextPath}/admin/menulist" class="w3-bar-item w3-button w3-padding"><font color="red">메뉴 관리</font></a>
       <a href="${pageContext.servletContext.contextPath}/admin/addDrink" class="w3-bar-item w3-button w3-padding"><font color="red">메뉴 등록</font></a>
    </c:if>
    </c:if>
    
    <br><br>
  </div>
</nav>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
</body>
</html>