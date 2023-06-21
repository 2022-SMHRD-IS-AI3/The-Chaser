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

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
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
	margin-left: 10px;
	margin-right: 20px;
}

.next:hover {
	color: #116dff;
}

.ekdma {
	width: 110px;
	height: 40px;
	padding: 10px 25px;
	border: 2px solid #444343;
	font-family: 'Lato', sans-serif;
	font-weight: 550;
	background: transparent;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
	font-size: 20px;
	color: #444343;
	bottom: 30px;
	left: 1735px;
}

.btn-7 {
	line-height: 39px;
	padding: 0;
}

.btn-7:hover {
	background: transparent;
	color: #444343;
}

.btn-7 span {
	position: relative;
	display: block;
	width: 100%;
	height: 100%;
}

.btn-7:before, .btn-7:after {
	position: absolute;
	content: "";
	left: 0;
	top: 0;
	background: #444343;
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
	background: #444343;
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

#aaa {
	text-decoration-line: none;
	color: #fff;
}

</style>
</head>

<body>

	<div class="topp">
		<div style="width: fit-content; height: 79px;">
			<img src="/resources/image/moon.png" alt="" class="top_img">
		</div>
		<span class="wnwp"><a href="/main" id="aaa">The Chaser</a></span>
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
			<h3
				style="font-size: xx-large; padding-left: 100px; padding-top: 40px; padding-bottom: 30px; font-family: 'btnfont';">
				제품 사용법
				</h2>
				<div style="display: flex;">
					<span>
						<div
							style="width: 950px; margin-right: 100px; padding-left: 100px;">

							<ul class="nav nav-pills">
								<li class="nav-item dropdown">
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="#scrollspyHeading1">Step1</a></li>
										<li>
											<hr class="dropdown-divider">
										</li>
										<li><a class="dropdown-item" href="#scrollspyHeading2">Step2</a></li>
										<li>
											<hr class="dropdown-divider">
										</li>
										<li><a class="dropdown-item" href="#scrollspyHeading3">Step3</a></li>
										<li>
											<hr class="dropdown-divider">
										</li>
										<li><a class="dropdown-item" href="#scrollspyHeading4">Step4</a></li>
										<li>
											<hr class="dropdown-divider">
										</li>
										<li><a class="dropdown-item" href="#scrollspyHeading5">Step5</a></li>
									</ul>
								</li>
							</ul>
							</nav>
							<div data-bs-spy="scroll" data-bs-target="#navbar-example2"
								data-bs-offset="0" class="scrollspy-example" tabindex="0"
								style="height: 650px; overflow-y: scroll;">
								<br>
								<h2 id="scrollspyHeading1" class="step">Step 1</h2>
								<br>
								<p class="ptag">
									1. 목록 페이지 에서는 등록 버튼을 눌러 사건을 등록 합니다.<br> 2. 사건을 등록 할 때 에는
									제목, 사건유형, 발생장소를 필수로 작성해야 하고 본인이 메모하거나 사건에 대해 적고 싶은 내용을 작성 할 수
									있습니다.<br> 3. 등록 버튼을 누르면 인상착의 선택 페이지로 넘어갑니다.
								</p>
								<br>
								<h2 id="scrollspyHeading2" class="step">Step 2</h2>
								<br>
								<p class="ptag">
									1. 인상착의 페이지에서는 범인의 성별, 키, 상의, 하의, 체형, 연령대, 소지품을 선택 후 영상 선택 페이지로
									넘어갑니다.<br>
									<!-- 2. 만약 이미 등록 후 다시 선택하는 거라면 불러오기 버튼을 통해 본인이 선택했던 인상착의 내용을 불러 올 수 있습니다. <br> -->
								</p>
								<br>
								<h2 id="scrollspyHeading3" class="step">Step 3</h2>
								<br>
								<p class="ptag">
									1. 영상 선택 페이지에서는 폴더생성 버튼을 눌러 지도를 통해 CCTV영상의 위치를 선택합니다.<br>
									2. 선택한 CCTV위치 장소 이름으로 폴더가 생성됩니다.<br> 3. 폴더가 생성이 되면 폴더 안에 그
									위치에 맞는 CCTV영상들을 체크박스를 선택해 추가 버튼을 눌러 폴더 안에 넣습니다.<br> 4. 다른
									위치에서의 CCTV영상을 분석하고 싶다면 다시 주소 찾기 버튼을 눌러 CCTV영상의 위치를 선택해 새로운 폴더를
									만들어야 합니다.<br> 5. 원하는 폴더를 다 만든 후 분석 시작 버튼을 누르면 분석을 시작합니다.<br>

								</p>
								<br>
								<h2 id="scrollspyHeading4" class="step">Step 4</h2>
								<br>
								<p class="ptag">
									1. 분석이 완료되면 영상들 중에서 선택했던 인상착의가 가장 유사한 순으로 리스트가 나오고 영상들이 하나로 합쳐진
									영상이 나옵니다.<br> 2. 리스트에 나온 용의자를 한 명 씩 선택 해보면 그 용의자의 일치율과 함께
									그 용의자가 나온 시간대를 눌러 영상에서의 해당 시간으로 이동하여 확인 할 수 있습니다.<br> 3.
									리스트 중에 해당하는 용의자가 있다면 확정 버튼을 눌러 해당 용의자를 확정 시킬 수 있습니다.<br>
									4. 왼쪽 상단에 있는 폴더 선택을 눌러 사용자가 만든 폴더들을 모두 확인할 수 있습니다.<br> 5.
									폴더를 확인 하였을 때 해당하는 용의자가 없다고 판단되면 폴더를 삭제 할 수 있습니다.<br> 6. 모든
									과정이 완료되었다면 경로 확인하기 버튼을 눌러 경로 확인 페이지로 이동합니다. <br>
								</p>
								<br>
								<h2 id="scrollspyHeading5" class="step">Step 5</h2>
								<br>
								<p class="ptag">
									1. 선택한 범인의 동선과 함께 요약된 사건을 보여줍니다.<br> 2. 결과 저장하기 버튼을 누르면 사건
									목록 페이지로 이동합니다.<br> 3. 사건 목록 페이지에서는 해당 글을 확인 할 수 있으며 글을
									선택하여 수정 및 삭제가 가능합니다.
								</p>
								<br>
								<br>
							</div>
						</div>

					</span>
					<div>
						<video prelaod="metadata" src="/resources/image/howto_use.mp4"
							controls style="width: 800px;"></video>
						<p
							style="font-size: x-large; padding-left: 400px; font-family: 'btnfont'; margin-top: 20px;">사용예시</p>
					</div>
				</div>
				<button class="ekdma btn-7"
					onclick="moveUrl('/episode/episode_list')">
					<span>다음</span>
				</button>
		</div>
	</main>

	<script type="text/javascript">
		const moveUrl = (url) => {
			location.href = url;
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

</body>

</html>