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
    <h5><b>메뉴 목록</b></h5>
  </header>
  
  <!-- 검색창 -->
 <%-- <div class="w3-container">
   <form style="padding-left: 30px;" method="get" action="${pageContext.servletContext.contextPath}/admin/userlist">
  검색 옵션 : <select name="option" class="w3-input" style="width: 100px; display: inline-block;">
  
  <option value="userid" <c:if test="${option eq 'userid'}">selected</c:if>>아이디</option>
  <option value="email" <c:if test="${option eq 'email'}">selected</c:if>>이메일</option>
 
  </select><p>
  <input class="w3-input w3-twothird" type="text" name="keyword" placeholder="검색어를 입력하세요" value="${keyword }">
  <input class="w3-button w3-black " type="submit" value="검색">
   </form>
  </div> --%>
  <hr>

  <div class="w3-container">
   
   <p class="w3-left" style="padding-left: 30px;"></p>
	<div class="w3-container">
		<span class="w3-padding">
			(전체 메뉴:${count })
		</span>
		<c:if test="${count==0 }">
			<table class="w3-table w3-bordered" width="100%">
			<tr class="w3-light-grey ">
			<td>등록된 메뉴가 없습니다.</td>
			</table>
		</c:if>
		
		<c:if test="${count!=0 }">
		<table class="w3-table-all" >
			<tr class="w3-grey">
				<td width="100" width="50">번호</td>
				<td width="100" width="30%">음료명</td>
				<td width="100" width="100">HOT/ICE</td>
				<td width="100" width="100">옵션</td>
				<td width="100" width="100">등록일</td>
				<td width="100" width="100">가격</td>
					
					
					<td align="center" width="100">관리</td>
					
			</tr>
			<c:forEach var="drink" items="${menulist}">
			<tr height="30">
				<td align="center" width="50">${number}</td>
			<c:set var="number" value="${number-1 }"/>
			
				
				<td align="center" >${drink.name}</td>
				<td align="center" >
				
				<c:if test="${drink.hot==1}">[HOT]</c:if>
				<c:if test="${drink.ice==1}">[ICE]</c:if>
				</td>
					<td align="center" >
					<c:if test="${drink.shot==1}">[샷추가]</c:if>
					<c:if test="${drink.whip==1}">[휘핑크림]</c:if>
					<c:if test="${drink.milk==1}">[우유변경]</c:if>
				</td>
				<td align="center">
			
				<fmt:formatDate value="${drink.regdate}" pattern="yyyy.MM.dd HH:mm:ss" />
				
				</td>
				<td align="center">
					<c:if test="${drink.small!=0}">Small:${drink.small}<br></c:if>
					<c:if test="${drink.regular!=0}">Regular:${drink.regular}<br></c:if>
					<c:if test="${drink.large!=0}">Large:${drink.large}</c:if>
			
				</td>
			
					<td align="center">
					<a class="w3-button w3-padding-small w3-black w3-small" href="${pageContext.servletContext.contextPath}/admin/modifyDrink?dnum=${drink.dnum}">수정</a>
					<a class="w3-button w3-padding-small w3-black w3-small" href="${pageContext.servletContext.contextPath}/admin/deleteDrink?dnum=${drink.dnum}">삭제</a>
					</td>
					
			</tr>
			</c:forEach>
		</table>
		</c:if>

		<div class="w3-center w3-padding">
			<c:if test="${count>0 }">
			
			<c:if test="${startPage>bottomLine }">
			<a href="${pageContext.servletContext.contextPath}/admin/menulist?pageNum=${startPage-bottomLine}&keyword=${keyword}&option=${option}">[이전]</a>
			</c:if>
			
			
			<c:forEach var="i" begin="${startPage }" end="${endPage}">
			<a href="${pageContext.servletContext.contextPath}/admin/menulist?pageNum=${i }&keyword=${keyword}&option=${option}"> 
				<c:if test="${i!=currentPage }">[${i}]</c:if>
				<c:if test="${i==currentPage }">[${i}]
				<font color='red'></font></c:if>
 			</a>
			</c:forEach>
			<c:if test="${endPage<pageCount }">
				<a href="${pageContext.servletContext.contextPath}/admin/menulist?pageNum=${startPage+bottomLine}&keyword=${keyword}&option=${option}">[다음]</a>
			</c:if>
			
		</c:if>
		</div>
	</div>
	
  </div>
  <hr>

  
</body>
</html>
