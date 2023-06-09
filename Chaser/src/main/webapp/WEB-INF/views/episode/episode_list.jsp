<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

        .wnwp{
            font-family:avenir-lt-w01_85-heavy1475544,sans-serif; 
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

    <div class = "topp">
        <div style="width: fit-content; height:79px;">
            <img src="./사진1.png" alt=""  class="top_img">
        </div>2
        <span
            class="wnwp">The
            Chaser</span>
        <button type="button" onclick="location.href='introduce.html'" class="menu"
            style="padding-left: 400px;">회사소개</button>
        <button type="button" onclick="location.href='demo_video.html'" class="menu">시연영상</button>
        <button type="button" onclick="location.href='product_use.html'" class="menu">시작하기</button>
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
                        <div>
                            <div class="num">1</div>
                            <div class="title"><a href="view.html">글 제목이 들어갑니다.</a></div>
                            <div class="type">절도</div>
                            <div class="state">진행중</div>
                            <div class="date">2023-05-16</div>
                        </div>
                        <div>
                            <div class="num">2</div>
                            <div class="title"><a href="view.html">글 제목이 들어갑니다.</a></div>
                            <div class="type">공갈</div>
                            <div class="state">진행중</div>
                            <div class="date">2023-05-20</div>
                        </div>
                        <div>
                            <div class="num">3</div>
                            <div class="title"><a href="view.html">글 제목이 들어갑니다.</a></div>
                            <div class="type">손괴</div>
                            <div class="state">진행완료</div>
                            <div class="date">2023-05-25</div>
                        </div>
                        <div>
                            <div class="num">4</div>
                            <div class="title"><a href="view.html">글 제목이 들어갑니다.</a></div>
                            <div class="type">폭행</div>
                            <div class="state">진행완료</div>
                            <div class="date">2023-05-25</div>
                        </div>
                        <div>
                            <div class="num">5</div>
                            <div class="title"><a href="view.html">글 제목이 들어갑니다.</a></div>
                            <div class="type">강도</div>
                            <div class="state">진행완료</div>
                            <div class="date">2023-05-28</div>
                        </div>
                        <div>
                            <div class="num">6</div>
                            <div class="title"><a href="view.html">글 제목이 들어갑니다.</a></div>
                            <div class="type">방화</div>
                            <div class="state">진행완료</div>
                            <div class="date">2023-06-01</div>
                        </div>
                        <div>
                            <div class="num">7</div>
                            <div class="title"><a href="view.html">글 제목이 들어갑니다.</a></div>
                            <div class="type">강간</div>
                            <div class="state">진행중</div>
                            <div class="date">2023-06-01</div>
                        </div>
                        <div>
                            <div class="num">8</div>
                            <div class="title"><a href="view.html">정유정 살인사건.</a></div>
                            <div class="type">살인</div>
                            <div class="state">진행완료</div>
                            <div class="date">2023-06-02</div>
                        </div>
                        <div>
                            <div class="num">9</div>
                            <div class="title"><a href="view.html">글 제목이 들어갑니다.</a></div>
                            <div class="type">유괴</div>
                            <div class="state">진행완료</div>
                            <div class="date">2023-06-03</div>
                        </div>
                        <div>
                            <div class="num">10</div>
                            <div class="title"><a href="view.html">글 제목이 들어갑니다.</a></div>
                            <div class="type">납치</div>
                            <div class="state">진행완료</div>
                            <div class="date">2023-06-05</div>
                        </div>
                    </div>
                    <div class="board_page">
                        <a href="#" class="bt first"></a>
                        <a href="#" class="bt prev"></a>
                        <a href="#" class="num on">1</a>
                        <a href="#" class="num">2</a>
                        <a href="#" class="num">3</a>
                        <a href="#" class="num">4</a>
                        <a href="#" class="num">5</a>
                        <a href="#" class="bt next">></a>
                        <a href="#" class="bt last">>></a>
                    </div>
                    <div class="bt_wrap">
                        <a href="write.html" class="on">등록</a>
                        <!--<a href="#">수정</a>-->
                    </div>
                </div>
            </div>
        </div>
    </main>
   


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


