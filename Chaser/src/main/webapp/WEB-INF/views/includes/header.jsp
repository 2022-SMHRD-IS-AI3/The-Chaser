<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
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
	overflow: auto;
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

</style>
</head>
<body>
	<div class="topp">
		<div style="width: fit-content; height: 79px;">
		<img src="/resources/image/moon.png" alt="" class="top_img">
		</div>
		<span class="wnwp"><a href="main.html" class="move">The
				Chaser</a></span>
		<button type="button" class="menu" style="padding-left: 400px;"><a href="/introduction">회사소개</a></button>
		<button type="button" class="menu"><a href="/intro_video">시연영상</a></button>
		<button type="button" id="Logsuccess" class="menu"><a href="/product_use">시작하기</a></button>
	</div>
</body>
</html>