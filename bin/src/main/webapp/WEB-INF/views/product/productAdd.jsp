<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CampBoss - 상품등록</title>
<link href="${path}/resources/css/productAdd.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(
			function() {
				$.post("/admin/getsub", {
					type : 1,
					p_id : 0
				}).done(
						function(data) {
							var c = eval("(" + data + ")");
							for (i = 0; i < c.length; i++) {
								$("#s1").append(
										"<option value='"+c[i].id+"'>"
												+ c[i].name + "</option>");
							}
						});

				$("#s1").click(
						function() {
							var x = 0;
							x = this.options[this.options.selectedIndex].value
							$.post("/admin/getsub", {
								type : 2,
								p_id : x
							}).done(
									function(data) {
										var c = eval("(" + data + ")");
										$("#s2").empty();
										$("#s3").empty();
										for (i = 0; i < c.length; i++) {
											$("#s2").append(
													"<option value='"+c[i].id+"'>"
															+ c[i].name
															+ "</option>");
										}
									});
						});

				$("#s2").click(
						function() {
							var x = 0;
							x = this.options[this.options.selectedIndex].value
							$.post("/admin/getsub", {
								type : 3,
								p_id : x
							}).done(
									function(data) {
										var c = eval("(" + data + ")");
										$("#s3").empty();
										for (i = 0; i < c.length; i++) {
											$("#s3").append(
													"<option value='"+c[i].id+"'>"
															+ c[i].name
															+ "</option>");
										}
									});
						});

			});
</script>

	<c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
	<br><br><br>

</head>
<body>
	<h3>CampBoss - 상품등록</h3>
	<form action="${pageContext.request.contextPath }/seller/add" 
	method="post" enctype="multipart/form-data"> 
	<select id="s1" name="category1_id" class="box" >
		<option disabled selected>대분류</option>
	</select>
	<select id="s2" name="category2_id" class="box">
		<option disabled selected>중분류</option>
	</select>
	<select id="s3" name="category3_id"class="box">
		<option disabled selected>소분류</option>
	</select>	
	
	<div>
		<p>제품이름</p>
  		<input type="text" name="name"  class="name">
	</div>
	
	<div>
		<p>제품설명</p>
		<textarea name = "info" class="info"></textarea>
	</div>
	
	<div>
		<p>제품가격</p>
		<input type="text" name="price" class="price">
	</div>


	<div>
		<p>판매자</p>
		<input type="text" name="seller_id" 
		value="${sessionScope.user_id }" class="seller" readonly>
	</div>
	
	<div> 
		<p>제품이미지</p>
		<input type="file" name="file1" class="upload-name">
		<input type="file" name="file2" class="upload-name">
		<input type="file" name="file3" class="upload-name">
	</div>
	 
	<div>
		<input type="submit" value="등록" class="submit">
		<input type="reset" value="취소" class="reset">	
	</div>
	</form>
</body>
</html>