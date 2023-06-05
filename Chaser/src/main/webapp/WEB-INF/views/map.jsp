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


	
	
	
	<script id="data">
// 경로로 표시할 배열(array)
// naver.maps.LatLng 위도 경도 변수
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

//지도 생성시 초기 옵션
var map = new naver.maps.Map("map", {
       center: new naver.maps.LatLng(37.2762087, 127.0808982),
       zoom: 15,
       mapTypeControl: true
   });
 //위의 배열을 이용해 라인 그리기
   var polyline = new naver.maps.Polyline({
       path: polylinePath,      //선 위치 변수배열
       strokeColor: '#FF0000', //선 색 빨강 #빨강,초록,파랑
       strokeOpacity: 0.8, //선 투명도 0 ~ 1
       strokeWeight: 6,   //선 두께
       map: map           //오버레이할 지도
   });

   // 배열  위치를 마크로 표시함

   var marker = new naver.maps.Marker({
       position: polylinePath[polylinePath.length-1], //마크 표시할 위치 배열의 마지막 위치
       map: map
   });
   var marker = new naver.maps.Marker({
       position: polylinePath[0], //마크 표시할 위치 배열의 마지막 위치
       map: map
   });
   var marker = new naver.maps.Marker({
       position: polylinePath[5], //마크 표시할 위치 배열의 마지막 위치
       map: map
   });
   var marker = new naver.maps.Marker({
       position: polylinePath[10], //마크 표시할 위치 배열의 마지막 위치
       map: map
   });
   var marker = new naver.maps.Marker({
       position: polylinePath[20], //마크 표시할 위치 배열의 마지막 위치
       map: map
   });
   var marker = new naver.maps.Marker({
       position: polylinePath[polylinePath.length-10], //마크 표시할 위치 배열의 마지막 위치
       map: map
   });
   var marker = new naver.maps.Marker({
       position: polylinePath[polylinePath.length-5], //마크 표시할 위치 배열의 마지막 위치
       map: map
   });
  
var map = new naver.maps.Map('map', mapOptions);

</script>

<!-- </script>

   <script>
   var map = new naver.maps.Map("map", {
       center: new naver.maps.LatLng(37.2762087, 127.0808982),
       zoom: 15,
       mapTypeControl: true
   });
 //위의 배열을 이용해 라인 그리기
   var polyline = new naver.maps.Polyline({
       path: polylinePath,      //선 위치 변수배열
       strokeColor: '#FF0000', //선 색 빨강 #빨강,초록,파랑
       strokeOpacity: 0.8, //선 투명도 0 ~ 1
       strokeWeight: 6,   //선 두께
       map: map           //오버레이할 지도
   });

   // 배열  위치를 마크로 표시함

   var marker = new naver.maps.Marker({
       position: polylinePath[polylinePath.length-1], //마크 표시할 위치 배열의 마지막 위치
       map: map
   });


   var infoWindow = new naver.maps.InfoWindow({
       anchorSkew: true
   });

    map.setCursor('pointer');

   function searchCoordinateToAddress(latlng) {

       infoWindow.close();

       naver.maps.Service.reverseGeocode({
           coords: latlng,
           orders: [
               naver.maps.Service.OrderType.ADDR,
               naver.maps.Service.OrderType.ROAD_ADDR
           ].join(',')
       }, function(status, response) {
           if (status === naver.maps.Service.Status.ERROR) {
               return alert('Something Wrong!');
           }

           var items = response.v2.results,
               address = '',
               htmlAddresses = [];

           for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
               item = items[i];
               address = makeAddress(item) || '';
               addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';

               htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
           }

           infoWindow.setContent([
               '<div style="padding:10px;min-width:200px;line-height:150%;">',
               '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
               htmlAddresses.join('<br />'),
               '</div>'
           ].join('\n'));

           infoWindow.open(map, latlng);
       });
   }

   function searchAddressToCoordinate(address) {
       naver.maps.Service.geocode({
           query: address
       }, function(status, response) {
           if (status === naver.maps.Service.Status.ERROR) {
               return alert('Something Wrong!');
           }

           if (response.v2.meta.totalCount === 0) {
               return alert('totalCount' + response.v2.meta.totalCount);
           }

           var htmlAddresses = [],
               item = response.v2.addresses[0],
               point = new naver.maps.Point(item.x, item.y);

           if (item.roadAddress) {
               htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
           }

           if (item.jibunAddress) {
               htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
           }

           if (item.englishAddress) {
               htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
           }

           infoWindow.setContent([
               '<div style="padding:10px;min-width:200px;line-height:150%;">',
               '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4><br />',
               htmlAddresses.join('<br />'),
               '</div>'
           ].join('\n'));

           map.setCenter(point);
           infoWindow.open(map, point);
       });
   }

   function initGeocoder() {
       map.addListener('click', function(e) {
           searchCoordinateToAddress(e.coord);
       });

       $('#address').on('keydown', function(e) {
           var keyCode = e.which;

           if (keyCode === 13) { // Enter Key
               searchAddressToCoordinate($('#address').val());
           }
       });

       $('#submit').on('click', function(e) {
           e.preventDefault();

           searchAddressToCoordinate($('#address').val());
       });

       searchAddressToCoordinate('정자동 178-1');
   }

   function makeAddress(item) {
       if (!item) {
           return;
       }

       var name = item.name,
           region = item.region,
           land = item.land,
           isRoadAddress = name === 'roadaddr';

       var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

       if (hasArea(region.area1)) {
           sido = region.area1.name;
       }

       if (hasArea(region.area2)) {
           sigugun = region.area2.name;
       }

       if (hasArea(region.area3)) {
           dongmyun = region.area3.name;
       }

       if (hasArea(region.area4)) {
           ri = region.area4.name;
       }

       if (land) {
           if (hasData(land.number1)) {
               if (hasData(land.type) && land.type === '2') {
                   rest += '산';
               }

               rest += land.number1;

               if (hasData(land.number2)) {
                   rest += ('-' + land.number2);
               }
           }

           if (isRoadAddress === true) {
               if (checkLastString(dongmyun, '면')) {
                   ri = land.name;
               } else {
                   dongmyun = land.name;
                   ri = '';
               }

               if (hasAddition(land.addition0)) {
                   rest += ' ' + land.addition0.value;
               }
           }
       }

       return [sido, sigugun, dongmyun, ri, rest].join(' ');
   }

   function hasArea(area) {
       return !!(area && area.name && area.name !== '');
   }

   function hasData(data) {
       return !!(data && data !== '');
   }

   function checkLastString (word, lastString) {
       return new RegExp(lastString + '$').test(word);
   }

   function hasAddition (addition) {
       return !!(addition && addition.value);
   }

   naver.maps.onJSContentLoaded = initGeocoder; 
   </script> -->
</body>
</html>