<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>CampBoss - 공지사항 관리</title>
    <link href="${path}/resources/noticecss/noticelist2.css?after" rel="stylesheet">
    
    <c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>

    <script>
        $(document).ready(function() {
            $("#edit").click(function() {
                $("#f1").attr('action', '/notice/edit');
                $("#f1").submit();
            });
        });
    </script>
    
</head>
<body>

   
   <h3>공지사항 리스트</h3>
    <a href="${pageContext.request.contextPath}/notice/noticeAdd" class="write"> 글작성 </a>

    <form action="${pageContext.request.contextPath}/notice/noticeList2" method="POST">
        <table>    
            <c:choose>
                <c:when test="${empty list}">
                    <tr>
                        <td colspan="5" align="center">데이터가 없습니다.</td>
                    </tr>                   
                </c:when>
                <c:when test="${not empty list}">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                             <th>작성날짜</th>
                            <!--이게 삭제버튼 위-->
                            <th></th>
                        </tr>
                    </thead>

                    <c:forEach var="n" items="${list}">
                        <tbody>
                            <tr>
                                <td>${n.notice_num}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/notice/noticeView?notice_num=${n.notice_num}">
                                    ${n.notice_name}</a></td>
                                    
                                    
                                <td>${n.notice_id}</td>
                                <td>${n.notice_date}</td>
                                <!--이게 삭제버튼-->
                                <td><a href="${pageContext.request.contextPath}/notice/del?notice_num=${n.notice_num}">삭제</a></td>
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