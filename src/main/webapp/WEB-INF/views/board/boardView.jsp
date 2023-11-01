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
<script src="https://kit.fontawesome.com/af585378dc.js" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CAMPBOSS</title>
<link href="${path}/resources/boardcss/boardview.css?after" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
//조회수

let cbboard_hit = ${b.cbboard_hit};

function increaseHit() {
	cbboard_hit++;
	
	document.getElementById("hitDisplay").innnerText - cbboard_hit;
}

window.onload  = function () {
	increaseHit();
}


$(document).ready(function() {
	$(".img").mouseover(function() {
		$("#bigImg").attr('src', this.src);
	});
	$("#del").click(function() {
		$("#f1").attr('action', '/seller/del');
		$("#f1").submit();
	});
});



$(document).ready(function() {
    $("#btn1").click(function() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/board/uplike?board_num=${b.board_num}&type=1",
            data: { },
            success: function(response) {
                
                location.reload(); 
            }
        });
    });
});


$(document).ready(function() {
    $("#btn2").click(function() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/board/uphate?board_num=${b.board_num}&type=1",
            data: { },
            success: function(response) {
                
                location.reload(); 
            }
        });
    });
});




var num = 0;

function writeComment(boardNum) {
    // 사용자가 입력한 데이터 가져오기
    var reNum = $("#re_num" + boardNum).val();
    var writerId = $("#writer_id" + boardNum).val();
    var content = $("#content" + boardNum).val();

    $.post("/rep/write", {
        re_num: reNum,
        writer_id: writerId,
        content: content
    }).done(function (data) {
        var items = eval("(" + data + ")"); // JSON 파일을 객체로 변환 
        var str = "";
        for (var i = 0; i < items.length; i++) {
        	str += '<div>';
            str += '<table class="red">';
            str += '<tr>'; 
            str += '<th>작성자 : ' + items[i].writer_id + '</th>';
            str += '</tr>';
            str += '<tr>'; 
            str += '<td>　' + items[i].content + '</td>';
            str += '</tr>';
            str += '</table>';
            str += '</div>';
        }

        $("#div_" + items[0].re_num).html(str);
        $("#content"+${b.board_num }).val("");
        
    });
}

$(document).ready(function(){
    var reNum = $("#re_num" + ${b.board_num}).val();

    $.post("/rep/print", {
        re_num: reNum
    }).done(function (data) {
        var items = eval("(" + data + ")"); // JSON 파일을 객체로 변환 
        var str = "";
        for (var i = 0; i < items.length; i++) {
        	str += '<div>';
            str += '<table class="red">';
            str += '<tr>'; 
            str += '<th>작성자 : ' + items[i].writer_id + '</th>';
            str += '</tr>';
            str += '<tr>'; 
            str += '<td>　' + items[i].content + '</td>';
            str += '</tr>';
            str += '</table>';
            str += '</div>';
        }

        $("#div_" + items[0].re_num).html(str);
    });
});



</script>
	<c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>

</head>
<body>
	<form id="f1" action="${pageContext.request.contextPath }/board/boardView" 
	method="post" class="row g-3">
	<input type="hidden" name="board_num" value="${b.board_num }">
	
		<div class="product-view">
			<h2>${b.board_name }</h2>
			<h5>조회수 : ${b.cbboard_hit }</h5>
			
			
			<table>
				<colgroup>
				<col style="width : px;"><col>
			</colgroup>
			
			<tbody>
				
				<tr>
				<th>작성날짜</th>
				<td>${b.board_date }</td>
				</tr>
				
				<tr>
				<th>작성자</th>
				<td>${b.board_id }</td>
				</tr>
				
				<tr>
				<th>내용</th>
				<td>하단참조</td>
				</tr>
				
				<tr>
					<th>장소</th>
					<td>	
						<i class="fa-solid fa-location-dot"></i>${b.board_addr }
						<div id="map" style="width:350px;height:150px;" class="name"></div>
					</td>
				</tr>
				
				<tr>
					<th></th>
					<td >
						<input type="button" id="btn1" class="btn1" value="좋아요"><i class="fa-regular fa-thumbs-up"></i>${b.board_like}
						 <input type="button" id="btn2" class="btn2" value="싫어요"><i class="fa-regular fa-thumbs-down"></i> ${b.board_hate}
					</td>
				</tr>
			</tbody>
			</table>
			
	<c:if test="${not empty file0 }">
      
      	<div class="img_head">
      		<img id="bigImg" src="${pageContext.request.contextPath }/boardimg?fname=${file0 }&board_num=${b.board_num }" > 
     		 
     		 <ul>
     	 	<li>
     	 		<img class="img" src="${pageContext.request.contextPath }/boardimg?fname=${file0 }&board_num=${b.board_num }" >
     	 	</li>
     	 	
     	 	<li>
     	 		<img class="img" src="${pageContext.request.contextPath }/boardimg?fname=${file1 }&board_num=${b.board_num }">
     	 	</li>
     	 	
     	 	<li>
     	 		<img class="img" src="${pageContext.request.contextPath }/boardimg?fname=${file2 }&board_num=${b.board_num }">
     	 	</li>
     	 </ul>
     </div>
	</c:if>
</div>


		
<div class="line1">
		<textarea class="info" >${b.board_info }</textarea>
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
	
	<h3>댓글</h3>
	<div class="reply" style="margin-left: 400px;">

	
		<div class="">
		<form action="" method="post">
		<input type="text" id="content${b.board_num }"class="reply1">
		
		<input type="hidden" id="re_num${b.board_num }" value="${b.board_num }">
		<input type="hidden" id="writer_id${b.board_num }" value="${sessionScope.user_id }">
		
		<input type="button" class="btn" value="작성" 
					onclick="writeComment(${b.board_num})">
		</form>
		</div>
	
			<div id="div_${b.board_num }" class="">
			<c:forEach var="r" items="${i.reps }">
			${r.content }(작성자:${r.writer_id })<br>
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