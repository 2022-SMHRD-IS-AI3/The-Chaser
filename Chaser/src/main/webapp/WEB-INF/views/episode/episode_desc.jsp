<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <div class = main_content style="width: 100%; height: 100%;">
            <div class="board_wap">
                <div class="board_view_wrap">
                    <div class="board_view">
                        <div class="title">
                            정유정 살인사건
                        </div>
                        <div class="info">
                            <dl>
                                <dt>번호</dt>
                                <dd>8</dd>
                            </dl>
                            <dl>
                                <dt>사건유형</dt>
                                <dd>살인</dd>
                            </dl>
                            <dl>
                                <dt>상태</dt>
                                <dd>진행완료</dd>
                            </dl>
                            <dl>
                                <dt>작성일</dt>
                                <dd>2023-06-01</dd>
                            </dl>
                            
                        </div>
                        <div class="cont" >
                            지난달 26일 오후 6시경 금정구 A(20대 여)씨의 집에서 흉기로 A씨를 살해<br>
                            시신을 훼손한 뒤 일부를 낙동강변 풀숲에 유기<br>
                            다음날인 27일 오전 3시15분경 젊은 여성이 큰 여행용 가방을 들고 산속으로 이동하는것이 수상하다는 택시 기사의 신고<br>
                            풀숲에서 여성의 시신 일부와 혈흔이 묻은 여행용 가방 등을 발견<br>
                            유기된 시신의 신원 확인 후 A씨의 주거지에서 나머지 시신 일부 발견<br>
                            같은 날 6시경 정유정 긴급 체포<br>
                            정유정은 지난달 31일 밤 범죄수사프로그램을 보며 살인 충동을 느꼈고 실제로 살인을 해보고 싶어서 범행을 저질렀다고 자백함<br>
                            휴대전화 디지털 포렌식 검사 결과 3개월 전부터 살인, 시체 없는 살인 사건 등을 집중적으로 검색 <br>
                            도서관에서 범죄 관련 소설을 다수 빌려 본 것으로 확인됌<br>
                            정유정은 과외 앱에 학부모로 가입한 뒤 혼자 사는 과외선생을 범행 대상으로 물색<br>
                            이후 정유정은 피해자 A씨를 알게 됐고 2~3일간 메세지를 주고 받으며 자녀의 과외를 부탁한다며 피해자를 속임<br>
                            특히 범행 당일 정유정은 학생인 것처럼 속이기 위해 인터넷 중고장터에서 구입한 교복을 입고 중학생 행세를 하며 A씨를 찾아감<br>
                            무방비 상태에 있던 A씨를 흉기로 수차례 찔러 살해<br>
                            완전범죄를 꿈 꾼 정유정은 A씨가 실종된 것처럼 위장하기 위해 A씨의 휴대전화와 신분증, 지갑 등을 시신유기 현장에서 챙김<br>
                            정유정은 평소 사회적 유대가 없고 폐쇄적인 성격이었으며 고등학교를 졸업한 뒤 현재까지 직장이 없음<br>
                            체격은 또래 여성보다 조금 작은편<br>
                            살인과 시체유기 등은 사전에 계획했고 혼자 범행을 저지른 것으로 보임<br>
                            정유정은 택시를 잡아타고 경남 양산 낙동강 변으로 가 시신을 유기<br>
                            나머지 시신 처리 등을 위해 캐리어는 버리지 않음<br>
                            시신을 유기한 곳은 그가 평소 산책하던 곳<br>
                            혼자서 범죄 관련 영상을 보며 각종 환상을 갖고 있었음<br>
                            실현하기 위해 살인을 위한 범죄 시나리오를 혼자 쓰고는 연출, 감독, 작가에 이어 주연, 조연 배우까지 자신이 한 것<br>
                            
                            <div class = "map" style="width: 600px; height: 505px; background-color: #000; float: right; position: relative; bottom: 500px;"></div>
                        </div>
                    </div>
                    <div class="bt_wrap">
                        <a href="edit.html">수정</a>
                        <a href="#">삭제</a>
                        <a href="list.html" class="on">목록</a>
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
