<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>CampBoss - 회원관리</title>
    <link href="${path}/resources/css/adminList.css" rel="stylesheet">
    
    <c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
    
</head>
<body>

	</br></br></br></br></br>
	<h2>회원리스트</h2>
	</br></br>
	
    <form action="${pageContext.request.contextPath}/admin/memberList" method="post">
        <table>
            <c:choose>
                <c:when test="${empty list}">
                    <tr>
                        <td colspan="9" align="center">데이터가 없습니다.</td>
                    </tr>
                </c:when>
                <c:when test="${not empty list}">
                    <thead>
                        <tr>
                            <th>아이디</th>
                            <th>비밀번호</th>
                            <th>이름</th>
                            <th>닉네임</th>
                            <th>이메일</th>
                            <th>전화번호</th>
                            <th>주소</th>
                            <th>생일</th>
                            <th></th>
                        </tr>
                    </thead>
                    <c:forEach var="m" items="${list}">
                        <c:if test="${m.user_type == 1}">
                            <tbody>
                                <tr>
                                    <td>${m.user_id}</td>
                                    <td>${m.user_pwd}</td>
                                    <td>${m.user_name}</td>
                                    <td>${m.user_nickname}</td>
                                    <td>${m.user_email}</td>
                                    <td>${m.user_tel}</td>
                                    <td>${m.user_addr}</td>
                                    <td>${m.user_birth}</td>
                                    <td><a href="${pageContext.request.contextPath}/member/del?user_id=${m.user_id}">탈퇴</a></td>
                                </tr>
                            </tbody>
                        </c:if>
                    </c:forEach>
                </c:when>
            </c:choose>
        </table>
    </form>
</body>
</html>
