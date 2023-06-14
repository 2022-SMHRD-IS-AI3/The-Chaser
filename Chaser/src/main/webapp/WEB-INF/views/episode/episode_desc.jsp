<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	top: 10px;
}

.wnwp {
	font-family: avenir-lt-w01_85-heavy1475544, sans-serif;
	color: white;
	font-size: 1.5rem;
	font-weight: 600;
	position: relative;
	left: 42px;
	top: 20px;
}

.menu {
	font-size: large;
	color: white;
	background-color: transparent;
	border: none;
	padding-left: 250px;
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
			<img src="./사진1.png" alt="" class="top_img">
		</div>
		<span class="wnwp">The Chaser</span>
		<button type="button" onclick="location.href='/introduction'" class="menu"
            style="padding-left: 400px;">회사소개</button>
        <button type="button" onclick="location.href='/intro_video'" class="menu">시연영상</button>
        <button type="button" onclick="location.href='/product_use'" class="menu">시작하기</button>
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
								<dd><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${episode.episode_start_dt}"/></dd>
							</dl>

						</div>
						<div class="cont">
							<div style="float: right; margin-right: 130px;">
								${episode.episode_content }</div>
							<div class="map"
								style="width: 600px; height: 505px; background-color: #000;"></div>
						</div>
					</div>
					<div class="bt_wrap">
						<button onclick="moveUrl('/episode/episode_modify?episode_idx=${episode.episode_idx }')">수정</button>
						<button onclick="moveUrl('/episode/episode_delete?episode_idx=${episode.episode_idx }')">삭제</button>
						<button onclick="moveUrl('/episode/episode_list')" class="on">목록</button>
									 <c:choose>
										<c:when test="${episode.episode_flag.toString() eq '0'}">
										<button class="on" onclick="moveUrl('/analysis/appearance?episode_idx=${episode.episode_idx }')">인상착의 입력</button>
										</c:when>
										<c:when test="${episode.episode_flag.toString() eq '1'}">
										<button class="on" onclick="moveUrl('/analysis/appearance?episode_idx=${episode.episode_idx }')">인상착의 수정</button>
										</c:when>
										<c:when test="${episode.episode_flag.toString() eq '2'}">
										동영상 선택완료
										</c:when>
										<c:when test="${episode.episode_flag.toString() eq '3'}">
										동영상 분석완료
										</c:when>
										<c:when test="${episode.episode_flag.toString() eq '9'}">
										사건 종결
										</c:when>
										<c:otherwise>DB Error02</c:otherwise>
									</c:choose> 
						
					</div>
				</div>
			</div>
		</div>
	</main>

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

</body>

</html>
