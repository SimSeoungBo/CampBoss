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

<link href="${path}/resources/boardcss/boardpage.css?after" rel="stylesheet">
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

<c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
	<br><br><br>
</head>
<body>


<h3>CAMPBOSS - 게시글리스트</h3>


<!-- 카테고리 검색 -->

<form action="${pageContext.request.contextPath }/board/cateList"
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


<!-- 게시글 제목 검색 -->

<form action="${pageContext.request.contextPath }/board/board_nameList"
		method="post">

		<div class="name-view">
			<input type="text" name="board_name" placeholder = "게시글 제목 검색"  class="name1">
			<button class="btn">search</button>
		</div>

	</form>


<!-- 작성자 검색 -->
	<form action="${pageContext.request.contextPath }/board/board_idList"
		method="post">
	<div  class="seller-view">
		<input type="text" name="board_id"  placeholder = "작성자 검색"  class="seller1">
		<button class="btn">search</button>
	</div>
	</form>

<!-- 검색된 게시글 리스트 출력 -->

<c:if test="${empty list }">
	<table border="1" class="table">
	<thead class="thead">
		<tr>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>좋아요　싫어요</th>
		</tr>
	</thead>
	
	<tbody>
		<tr class="tbody">
			<td colspan="5">검색된 글이 없습니다.</td>
		</tr>
	</tbody>
	</table>
	 </c:if>
	 
	<c:if test="${not empty list }">
	<table border="1" cellspacing="0" class="table">
	 <thead class="thead">
	<tr>
	<th >제목　　　　　　　　　</th>
	<th >내용　　　　　　　　　</th>
	<th >작성자　　　　　　　</th>
	<th >조회수　　　　　　　</th>
	<th>좋아요　싫어요</th></tr>
	 </thead>
	 
	 
	<c:forEach var="b" items="${list }">
	 <tbody class="tbody">
	<tr>
	<td ><a href="${pageContext.request.contextPath }
	/board/boardView?board_num=${b.board_num }&type=1">${b.board_name }</a></td>
	
	 <c:choose>
           <c:when test="${fn:length(b.board_info ) > 14}">
            <td><c:out value="${fn:substring(b.board_info ,0,13)}"/>....</td>
           </c:when>
           <c:otherwise>
            <td><c:out value="${b.board_info }"/></td>
           </c:otherwise> 
     </c:choose>
          
	<td >${b.board_id }</td>
	<td >${b.cbboard_hit }</td>
	<td >${b.board_like }　　　　　${b.board_hate }</td>
	</tr>
	 </tbody>
	</c:forEach>

	</table>
	</c:if>
<footer >
	<div class="copyright">
		<p>Copyright 2023 All ⓒ rights reserved </p>
	</div>
</footer>


</body>
</html>