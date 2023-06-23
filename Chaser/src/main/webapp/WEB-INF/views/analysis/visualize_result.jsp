<%@page import="com.wasp.chaser.domain.ImageDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Visualize_result Page</title>
	<link rel="stylesheet" href="https://blog.codepen.io/documentation/exporting-pens/">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/css.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<style>
body {
	margin: 0;
	padding: 0;
}

@font-face {
	font-family: 'btnfont';
	src: url('/resources/font/SCDream4.woff') format('woff');
}

@font-face {
	font-family: 'contentfont';
	src: url('/resources/font/NotoSansKR-Medium.woff') format('woff');
}

@font-face {
	font-family: 'cntfont';
	src: url('/resources/font/NotoSansKR-Regular.woff') format('woff');
}

.topp {
	width: 100%;
	height: 79px;
	background-color: rgb(31, 35, 44);
	display: flex;
}

.top_img {
	width: 70px;
	position: relative;
	left: 90px;
	top: 12px;
}

.wnwp {
	font-family: avenir-lt-w01_85-heavy1475544, sans-serif;
	color: white;
	font-size: 23px;
	font-weight: 600;
	position: relative;
	left: 47px;
	top: 23px;
}

.menu {
	font-size: large;
	color: white;
	background-color: transparent;
	border: none;
	padding-left: 250px;
	font-family: 'btnfont';
}

.info {
	position: relative;
	top: 5px;
	left: 5px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	font-size: 12px;
	padding: 5px;
	background: #fff;
	list-style: none;
	margin: 0;
}

.info:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .label {
	display: inline-block;
	width: 50px;
}

.number {
	font-weight: bold;
	color: #00a0e9;
}

p {
	font-size: 18px;
	width: 400px;
}

.custom-btn {
	width: 450px;
	height: 50px;
	margin-top: 30px;
	padding: 10px 25px;
	margin-left: 820px;
	border: 2px solid #000;
	font-family: 'Lato', sans-serif;
	font-weight: 500;
	font-size: 2rem;
	background: transparent;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
	border-radius: 5px;
}

.btn-10 {
	transition: all 0.3s ease;
	overflow: hidden;
}

.btn-10:after {
	position: absolute;
	content: " ";
	top: 0;
	left: 0;
	z-index: -1;
	width: 100%;
	height: 100%;
	transition: all 0.3s ease;
	-webkit-transform: scale(.1);
	transform: scale(.1);
}

.btn-10:hover {
	color: #fff;
}

.btn-10:hover:after {
	background: #000;
	-webkit-transform: scale(1);
	transform: scale(1);
}

.sub {
	margin-bottom: 10px;
}

.conttt {
	text-align: center;
}
</style>
</head>

