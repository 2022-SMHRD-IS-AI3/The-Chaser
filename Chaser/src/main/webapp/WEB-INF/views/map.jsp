<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>간단한 지도 표시하기</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=h55y8f2clp"></script>
</head>
<body>
	<div id="map" style="width: 100%; height: 400px;"></div>
	
	<script id=data>
	var polylinePath = [
	    new naver.maps.LatLng(37.4526437, 126.49236),
	    new naver.maps.LatLng(37.4768068, 126.4847975),
	    new naver.maps.LatLng(37.4988237, 126.4960839),
	    new naver.maps.LatLng(37.5176422, 126.5392841),
	    new naver.maps.LatLng(37.5398154, 126.5708743),
	    new naver.maps.LatLng(37.5457857, 126.5968815),
	    new naver.maps.LatLng(37.5646413, 126.6502792),
	    new naver.maps.LatLng(37.5708896, 126.7197823),
	    new naver.maps.LatLng(37.5710499, 126.7444216),
	    new naver.maps.LatLng(37.5770001, 126.7733532),
	    new naver.maps.LatLng(37.5817724, 126.799401),
	    new naver.maps.LatLng(37.5841817, 126.8167752),
	    new naver.maps.LatLng(37.5808037, 126.8313027),
	    new naver.maps.LatLng(37.5716637, 126.8473288),
	    new naver.maps.LatLng(37.56136, 126.8619116),
	    new naver.maps.LatLng(37.5487926, 126.8852035),
	    new naver.maps.LatLng(37.540747, 126.8910651),
	    new naver.maps.LatLng(37.5303713, 126.8925982),
	    new naver.maps.LatLng(37.5164746, 126.8825719),
	    new naver.maps.LatLng(37.5002697, 126.8725686),
	    new naver.maps.LatLng(37.4933399, 126.8711786),
	    new naver.maps.LatLng(37.4760577, 126.8756663),
	    new naver.maps.LatLng(37.4634352, 126.8887979),
	    new naver.maps.LatLng(37.448467, 126.8947082),
	    new naver.maps.LatLng(37.4346374, 126.8977132),
	    new naver.maps.LatLng(37.4242394, 126.8949032),
	    new naver.maps.LatLng(37.4033979, 126.8806084),
	    new naver.maps.LatLng(37.3848775, 126.8691937),
	    new naver.maps.LatLng(37.371033, 126.8693097),
	    new naver.maps.LatLng(37.3724101, 126.9126676),
	    new naver.maps.LatLng(37.3830471, 126.9660813),
	    new naver.maps.LatLng(37.3807849, 126.9762181),
	    new naver.maps.LatLng(37.3971504, 127.0267188),
	    new naver.maps.LatLng(37.3961676, 127.0715545),
	    new naver.maps.LatLng(37.3730718, 127.0659032),
	    new naver.maps.LatLng(37.35114, 127.063139),
	    new naver.maps.LatLng(37.3268898, 127.0575003),
	    new naver.maps.LatLng(37.3210994, 127.0517556),
	    new naver.maps.LatLng(37.3084352, 127.0590529),
	    new naver.maps.LatLng(37.2877049, 127.0692822),
	    new naver.maps.LatLng(37.2762087, 127.0808982)
	];

	</script>
	<script>
		var map = new naver.maps.Map("map", {
			center : new naver.maps.LatLng(37.5666103, 126.9783882),
			zoom : 16
		}), infoWindow = null;
		
		 var polyline = new naver.maps.Polyline({
		        path: polylinePath,      //선 위치 변수배열
		        strokeColor: '#FF0000', //선 색 빨강 #빨강,초록,파랑
		        strokeOpacity: 0.8, //선 투명도 0 ~ 1
		        strokeWeight: 6,   //선 두께
		        map: map           //오버레이할 지도
		    });

		 var marker = new naver.maps.Marker({
		        position: polylinePath[0], 
		        map: map
		    });
		 var marker = new naver.maps.Marker({
		        position: polylinePath[1], 
		        map: map
		    });
		 var marker = new naver.maps.Marker({
		        position: polylinePath[2], 
		        map: map
		    });
		    var marker = new naver.maps.Marker({
		        position: polylinePath[3], 
		        map: map
		    });
	

		function initGeocoder() {
			var latlng = map.getCenter();
			var utmk = naver.maps.TransCoord.fromLatLngToUTMK(latlng); // 위/경도 -> UTMK
			var tm128 = naver.maps.TransCoord.fromUTMKToTM128(utmk); // UTMK -> TM128
			var naverCoord = naver.maps.TransCoord.fromTM128ToNaver(tm128); // TM128 -> NAVER

			infoWindow = new naver.maps.InfoWindow({
				content : ''
			});

			map
					.addListener(
							'click',
							function(e) {
								var latlng = e.coord, utmk = naver.maps.TransCoord
										.fromLatLngToUTMK(latlng), tm128 = naver.maps.TransCoord
										.fromUTMKToTM128(utmk), naverCoord = naver.maps.TransCoord
										.fromTM128ToNaver(tm128);

								utmk.x = parseFloat(utmk.x.toFixed(1));
								utmk.y = parseFloat(utmk.y.toFixed(1));

								infoWindow
										.setContent([
												'<div style="padding:10px;width:380px;font-size:14px;line-height:20px;">',
												'<strong>LatLng</strong> : '
														+ '좌 클릭 지점 위/경도 좌표'
														+ '<br />',
												'<strong>UTMK</strong> : '
														+ '위/경도 좌표를 UTMK 좌표로 변환한 값'
														+ '<br />',
												'<strong>TM128</strong> : '
														+ '변환된 UTMK 좌표를 TM128 좌표로 변환한 값'
														+ '<br />',
												'<strong>NAVER</strong> : '
														+ '변환된 TM128 좌표를 NAVER 좌표로 변환한 값'
														+ '<br />', '</div>' ]
												.join(''));

								infoWindow.open(map, latlng);
								console.log('LatLng: ' + latlng.toString());
								console.log('UTMK: ' + utmk.toString());
								console.log('TM128: ' + tm128.toString());
								console.log('NAVER: ' + naverCoord.toString());
							});
		}

		naver.maps.onJSContentLoaded = initGeocoder;
	</script>
</body>
</html>