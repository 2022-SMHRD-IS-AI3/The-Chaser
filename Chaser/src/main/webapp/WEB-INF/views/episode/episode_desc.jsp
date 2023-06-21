<%@page import="java.util.List"%>
<%@page import="com.wasp.chaser.domain.ImageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/css.css">
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

.sub-title {
	width: fit-content;
	height: fit-content;
	font-size: larger;
}

.explain {
	width: fit-content;
	height: fit-content;
	font-size: large;
}

.step {
	font-size: x-large;
}

.ptag {
	font-size: large;
	padding-left: 5px;
}

.next:hover {
	color: #116dff;
}
</style>
</head>

<body>

	<div class="topp">
		<div style="width: fit-content; height: 79px;">
			<img src="/resources/image/moon.png" alt="" class="top_img">
		</div>
		<span class="wnwp"><a href="/main">The Chaser</a></span>
		<button type="button" onclick="location.href='/introduction'"
			class="menu" style="padding-left: 400px;">회사소개</button>
		<button type="button" onclick="location.href='/intro_video'"
			class="menu">시연영상</button>
		<button type="button" onclick="location.href='/product_use'"
			class="menu">시작하기</button>
	</div>
	<main id="PAGES_CONTAINER" class="PAGES_CONTAINER" tabindex="-1"
		data-main-content="true">
		<div class=main_content style="width: 100%; height: 100%;">
			<div class="board_wap">
				<div class="board_view_wrap">
					<div class="board_view">
						<div class="title">${episode.episode_title }</div>
						<div class="info">
							<dl>
								<dt>번호</dt>
								<dd>${episode.episode_idx }</dd>
							</dl>
							<dl>
								<dt>사건유형</dt>
								<dd>${episode.episode_type }</dd>
							</dl>
							<dl>
								<dt>상태</dt>
								<dd>
									<c:choose>
										<c:when test="${episode.episode_flag.toString() eq '0'}">사건생성완료</c:when>
										<c:when test="${episode.episode_flag.toString() eq '1'}">인상착의 등록완료</c:when>
										<c:when test="${episode.episode_flag.toString() eq '2'}">동영상 선택완료</c:when>
										<c:when test="${episode.episode_flag.toString() eq '3'}">동영상 분석완료</c:when>
										<c:when test="${episode.episode_flag.toString() eq '9'}">사건 종결</c:when>
										<c:otherwise>DB Error02</c:otherwise>
									</c:choose>
								</dd>
							</dl>
							<dl>
								<dt>작성일</dt>
								<dd>
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${episode.episode_start_dt}" />
								</dd>
							</dl>

						</div>
						      <div class="cont" style="display: flex;">
                     <div style="float: left; width: 70%;">
                        ${episode.episode_content }</div>
                     <div class="map"  id="map"
                        style="width: 600px; height: 505px; background-color: #000;"></div>
                  </div>
					</div>
					<div class="bt_wrap">
						<button
							onclick="moveUrl('/episode/episode_modify?episode_idx=${episode.episode_idx }')">수정</button>
						<button
							onclick="moveUrl('/episode/episode_delete?episode_idx=${episode.episode_idx }')">삭제</button>
						<button onclick="moveUrl('/episode/episode_list')" class="on">목록</button>
						<c:choose>
							<c:when test="${episode.episode_flag.toString() eq '0'}">
								<button class="on"
									onclick="moveUrl('/analysis/appearance?episode_idx=${episode.episode_idx }')">인상착의
									입력</button>
							</c:when>
							<c:when test="${episode.episode_flag.toString() eq '1'}">
								<button class="on"
									onclick="moveUrl('/analysis/appearance?episode_idx=${episode.episode_idx }')">인상착의
									수정</button>
							</c:when>
							<c:when test="${episode.episode_flag.toString() eq '2'}">
								<button class="on"
									onclick="moveUrl('/analysis/image_list?episode_idx=${episode.episode_idx }')">동영상
									선택완료</button>
							</c:when>
							<c:when test="${episode.episode_flag.toString() eq '3'}">
								<button class="on"
									onclick="moveUrl('/analysis/analysis_result?episode_idx=${episode.episode_idx }')">
									동영상 분석완료</button>
							</c:when>
							<c:when test="${episode.episode_flag.toString() eq '9'}">
								<button class="on"
									onclick="moveUrl('/analysis/visualize_result?episode_idx=${episode.episode_idx }')">
									사건 종결</button>
							</c:when>
							<c:otherwise>DB Error02</c:otherwise>
						</c:choose>

					</div>
				</div>
			</div>
		</div>
	</main>
	
	
		<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	c85ff3c34864a0b1cc76a56f7ada7356&libraries=services"></script>
	
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
			{         
				title : "광주광역시 동구 중앙로196번길 35",
				latlng: new kakao.maps.LatLng(35.1484931914149, 126.91910929651485)
			},
			{        
				title : "광주광역시 동구 예술길 38",
				latlng: new kakao.maps.LatLng(35.14883825585116, 126.91955066768315)
			},
			{        
				title : "광주광역시 동구 예술길 31-15",
				latlng: new kakao.maps.LatLng(35.14979168613704, 126.91991462661997)
			},
			{        
				title : "광주광역시 동구 중앙로196번길 13",
				latlng: new kakao.maps.LatLng(35.14992516754839, 126.91734923619617)
			},{        
				title : "광주광역시 동구 중앙로 207",
				latlng: new kakao.maps.LatLng(35.15152244332673, 126.91678517345801)
			},{        
				title : "광주광역시 동구 제봉로 183-5",
				latlng: new kakao.maps.LatLng(35.152480109927836, 126.9167430432406)
			},{        
				title : "광주광역시 동구 구성로204번길 15-7",
				latlng: new kakao.maps.LatLng(35.15286045736732, 126.91605124548794)
			}  */
		];

<% List < ImageDTO > imgList = (List < ImageDTO >) request.getAttribute("list");
		for (int i = 0; i < imgList.size(); i++) {%>
			/* positions = ${list[0]}; */
			console.log(<%=i %>);
			positions[<%= i %>] = {
				//인포위도우에 표시할 내용
				title: `<%=imgList.get(i).getImg_nm()%>
		`,
					// 표시할 위도경도 좌표값
					latlng : new kakao.maps.LatLng(
	<%=imgList.get(i).getImg_xy() %>
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

			var iwContent = '<div style="width:100%;padding:5px;">'
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
	
	
	
	

	<script type="text/javascript">
		const moveUrl = (url) => {
			
	        	  if (confirm("정말 진행하시겠습니까??") == true){    //확인

	        		  location.href = url;

	        		 }else{   //취소

	        		     return false;

	        		 }
	        		
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<script>
		window.firstPageId = 'zg724'
		window.bi.sendBeat(12, 'Partially visible', {
			pageId : window.firstPageId
		})
		if (window.requestCloseWelcomeScreen) {
			window.requestCloseWelcomeScreen()
		}
		if (!window.__browser_deprecation__) {
			window.fedops.phaseStarted('partially_visible', {
				paramsOverrides : {
					pageId : firstPageId
				}
			})
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

</body>

</html>
