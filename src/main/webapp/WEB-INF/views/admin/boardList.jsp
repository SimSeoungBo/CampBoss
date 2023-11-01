<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CampBoss - 게시글리스트관리</title>

    <link href="${path}/resources/css/adminList.css?after" rel="stylesheet">
    
    <c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
    
</head>
<body>


	<h2>게시글리스트</h2>


   <form action="${pageContext.request.contextPath}/admin/boardList" method="post">
        <table>
            <c:choose>
                <c:when test="${empty list}">
                    <tr>
                        <td colspan="4" align="center">데이터가 없습니다.</td>
                    </tr>
                </c:when>
                <c:when test="${not empty list}">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th></th>
                        </tr>
                    </thead>
                    <c:forEach var="p" items="${list}">
                        <tbody>
                            <tr>
                                <td>${p.board_num}</td>
                                <td><a href="${pageContext.request.contextPath }
									/board/boardView?board_num=${p.board_num }&type=1">${p.board_name}</a></td>
                                <td>${p.board_id}</td>
                                <td><a href="${pageContext.request.contextPath}/board/bodel?num=${p.board_num}">삭제</a></td>
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