<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.wasp.chaser.domain.WantedDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath"
	value="${pageContext.request.contextPath == '/' ? '' : pageContext.request.contextPath }"
	scope="application" />
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
<link rel="stylesheet"
	href="https://blog.codepen.io/documentation/exporting-pens/">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
	color: whitesmoke;
	font-size: 23px;
	font-weight: 600;
	position: relative;
	left: 47px;
	top: 23px;
}

.menu {
	font-size: large;
	color: whitesmoke;
	background-color: transparent;
	border: none;
	padding-left: 250px;
	font-family: 'btnfont';
}

.main_content {
	font-family: 'cntfont';
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

.sidebar {
	height: 100%;
	width: 0px;
	position: absolute;
	z-index: 1;
	top: 0;
	left: 0;
	overflow: auto;
	background-color: rgb(31, 35, 44);
	overflow-x: hidden;
	transition: 0.3s;
	/*펼침속도*/
	padding-top: 60px;
}

.sidebar a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 15px;
	color: #818181;
	display: block;
	transition: 0.3s;
}
/*메뉴열기 hover 시*/
.sidebar a:hover {
	color: #F1F1F1;
}

.sidebar .closebtn {
	position: absolute;
	top: 0;
	right: 10px;
	font-size: 36px;
	/* margin-left: 50px; */
}

.openbtn {
	font-size: 17px;
	cursor: pointer;
	background-color: transparent;
	color: #C8C8C8;
	padding: 10px 15px;
	border: none;
}

.openbtn:hover {
	background-color: #444;
}

#main {
	transition: margin-left 0.4s;
	padding: 16px;
}

h5, p {
	margin: 0;
}

a {
	text-decoration: none;
	color: inherit;
}

ul {
	list-style: none;
}

.target {
	display: block;
	top: 0;
	left: 0;
	position: fixed;
}

.open-accordion {
	display: block;
}

.close-accordion {
	display: none;
}

:target ~.open-accordion {
	display: none;
}

:target ~.close-accordion {
	display: block;
}

.accordion {
	display: flex;
	flex-direction: column;
	gap: 1.5rem;
	padding-left: 270px;
	float: left;
	padding-right: 100px;
}

.accordion__li {
	width: 45rem;
	background: rgb(31, 35, 44);
	border-radius: 0.4rem;
	padding: 2rem;
}

.accordion__li a>div {
	display: flex;
	justify-content: space-between;
	align-items: center;
	cursor: pointer;
}

.accordion__li a>div div {
	display: flex;
	align-items: center;
}

.accordion__num {
	font-size: 1.8rem;
	margin-right: 1.3rem;
	color: #C8C8C8;
}

.accordion__title {
	font-size: 1.6rem;
	color: #C8C8C8;
}

.accordion__li i {
	font-size: 1.3rem;
	position: relative;
	top: 0.1rem;
	right: 0.5rem;
	color: #C8C8C8;
}

/* When accordion is open */
.accordion__content {
	font-size: 1.6rem;
	line-height: 1.5;
	height: 0;
	overflow: hidden;
	transition: all 0.3s ease-in-out;
	color: #C8C8C8;
}

.accordion__li:first-of-type :target ~.accordion__content {
	height: 3rem;
	padding-top: 0.5rem;
}

.accordion__li:nth-of-type(2) :target ~.accordion__content {
	height: 3rem;
	padding-top: 0.5rem;
}

.accordion__li:last-child :target ~.accordion__content {
	height: 3rem;
	padding-top: 0.5rem;
}

#progress-bar-container {
	width: 100%;
	height: 5px;
	background-color: #ccc;
	cursor: pointer;
}

#progress-bar {
	height: 100%;
	background-color: #f00;
}

.btn_time {
	border: none;
	background-color: transparent;
	color: #C8C8C8;
}

.btn_time:hover {
	color: #0040FF;
}

.btn_confirm {
	background-color: whitesmoke;
	width: 70px;
	height: 25px;
	font-size: 1.3rem;
	border-radius: 8px;
	margin-left: 335px;
	box-shadow: 1px 2px 0 rgba(3, 44, 230, 0.356);
	float: left;
}

.btn_confirm:active {
	box-shadow: 1px 1px 0 rgb(0, 0, 0, 0.5);
	position: relative;
	top: 2px;
}

.ekdma {
	width: 250px;
	height: 50px;
	padding-top: 30px;
	border: 2px solid #FFFEFE;
	font-family: 'Lato', sans-serif;
	font-weight: 500;
	background: transparent;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
	font-size: 20px;
	color: #FFFEFE;
	top: 80px;
	left: 350px;
}

