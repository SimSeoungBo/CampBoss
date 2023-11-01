<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CampBoss - ȸ������</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		// ���̵� �ߺ�üũ 
		
		$("#idCheck").click(function() {
			$.post( "/member/idCheck", { user_id: $("#user_id").val()} )
		    .done(function( data ) {
		    	$("#idResult").text(data);
		  });
		});
		$("#join").click(function() {		
			if($("#idResult").text().trim()=="��밡��"){
				$("form").submit();
			}else{
				alert("id �ߺ�üũ ����");
			}
		});
		
	});
</script>
</head>
<body>
	<h3>CampBoss - ȸ������</h3>
	<form action="${pageContext.request.contextPath }/member/join" method="post">
	<table border="1">
	<tr>
	<th>���̵�</th>
	<td><input type="text" name="user_id" id="user_id"> 
			<input type="button" id="idCheck" value="id �ߺ�üũ"> 
			<span id="idResult"></span>
	</td>
	</tr>
	
	<tr>
	<th>��й�ȣ</th>
	<td><input type="password" name="user_pwd"></td>
	</tr>
	
	<tr>
	<th>�̸�</th>
	<td> <input	type="text" name="user_name"></td>
	</tr>
	
	<tr>
	<th>�г���</th>
	<td><input type="text" name="user_nickname"></td>
	</tr>
	
	<tr>
	<th>�̸���</th>
	<td><input type="text" name="user_email"></td>
	</tr>
	
	<tr>
	<th>��ȭ��ȣ</th>
	<td> <input type="text"name="user_tel"></td>
	</tr>
	
	<tr>
	<th>�ּ�</th>
	<td><input type="text"name="user_addr"></td>
	</tr>
	
	<tr>
	<th>�������</th>
	<td><input type="text" name="user_birth"></td>
	</tr>
	
	<tr>
	<th>type</th>
	<td>
	<input type="radio" name="user_type" value="1">�Ϲ�ȸ��
	<input type="radio" name="user_type" value="2">������
	</td>
	</tr>
	</table>
	<input type="button" value="����" id="join">
	</form>
</body>
</html>



