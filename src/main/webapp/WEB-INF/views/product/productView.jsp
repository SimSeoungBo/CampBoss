<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%   
 response.setHeader("Cache-Control","no-store");   
 response.setHeader("Pragma","no-cache");   
 response.setDateHeader("Expires",0);   
 if (request.getProtocol().equals("HTTP/1.1")) 
 response.setHeader("Cache-Control", "no-cache"); %>   
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://kit.fontawesome.com/af585378dc.js" crossorigin="anonymous"></script>
<title>CAMPBOSS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="${path}/resources/productcss/productview.css?after" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>


let cbproduct_hit = ${p.cbproduct_hit};

function increaseHit() {
	cbproduct_hit++;
	
	document.getElementById("hitDisplay").innerText = cbproduct_hit;
}

window.onload = function () {
	increaseHit();
}





$(document).ready(function() {
	$(".img").click(function() {
		$("#bigImg").attr('src', this.src);
	});
	$("#del").click(function() {
		$("#f1").attr('action', '/seller/del');
		$("#f1").submit();
	});
});


var num = 0;

function writeComment(num) {
    // 사용자가 입력한 데이터 가져오기
    var reNum = $("#repro_num" + num).val();
    var writerId = $("#repro_writer_id" + num).val();
    var content = $("#repro_content" + num).val();

    $.post("/repro/writepro", {
        repro_num: reNum,
        repro_writer_id: writerId,
        repro_content: content
    }).done(function (data) {
        var items = eval("(" + data + ")"); // JSON 파일을 객체로 변환 
        var str = "";
        for (var i = 0; i < items.length; i++) {
        	str += '<div>';
            str += '<table class="red">';
            str += '<tr>'; 
            str += '<th>작성자 : ' + items[i].repro_writer_id + '</th>';
            str += '</tr>';
            str += '<tr>'; 
            str += '<td>　' + items[i].repro_content + '</td>';
            str += '</tr>';
            str += '</table>';
            str += '</div>';
        }

        $("#div_" + items[0].repro_num).html(str);
        $("#repro_content"+${p.num }).val("");
        
    });
}

$(document).ready(function(){
    var reNum = $("#repro_num" + ${p.num}).val();

    $.post("/repro/printpro", {
        repro_num: reNum
    }).done(function (data) {
        var items = eval("(" + data + ")"); // JSON 파일을 객체로 변환 
        var str = "";
        for (var i = 0; i < items.length; i++) {
        	str += '<div>';
            str += '<table class="red">';
            str += '<tr>'; 
            str += '<th>작성자 : ' + items[i].repro_writer_id + '</th>';
            str += '</tr>';
            str += '<tr>'; 
            str += '<td>　' + items[i].repro_content + '</td>';
            str += '</tr>';
            str += '</table>';
            str += '</div>';
        }

        $("#div_" + items[0].repro_num).html(str);
    });
});


</script>

<c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
</head>
<body>
	<form id="f1" action="${pageContext.request.contextPath }/product/view" 
	method="post" >
	<input type="hidden" name="pro_num" value="${p.num }">
	
	<div class="product-view">
		<h2>${p.name }</h2>
		<h5>조회수 : ${p.cbproduct_hit }</h5>
		
	<div>
		<table>
			<colgroup>
				<col style="width : px;"><col>
			</colgroup>
		
			<tbody>
			<tr>
				<th>작성날짜</th>
				<td>${p.cb_date }</td>
			</tr>
				<tr>
				<th>가격</th>
				<td  class="pricecolor"><b>${p.price}</b><i class="fa-solid fa-won-sign"></i></td>
			</tr>
			<tr>
				<th>판매자</th>
				<td>${p.seller_id }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>하단 참조</td>
			</tr>
			<tr>
				<th>장소</th>
				<td>
				<i class="fa-solid fa-location-dot"></i>${p.addr }
				<div id="map" style="width:300px;height:150px; margin-top: 20px"class="name" ></div>
				</td>
			</tr>
			
			</tbody>
		</table>
	</div>	
		<c:if test="${not empty file0 }">
		<div  class="img_head">
			<img id="bigImg" src="${pageContext.request.contextPath }/img?fname=${file0 }&num=${p.num }" > 
		<ul >
			<li >
				<img class="img" src="${pageContext.request.contextPath }/img?fname=${file0 }&num=${p.num }">
			</li>
			<li >
				<img class="img" src="${pageContext.request.contextPath }/img?fname=${file1 }&num=${p.num }"  >
			</li>
			<li >
				<img class="img" src="${pageContext.request.contextPath }/img?fname=${file2 }&num=${p.num }"  >
			</li>
		</ul>
	</div>
	
	</c:if>
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
				
				
				 // 페이지가 로드될 때 자동으로 실행할 함수
				    function initializeMap() {
				        var sample5_address = document.getElementById("sample5_address");

				        // 사용자가 선택한 주소를 입력 필드에서 가져옵니다.
				        var addr = sample5_address.value;

				        // 주소로 상세 정보를 검색
				        geocoder.addressSearch(addr, function(results, status) {
				            // 정상적으로 검색이 완료됐으면
				            if (status === daum.maps.services.Status.OK) {
				                var result = results[0]; // 첫번째 결과의 값을 활용

				                // 해당 주소에 대한 좌표를 받아서
				                var coords = new daum.maps.LatLng(result.y, result.x);

				                // 지도를 보여줍니다.
				                mapContainer.style.display = "block";
				                map.relayout();

				                // 지도 중심을 변경합니다.
				                map.setCenter(coords);

				                // 마커를 결과값으로 받은 위치로 옮깁니다.
				                marker.setPosition(coords);
				            }
				        });
				    }

				    // 페이지가 로드될 때 자동으로 실행되도록 설정
				    window.onload = initializeMap;
				    	

			</script>	
	</form>
	<div class="line1">
		<textarea class="info" readonly>${p.info }</textarea>
	</div>
	
	
	
	

	<h3>댓글</h3>
	<div class="reply" >

		<div class="">
		<form action="" method="post">
		<input type="text" id="repro_content${p.num }" class="reply1">
		
		<input type="hidden" id="repro_num${p.num }" value="${p.num }">
		<input type="hidden" id="repro_writer_id${p.num }" value="${sessionScope.user_id }">
		
		<input type="button" class="btn" value="등록" 
					onclick="writeComment(${p.num})">
		</form>
		</div>
	
			<div id="div_${p.num }" class="">
			<c:forEach var="r" items="${i.reps }">
	
			${r.repro_content }(작성자:${r.repro_writer_id })<br>
			</c:forEach>
			</div>
			
			
	</div>	

	
<footer >
	<div class="copyright">
		<p>Copyright 2023 All ⓒ rights reserved </p>
	</div>
</footer>
</body>
</html>

