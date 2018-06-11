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
    <h5><b>주문 내역 
    </b></h5>
  </header>
  
  
  <hr>

  <div class="w3-container">
   
   <p class="w3-left" style="padding-left: 30px;"></p>
	<div class="w3-container">
		<span class="w3-padding">
			(주문수:${count })
		</span>
		<c:if test="${count==0 }">
			<table class="w3-table w3-bordered" width="100%">
			<tr class="w3-light-grey ">
			<td>주문 내역이 없습니다.</td>
			</table>
		</c:if>
		
		<c:if test="${count!=0 }">
		<c:set var="number" value="${count}"/>
		<table class="w3-table-all" >
			<tr class="w3-grey">
				<td width="100" width="50">번호</td>
				<td width="100" width="30%">음료명</td>
				<td width="100" width="100">HOT/ICE</td>
				<td width="100" width="80">추가옵션</td>
				<td width="100" width="100">사이즈</td>
				<td width="100" width="100">수량</td>
				<td width="100" width="100">금액</td>
				<td width="100" width="50">주문일</td>
				<td width="100" width="50">주문상태</td>
					<td width="50">취소</td>
					
			</tr>
			<c:forEach var="order" items="${orderlist}">
			<tr height="30">
				<td align="center" width="50">${number}</td>
			<c:set var="number" value="${number-1 }"/>
				<td width="250">
			
						${order.drink.name}
			
				</td>
	
			
				
				<td align="center" >${order.temp}</td>
				<td align="center" >${order.addopt}/${order.milk }</td>	
						<td align="center">
				${order.drinksize }
				</td>
				<td align="center" >${order.count}</td>
				<td align="center" >${order.price}</td>
			
				
			
				
				<jsp:useBean id="now" class="java.util.Date" />

<%-- <fmt:formatDate value="${now}" pattern="yyyyMMddhhmm" var="nowDate" />       --%>      
<fmt:formatDate value="${order.regdate}" pattern="yyyy-MM-dd HH : mm" var="regdate"/>       
	 	
				<td align="center">
		${regdate }
				</td>
				<td align="center" >
				
				<c:if test="${order.state==0}">취소됨</c:if>
				<c:if test="${order.state==1}">결제</c:if>
				</td>
				
				
			
	
		<td align="center">
		<c:if test="${order.state==1}">
		<a class="w3-button w3-padding-small w3-black w3-small" href="${pageContext.servletContext.contextPath}/user/cancelOrder?onum=${order.onum}">취소</a>
		</c:if>
		
		</td>
					
			</tr>
			</c:forEach>
		</table>
		</c:if>

		
	</div>
	
  </div>
  <hr>

  
</body>
</html>