.btn-7 {
	line-height: 39px;
	padding: 0;
}

.btn-7:hover {
	background: transparent;
	color: #FFFEFE;
}

.btn-7 span {
	position: relative;
	display: block;
	width: 100%;
	height: 100%;
	padding-top: 5px;
}

.btn-7:before, .btn-7:after {
	position: absolute;
	content: "";
	left: 0;
	top: 0;
	background: #FEFEFF;
	transition: all 0.3s ease;
}

.btn-7:before {
	height: 0%;
	width: 2px;
}

.btn-7:after {
	width: 0%;
	height: 2px;
}

.btn-7:hover:before {
	height: 100%;
}

.btn-7:hover:after {
	width: 100%;
}

.btn-7 span:before, .btn-7 span:after {
	position: absolute;
	content: "";
	right: 0;
	bottom: 0;
	background: #FFFEFE;
	transition: all 0.3s ease;
}

.btn-7 span:before {
	width: 2px;
	height: 0%;
}

.btn-7 span:after {
	width: 0%;
	height: 2px;
}

.btn-7 span:hover:before {
	height: 100%;
}

.btn-7 span:hover:after {
	width: 100%;
}

.folder-link {
	display: block;
	font-size: 15px;
	width: 300px; /* 원하는 넓이 값으로 변경하세요 */
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
<script>
	var wantedList = [];
</script>
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

		<div class=main_content
			style="width: 100%; height: 850px; background-color: #2C2C2C;">
			<div style="height: 100%;">
				<div class="sidebar">
					<a class="closebtn" onclick="closeMenu()">×</a>

					<c:forEach items="${imageList}" var="image">
						<div style="display: flex;">
							<a
								href="/analysis/analysis_result?episode_idx=${image.episode_idx}&img_idx=${image.img_idx}"
								class="folder-link">${image.img_nm }</a> <a
								href="/analysis/image_delete?img_idx=${image.img_idx}"
								style="position: relative; bottom: 10px;"><i
								class="fa fa-trash-o" aria-hidden="true"
								style="color: #C8C8C8; font-size: 15px; margin-right: 5px; margin-top: 13px;"></i></a>
						</div>
					</c:forEach>

				</div>

				<div id="main">
					<button class="openbtn" onclick="openMenu()">☰ 폴더 선택</button>
				</div>
				<ul class="accordion">
					<span class="target" id="accordion"></span>
					<c:forEach items="${result.wantedDTOList}" var="wanted">
						<c:set var="i" value="${i+1 }" />
						<li class="accordion__li"><span class="target"
							id="accordion${i}"></span> <a href="#accordion${i}"
							class="open-accordion" title="open">
								<div>
									<div>
										<span class="accordion__num" style="color:${wanted.w_color};">${i}</span>
										<h5 class="accordion__title" style="color:${wanted.w_color};">용의자</h5>
									</div>
									<i class="fas fa-chevron-down"></i>
								</div>
						</a> <a href="#accordion" class="close-accordion" title="close">
								<div>
									<div>
										<span class="accordion__num" style="color:${wanted.w_color};">${i}</span>
										<h5 class="accordion__title" style="color:${wanted.w_color};">용의자</h5>
									</div>
									<i class="fas fa-chevron-up"></i>
								</div>
						</a>
							<p class="accordion__content" id="w_per">일치율 :
								${wanted.w_per}%</p> <%-- <fmt:parseNumbervar="pages"integerOnly="true"value="${wanted.w_first/2/3600}:${wanted.w_first}:${wanted.w_first/2%60}"/> --%>
							<p class="accordion__content">
								나온 시간 :
								<button class="btn_time" onclick="goToTimestamp(this.innerHTML)">
									<fmt:parseNumber var="hours" value="${wanted.w_first/2/3600}"
										integerOnly="true" />
									<fmt:parseNumber var="mins" value="${wanted.w_first/2/60%60}"
										integerOnly="true" />
									<fmt:parseNumber var="secs" value="${wanted.w_first/2%60}"
										integerOnly="true" />
									${hours}:
									<c:if test="${mins <= '9'}">0${mins}</c:if>
									<c:if test="${mins > '9'}">${mins}</c:if>
									:
									<c:if test="${secs <= '9'}">0${secs}</c:if>
									<c:if test="${secs > '9'}">${secs}</c:if>
								</button>
								~
								<button class="btn_time" onclick="goToTimestamp(this.innerHTML)">
									<fmt:parseNumber var="hours2" value="${wanted.w_last/2/3600}"
										integerOnly="true" />
									<fmt:parseNumber var="mins2" value="${wanted.w_last/2/60%60}"
										integerOnly="true" />
									<fmt:parseNumber var="secs2" value="${wanted.w_last/2%60}"
										integerOnly="true" />
									${hours2}:
									<c:if test="${mins2 <= '9'}">0${mins2}</c:if>
									<c:if test="${mins2 > '9'}">${mins2}</c:if>
									:
									<c:if test="${secs2 <= '9'}">0${secs2}</c:if>
									<c:if test="${secs2 > '9'}">${secs2}</c:if>
								</button>
							</p>
							<p class="accordion__content">
								<button type="button" class="btn_confirm"
									onclick="confirmData(this)">확정</button>
							</p></li>
					</c:forEach>
				</ul>


				<div style="width: 900px; float: left;">
					<video id="video" prelaod="metadata" src="${result.img_src}"
						controls style="width: 100%;"></video>
					<button class="ekdma btn-7">
						<a href="/analysis/visualize_result?episode_idx=${episode_idx}"><span>경로
								확인하기</span></a>
					</button>
				</div>
			</div>
		</div>
	</main>

	<script src="https://kit.fontawesome.com/70e0dc75f1.js" s></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		function confirmData(button) {
			var buttonText = button.innerHTML;
			var liElement = button.parentNode.parentNode; // 확정 버튼이 속한 li 태그 선택
			if (buttonText === "확정") {
				button.innerHTML = "확정취소";
				liElement.style.boxShadow = "0 0 10px grey"; // box-shadow 추가
				// 저장 기능을 여기에 추가
			} else if (buttonText === "확정취소") {
				button.innerHTML = "확정";
				liElement.style.boxShadow = ""; // box-shadow 제거
				// 저장 취소 기능을 여기에 추가
			}
		}
	</script>
	<script>
		// 비디오 엘리먼트와 프로그레스 바 엘리먼트를 가져옵니다.
		var video = document.getElementById('video');
		var progressBar = document.getElementById('progress-bar');
		// 비디오 로드가 완료되었을 때의 이벤트 핸들러를 등록합니다.
		video.addEventListener('loadedmetadata', function() {
			// 비디오의 총 재생 시간을 가져옵니다.
			var duration = video.duration;
			// 프로그레스 바를 클릭하였을 때의 이벤트 핸들러를 등록합니다.
			progressBar.addEventListener('click', function(event) {
				// 클릭한 위치의 x 좌표를 가져옵니다.
				var clickX = event.pageX - progressBar.offsetLeft;
				// console.log("${event.pageX}");
				// 프로그레스 바의 총 너비를 가져옵니다.
				var progressBarWidth = progressBar.offsetWidth;
				// 비디오를 클릭한 위치의 시간으로 이동시킵니다.
				video.currentTime = (clickX / progressBarWidth) * duration;
			});
		});
	</script>
	<script>
		function goToTimestamp(timestampText) {
			var video = document.getElementById('video');
			var timeParts = timestampText.split(':');
			var hours = 0;
			var minutes = 0;
			var seconds = 0;
			if (timeParts.length === 2) {
				minutes = parseInt(timeParts[0], 10);
				seconds = parseInt(timeParts[1], 10);
			} else if (timeParts.length === 3) {
				hours = parseInt(timeParts[0], 10);
				minutes = parseInt(timeParts[1], 10);
				seconds = parseInt(timeParts[2], 10);
			}
			var totalSeconds = hours * 3600 + minutes * 60 + seconds;
			video.currentTime = totalSeconds;
		}
	</script>
	<script>
		function changeSize(select) {
			var text = document.getElementById('text');
			if (select.value === 'option1') {
				text.classList.remove('normal');
				text.classList.add('selected');
			} else if (select.value === 'option2') {
				text.classList.remove('selected');
				text.classList.add('normal');
			}
		}
	</script>
	<script>
		function openMenu() {
			document.getElementById("main").style.marginLeft = "250px";
			document.querySelector('.sidebar').style.width = "350px";
			document.querySelector('.openbtn').style.display = 'none';
		}
		function closeMenu() {
			document.getElementById("main").style.marginLeft = "0";
			document.querySelector('.sidebar').style.width = "0";
			document.querySelector('.openbtn').style.display = 'block';
		}
	</script>
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

</body>

</html>