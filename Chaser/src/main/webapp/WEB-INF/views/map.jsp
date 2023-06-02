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

	<script>
		var map = new naver.maps.Map("map", {
			center : new naver.maps.LatLng(37.5666103, 126.9783882),
			zoom : 16
		}), infoWindow = null;

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