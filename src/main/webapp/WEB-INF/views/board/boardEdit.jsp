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
<link href="${path}/resources/boardcss/boardedit.css?after" rel="stylesheet">
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

</head>
<body>
<h3>CAMPBOSS - 게시글 수정 및 삭제</h3>

<form action="${pageContext.request.contextPath }/board/edit" method="post"  id="f1">
<input type="hidden" name="board_num" value="${b.board_num }">

<div class="product-view">
	<h2><input type="text" name="board_name" value="${b.board_name }"></h2>
	
	<table>
		<colgroup>
			<col style="width : px;"><col>
		</colgroup>
		
		<tbody>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="board_id" value="${b.board_id }"readonly></td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td>하단 이용</td>
			</tr>
			
			<tr>
				<th>장소</th>
				<td>
					<input type="text" id="sample5_address" class="name" name="board_addr" value="${b.board_addr }">
					<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" class="submit" style="text-align: center;"><br>
					<div id="map" style="width:300px;height:150px; margin-top: 20px" class="name"></div>
				</td>
			</tr>
			
			<tr>
				<th></th>
				<td>	
					<input type="submit" value="수정" class="btn">
					<input type="reset" value="삭제" id="del"  class="btn">
				</td>
			</tr>
		</tbody>
	</table>
	
	<c:if test="${not empty file0 }">
		<div class="img_head">
			<img id="bigImg" src="${pageContext.request.contextPath }/boardimg?fname=${file0 }&num=${b.board_num }" >
		
		<ul>
			<li>
				<img class="img" src="${pageContext.request.contextPath }/boardimg?fname=${file0 }&board_num=${b.board_num }" >
			</li>
				
			<li>
				<img class="img" src="${pageContext.request.contextPath }/boardimg?fname=${file1 }&board_num=${b.board_num }" >
			</li>
			
			<li>
				<img class="img" src="${pageContext.request.contextPath }/boardimg?fname=${file2 }&board_num=${b.board_num }">
			</li>
		</ul>
		
		</div>
	
	</c:if>
</div>

<div class="line1">
		<textarea name="board_info" class="info">${b.board_info }</textarea>
</div>


				
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
</form>
</body>
</html>