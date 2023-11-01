<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CampBoss - 판매리스트</title>

<link href="${path}/resources/productcss/productlist.css?after" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		$(".img").mouseover(function() {
			$("#bigImg").attr('src', this.src);
		});
		$("#del").click(function() {
			$("#f1").attr('action', '/seller/del');
			$("#f1").submit();
		});
	});
</script>


<c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>

</head>
<body>

<div class="over" ></div>
<h3>판매리스트</h3>

<form action="${pageContext.request.contextPath }/product/productList">
<table class="table">
	<c:choose>
	<c:when test="${empty list }">
	<thead class="thead">
		<tr>
			<th>글번호</th>
			<th>제품이름</th>
			<th>제품내용</th>
			<th>제품 가격</th>
			<th>조회수</th>
		</tr>
	</thead>
	
<tbody class="tbody">
	<tr >
		<td colspan="4">상품이 없습니다.</td>
	</tr>
</tbody>	
	</c:when>




	<c:when test="${not empty list }">
	
<thead class="thead">
	<tr>
		<th scope="col">글번호</th>
		<th scope="col">제품이름</th>
		<th scope="col">제품내용</th>
		<th scope="col">가격</th>
		<th scope="col">조회수</th>
	</tr>
</thead>		


<c:forEach var="p" items="${list }">

<tbody class="tbody">
	<tr>
		<td >${p.num }</td>
		<td><a href="${pageContext.request.contextPath }/product/productEdit?num=${p.num}">${p.name }</a></td>
		
		<c:choose>
           <c:when test="${fn:length(p.info ) > 14}">
            <td><c:out value="${fn:substring(p.info ,0,13)}"/>....</td>
           </c:when>
           <c:otherwise>
            <td><c:out value="${p.info }"/></td>
           </c:otherwise> 
    	 </c:choose>
     
		<td>${p.price }</td>
		<td>${p.cbproduct_hit }</td>
	</tr>
</tbody>
	</c:forEach>
	</c:when>
	</c:choose>
	
	</table>
	</form>
	<footer >
	<div class="copyright">
		<p>Copyright 2023 All ⓒ rights reserved </p>
	</div>
</footer>
</body>
</html>