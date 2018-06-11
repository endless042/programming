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
    <h5><b>도서 검색하기</b></h5>
  </header>


  <div class="w3-container">
   <form method="get" action="${pageContext.servletContext.contextPath}/page/search">
  <input class="w3-input w3-twothird" placeholder="검색어를 입력하세요">
  <input class="w3-button w3-black" value="검색">
   </form>
  </div>
  <hr>

</body>
</html>
