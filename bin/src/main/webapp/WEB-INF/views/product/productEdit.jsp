<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
			$("#f1").attr('action', '/seller/del');
			$("#f1").submit();
		});
	});
</script>

<c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
	<br><br><br>
</head>
<body>
<h3>CAMPBOSS - 상품 수정 및 삭제</h3>

<form action="${pageContext.request.contextPath }/product/edit" method="post"  id="f1">
<input type="hidden" name="num" value="${p.num }">

<div>
	<p class="name-title">제품이름</p>
	<input type="text" name="name" value="${p.name }" class="name">
</div>


<div>
	<p class="info-title">제품내용</p>
</div>

<div>
	<textarea name="info" class="info" >${p.info }</textarea>
</div>

<div>
 	
 	<c:if test="${empty file0 }">
		<div>
			<p class="not-img">등록된 이미지가 없습니다.</p>
		</div>
	</c:if>
	
	<c:if test="${not empty file0 }">
		<div>
			<div>
			<img id="bigImg" src="${pageContext.request.contextPath }/img?fname=${file0 }&num=${p.num }" 
							 class="img-head">
			</div>
			
			<div>
				<img src="${pageContext.request.contextPath }/img?fname=${file0 }&num=${p.num }" class="img img-body1">
				<img src="${pageContext.request.contextPath }/img?fname=${file1 }&num=${p.num }" class="img  img-body2">
				<img src="${pageContext.request.contextPath }/img?fname=${file2 }&num=${p.num }" class="img  img-body3">
			</div>
		</div>
	</c:if>




<div>
	<p class="price-title">제품가격	</p>
	<input type = "text" name="price" value="${p.price }" class="price">
</div>

<div>
	<p class="seller-title">판매자</p>
	<input type="text" name="seller_id" value="${p.seller_id }" class="seller" readonly>
</div>
	<input type="submit" value="수정" class="submit">
	<input type="reset" value="삭제" id="del" class="reset">
<div>

</div>





</form>
</body>
</html>