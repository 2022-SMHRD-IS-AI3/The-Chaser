<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>여러개 마커 표시하기</title>
    
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	c85ff3c34864a0b1cc76a56f7ada7356&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.14838454247798, 126.91838510907495), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
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
    }
];
 

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });

    // if(i!=positions.length){
    
    
    // var iwContent = '<div style="padding:5px;"><a href="https://map.kakao.com/?sName='+
    //     positions[i].title+'&eName='+positions[i+1].title+'">'+positions[i].title + '</div>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    // };
    
    var iwContent = '<div style="width:100%;padding:5px;">'+positions[i].title + '</div>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        position : positions[i].latlng, 
        content : iwContent
    
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
            linePath = [ positions[i -1].latlng, positions[i].latlng ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정했습니다
        }
        ;
        lineLine.setPath(linePath); // 선을 그릴 라인을 세팅합니다
        var drawLine = new daum.maps.Polyline({
            map : map, // 선을 표시할 지도입니다 
            path : linePath,
            strokeWeight : 3, // 선의 두께입니다 
            strokeColor : '#db4040', // 선의 색깔입니다
            strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle : 'solid' // 선의 스타일입니다
        });
    }


// 지도에 선을 표시합니다 
polyline.setMap(map); 



</script>


</body>
</html>