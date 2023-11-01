<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CampBoss - 로그인</title>


<link href="${path}/resources/css/loginForm.css" rel="stylesheet" >

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	$("#idCheck").click(function() {
		$.post( "/member/idCheck", { user_id: $("#user_id").val()} )
	    .done(function( data ) {
	    	$("#idResult").text(data);
	  });
	});
	$("#join").click(function() {		
		if($("#idResult").text().trim()=="OK"){
			$("form").submit();
		}else{
			alert("ID중복체크 먼저 해주세요");
		}
	});
});
</script>

</head>
<body>

	<div class="login-wrap">
	  <div class="login-html">
	  </br></br>
	    <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
	    <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
	
	    <div class="login-form">
	 <form action="${pageContext.request.contextPath }/member/login"
				method="post">
	      <div class="sign-in-htm">
	        <div class="group">
	          <label for="user" class="label">ID</label>
	          <input id="user" type="text" class="input" name="user_id">
	        </div>
	        <div class="group">
	          <label for="pass" class="label">Password</label>
	          <input id="pass" type="password" class="input" name="user_pwd">
	        </div>
	        <div class="group">
	          <input type="submit" class="button" value="Sign In">
	        </div>
	      </div>
	  </form>
	 
	<form action="${pageContext.request.contextPath }/member/join" method="post">  		
	      <div class="sign-up-htm">
	
	        <div class="group">
	          <label for="user" class="label">ID</label>
	          <input id="user_id" type="text" class="input2" name="user_id">
	          <input type="button" id="idCheck" class="button2" style="color: black;" value="ID중복체크">
		      <span id="idResult" style="color: black; font-size: 17px; font: bold;"></span>
	        </div>
	        
	        <div class="group">
	          <label for="pass" class="label">Password</label>
	          <input id="pass" type="password" class="input" name="user_pwd">
	        </div>
	        <div class="group">
	          <label for="pass" class="label">Username</label>
	          <input id="pass" type="text" class="input" name="user_name">
	        </div>
	        <div class="group">
	          <label for="pass" class="label">NickName</label>
	          <input id="pass" type="text" class="input" name="user_nickname">
	        </div>        
	        <div class="group">
	          <label for="pass" class="label">Email</label>
	          <input id="pass" type="text" class="input" name="user_email">
	        </div>        
	        <div class="group">
	          <label for="pass" class="label">Tel</label>
	          <input id="pass" type="text" class="input" name="user_tel">
	        </div>       
	        <div class="group">
	          <label for="pass" class="label">Address</label>
	          <input id="pass" type="text" class="input" name="user_addr">
	        </div>       
	        <div class="group">
	          <label for="pass" class="label">Birth</label>
	          <input id="pass" type="text" class="input" name="user_birth">
	        </div>        
	        <div class="group">
	          <label for="pass" class="label">Type</label>
	         	<input type="radio" name="user_type" class="ra" value="1"><a style="color: black;" >일반회원</a>
				<input type="radio" name="user_type" class="ra" value="2"><a style="color: black;" >관리자</a>
	        </div>      
	        <div class="group">
	          <input type="submit" class="button" value="Sign Up">
	        </div>
	      </div>
	      </form>
	         
	    </div>
	  </div>
	</div>

</body>
</html>