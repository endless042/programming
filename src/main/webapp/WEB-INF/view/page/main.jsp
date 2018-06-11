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
    <h5><b>메뉴 목록</b></h5>
  </header>
  
  <!-- 검색창 -->
 <div class="w3-container">
   <form style="padding-left: 30px;" method="get" action="${pageContext.servletContext.contextPath}/page/main">
  검색 옵션 : <select name="option" class="w3-input" style="width: 100px; display: inline-block;">
  
  
  
  <option value="name" <c:if test="${option eq 'name'}">selected</c:if>>음료명</option>
  
  </select><p>
  <input class="w3-input w3-twothird" type="text" name="keyword" placeholder="검색어를 입력하세요" value="${keyword }">
  <input class="w3-button w3-black " type="submit" value="검색">
   </form>
  </div>
  <hr>

  <%-- <div class="w3-container">
   
   <p class="w3-left" style="padding-left: 30px;"></p>
	<div class="w3-container">
		<span class="w3-padding">
			(전체 도서:${count })
		</span>
		<c:if test="${count==0 }">
			<table class="w3-table w3-bordered" width="100%">
			<tr class="w3-light-grey ">
			<td>보유 도서가 없습니다.</td>
			</table>
		</c:if>
		
		<c:if test="${count!=0 }">
		<table class="w3-table-all" >
			<tr class="w3-grey">
				<td width="100" width="50">번호</td>
				<td width="100" width="50">사진</td>
				<td width="100" width="30%">제목</td>
				<td width="100" width="100">저자</td>
				<td width="100" width="100">장르</td>
				<td width="100" width="100">입고일</td>
					<td width="100">대여상태</td>
					
					<c:if test="${sessionScope.level==0 }">
					<td align="center" width="100">관리</td>
					</c:if>
			</tr>
			<c:forEach var="book" items="${booklist}">
			<tr height="30">
				<td align="center" width="50">${number}</td>
			<c:set var="number" value="${number-1 }"/>
			<td><img src=></td>
				<td width="250">
			
		
 				<a href="${pageContext.servletContext.contextPath}/page/content?num=${book.num}">
						${book.title }</a> 
			
				</td>
				
				<td align="center" >${book.author}</td>
				<td align="center" >${book.category}</td>
				<td align="center">${book.regdate}</td>
				<td align="center">
				<c:if test="${book.isLend==1}">대출 중</c:if>
				<c:if test="${book.isLend==0}">
				<c:if test="${sessionScope.userid!=null}">
					<c:if test="${sessionScope.userid eq 'admin' }">
					미대출
					</c:if>
					<c:if test="${!(sessionScope.userid eq 'admin') }">
				<a href="${pageContext.servletContext.contextPath}/user/lendbook?num=${book.num}"
				class="w3-button w3-padding-small w3-black w3-small" >대출하기</a></c:if>
				</c:if>
				
				
				<c:if test="${sessionScope.userid==null }">대출 가능</c:if>
			</c:if>
				</td>
				<c:if test="${sessionScope.level==0 }">
					<td align="center">
					<a class="w3-button w3-padding-small w3-black w3-small" href="${pageContext.servletContext.contextPath}/admin/modifybook?num=${book.num}">수정</a>
					<a class="w3-button w3-padding-small w3-black w3-small" href="${pageContext.servletContext.contextPath}/admin/deletebook?num=${book.num}">삭제</a>
					</td>
					</c:if>
			</tr>
			</c:forEach>
		</table>
		</c:if>

		<div class="w3-center w3-padding">
			<c:if test="${count>0 }">
			
			<c:if test="${startPage>bottomLine }">
			<a href="${pageContext.servletContext.contextPath}/page/main?pageNum=${startPage-bottomLine}&keyword=${keyword}&option=${option}">[이전]</a>
			</c:if>
			
			
			<c:forEach var="i" begin="${startPage }" end="${endPage}">
			<a href="${pageContext.servletContext.contextPath}/page/main?pageNum=${i }&keyword=${keyword}&option=${option}"> 
				<c:if test="${i!=currentPage }">[${i}]</c:if>
				<c:if test="${i==currentPage }">[${i}]
				<font color='red'></font></c:if>
 			</a>
			</c:forEach>
			<c:if test="${endPage<pageCount }">
				<a href="${pageContext.servletContext.contextPath}/page/main?pageNum=${startPage+bottomLine}&keyword=${keyword}&option=${option}">[다음]</a>
			</c:if>
			
		</c:if>
		</div>
	</div>
	<c:if test="${level==0 }">
    <a class="w3-button w3-black w3-section w3-right w3-margin" href="${pageContext.servletContext.contextPath}/admin/addbook">도서 등록</a>
  </c:if>
  </div> --%>
  
  
  
  
