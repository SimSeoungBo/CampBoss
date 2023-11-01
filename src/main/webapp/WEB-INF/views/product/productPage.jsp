<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="${path}/resources/productcss/productpage.css?after" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function() {
	$.post("/admin/getsub", {
		type : 1,
		p_id : 0
	}).done(function(data) {
		var c = eval("(" + data + ")");
		for (i = 0; i < c.length; i++) {
			$("#s1").append(	"<option value='"+c[i].id+"'>"
										+ c[i].name + "</option>");
		}
	});

	$("#s1").click(function() {
		var x = 0;
		x = this.options[this.options.selectedIndex].value
		$.post("/admin/getsub", {
				type : 2,
				p_id : x
		}).done(function(data) {
			var c = eval("(" + data + ")");
			$("#s2").empty();
			$("#s3").empty();
			for (i = 0; i < c.length; i++) {
				$("#s2").append(	"<option value='"+c[i].id+"'>"
													+ c[i].name + "</option>");
			}
		});
	});

	$("#s2").click(function() {
		var x = 0;
		x = this.options[this.options.selectedIndex].value
		$.post("/admin/getsub", {
			type : 3,
			p_id : x
		}).done(function(data) {
		var c = eval("(" + data + ")");
		$("#s3").empty();
		for (i = 0; i < c.length; i++) {
			$("#s3").append(	"<option value='"+c[i].id+"'>"
													+ c[i].name + "</option>");
		}
	});
});
});
</script>
<!-- 상단 메뉴바 불러오기  -->
	<c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
</head>
<body>
<h3>CAMPBOSS - 상품리스트</h3>



<!-- 카테고리 검색 -->
	<form action="${pageContext.request.contextPath }/seller/cateList"
		method="post">
<div class="select-view">
	<div class="select1">
		<select id="s1" name="c1">
			<option disabled selected>대분류</option>
		</select>
	
	</div>
		
	<div class="select1">
		<select id="s2" name="c2" >
			<option disabled selected>중분류</option>
		</select>
	</div>
		
	<div>
		<select id="s3" name="c3">
			<option disabled selected>소분류</option>
		</select>
	</div> 
	
	<button class="btn" style="margin-top: 15px; margin-left: 40px">search</button>
</div>		
	
	</form>
	
	
<!-- 제품명으로 검색 -->	


	<form action="${pageContext.request.contextPath }/seller/nameList"
		method="post">
		<div class="name-view">
			<input type="text" name="name" placeholder = "제품명으로 검색" class="name1">
			<button class="btn">search</button>
		</div>

	</form>
	
<!-- 판매자로 검색 -->
	<form action="${pageContext.request.contextPath }/seller/sellerList"
		method="post">
	<div class="seller-view">
		<input type="text" name="seller_id"  placeholder = "판매자 검색" class="seller1">
		<button class="btn">search</button>
	</div>
	</form>


<div class="list1">
	<c:if test="${empty list }">	
	<table border="1" class="table">
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
	</table>
	 </c:if>
	 
	<c:if test="${not empty list }">
	<table border="1" cellspacing="0">
	 <thead class="thead">
	<tr><th>제품이름</th><th>제품설명</th><th>제품가격</th><th>판매자</th><th>조회수</th></tr>
	 </thead>
	 
	 
	<c:forEach var="p" items="${list }">
	 <tbody class="tbody">
	<tr>
	<td><a href="${pageContext.request.contextPath }
	/product/productView?num=${p.num }&type=1">${p.name }</a></td>
	
	<c:choose>
       <c:when test="${fn:length(p.info ) > 14}">
       <td><c:out value="${fn:substring(p.info ,0,13)}"/>....</td>
       </c:when>
       <c:otherwise>
       <td><c:out value="${p.info }"/></td>
       </c:otherwise> 
    </c:choose>
	
	<td>${p.price }</td>
	<td>${p.seller_id }</td>
	<td>${p.cbproduct_hit }</td>
	</tr>
	 </tbody>
	</c:forEach>

	</table>
	</c:if>
	


</div>
	

<footer >
	<div class="copyright">
		<p>Copyright 2023 All ⓒ rights reserved </p>
	</div>

</footer>
</body>
</html>