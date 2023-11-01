<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CampBoss - 공지사항</title>

<link href="${path}/resources/noticecss/noticelist1.css?after" rel="stylesheet">

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
<h3>공지사항</h3>

<form action="${pageContext.request.contextPath }/notice/noticeList1">
<table class="table">
   <c:choose>
   <c:when test="${empty list }">
   <thead class="thead">
      <tr>
         <th>글번호</th>
         <th class="n1">제목</th>
         <th>내용</th>
         <th>작성날짜</th>
         <th>좋아요　싫어요</th>
      </tr>
   </thead>
   
<tbody class="tbody">
   <tr >
      <td colspan="5">공지사항이 없습니다.</td>
   </tr>
</tbody>   
   </c:when>




<c:when test="${not empty list }">
   
<thead class="thead">
   <tr>
      <th scope="col">글번호</th>
      <th scope="col">제목</th>
      <th scope="col">내용</th>
      <th scope="col">작성날짜</th>
      <th scope="col">좋아요　싫어요</th>
   </tr>
</thead>      


<c:forEach var="n" items="${list }">

<tbody class="tbody">
   <tr>
      <td >${n.notice_num }</td>
      <td>
         <a href="${pageContext.request.contextPath}/notice/noticeView?notice_num=${n.notice_num}">
         ${n.notice_name } </a></td>
         
      <c:choose>
         <c:when test="${fn:length(n.notice_info ) > 14}">
         <td><c:out value="${fn:substring(n.notice_info ,0,13)}"/>....</td>
         </c:when>
         <c:otherwise>
         <td><c:out value="${n.notice_info }"/></td>
         </c:otherwise> 
     </c:choose>
      
      <td>${n.notice_date }</td>
      <td>${n.notice_like }　　　　　${n.notice_hate }</td>

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