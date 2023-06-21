<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/css.css">
<style>
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

body {
	margin: 0;
	padding: 0;
}

#myProgress {
	position: relative;
	width: 1100px;
	height: 50px;
	background-color: white;
	border: 2px solid;
	margin-top : 15px;
}

#myBar {
	position: absolute;
	width: 1%;
	height: 100%;
	background-color: grey;
}
#myBar2 {
	position: absolute;
	width: 1%;
	height: 100%;
	background-color: grey;
}

#label {
	text-align: center;
	line-height: 50px;
	color: black;
	font-size: large;
}
#label2 {
	text-align: center;
	line-height: 50px;
	color: black;
	font-size: large;
}
</style>
</head>

<body>
	<main id="PAGES_CONTAINER" class="PAGES_CONTAINER" tabindex="-1"
		data-main-content="true">
		<div class=main_content style="width: 100%; height: 100%;">
			<div
				style="padding-left: 410px; width: 700px; height: 100%; position: relative; top: 300px;">
				<div class="spinner-border text-secondary" role="status"
					style="width: 100px; height: 100px; position: relative; left: 485px;">
					<span class="visually-hidden">Loading...</span>
				</div>
				<br> <br>
				<p style="font-size: 3.0rem; width:500px; text-align:center; margin-left:290px;" id="process_status">압축 중...</p>
				<div>
					<div id="myProgress" style="position: relative; top: 100px;">
						<div id="myBar">
							<div id="label">0%</div>
						</div>
					</div>
					<br>
					<p style="font-size:20px;"><span id="img_frame">0</span> / <span id="total_img_frame"></span></p>
					<p
						style="font-size: 2.0rem; position: relative; width: 500px; bottom: 40px; left: 700px;">현재 폴더 예상 소요 시간 : <span id="total_img_time"></span></p>
				</div>
								<div>
					<div id="myProgress" style="position: relative; top: 100px;">
						<div id="myBar2">
							<div id="label2">0%</div>
						</div>
					</div>
					<br>
					<p style="font-size:20px;"><span id="imgs_frame">0</span> / <span id="total_imgs_frame"></span></p>
					<p
						style="font-size: 2.0rem; position: relative; width: 500px; bottom: 40px; left: 750px;">전체 예상 소요 시간 : <span id="total_imgs_time"></span></p>
				</div>
			</div>
		</div>
	</main>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<script>
    	$(document).ready(function(){
    		
    		$.ajax({
    			url : "/flaskStart",
    			type : "POST",
    			data : {
    				episode_idx : ${episode_idx}
    			},
    			success : function(){
    				if(isSuccess == true){
    				location.href = "/analysis/analysis_result?episode_idx=${episode_idx}";    					
    				}
    			},
    			error : function(){
    				alert("실패");
    				location.href="/episode/episode_desc?episode_idx=${episode_idx}";
    			}
    		})
    	})
    </script>

	<script>
    	let sock = new SockJS("http://localhost:9090/socket");
    	sock.onmessage = onMessage;
    	
    	let imgs = [];		// 폴더마다 프레임을 저장하는 변수
    	let cnt = 0;		// 폴더의 인덱스
    	
    	let sumPreImg = 0;	// 전까지한 폴더의 프레임 총합
    	let sumImgs = 0;	// 모든 폴더 프레임 총합
    	
    	let img_time = 0;	// 현재 폴더의 시간을 계산할 변수
    	let imgs_time = 0;	// 모든 폴더의 시간을 계산할 변수
    	
    	let elem = document.getElementById("myBar");	// 현재 폴더 로딩바
    	let elem2 = document.getElementById("myBar2");	// 전체 폴더 로딩바
    	
    	let isSuccess = false;
    	
    	function onMessage(msg){
            var data = JSON.parse(msg.data);	// json 형식으로 변환
            
            // 전체 영상 프레임 수를 담는 변수가 있다면 if
            if(data.hasOwnProperty('img_list')){
            	// 전체 영상 리스트 반복문
            	for(i = 0; i < data.img_list.length; i++){
            		imgs[i] = data.img_list[i];		// 배열에 담음
            		sumImgs += data.img_list[i];	// 프레임 수를 담음
            	}
            	
            	// 프레임 수에 3씩 곱해서 변수에 담음
            	imgs_time = sumImgs * 3;
            	img_time = imgs[cnt] * 3;
            	
            	// 전체 프레임 수와 현재 프레임 수를 innerText
           		document.getElementById("total_img_frame").innerText = imgs[cnt];
           		document.getElementById("total_imgs_frame").innerText = imgs.length;
           		document.getElementById("imgs_frame").innerText = cnt;
           		
           		// 영상 프레임이 왔고 이제 영상 분석 단계이기 때문에 innerText
           		document.getElementById("process_status").innerText = "영상 분석 중";
           		
           		// 시간을 표시
           		document.getElementById("total_img_time").innerText = parseInt(img_time/3600)+"시간 "+parseInt(img_time/60)+"분 "+(img_time%60)+"초";
           		document.getElementById("total_imgs_time").innerText = parseInt(imgs_time/3600)+"시간 "+parseInt(imgs_time/60)+"분 "+(imgs_time%60)+"초";
           		
           		// 1초마다 1씩 빼서 시간 출력
           		setInterval(function(){
           			img_time -= 1;
           			imgs_time -= 1;
           			if(img_time >= 0 && isSuccess == false){
		           		document.getElementById("total_img_time").innerText = parseInt(img_time/3600)+"시간 "+parseInt(img_time/60)+"분 "+(img_time%60)+"초";
           			}
	           		document.getElementById("total_imgs_time").innerText = parseInt(imgs_time/3600)+"시간 "+parseInt(imgs_time/60)+"분 "+(imgs_time%60)+"초";           			
           		}, 1000);
           		
           		
            }
            
            // 현재 프레임을 담는 변수가 있다면 if
            if(data.hasOwnProperty('img_frame')){
            	// 현재 프레임 - 지금까지 한 폴더를 담아줌
            	var img_frame = data.img_frame-sumPreImg;
            	
            	// 현재 프레임이 현재 폴더보다 많으면 if
            	if(imgs[cnt] < img_frame){
            		sumPreImg += imgs[cnt++];		// 지금까지 한 폴더 변수에 현재 폴더 더해주고 인덱스++
            		
	           		document.getElementById("total_img_frame").innerText = imgs[cnt];	// 화면에 바뀐 폴더로 출력
	           		img_frame = data.img_frame - sumPreImg;								// 다시 한번 더 프레임 계산
               		document.getElementById("imgs_frame").innerText = cnt;				// 전체 폴더에서 현재 폴더도 변경
               		
           			img_time = imgs[cnt] * 3;		// 현재 폴더의 프레임의 * 3 => 한 프레임당 평균 3초 걸리니까
           			document.getElementById("total_img_time").innerText = parseInt(img_time/3600)+"시간 "+parseInt(img_time/60)+"분 "+(img_time%60)+"초";  // 시간계산해서 출력
            	}
            		
           		document.getElementById("img_frame").innerText = img_frame;									// 현재 폴더의 현재 프레임 출력 
            	document.getElementById("label").innerHTML = parseInt(img_frame / imgs[cnt] * 100)  + '%';	// 현재 폴더의 진행도 계산해서 출력
            	elem.style.width = img_frame / imgs[cnt] * 100 + '%'; 										// 현재 폴더의 진행도에 바도 변경
            	
            	// 100까지찼다면 0.5초 후에 0으로 보여주기
            	if(parseInt(img_frame / imgs[cnt] * 100) == 100){
            		setTimeout(function() {
		            	document.getElementById("label").innerHTML = 0  + '%';
		            	elem.style.width = 0 + '%';
            			}, 500);
            	}
            	
            	// 전체 폴더 상태도 변화
            	document.getElementById("label2").innerHTML = parseInt(data.img_frame / sumImgs * 100)  + '%';
            	elem2.style.width = data.img_frame / sumImgs * 100 + '%';
            	
            	// 전체 폴더 바가 100이라면 분석결과 페이지로 이동
            	if(parseInt(data.img_frame / sumImgs * 100) == 100){            		
               		document.getElementById("imgs_frame").innerText = imgs.length;
               		isSuccess = true;
            	}
            	
            }
    	}
    	
    </script>

</body>

</html>