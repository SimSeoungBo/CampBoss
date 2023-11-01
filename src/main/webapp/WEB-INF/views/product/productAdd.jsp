<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CampBoss - 상품등록</title>
<link href="${path}/resources/productcss/productadd.css?after" rel="stylesheet">
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
					$("#del").click(function() {
					$("#f1").attr('action', '/seller/reset');
					$("#f1").submit();
				});
			});
</script>

	<c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>

</head>
<body>
	<h3>CampBoss - 상품등록</h3>
	<form action="${pageContext.request.contextPath }/seller/add" 
	method="post" enctype="multipart/form-data" id="f1"> 
	<p>카테고리 선택</p>
	<select id="s1" name="category1_id" class="box" >
		<option disabled selected>대분류</option>
	</select>
	<select id="s2" name="category2_id" class="box">
		<option disabled selected>중분류</option>
	</select>
	<select id="s3" name="category3_id"class="box">
		<option disabled selected>소분류</option>
	</select>	
	
	<div class="product-view">
		
		<table>
			<colgroup>
			<col style="width : px;"><col>
		</colgroup>
		
		<tbody>
			<tr>
				<th>제품이름</th>
				<td><input type="text" name="name"  ></td>
			</tr>
			
			<tr>
				<th>가격</th>
				<td class="pricecolor"><input type="text" name="price" ></td>
			</tr>
			
			<tr>
				<th>판매자</th>
				<td><input type="text" name="seller_id" 
				value="${sessionScope.user_id }"  readonly>
				</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td>하단 이용</td>
			</tr>
		
			<tr>
				<th>장소</th>
				<td>
				<input type="text" id="sample5_address"  name="addr" value="${p.addr }">
				<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"  style="text-align: center;">
				<div id="map" style="width:300px;height:150px; margin-top: 20px"class="name" ></div>
				</td>
			</tr>
			
			<tr>
				<th></th>
				<td>	
				<input type="submit" value="등록" class="btn">
				<input type="reset" value="취소" class="btn" id="del">
				</td>
			</tr>
		</tbody>
		</table>
		
		<div class="img_head"> 
			<p>제품이미지</p>
			<input type="file" name="file1" class="img"><br>
			<input type="file" name="file2" class="img"><br>
			<input type="file" name="file3" class="img"><br>
		</div>
	</div>
	
	<div class="line1">
		<textarea name="info" class="info" placeholder = "내용입력"></textarea>
</div>
	
</form>
	
	
	
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f77ab4323888c99a1ffb18bd492e20cc&libraries=services"></script>
				<script>
				    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				        mapOption = {
				            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
				            level: 5 // 지도의 확대 레벨
				        };
				
				    //지도를 미리 생성
				    var map = new daum.maps.Map(mapContainer, mapOption);
				    //주소-좌표 변환 객체를 생성
				    var geocoder = new daum.maps.services.Geocoder();
				    //마커를 미리 생성
				    var marker = new daum.maps.Marker({
				        position: new daum.maps.LatLng(37.537187, 127.005476),
				        map: map
				    });
				
				
				    function sample5_execDaumPostcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
				                var addr = data.address; // 최종 주소 변수
				
				                // 주소 정보를 해당 필드에 넣는다.
				                document.getElementById("sample5_address").value = addr;
				                // 주소로 상세 정보를 검색
				                geocoder.addressSearch(data.address, function(results, status) {
				                    // 정상적으로 검색이 완료됐으면
				                    if (status === daum.maps.services.Status.OK) {
										
				                        var result = results[0]; //첫번째 결과의 값을 활용
				
				                        // 해당 주소에 대한 좌표를 받아서
				                        var coords = new daum.maps.LatLng(result.y, result.x);
				                        // 지도를 보여준다.
				                        mapContainer.style.display = "block";
				                        map.relayout();
				                        // 지도 중심을 변경한다.
				                        map.setCenter(coords);
				                        // 마커를 결과값으로 받은 위치로 옮긴다.
				                        marker.setPosition(coords)
				                    }
				                });
				            }
				        }).open();
				    }
				</script>
				
<footer >
	<div class="copyright">
		<p>Copyright 2023 All ⓒ rights reserved </p>
	</div>
</footer>
</body>
</html>