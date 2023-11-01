<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CampBoss - 회원가입</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		// 아이디 중복체크 
		
		$("#idCheck").click(function() {
			$.post( "/member/idCheck", { user_id: $("#user_id").val()} )
		    .done(function( data ) {
		    	$("#idResult").text(data);
		  });
		});
		$("#join").click(function() {		
			if($("#idResult").text().trim()=="사용가능"){
				$("form").submit();
			}else{
				alert("id 중복체크 먼저");
			}
		});
		
	});
</script>
</head>
<body>
	<h3>CampBoss - 회원가입</h3>
	<form action="${pageContext.request.contextPath }/member/join" method="post">
	<table border="1">
	<tr>
	<th>아이디</th>
	<td><input type="text" name="user_id" id="user_id"> 
			<input type="button" id="idCheck" value="id 중복체크"> 
			<span id="idResult"></span>
	</td>
	</tr>
	
	<tr>
	<th>비밀번호</th>
	<td><input type="password" name="user_pwd"></td>
	</tr>
	
	<tr>
	<th>이름</th>
	<td> <input	type="text" name="user_name"></td>
	</tr>
	
	<tr>
	<th>닉네임</th>
	<td><input type="text" name="user_nickname"></td>
	</tr>
	
	<tr>
	<th>이메일</th>
	<td><input type="text" name="user_email"></td>
	</tr>
	
	<tr>
	<th>전화번호</th>
	<td> <input type="text"name="user_tel"></td>
	</tr>
	
	<tr>
	<th>주소</th>
	<td><input type="text"name="user_addr"></td>
	</tr>
	
	<tr>
	<th>생년월일</th>
	<td><input type="text" name="user_birth"></td>
	</tr>
	
	<tr>
	<th>type</th>
	<td>
	<input type="radio" name="user_type" value="1">일반회원
	<input type="radio" name="user_type" value="2">관리자
	</td>
	</tr>
	</table>
	<input type="button" value="가입" id="join">
	</form>
</body>
</html>



