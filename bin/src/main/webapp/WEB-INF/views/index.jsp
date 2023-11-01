<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>CampBoss</title>

    <link href="${path}/resources/css/index.css" rel="stylesheet" >
</head>

<body style="margin: 0px; height: 500px;">

    <div class="container">
    </div>
    
    <div class="main-box">
    <h3 class="main-title">CampBoss</h3>
        <p class="main-content">CampBoss is a site that hopes to help you with your camping life and bring happiness to the daily lives of many people through camping.</p>
        <a href="${pageContext.request.contextPath}/member/loginForm" class="main-button" >LOGIN</a>
    </div>
    
    <div class="explain-box">
    <h4>Buy camping supplies</h4>
    <p>Improve the quality of your camping life by purchasing and selling the camping equipment you want!!</p>
	</div>
	

</body>
</html>