<!-- category -->
   <%--  <div class="w3-container">
    <div class="w3-section w3-bottombar w3-padding-16 w3-small">
      <span class="w3-margin-right">Filter:</span> 
      
      <button class="w3-button" onclick="location.href='auction?stateSelect=all'">ALL(${allcount})</button>
    
      <button class="w3-button " onclick="location.href='auction?stateSelect=top'"><i class="fa fa-diamond w3-margin-right"></i>인기순</button>
      <button class="w3-button w3-hide-small" onclick="location.href='auction?stateSelect=2'"><i class="fa fa-map-pin w3-margin-right"></i>진행 중</button>
     
         <button class="w3-button  w3-hide-small" onclick="location.href='auction?stateSelect=1'"><i class="fa fa-map-pin w3-margin-right"></i>진행 예정</button>
          <button class="w3-button  w3-hide-small" onclick="location.href='auction?stateSelect=3'"><i class="fa fa-map-pin w3-margin-right"></i>마감</button>
    </div>
    </div> --%>
 
 <div>
  <!-- Product grid -->
  
  
  <div class="w3-row-padding " style="width:85%;">
  
  <c:if test="${count==0}">
    	
    	<table class="w3-table w3-border w3-hoverable w3-center w3-small " width="90%">
    	<tr class="w3-light-grey">
    	<td class="w3-center">등록된 메뉴가 없습니다.</td>
    	
    	</table>
    	</c:if>
     <c:if test="${count!=0}">
    	
 
      <c:forEach var="drink" items="${drinklist}">
        <div class="w3-third w3-container w3-margin-bottom w3-padding w3-small">
         <div class="w3-display-container">
          <img src="<%= request.getContextPath() %>/fileSave/${drink.filename}" 
          class="w3-border-top w3-border-left w3-border-right" alt="이미지를표시할수없음" style="height:350px; width:100%;">
       
          <div class="w3-display-middle w3-display-hover">
          
            <button class="w3-button w3-xxlarge w3-red" onclick="location.href='content?dnum=${drink.dnum}';">주문하기</button>
          </div>
        </div>
      <div class="w3-container w3-border ">

      
               <font class="w3-small"><table width="100%" class="w3-light-grey">
               <tr><td><p><b>음료명</b> </p></td>
               <td class="w3-right">
            <p> ${drink.name} <c:if test="${drink.hot==1 }">[HOT]</c:if>
            <c:if test="${drink.ice==1 }">[ICE]</c:if></p>
              
              </td></tr>  </table></font><p>
               <table width="100%"><tr><td><b>가격</b> </td><td class="w3-right">
              <c:if test="${drink.small!=0 }"> <b> Small : ${drink.small }</b><br></c:if>
                <c:if test="${drink.regular!=0 }">  <b> Regular : ${drink.regular }</b><br></c:if>
                  <c:if test="${drink.large!=0 }">  <b> Large : ${drink.large }</b><br></c:if>
                 </td></tr>  </table>  <p/>
      </div>
    </div>

</c:forEach>
   </c:if>
  
   </div>
   

 <!-- 하단 페이징  -->
    	<div class="w3-center w3-section w3-small">
    	
    	<c:if test="${startPage>bottomLine}">
    		
    		 <a href="main?pageNum=${startPage-bottomLine}" class="w3-bar-item w3-button w3-hover-black">«</a>
    	
    		</c:if>
    	
    		<c:forEach var="i" begin="${startPage }" end="${endPage }">
    		
    		<c:if test="${i!=currentPage}">
    		  <a href="main?pageNum=${i}"
    		 class="w3-bar-item w3-button w3-hover-black">${i}</a> 
    		 
    		 
    		 	</c:if>
    		
    		
    		<c:if test="${i==currentPage}">
    		  <a href="main?pageNum=${i}" 
    		  class="w3-bar-item w3-black w3-button">${i}</a> 
    		</c:if>
    		
    		</c:forEach>
    	
    	
    	<c:if test="${endPage<pageCount}">
    		
    		
    		 <a href="main?pageNum=${ startPage+bottomLine}" class="w3-bar-item w3-button w3-hover-black">»</a>
    			</c:if>
    	
    		 
    		
    	</div>
    	
    	
</div>
  
  <hr>

  
</body>
</html>
