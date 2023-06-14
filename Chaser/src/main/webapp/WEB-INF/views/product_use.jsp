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
	src: url('/font/SCDream4.woff') format('woff');
}

@font-face {
	font-family: 'contentfont';
	src: url('/font/NotoSansKR-Medium.woff') format('woff');
}

@font-face {
	font-family: 'cntfont';
	src: url('/font/NotoSansKR-Regular.woff') format('woff');
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
	padding-left: 5px;
}

.next:hover {
	color: #116dff;
}

#Logsuccess {
	visibility: hidden;
}
</style>
</head>

<body>

    <div class="topp">
        <div style="width: fit-content; height:79px;">
            <img src="./사진1.png" alt="" class="top_img">
        </div>
        <span class="wnwp">The
            Chaser</span>
        <button type="button" onclick="location.href='/introduction'" class="menu"
            style="padding-left: 400px;">회사소개</button>
        <button type="button" onclick="location.href='/intro_video'" class="menu">시연영상</button>
        <button type="button" id="Logsuccess" onclick="moveUrl('/product_use')" class="menu">시작하기</button>
    </div>
	<main id="PAGES_CONTAINER" class="PAGES_CONTAINER" tabindex="-1"
		data-main-content="true">
		<div class=main_content style="width: 100%; height: 100%;">
			<h3
				style="font-size: xx-large; padding-left: 100px; padding-top: 40px; padding-bottom: 30px; font-family: 'btnfont';">
				제품 사용법
				</h3>
				<div style="display: flex;">
					<span>
						<div style="width: 950px; margin-right: 100px; padding-left: 100px;">
							<nav id="navbar-example2"
								class="navbar navbar-light bg-light px-3">
								<a class="navbar-brand" href="#"></a>
								<ul class="nav nav-pills">
									<li class="nav-item dropdown">
										<!-- <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
                                            role="button" aria-expanded="false" style="font-size:20px;">목록</a> -->
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
								style="height: 700px; overflow-y: scroll;">
								<br>
								<h2 id="scrollspyHeading1" class="step">Step 1</h2>
								<br>
								<p class="ptag">
									1.목록 페이지 에서는 등록 버튼을 눌러 사건을 등록 합니다.<br> 2.사건을 등록 할 때 에는 제목,
									사건유형, 발생장소를 필수로 작성해야 하고 본인이 메모하거나 사건에 대해 적고 싶은 내용을 작성 할 수 있습니다.<br>
									3. 글을 등록하면 등록한 리스트를 누른 후 다음 버튼을 눌러 인상착의 선택 페이지로 넘어갑니다.
								</p>
								<br>
								<h2 id="scrollspyHeading2" class="step">Step 2</h2>
								<br>
								<p class="ptag">
									1. 인상착의 페이지에서는 범인의 성별, 키, 상의, 하의, 체형, 연령대, 소지품을 선택 후 영상 선택 페이지로
									넘어갑니다.<br> 2. 만약 이미 등록 후 다시 선택하는 거라면 불러오기 버튼을 통해 본인이 선택했던
									인상착의 내용을 불러 올 수 있습니다. <br>
								</p>
								<br>
								<h2 id="scrollspyHeading3" class="step">Step 3</h2>
								<br>
								<p class="ptag">
									1. 영상 선택 페이지에서는 주소 찾기 버튼을 눌러 본인이 넣고 싶은 CCTV영상의 위치를 선택합니다.<br>
									2. 선택하면 CCTV영상의 위치 내용으로 폴더가 생성됩니다.<br> 3. 폴더가 생성이 되면 폴더 안에
									그 위치에 맞는 CCTV영상들을 넣습니다.<br> 4. 다른 위치에서의 CCTV영상을 분석하고 싶다면
									다시 주소 찾기 버튼을 눌러 CCTV영상의 위치를 선택해 새로운 폴더를 만들어야 합니다.<br> 5.
									원하는 폴더를 다 만든 후 다음 버튼을 누르면 분석을 시작합니다.<br>

								</p>
								<br>
								<h2 id="scrollspyHeading4" class="step">Step 4</h2>
								<br>
								<p class="ptag">
									1. 분석이 완료되면 영상들 중에서 선택했던 인상착의가 가장 유사한 순으로 리스트가 나오고 영상들이 하나로 합쳐진
									영상이 나옵니다.<br> 2. 리스트에 나온 용의자를 한 명 씩 선택 해보면 그 용의자의 일치율과 함께
									그 용의자가 나온 시간대를 영상으로 확인 할 수 있습니다.<br> 3. 사용자는 시간대 바를 통해 그
									용의자가 나온 시간을 조절해가며 확인 할 수 있습니다.<br> 4. 리스트중에 범인을 선택 해 다음
									버튼을 누르면 선택한 범인의 동선을 확인 할 수 있는 페이지로 넘어갑니다.<br> 4. 만약 사용자가
									생각한 범인이 리스트에 없다면 다시 인상착의를 선택하거나 영상을 선택 할 수 있습니다. <br>
								</p>
								<br>
								<h2 id="scrollspyHeading5" class="step">Step 5</h2>
								<br>
								<p class="ptag">
									1. 선택한 범인의 동선을 지도를 통해 보여줍니다.<br> 2. 확인 버튼을 누르면 다시 첫
									페이지(목록)로 돌아가게 됩니다.<br> 3. 목록 페이지에서는 해당 글을 확인 할 수 있으며 글을
									선택하여 수정 및 삭제가 가능합니다.
								</p>
								<br>
								<br>
							</div>
						</div>

					</span>
					<div>
						<video prelaod="metadata" src="./LG 시그니처 제품 소개 영상.mp4#t=0.8"
							controls style="width: 800px;"></video>
					</div>
				</div>
				<div
					style="font-size: 30px; position: relative; left: 1750px; bottom: 50px;"
					class="next">
					<a href="/episode/episode_list?pageNum=1" style="color: black;">다음</a>
				</div>
		</div>
	</main>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script>
        window.firstPageId = 'zg724'
        window.bi.sendBeat(12, 'Partially visible', {
            pageId: window.firstPageId
        })
        if (window.requestCloseWelcomeScreen) {
            window.requestCloseWelcomeScreen()
        }
        if (!window.__browser_deprecation__) {
            window.fedops.phaseStarted('partially_visible', {
                paramsOverrides: {
                    pageId: firstPageId
                }
            })
        }
        
        const moveUrl = (url) => {
    		console.log('move..............url...............')
    		location.href = url;
    	}
    </script>

</body>

</html>