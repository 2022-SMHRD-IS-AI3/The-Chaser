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

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/css.css">
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

        .move:hover{
            color: #ffffff;
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

        .jb-box {
            width: 100%;
            height: 900px;
            overflow: hidden;
            margin: 0px auto;
            position: relative;
        }

        video {
            width: 100%;
        }

        .jb-text {
            position: absolute;
            top: 13%;
            width: 100%;
            right: 23%;
        }

        .jb-text p {
            margin-top: -24px;
            text-align: center;
            color: #ffffff;
            font-family: 'btnfont';
            font-weight: 800;
            font-size: 8.0rem;
        }

        .pattern{
            position: absolute;
            width: 150px; 
            height: 30px;
            top: 40%;
            right: 23%;
            background-color: rgb(255,255,255);
        }
        #Logsuccess{
        	visibility : hidden;
        }
    </style>
</head>

<body>

    <div class="topp">
        <div style="width: fit-content; height:79px;">
            <img src="./사진1.png" alt="" class="top_img">
        </div>
        <span class="wnwp"><a href="main.html" class="move">The
            Chaser</a></span>
        <button type="button" onclick="" class="menu"
            style="padding-left: 400px;">회사소개</button>
        <button type="button" onclick="" class="menu">시연영상</button>
        <button type="button" id="Logsuccess" onclick="moveUrl('/product_use')" class="menu">시작하기</button>
    </div>
    <main id="PAGES_CONTAINER" class="PAGES_CONTAINER" tabindex="-1" data-main-content="true">
        <div class=main_content style="width: 100%; height: 100%;">
            <div class="jb-box">
                <video muted autoplay loop>
                    <source src="/resources/videoplayback.mp4#t=00:00:46" type="video/mp4">
                </video>
                
                <div class="jb-text">
                    <p>Chase Your Criminal</p><br>
                    <p style="padding-right: 100px;">The Better World</p>
                </div>
                <div>
                    <input class="pattern" type="password" id="loginText" name="loginText">
                </div>
                    <div><button type="button" onclick="submitData()" id="LoginTxt" name="LoginTxt" style="position: absolute; top: 40%;
            right: 18%; padding: 10px 30px;">LOGIN</button></div>                    
                
            </div>
        </div>

    </main>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script>
    function submitData(){
    	var inputData = document.getElementById('loginText')['value'];
    	if(inputData=='smhrd'){
    		$("#Logsuccess").css("visibility","visible");
    	} else{
    		alert("다시다시 다시마 .");
            return;
    	}
    	
    }
    
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


