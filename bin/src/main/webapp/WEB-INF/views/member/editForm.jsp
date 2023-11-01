<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <title>CampBoss - 회원정보 수정</title>
  <!-- 상단 메뉴바 불러오기 -->
  <link href="${path}/resources/css/editmem.css" rel="stylesheet">
  <c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
</head>
<body>
</br></br>
  <h2>CampBoss - 회원정보 수정</h2>
</br></br>

  <div class="login-wrap">
    <div class="login-html">
      <div class="login-form">
        <form action="${pageContext.request.contextPath}/member/edit" method="post">
          <!-- 아이디 입력 -->
          <div class="group">
            <label for="user" class="label">아이디</label>
            <input type="text" class="input" name="user_id" id="user_id" value="${m.user_id}" readonly>
          </div>
          <!-- 비밀번호 입력 -->
          <div class="group">
            <label for="pass" class="label">Password</label>
            <input type="password" class="input" name="user_pwd" value="${m.user_pwd}">
          </div>
          <!-- 이름 입력 -->
          <div class="group">
            <label for="pass" class="label">Username</label>
            <input type="text" class="input" name="user_name" value="${m.user_name}">
          </div>
          <!-- 닉네임 입력 -->
          <div class="group">
            <label for="pass" class="label">NickName</label>
            <input type="text" class="input" name="user_nickname" value="${m.user_nickname}">
          </div>
          <!-- 이메일 입력 -->
          <div class="group">
            <label for="pass" class="label">Email</label>
            <input type="text" class="input" name="user_email" value="${m.user_email}">
          </div>
          <!-- 전화번호 입력 -->
          <div class="group">
            <label for="pass" class="label">Tel</label>
            <input type="text" class="input" name="user_tel" value="${m.user_tel}">
          </div>
          <!-- 주소 입력 -->
          <div class="group">
            <label for="pass" class="label">Address</label>
            <input type="text" class="input" name="user_addr" value="${m.user_addr}">
          </div>
          <!-- 생년월일 입력 -->
          <div class="group">
            <label for="pass" class="label">Birth</label>
            <input type="text" class="input" name="user_birth" value="${m.user_birth}">
          </div>
          <!-- 회원 유형 선택 -->
          <div class="group">
            <label for="pass" class="label">Type</label></br>
            <c:choose>
              <c:when test="${m.user_type==1}">
                일반회원
              </c:when>
              <c:when test="${m.user_type==2}">
                관리자
              </c:when>
              <c:otherwise>잘못된 type</c:otherwise>
            </c:choose>
          </div>
          <!-- 수정 및 취소 버튼 -->
          <div class="group">
            <input type="submit" class="button" value="수정"/>
            <input type="reset" class="button" value="취소"/>
          </div>
        </form>
      </div>
    </div>
  </div>
</body>
</html>
