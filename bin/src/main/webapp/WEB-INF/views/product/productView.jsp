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
<link href="${path}/resources/css/productView.css" rel="stylesheet">
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
	<h3>상품 상세정보</h3>
	<form id="f1" action="${pageContext.request.contextPath }/product/view" 
	method="post" class="row g-3">
	<input type="hidden" name="pro_num" value="${p.num }">

		<div >
			<p>제품이름</p> 
			<input type="text" value="${p.name }" readonly >
		</div>
		
		<div>
			<p>제품내용</p>
		</div>
			<textarea name="info"readonly>${p.info }</textarea>
		<div></div>
		
		<div >
			<p>제품가격</p> 
			<input type="text" value="${p.price }"  readonly>
		</div>
			
  
      	<c:if test="${empty file0 }">
			<div>
				<p>등록된 이미지가 없습니다.</p>
			</div>
     	 </c:if> 
   		
      	<c:if test="${not empty file0 }">
      
      	<div>
      		<img id="bigImg" src="${pageContext.request.contextPath }/img?fname=${file0 }&num=${p.num }" 
     		 > 
     		  </div>
      
      	<div>   
      		<img src="${pageContext.request.contextPath }/img?fname=${file0 }&num=${p.num }" class="img" >
      		<img src="${pageContext.request.contextPath }/img?fname=${file1 }&num=${p.num }" class="img" >
      		<img src="${pageContext.request.contextPath }/img?fname=${file2 }&num=${p.num }" class="img" >
        </div>
            </c:if>

			
	</form>

</body>
</html>

