<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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

        .top_img{
            width: 70px; position: relative; left: 90px; top: 10px;
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

    <div class = "topp">
        <div style="width: fit-content; height:79px;">
            <img src="./사진1.png" alt=""  class="top_img">
        </div>
        <span
            class="wnwp"><a href="/main" >The
            Chaser</a></span>
        <button type="button" onclick="location.href='/introduction'" class="menu"
            style="padding-left: 400px;">회사소개</button>
        <button type="button" onclick="location.href='/intro_video'" class="menu">시연영상</button>
        <button type="button" onclick="location.href='/product_use'" class="menu">시작하기</button>
    </div>
    <main id="PAGES_CONTAINER" class="PAGES_CONTAINER" tabindex="-1" data-main-content="true">
        <div class = main_content style="width: 100%; height: 100%;">
            <div class="board_wrap">
                <div class="board_title">
                    <strong>목록</strong>
                    
                </div>
                <div class="board_list_wrap">
                    <div class="board_list">
                        <div class="top">
                            <div class="num">번호</div>
                            <div class="title">제목</div>
                            <div class="type">사건유형</div>
                            <div class="state">상태</div>
                            <div class="date">작성일</div>
                        </div>
                        <c:forEach items="${list }" var="episode">
                        	<div>
                           		<div class="num">${episode.episode_idx }</div>
                            	<div class="title"><a href="./episode_desc?episode_idx=${episode.episode_idx} ">${episode.episode_title }</a></div>
                            	<div class="type">${episode.episode_type}</div>
                            	<div class="state">
                            		<c:choose>
                            			<c:when test="${episode.episode_flag.toString() eq '0'}">사건생성완료</c:when>
                            			<c:when test="${episode.episode_flag.toString() eq '1'}">인상착의 등록완료</c:when>
                            			<c:when test="${episode.episode_flag.toString() eq '2'}">동영상 선택완료</c:when>
                            			<c:when test="${episode.episode_flag.toString() eq '3'}">동영상 분석완료</c:when>
                            			<c:when test="${episode.episode_flag.toString() eq '9'}">사건 종결</c:when>
                            			<c:otherwise>바보야 다시해</c:otherwise>
                            		</c:choose>
                            	</div>
                            	<div class="date"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${episode.episode_start_dt}"/></div>
                            	
                        	</div>
                        </c:forEach>
                    </div>
                    <!-- 페이징 -->
                   <!--  <div class="board_page">
                        <a href="#" class="bt first"></a>
                        <a href="#" class="bt prev"></a>
                        <a href="#" class="num on">1</a>
                        <a href="#" class="num">2</a>
                        <a href="#" class="num">3</a>
                        <a href="#" class="num">4</a>
                        <a href="#" class="num">5</a>
                        <a href="#" class="bt next">></a>
                        <a href="#" class="bt last">>></a>
                    </div> -->
                    <div class='board_page'>
					
						<c:if test="${pageMaker.prev}">
							<a  class="bt prev"
								href="/episode/episode_list?pageNum=${pageMaker.startPage -1}">이전</a>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							
								<a class="num  ${pageMaker.cri.pageNum == num ? "on":""} " href="/episode/episode_list?pageNum=${num}">${num}</a>
							
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<a class="bt next" 
								href="/episode/episode_list?pageNum=${pageMaker.endPage +1 }">다음</a>
						</c:if>
					
				</div>
                    
                    <div class="bt_wrap">
                        <button onclick="moveUrl('/episode/episode_register')" class="on">등록</button>
                        
                    </div>
                </div>
            </div>
        </div>
    </main>
   
	<script type="text/javascript">
		const moveUrl = (url) => {
			location.href = url;
		}
	</script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

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
    </script>

</body>

</html>