<body>

	<div class="topp">
		<div style="width: fit-content; height: 79px;">

		<img src="/resources/image/moon.png" alt="" class="top_img">
		</div>

		<span class="wnwp"><a href="/main" class="move">The
				Chaser</a></span>
		<button type="button" class="menu" style="padding-left: 400px;"><a href="/introduction">회사소개</a></button>
		<button type="button" class="menu"><a href="/intro_video">시연영상</a></button>
		<button type="button" id="Logsuccess" class="menu"><a href="/product_use">시작하기</a></button>
	</div>

	<main id="PAGES_CONTAINER" class="PAGES_CONTAINER" tabindex="-1"
		data-main-content="true">
		<div class=main_content style="width: 100%; height: 100%;">
			<div style="display: flex; margin-top: 50px; margin-left: 80px;">
				<div style="margin-right: 50px;">
				
					<p style="padding-left: 120px; font-size: 23px;">사건요약</p>
					<br>
					<p class="sub">사건제목 : ${episode.episode_title}</p>
					<p class="sub">사건유형 : ${episode.episode_type}</p>
					<p class="sub">
						발생일자 :
						<fmt:formatDate pattern="yyyy-MM-dd"
							value="${episode.episode_time}" />
					</p>
					<p class="sub" style="height : 180px;
	overflow : auto;">내용 : ${episode.episode_content }</p>
				
					
					<p style="padding-left: 120px; font-size: 23px; padding-top: 50px;">인상착의</p>
					<br>
					<p class="sub">
						성별 :
						<c:if test="${appe.appe_gender.toString() eq 'M'}">남자</c:if>
						<c:if test="${appe.appe_gender.toString() eq 'F'}">여자</c:if>
						<c:if test="${appe.appe_gender.toString() eq '0'}">모름</c:if>
					</p>
					<p class="sub">
						연령대 :
						<c:if test="${appe.appe_age eq '1'}">학생</c:if>
						<c:if test="${appe.appe_age eq '2'}">성인</c:if>
						<c:if test="${appe.appe_age eq '3'}">노인</c:if>
					</p>
					<p class="sub">
						키 :
						<c:if test="${appe.appe_height eq '1'}">160cm미만</c:if>
						<c:if test="${appe.appe_height eq '2'}">160~170cm미만</c:if>
						<c:if test="${appe.appe_height eq '3'}">170~180cm미만</c:if>
						<c:if test="${appe.appe_height eq '4'}">180cm이상</c:if>
					</p>
					<p class="sub">체형 : ${appe.appe_body }</p>
					<p class="sub">상의 : ${appe.appe_top_type }</p>
					<p class="sub">하의 : ${appe.appe_bottom_type }</p>
					<p class="sub">소지품 : ${appe.appe_stuff_type }</p>
					<br>
				</div>

				<div id="map" style="width: 50%; height: 700px; background-color: black; "></div>
					<div style="height:700px; overflow:auto; margin-left:40px;">
						<c:forEach items="${list}" var="imgList">
						<div style="margin-left: 40px; border : 2px solid; margin-bottom:30px;">
							<p style="font-size: 2rem; font-weight:600; text-align: center; margin-top : 15px; overflow: hidden;
	text-overflow: ellipsis; white-space: nowrap; margin-left:10px; margin-right:10px;">${imgList.img_nm}</p>
							<p style="text-align: center;">찍힌 날짜 및 시간 : ${imgList.img_time}</p>
							<br>
						</div>
						</c:forEach>
					</div>
			</div>
			<p style="position: relative; left : 68.36%; bottom : 45px; background-color : transparent;">
				<button onclick="removeCircles()">모두 지우기</button>
				<br>
			</p>
			<c:choose>
				<c:when test="${episode.episode_flag.toString() ne '9'}">
					<form action="/episode/episode_end" method="post" id="form">
						<button class="custom-btn btn-10" onclick="submitData()">최종 결과 저장</button>
						<input type="hidden" value="${episode_idx }" name="episode_idx">
					</form>
				</c:when>
				<c:otherwise>
					<a href="/episode/episode_list"><button class="custom-btn btn-10">사건 목록</button></a>
				</c:otherwise>
			</c:choose>
		</div>
	</main>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	c85ff3c34864a0b1cc76a56f7ada7356&libraries=services"></script>
	<script type="text/javascript">
	
	const moveUrl = (url) => {
		location.href = url;
	}
	
	function submitData(){
		console.log('testtttttttttttttttttttttt');
	           
	        	  if (confirm("정말 진행하시겠습니까??") == true){    //확인

	        		  var form1 = document.getElementById('form')
		        	  form1.submit();

	        		 }else{   //취소

	        		     return false;

	        		 }
	        		
	        	  
	          
	          
	          
	    }   
	
</script>

	<script type="text/javascript">
		function search() {
			var ip1 = document.getElementById('fst_data').value;
			var ip2 = document.getElementById('sec_data').value;
			console.log(ip1);
			console.log(ip2);
			var url = "https://map.kakao.com/?sName=" + ip1 + "&eName=" + ip2;
			window.open(url);

		}
	</script>

	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			mapOption = {
				center: new kakao.maps.LatLng(35.14838454247798, 126.91838510907495), // 지도의 중심좌표
				level: 3 // 지도의 확대 레벨
			};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [


			/* {
				//인포위도우에 표시할 내용
				title : "광주광역시 동구 금남로 245",
				// 표시할 위도경도 좌표값
				latlng: new kakao.maps.LatLng(35.14838454247798, 126.91838510907495)
			},
			*/
		];

