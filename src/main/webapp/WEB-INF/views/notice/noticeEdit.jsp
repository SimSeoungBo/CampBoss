<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CAMPBOSS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="${path}/resources/css/productEdit.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
   $(document).ready(function() {
      $(".img").mouseover(function() {
         $("#bigImg").attr('src', this.src);
      });
      $("#del").click(function() {
         $("#f1").attr('action', '/board/del');
         $("#f1").submit();
      });
   });
</script>

<c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
   <br><br><br>
</head>
<body>
<h3>CAMPBOSS - 상품 수정 및 삭제</h3>

<form action="${pageContext.request.contextPath }/notice/Edit" method="POST">
<input type="hidden" name="notice" value="${n.notice_num }">

<div>
   <p class="name-title">제목</p>
   <input type="text" name="notice_name" value="${n.notice_name }" class="name">
</div>


<div>
   <p class="info-title">내용</p>
</div>

<div>
   <textarea name="notice_info" class="info" >${n.notice_info }</textarea>
</div>
    

<div>
   <p class="seller-title">작성자</p>
   <input type="text" name="notice_id" value="${n.notice_id }" class="notice" readonly>


</div>

<div>
   <p class="seller-title">작성자</p>
   <input type="text" name="notice_id" value="${n.notice_id }" class="seller" readonly>
</div>
   <input type="submit" value="수정" class="submit">
<div>

</div>

<!-- 맨아래에 수정버튼 있어야 함 .-->


</form>
</body>
</html>