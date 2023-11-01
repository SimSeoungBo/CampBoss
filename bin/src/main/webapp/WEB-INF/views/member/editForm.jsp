<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <title>CampBoss - ȸ������ ����</title>
  <!-- ��� �޴��� �ҷ����� -->
  <link href="${path}/resources/css/editmem.css" rel="stylesheet">
  <c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
</head>
<body>
</br></br>
  <h2>CampBoss - ȸ������ ����</h2>
</br></br>

  <div class="login-wrap">
    <div class="login-html">
      <div class="login-form">
        <form action="${pageContext.request.contextPath}/member/edit" method="post">
          <!-- ���̵� �Է� -->
          <div class="group">
            <label for="user" class="label">���̵�</label>
            <input type="text" class="input" name="user_id" id="user_id" value="${m.user_id}" readonly>
          </div>
          <!-- ��й�ȣ �Է� -->
          <div class="group">
            <label for="pass" class="label">Password</label>
            <input type="password" class="input" name="user_pwd" value="${m.user_pwd}">
          </div>
          <!-- �̸� �Է� -->
          <div class="group">
            <label for="pass" class="label">Username</label>
            <input type="text" class="input" name="user_name" value="${m.user_name}">
          </div>
          <!-- �г��� �Է� -->
          <div class="group">
            <label for="pass" class="label">NickName</label>
            <input type="text" class="input" name="user_nickname" value="${m.user_nickname}">
          </div>
          <!-- �̸��� �Է� -->
          <div class="group">
            <label for="pass" class="label">Email</label>
            <input type="text" class="input" name="user_email" value="${m.user_email}">
          </div>
          <!-- ��ȭ��ȣ �Է� -->
          <div class="group">
            <label for="pass" class="label">Tel</label>
            <input type="text" class="input" name="user_tel" value="${m.user_tel}">
          </div>
          <!-- �ּ� �Է� -->
          <div class="group">
            <label for="pass" class="label">Address</label>
            <input type="text" class="input" name="user_addr" value="${m.user_addr}">
          </div>
          <!-- ������� �Է� -->
          <div class="group">
            <label for="pass" class="label">Birth</label>
            <input type="text" class="input" name="user_birth" value="${m.user_birth}">
          </div>
          <!-- ȸ�� ���� ���� -->
          <div class="group">
            <label for="pass" class="label">Type</label></br>
            <c:choose>
              <c:when test="${m.user_type==1}">
                �Ϲ�ȸ��
              </c:when>
              <c:when test="${m.user_type==2}">
                ������
              </c:when>
              <c:otherwise>�߸��� type</c:otherwise>
            </c:choose>
          </div>
          <!-- ���� �� ��� ��ư -->
          <div class="group">
            <input type="submit" class="button" value="����"/>
            <input type="reset" class="button" value="���"/>
          </div>
        </form>
      </div>
    </div>
  </div>
</body>
</html>