<%List<ImageDTO> imgList = (List<ImageDTO>) request.getAttribute("list");
for (int i = 0; i < imgList.size(); i++) {%>
			/* positions = ${list[0]}; */
			console.log(<%=i%>);
			positions[<%=i%>] = {
				//인포위도우에 표시할 내용
				title: `<%=imgList.get(i).getImg_nm()%>
		`,
					// 표시할 위도경도 좌표값
					latlng : new kakao.maps.LatLng(
	<%=imgList.get(i).getImg_xy()%>
		)
			}
	<%}%>
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		var markers = [];
		for (var i = 0; i < positions.length; i++) {
			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new kakao.maps.Size(24, 35);

			// 마커 이미지를 생성합니다    
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map: map, // 마커를 표시할 지도
				position: positions[i].latlng, // 마커를 표시할 위치
				title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image: markerImage // 마커 이미지 
			});
			markers[i] = marker;

			// if(i!=positions.length){

			// var iwContent = '<div style="padding:5px;"><a href="https://map.kakao.com/?sName='+
			//     positions[i].title+'&eName='+positions[i+1].title+'">'+positions[i].title + '</div>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			// };

			var iwContent = '<div style="width:100%;padding:5px;font-size: medium;">'
				+ positions[i].title + '</div>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				position: positions[i].latlng,
				content: iwContent

			});

			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker);

		}

		// // 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
		// var linePath = [
		//     new kakao.maps.LatLngLatLng(33.450705, 126.570677),
		//     new kakao.maps.LatLng(33.450936, 126.569477),
		//     new kakao.maps.LatLng(33.450879, 126.569940),
		//     new kakao.maps.LatLng(33.451393, 126.570738)

		// ];

		var linePath;
		var lineLine = new daum.maps.Polyline();
		for (var i = 1; i < positions.length; i++) {
			if (i != 0) {
				linePath = [positions[i - 1].latlng, positions[i].latlng] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정했습니다
			}
			;
			lineLine.setPath(linePath); // 선을 그릴 라인을 세팅합니다
			var drawLine = new daum.maps.Polyline({
				map: map, // 선을 표시할 지도입니다 
				path: linePath,
				strokeWeight: 3, // 선의 두께입니다 
				strokeColor: '#db4040', // 선의 색깔입니다
				strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
				strokeStyle: 'solid' // 선의 스타일입니다
			});
		}

		for (var i = 1; i < markers.length; i++) {

			// 마커에 click 이벤트를 등록합니다
			kakao.maps.event.addListener(markers[i], 'click', function () {

				var click1 = document.getElementById('fst_data');
				var click2 = document.getElementById('sec_data');

				var ttl = this.getTitle();
				console.log(ttl);
				click1.value = click2.value;
				click2.value = ttl;

			});

		}

		var drawingFlag = false; // 원이 그려지고 있는 상태를 가지고 있을 변수입니다
		var centerPosition; // 원의 중심좌표 입니다
		var drawingCircle; // 그려지고 있는 원을 표시할 원 객체입니다
		var drawingLine; // 그려지고 있는 원의 반지름을 표시할 선 객체입니다
		var drawingOverlay; // 그려지고 있는 원의 반경을 표시할 커스텀오버레이 입니다
		var drawingDot; // 그려지고 있는 원의 중심점을 표시할 커스텀오버레이 입니다

		var circles = []; // 클릭으로 그려진 원과 반경 정보를 표시하는 선과 커스텀오버레이를 가지고 있을 배열입니다

		// 지도에 클릭 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function (mouseEvent) {

			// 클릭 이벤트가 발생했을 때 원을 그리고 있는 상태가 아니면 중심좌표를 클릭한 지점으로 설정합니다
			if (!drawingFlag) {

				// 상태를 그리고있는 상태로 변경합니다
				drawingFlag = true;

				// 원이 그려질 중심좌표를 클릭한 위치로 설정합니다 
				centerPosition = mouseEvent.latLng;

				// 그려지고 있는 원의 반경을 표시할 선 객체를 생성합니다
				if (!drawingLine) {
					drawingLine = new kakao.maps.Polyline({
						strokeWeight: 3, // 선의 두께입니다
						strokeColor: '#00a0e9', // 선의 색깔입니다
						strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
						strokeStyle: 'solid' // 선의 스타일입니다
					});
				}

				// 그려지고 있는 원을 표시할 원 객체를 생성합니다
				if (!drawingCircle) {
					drawingCircle = new kakao.maps.Circle({
						strokeWeight: 1, // 선의 두께입니다
						strokeColor: '#00a0e9', // 선의 색깔입니다
						strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
						strokeStyle: 'solid', // 선의 스타일입니다
						fillColor: '#00a0e9', // 채우기 색깔입니다
						fillOpacity: 0.2 // 채우기 불투명도입니다 
					});
				}

				// 그려지고 있는 원의 반경 정보를 표시할 커스텀오버레이를 생성합니다
				if (!drawingOverlay) {
					drawingOverlay = new kakao.maps.CustomOverlay({
						xAnchor: 0,
						yAnchor: 0,
						zIndex: 1
					});
				}
			}
		});

		// 지도에 마우스무브 이벤트를 등록합니다
		// 원을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 원의 위치와 반경정보를 동적으로 보여주도록 합니다
		kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

			// 마우스무브 이벤트가 발생했을 때 원을 그리고있는 상태이면
			if (drawingFlag) {

				// 마우스 커서의 현재 위치를 얻어옵니다 
				var mousePosition = mouseEvent.latLng;

				// 그려지고 있는 선을 표시할 좌표 배열입니다. 클릭한 중심좌표와 마우스커서의 위치로 설정합니다
				var linePath = [centerPosition, mousePosition];

				// 그려지고 있는 선을 표시할 선 객체에 좌표 배열을 설정합니다
				drawingLine.setPath(linePath);

				// 원의 반지름을 선 객체를 이용해서 얻어옵니다 
				var length = drawingLine.getLength();

				if (length > 0) {

					// 그려지고 있는 원의 중심좌표와 반지름입니다
					var circleOptions = {
						center: centerPosition,
						radius: length,
					};

					// 그려지고 있는 원의 옵션을 설정합니다
					drawingCircle.setOptions(circleOptions);

					// 반경 정보를 표시할 커스텀오버레이의 내용입니다
					var radius = Math.round(drawingCircle.getRadius()),
						content = '<div class="info">반경 <span class="number">' + radius + '</span>m</div>';

					// 반경 정보를 표시할 커스텀 오버레이의 좌표를 마우스커서 위치로 설정합니다
					drawingOverlay.setPosition(mousePosition);

					// 반경 정보를 표시할 커스텀 오버레이의 표시할 내용을 설정합니다
					drawingOverlay.setContent(content);

					// 그려지고 있는 원을 지도에 표시합니다
					drawingCircle.setMap(map);

					// 그려지고 있는 선을 지도에 표시합니다
					drawingLine.setMap(map);

					// 그려지고 있는 원의 반경정보 커스텀 오버레이를 지도에 표시합니다
					drawingOverlay.setMap(map);

				} else {

					drawingCircle.setMap(null);
					drawingLine.setMap(null);
					drawingOverlay.setMap(null);

				}
			}
		});

		// 지도에 마우스 오른쪽 클릭이벤트를 등록합니다
		// 원을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면
		// 마우스 오른쪽 클릭한 위치를 기준으로 원과 원의 반경정보를 표시하는 선과 커스텀 오버레이를 표시하고 그리기를 종료합니다
		kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

			if (drawingFlag) {

				// 마우스로 오른쪽 클릭한 위치입니다 
				var rClickPosition = mouseEvent.latLng;

				// 원의 반경을 표시할 선 객체를 생성합니다
				var polyline = new kakao.maps.Polyline({
					path: [centerPosition, rClickPosition], // 선을 구성하는 좌표 배열입니다. 원의 중심좌표와 클릭한 위치로 설정합니다
					strokeWeight: 3, // 선의 두께 입니다
					strokeColor: '#00a0e9', // 선의 색깔입니다
					strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
					strokeStyle: 'solid' // 선의 스타일입니다
				});

				// 원 객체를 생성합니다
				var circle = new kakao.maps.Circle({
					center: centerPosition, // 원의 중심좌표입니다
					radius: polyline.getLength(), // 원의 반지름입니다 m 단위 이며 선 객체를 이용해서 얻어옵니다
					strokeWeight: 1, // 선의 두께입니다
					strokeColor: '#00a0e9', // 선의 색깔입니다
					strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
					strokeStyle: 'solid', // 선의 스타일입니다
					fillColor: '#00a0e9', // 채우기 색깔입니다
					fillOpacity: 0.2  // 채우기 불투명도입니다 
				});

				var radius = Math.round(circle.getRadius()), // 원의 반경 정보를 얻어옵니다
					content = getTimeHTML(radius); // 커스텀 오버레이에 표시할 반경 정보입니다


				// 반경정보를 표시할 커스텀 오버레이를 생성합니다
				var radiusOverlay = new kakao.maps.CustomOverlay({
					content: content, // 표시할 내용입니다
					position: rClickPosition, // 표시할 위치입니다. 클릭한 위치로 설정합니다
					xAnchor: 0,
					yAnchor: 0,
					zIndex: 1
				});

				// 원을 지도에 표시합니다
				circle.setMap(map);

				// 선을 지도에 표시합니다
				polyline.setMap(map);

				// 반경 정보 커스텀 오버레이를 지도에 표시합니다
				radiusOverlay.setMap(map);

				// 배열에 담을 객체입니다. 원, 선, 커스텀오버레이 객체를 가지고 있습니다
				var radiusObj = {
					'polyline': polyline,
					'circle': circle,
					'overlay': radiusOverlay
				};

				// 배열에 추가합니다
				// 이 배열을 이용해서 "모두 지우기" 버튼을 클릭했을 때 지도에 그려진 원, 선, 커스텀오버레이들을 지웁니다
				circles.push(radiusObj);

				// 그리기 상태를 그리고 있지 않는 상태로 바꿉니다
				drawingFlag = false;

				// 중심 좌표를 초기화 합니다  
				centerPosition = null;

				// 그려지고 있는 원, 선, 커스텀오버레이를 지도에서 제거합니다
				drawingCircle.setMap(null);
				drawingLine.setMap(null);
				drawingOverlay.setMap(null);
			}
		});

		// 지도에 표시되어 있는 모든 원과 반경정보를 표시하는 선, 커스텀 오버레이를 지도에서 제거합니다
		function removeCircles() {
			for (var i = 0; i < circles.length; i++) {
				circles[i].circle.setMap(null);
				circles[i].polyline.setMap(null);
				circles[i].overlay.setMap(null);
			}
			circles = [];
		}

		// 마우스 우클릭 하여 원 그리기가 종료됐을 때 호출하여 
		// 그려진 원의 반경 정보와 반경에 대한 도보, 자전거 시간을 계산하여
		// HTML Content를 만들어 리턴하는 함수입니다
		function getTimeHTML(distance) {

			// 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
			var walkkTime = distance / 67 | 0;
			var walkHour = '', walkMin = '';

			// 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
			if (walkkTime > 60) {
				walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
			}
			walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

			// 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
			var bycicleTime = distance / 227 | 0;
			var bycicleHour = '', bycicleMin = '';

			// 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
			if (bycicleTime > 60) {
				bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
			}
			bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

			// 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
			var content = '<ul class="info">';
			content += '    <li>';
			content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
			content += '    </li>';
			content += '    <li>';
			content += '        <span class="label">도보</span>' + walkHour + walkMin;
			content += '    </li>';
			content += '    <li>';
			content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
			content += '    </li>';
			content += '</ul>'

			return content;
		}

		/* // 마커에 click 이벤트를 등록합니다
		 kakao.maps.event.addListener(marker, 'click', function() {
		
		 var click1 = document.getElementById('fst_data');
		 var click2 = document.getElementById('sec_data');
		
		 var ttl = this.getTitle();
		 console.log(ttl);
		 click1.value=click2.value;
		 click2.value=ttl;    
		
		 }); */

		//지도에 선을 표시합니다 
		polyline.setMap(map);
	</script>


</body>

</html>