<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=h55y8f2clp"></script>
</head>
<body>
	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width: 100%; height: 350px;"></div>


	<script>
		//지도를 삽입할 HTML 요소 또는 HTML 요소의 id를 지정합니다.
		var mapDiv = document.getElementById('map'); // 'map'으로 선언해도 동일
		
		//옵션 없이 지도 객체를 생성하면 서울 시청을 중심으로 하는 16 레벨의 지도가 생성됩니다.
		var map = new naver.maps.Map(mapDiv);
		
		var map = new naver.maps.Map('naverMap', { // naverMap 값은 div 의 id 값
			center : new naver.maps.LatLng(37.5782709,126.9770043), // 지도 중앙 위치 : 위도, 경도 설정
			zoom : 10, // 줌 설정 : 1~14, 수치가 클수록 지도 확대(줌인), 이 옵션 생략시 기본값 9
			zoomControl : true, // 줌 컨트롤 표시 (기본값 표시안함)
			zoomControlOptions : { // 줌 컨트롤 오른쪽 위로 위치 설정
			position : naver.maps.Position.TOP_RIGHT // 오른쪽 위로 설정값
			},
			mapTypeControl : true, // 일반ㆍ위성 지도보기 컨트롤 표시 (기본값 표시안함)
		});


		// 클릭이벤트를 적용하여 경고창으로 위도 경도를 봅니다.
		naver.maps.Event.addListener(nmap, 'click', function(e){
			// 지도를 클릭하면 아래 내용이 실행됩니다.
			alert(e.coord.lat() + ', ' + e.coord.lng());
			// e 는 클릭시 넘어오는 이벤트 (네이밍은 원하는 대로 하셔도 됩니다)
			// e 에서 필요한 것을 꺼내서 쓰면 됩니다.
			// e.coord.lat() 는 위도 (Latitude)  보통 약어로 lat
			// e.coord.lng() 는 경도 (Longitude) 보퉁 약어로 lng
		});
	</script>


</body>
</html>