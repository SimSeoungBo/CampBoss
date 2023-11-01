<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <script src="https://kit.fontawesome.com/af585378dc.js" crossorigin="anonymous"></script>
   <title>Insert title here</title>
    <link href="${path}/resources/css/mainMenu.css" rel="stylesheet">
   

</head>
<body class="bodymenu">


<section class="nav-bar">
    <div class="nav-container">
      <div class="brand">                                 <!-- 로고 이미지 폴더에 사진 넣고 경로 변경  -->
    	
        <a href="${pageContext.request.contextPath }/member/main">
        CampBoss
         </a>
      </div>
      <nav>
        
        <c:if test="${sessionScope.user_type==1 }">
        <ul class="nav-list">
            <li>
               <a href="#">게시판</a>
             </li>
          <li>
            <a href="#">내정보</a>
            <ul class="nav-dropdown">
              <li>
                <a href="${pageContext.request.contextPath }/member/editForm">내정보수정</a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath }/member/logout">로그아웃</a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath }/member/out">탈퇴하기</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="#!">상품</a>
            <ul class="nav-dropdown">
              <li>
                <a href="${pageContext.request.contextPath }/product/productAdd">상품등록</a>

              </li>
              <li>
                <a href="${pageContext.request.contextPath }/product/productList">판매리스트</a>
              </li>
            </ul>
          </li>
        </ul>
        
           
               
        </c:if>
        
        <!--  위에는 일반로그인 아래는 관리자 로그인  -->
        
        <c:if test="${sessionScope.user_type==2 }"> 
        <ul class="nav-list">
           <li>
               <a href="#">추가메뉴</a>
             </li>
             <li>
               <a href="#">추가메뉴2</a>
             </li>
          <li>
            <a href="#">관리</a>
            <ul class="nav-dropdown">
              <li>
                <a href="${pageContext.request.contextPath }/admin/memberList">회원관리</a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath }/member/main">카테고리관리</a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath }/admin/productList"> 상품리스트관리</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="#!">내정보</a>
            <ul class="nav-dropdown">
              <li>
                <a href="${pageContext.request.contextPath }/member/editForm">내정보수정</a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath }/member/logout">로그아웃</a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath }/member/out">탈퇴하기</a>
              </li>
            </ul>
          </li>
        </ul>
       </c:if>
        
      </nav>
    </div>
  </section>
 
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
 <script src="${path}/resources/js/mainMenu.js"></script>

</body>
</html>