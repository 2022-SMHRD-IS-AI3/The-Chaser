<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
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

        /* .topp {
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
        } */

        #myProgress {
            position: relative;
            width: 1100px;
            height: 50px;
            background-color: white;
            border: 2px solid;

        }

        #myBar {
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
    </style>
</head>

<body>

    <!-- <div class="topp">
        <div style="width: fit-content; height:79px;">
            <img src="./사진1.png" alt="" class="top_img">
        </div>
        <span class="wnwp">The
            Chaser</span>
        <button type="button" onclick="location.href='introduce.html'" class="menu"
            style="padding-left: 400px;">회사소개</button>
        <button type="button" onclick="location.href='demo_video.html'" class="menu">시연영상</button>
        <button type="button" onclick="location.href='product_use.html'" class="menu">시작하기</button>
    </div> -->
    <main id="PAGES_CONTAINER" class="PAGES_CONTAINER" tabindex="-1" data-main-content="true">
        <div class=main_content style="width: 100%; height: 100%;">
            <div style="padding-left: 410px; width: 700px; height: 100%; position: relative; top: 300px;">
                <div class="spinner-border text-secondary" role="status" style="width: 100px; height: 100px; position: relative;
                left: 485px;">
                    <span class="visually-hidden">Loading...</span>
                  </div>
                  <br>
                  <br>
                  <p style="font-size: 3.0rem; padding-left: 480px;">Loading</p>

                  <div id="myProgress" style="position: relative; top: 100px;">
                    <div id="myBar">
                      <div id="label">0%</div>
                    </div>
                  </div>
                  
                  <br>
                  <button onclick="move()">Click Me</button>
                  <p style="font-size: 2.0rem; position: relative; width: 500px; bottom: 10px; left: 800px;">예상 소요 시간 : 1시간 25분 30초</p> 
            </div>
        </div>
    </main>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
    	$(document).ready(function(){
    		$.ajax({
    			url : "/apiTest",
    			type : "POST",
    			data : {
    				num : 1,
    				name : 'name1'
    			},
    			success : function(){
    				alert("성공");
    			},
    			error : function(){
    				alert("실패");
    			}
    		})
    	})
    </script>
    
    
    
    
    <script>
    	let sock = new SockJS("http://localhost:9090/socket");
    	sock.onmessage = onMessage;
    	
    	let elem = document.getElementById("myBar");
    	
    	function onMessage(msg){
            var data = Number(msg.data);
            elem.style.width = data + '%'; 
            document.getElementById("label").innerHTML = data * 1  + '%';
    	}
    </script>

</body>

</html>