<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link href="${path}/resources/css/productPage.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function() {
	$.post("/admin/getsub", {
		type : 1,
		p_id : 0
	}).done(function(data) {
		var c = eval("(" + data + ")");
		for (i = 0; i < c.length; i++) {
			$("#s1").append(	"<option value='"+c[i].id+"'>"
										+ c[i].name + "</option>");
		}
	});

	$("#s1").click(function() {
		var x = 0;
		x = this.options[this.options.selectedIndex].value
		$.post("/admin/getsub", {
				type : 2,
				p_id : x
		}).done(function(data) {
			var c = eval("(" + data + ")");
			$("#s2").empty();
			$("#s3").empty();
			for (i = 0; i < c.length; i++) {
				$("#s2").append(	"<option value='"+c[i].id+"'>"
													+ c[i].name + "</option>");
			}
		});
	});

	$("#s2").click(function() {
		var x = 0;
		x = this.options[this.options.selectedIndex].value
		$.post("/admin/getsub", {
			type : 3,
			p_id : x
		}).done(function(data) {
		var c = eval("(" + data + ")");
		$("#s3").empty();
		for (i = 0; i < c.length; i++) {
			$("#s3").append(	"<option value='"+c[i].id+"'>"
													+ c[i].name + "</option>");
		}
	});
});
});
</script>
</head>
<body>

<h3>CAMPBOSS - ��ǰ����Ʈ</h3>
<<<<<<< HEAD
=======

</br>
>>>>>>> branch 'master' of https://github.com/Choings/campbossproject.git


<!-- ī�װ� �˻� -->
	<form action="${pageContext.request.contextPath }/seller/cateList"
		method="post">
	
		<select id="s1" name="c1" class="box">
			<option disabled selected>��з�</option>
		</select>
	
		<select id="s2" name="c2" class="box">
			<option disabled selected>�ߺз�</option>
		</select>
		
		<select id="s3" name="c3"class="box">
			<option disabled selected>�Һз�</option>
		</select> 
	
	<input type="submit" value="�˻�"  class="boxbtn">	
	</form>
	
	
<!-- ��ǰ������ �˻� -->	


	<form action="${pageContext.request.contextPath }/seller/nameList"
		method="post">
<<<<<<< HEAD
		
		<div>
			<input type="text" name="name" placeholder = "��ǰ������ �˻�" class="name-search">
			<input type="submit" value="�˻�" class="name-searchbtn">
		</div>
		
=======

>>>>>>> branch 'master' of https://github.com/Choings/campbossproject.git

<<<<<<< HEAD
		
=======
		<input type="text" name="name" placeholder = "��ǰ������ �˻�">
		<input type="submit" value="�˻�" class = "ct-btn">

>>>>>>> branch 'master' of https://github.com/Choings/campbossproject.git

	</form>
	
<!-- �Ǹ��ڷ� �˻� -->
	<form action="${pageContext.request.contextPath }/seller/sellerList"
		method="post">
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/Choings/campbossproject.git

<<<<<<< HEAD

	<div>
		<input type="text" name="seller_id"  placeholder = "�Ǹ��� �˻�" class="seller-search">
		<input type="submit" value="�˻�" class="seller-searchbtn">
	</div>
=======
		<input type="text" name="seller_id"  placeholder = "�Ǹ��� �˻�">
		<input type="submit" value="�˻�" class = "ct-btn">

>>>>>>> branch 'master' of https://github.com/Choings/campbossproject.git

	</form>

	<div class="over" ></div>
	<!-- �˻��� ��ǰ ����Ʈ ��� -->

	
	<c:if test="${empty list }">
	<table border="1" class="table">
	<tr>
	<td>�˻��� ��ǰ�� �����ϴ�.</td>
	</tr>
	</table>
	 </c:if>
	 
	<c:if test="${not empty list }">
	<table border="1" cellspacing="0" class="table">
	 <thead class="thead">
	<tr><th>��ǰ�̸�</th><th>��ǰ����</th><th>��ǰ����</th><th>�Ǹ���</th></tr>
	 </thead>
	 
	 
	<c:forEach var="p" items="${list }">
	 <tbody class="tbody">
	<tr>
	<td><a href="${pageContext.request.contextPath }
	/product/productView?num=${p.num }&type=1">${p.name }</a></td>
	<td>${p.info }</td><td>${p.price }</td>
	<td>${p.seller_id }</td>
	</tr>
	 </tbody>
	</c:forEach>

	</table>
	</c:if>


</body>
</html>