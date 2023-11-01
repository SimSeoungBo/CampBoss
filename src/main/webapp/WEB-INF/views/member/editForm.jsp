<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>CampBoss - 회원정보 수정</title>
  <!-- 상단 메뉴바 불러오기 -->
  <link href="${path}/resources/css/editmem.css" rel="stylesheet">
  <c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  <script>
  	$(document).ready(function name() {
  				$("#del").click(function() {
				$("#f1").attr('action', '/member/reset');
				$("#f1").submit();
			});
	});
  			
  	
  </script>
</head>
<body>
</br></br>
  <h2>CampBoss - 회원정보 수정</h2>
</br></br>

  <div class="login-wrap">
    <div class="login-html">
      <div class="login-form">
        <form action="${pageContext.request.contextPath}/member/edit" method="post" id="f1">
          <!-- 아이디 입력 -->
          <div class="group">
            <label for="user" class="label">아이디</label>
            <input type="text" class="input" name="user_id" id="user_id" value="${m.user_id}" readonly>
          </div>
          <!-- 비밀번호 입력 -->
          <div class="group">
            <label for="pass" class="label">비밀번호</label>
            <input type="password" class="input" name="user_pwd" value="${m.user_pwd}">
          </div>
          <!-- 이름 입력 -->
          <div class="group">
            <label for="pass" class="label">이름</label>
            <input type="text" class="input" name="user_name" value="${m.user_name}">
          </div>
          <!-- 닉네임 입력 -->
          <div class="group">
            <label for="pass" class="label">닉네임</label>
            <input type="text" class="input" name="user_nickname" value="${m.user_nickname}">
          </div>  
                  
          <!-- 이메일 입력 -->
          <div class="group">
            <label for="pass" class="label">이메일</label>
            <input type="text" class="input" value="${m.user_email}" readonly="readonly"></br>
  			
  			<label for="pass" class="label"></label></br>
  			<input type="text" id="emailPrefix" class="input2" placeholder="이메일 주소 입력">
			  <a style="font-size: 20px; color: black;" >@</a>
			  <select id="emailSuffix" onchange="combineEmail()" class="input2">
			    <option value="직접입력" class="input2">직접입력</option>
			    <option value="naver.com">naver.com</option>
			    <option value="daum.net">daum.net</option>
			    <option value="gmail.com">gmail.com</option>
			  </select>
			  <input id="result" type="hidden" class="input" name="user_email" readonly>
			  
			  <script>
			    function combineEmail() {
			      const emailPrefix = document.getElementById("emailPrefix").value;
			      const emailSuffix = document.getElementById("emailSuffix").value;
			
			      if (emailSuffix === "직접입력") {
			        alert("이메일 주소를 직접 입력하세요.");
			        location.href = "/member/editForm.jsp"; // 리디렉션
			      } else {
			        const fullEmail = emailPrefix + "@" + emailSuffix;
			        document.getElementById("result").value = fullEmail; // .textContent 대신 .value 사용
			      }
			    }
			  </script>
   
          </div>
          
          
          
          
          <!-- 전화번호 입력 -->
          <div class="group">
            <label for="pass" class="label">전화번호</label>
            <input type="text" class="input" name="user_tel" value="${m.user_tel}">
          </div>
          
          <!-- 주소 입력 -->
          <div class="group">
            <label for="pass" class="label">주소</label>
         		<input type="text" id="sample5_address" class="input" name="user_addr" value="${m.user_addr }" style="font-size: 18px; font-weight: bold; ">
				<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" class="mapin" ><br>
				<div id="map" style="width:0.1px;height:0.1px; display:none"></div>
				
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
         
          </div>
          
          
          <!-- 생년월일 입력 -->
          <div class="group">
            <label for="pass" class="label">생년월일</label>
            <input type="text" class="input" name="user_birth" value="${m.user_birth}">
          </div>
          <!-- 회원 유형 선택 -->
          <div class="group">
            <label for="pass" class="label">회원타입</label></br>
            <c:choose>
              <c:when test="${m.user_type==1}">
                일반회원
              </c:when>
              <c:when test="${m.user_type==2}">
                관리자
              </c:when>
              <c:otherwise>잘못된 type</c:otherwise>
            </c:choose>
          </div>
          <!-- 수정 및 취소 버튼 -->
          <div class="group">
            <input type="submit" class="button" value="수정"/>
            <input type="reset" class="button" value="취소" id="del"/>
          </div>
        </form>
      </div>
    </div>
  </div>
  
  <footer >
	<div class="copyright">
		<p>Copyright 2023 All ⓒ rights reserved </p>
	</div>
</footer>
  
</body>
</html>
