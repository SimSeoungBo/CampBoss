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
<link href="${path}/resources/noticecss/noticeadd.css?after" rel="stylesheet">
<c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
   <br><br><br>
</head>
<body>


    <form action="${pageContext.request.contextPath }/notice/add" method="post">

            <div>
                <p class="title">제목</p>
                  <input type="text" name="notice_name"  class="title1">
            </div>          	   
            <div>
                <p>작성자 : <input type="text" name="notice_id" 
                value="${sessionScope.user_id }" class="seller" readonly></p>
            </div> 
                      
            
            <div class="line1">
				<textarea name="notice_info" class="info" ></textarea>
			</div>
			
			 <div>
			 <input type="submit" value="등록" class="btn">  
                <input type="reset" value="취소" class="btn" > 
            </div>
        </form>

<footer >
	<div class="copyright">
		<p>Copyright 2023 All ⓒ rights reserved </p>
	</div>
</footer>
</body>
</html>