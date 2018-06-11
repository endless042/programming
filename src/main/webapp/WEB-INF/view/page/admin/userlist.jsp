<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<body>
<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <!-- 제목 -->
  <header class="w3-container" style="padding-top:22px">
    <h5><b>회원 목록</b></h5>
  </header>
  
  <!-- 검색창 -->
 <div class="w3-container">
   <form style="padding-left: 30px;" method="get" action="${pageContext.servletContext.contextPath}/admin/userlist">
  검색 옵션 : <select name="option" class="w3-input" style="width: 100px; display: inline-block;">
  
  <option value="userid" <c:if test="${option eq 'userid'}">selected</c:if>>아이디</option>
  <option value="email" <c:if test="${option eq 'email'}">selected</c:if>>이메일</option>
 
  </select><p>
  <input class="w3-input w3-twothird" type="text" name="keyword" placeholder="검색어를 입력하세요" value="${keyword }">
  <input class="w3-button w3-black " type="submit" value="검색">
   </form>
  </div>
  <hr>

  <div class="w3-container">
   
   <p class="w3-left" style="padding-left: 30px;"></p>
	<div class="w3-container">
		<span class="w3-padding">
			(전체 회원:${count })
		</span>
		<c:if test="${count==0 }">
			<table class="w3-table w3-bordered" width="100%">
			<tr class="w3-light-grey ">
			<td>가입된 회원이 없습니다.</td>
			</table>
		</c:if>
		
		<c:if test="${count!=0 }">
		<table class="w3-table-all" >
			<tr class="w3-grey">
				<td width="100" width="50">번호</td>
				<td width="100" width="30%">아이디</td>
				<td width="100" width="100">이메일</td>
				<td width="100" width="100">가입일시</td>
				<td width="100" width="100">등급</td>
					
					<c:if test="${sessionScope.level==0 }">
					<td align="center" width="100">관리</td>
					</c:if>
			</tr>
			<c:forEach var="user" items="${userlist}">
			<tr height="30">
				<td align="center" width="50">${number}</td>
			<c:set var="number" value="${number-1 }"/>
			
				
				<td align="center" >${user.userid}</td>
				<td align="center" >${user.email}</td>
				<td align="center">
			
				<fmt:formatDate value="${user.regdate}" pattern="yyyy.MM.dd HH:mm:ss" />
				
				</td>
				<td align="center">
				${user.grade }
				</td>
				<c:if test="${sessionScope.level==0 }">
					<td align="center">
					<a class="w3-button w3-padding-small w3-black w3-small" href="${pageContext.servletContext.contextPath}/admin/modifyuser?userid=${user.userid}">수정</a>
					<a class="w3-button w3-padding-small w3-black w3-small" href="${pageContext.servletContext.contextPath}/admin/deleteuser?userid=${user.userid}">탈퇴</a>
					</td>
					</c:if>
			</tr>
			</c:forEach>
		</table>
		</c:if>

		<div class="w3-center w3-padding">
			<c:if test="${count>0 }">
			
			<c:if test="${startPage>bottomLine }">
			<a href="${pageContext.servletContext.contextPath}/admin/userlist?pageNum=${startPage-bottomLine}&keyword=${keyword}&option=${option}">[이전]</a>
			</c:if>
			
			
			<c:forEach var="i" begin="${startPage }" end="${endPage}">
			<a href="${pageContext.servletContext.contextPath}/admin/userlist?pageNum=${i }&keyword=${keyword}&option=${option}"> 
				<c:if test="${i!=currentPage }">[${i}]</c:if>
				<c:if test="${i==currentPage }">[${i}]
				<font color='red'></font></c:if>
 			</a>
			</c:forEach>
			<c:if test="${endPage<pageCount }">
				<a href="${pageContext.servletContext.contextPath}/admin/userlist?pageNum=${startPage+bottomLine}&keyword=${keyword}&option=${option}">[다음]</a>
			</c:if>
			
		</c:if>
		</div>
	</div>
	
  </div>
  <hr>

  
</body>
</html>
