<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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

        select {
            box-sizing: border-box;
            width: 100px;
            padding: 4px;
            font-size: 14px;
            border-radius: 6px;
        }

        option {
            padding: 4px;
            font-size: 14px;
            color: #fff;
            background: #272822;
        }
    </style>
</head>

<body>

    <div class = "topp">
        <div style="width: fit-content; height:79px;">
            <img src="./사진1.png" alt=""  class="top_img">
        </div>
        <span
            class="wnwp">The
            Chaser</span>
        <button type="button" onclick="location.href='introduce.html'" class="menu"
            style="padding-left: 400px;">회사소개</button>
        <button type="button" onclick="location.href='demo_video.html'" class="menu">시연영상</button>
        <button type="button" onclick="location.href='product_use.html'" class="menu">시작하기</button>
    </div>
    <main id="PAGES_CONTAINER" class="PAGES_CONTAINER" tabindex="-1" data-main-content="true">
        <div class=main_content style="width: 100%; height: 100%;">
            <div class="board_wrap">

                <div class="board_write_wrap">
                    <div class="board_write">
                        <div class="title">
                            <dl>
                                <dt>제목</dt>
                                <dd><input type="text" placeholder="제목 입력"></dd>
                            </dl>
                        </div>
                        <div class="title">
                            <dl>
                                <dt>사건유형</dt>
                                <dd><select name="select">
                                    <option value="none" selected>선택</option>
                                    <option value="option 1">절도</option>
                                    <option value="option 2">공갈</option>
                                    <option value="option 3">손괴</option>
                                    <option value="option 4">폭행</option>
                                    <option value="option 5">강도</option>
                                    <option value="option 6">방화</option>
                                    <option value="option 7">강간</option>
                                    <option value="option 8">살인</option>
                                    <option value="option 9">유괴</option>
                                    <option value="option 10">납치</option>

                                  </select></dd>
                            </dl>
                        </div>
                        <div class="title">
                            <dl>
                                <dt>장소</dt>
                                <dd></dd>
                            </dl>
                        </div>
                        <div class="info">
                            <dl>
                                <dt>사건발생일자</dt>
                                <dd style="padding-top: 5px;">
                                    <input type="date"
                                           id="date"
                                           max="2024-12-31"
                                           min="2021-01-01"
                                           value="2023-01-01">
                                  </dd>
                            </dl>
                        </div>
                        <div class="cont">
                            <textarea placeholder="내용 입력"></textarea>
                        </div>
                    </div>
                    <div class="bt_wrap">
                        <a href="view.html" class="on">수정</a>
                        <a href="view.html">취소</a>
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