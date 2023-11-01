<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CAMPBOSS</title>
<link href="${path}/resources/css/membermainPage.css" rel="stylesheet">
</head>
<body>


<div class="main1">
<div>
	<div class="first" onclick="location.href = '/product/productPage';">
	</div>
	<div class="second" onclick="location.href = '/board/boardPage';"></div>
</div>




	<div class="a1">
		<p>상품거래</p>
	</div>
	<div class="a2">
		<p>정보게시판</p>
	</div>
</div>


</body>

</html>