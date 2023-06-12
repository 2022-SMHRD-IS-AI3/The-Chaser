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

@
supports(-webkit-appearance: none) or (-moz-appearance: none) {input
	[type='radio'] { --active:#275EFE; -
	-active-inner: #fff; -
	-focus: 2px rgba(39, 94, 254, .3); -
	-border: #BBC1E1; -
	-border-hover: #275EFE; -
	-background: #fff; -
	-disabled: #F6F8FF; -
	-disabled-inner: #E1E6F9;
	-webkit-appearance: none;
	-moz-appearance: none;
	height: 21px;
	outline: none;
	display: inline-block;
	vertical-align: top;
	position: relative;
	margin: 0;
	cursor: pointer;
	border: 1px solid var(- -bc, var(- -border));
	background: var(- -b, var(- -background));
	transition: background .3s, border-color .3s, box-shadow .2s; &: after
	{ content : '';
	display: block;
	left: 0;
	top: 0;
	position: absolute;
	transition: transform var(- -d-t, .3s) var(- -d-t-e, ease), opacity
		var(- -d-o, .2s);
}

&
:checked { -
	-b: var(- -active); -
	-bc: var(- -active); -
	-d-o: .3s; -
	-d-t: .6s; -
	-d-t-e: cubic-bezier(.2, .85, .32, 1.2);
}

&
:disabled { -
	-b: var(- -disabled);
	cursor: not-allowed;
	opacity: .9; &: checked { --b : var( - -disabled-inner); -
	-bc: var(- -border);
}

&+
label {
	cursor: not-allowed;
}

}
&
:hover { &:
	not (: checked){
                        &:not(: disabled){
                            --bc: var(- -border-hover);
}

}
}
&
:focus {
	box-shadow: 0 0 0 var(- -focus);
}

&
:not(.switch) {
	width: 21px;
	&:
	after
	{
	opacity
	:
	var(
	-
	-o
	,
	0
	);
}

&
:checked { -
	-o: 1;
}

}
&+
label {
	font-size: 20px;
	line-height: 21px;
	display: inline-block;
	vertical-align: top;
	cursor: pointer;
	margin-left: 4px;
	padding-left: 10px;
}

}
input[type='radio'] {
	border-radius: 50%; &: after { width : 19px;
	height: 19px;
	border-radius: 50%;
	background: var(- -active-inner);
	opacity: 0;
	transform: scale(var(- -s, .7));
}

&
:checked { -
	-s: .5;
}

}
}
label {
	font: 1rem 'Fira Sans', sans-serif;
}

input {
	margin: 0.4rem;
}

.ex {
	padding-left: 40px;
	padding-bottom: 20px;
}

.ex2 {
	padding-bottom: 20px;
}

.ex3 {
	padding-left: 40px;
	padding-bottom: 10px;
}

.bigex {
	width: 250px;
	height: 240px;
	border-radius: 10px;
	box-shadow: 0px 10px 10px -10px grey;
	border: #000;
	padding-right: 20px;
}

.ex4 {
	padding-left: 5px;
	float: left;
	padding-top: 20px;
}

.ex5 {
	padding-left: 45px;
	padding-bottom: 35px;
}

.ho {
	flex-basis: 22%;
	padding-top: 50px;
	padding-left: 60px;
}

.colorpick {
	font-size: 1.9rem;
	padding-left: 5px;
}
</style>
</head>

<body>

	<div class="topp">
		<div style="width: fit-content; height: 79px;">
			<img src="./사진1.png" alt="" class="top_img">
		</div>
		<span class="wnwp">The Chaser</span>
		<button type="button" onclick="location.href='introduce.html'"
			class="menu" style="padding-left: 400px;">회사소개</button>
		<button type="button" onclick="location.href='demo_video.html'"
			class="menu">시연영상</button>
		<button type="button" onclick="location.href='product_use.html'"
			class="menu">시작하기</button>
	</div>
	<form action="/analysis/appearance" method="post">
		<main id="PAGES_CONTAINER" class="PAGES_CONTAINER" tabindex="-1"
			data-main-content="true">
			<div class="main_content"
				style="width: 100%; height: 100%; display: flex; flex-wrap: wrap; padding-left: 280px; padding-right: 180px;">
				<div class="ho">
					<fieldset class="bigex">
						<div class="ex1"
							style="font-size: x-large; text-align: center; border-bottom: 2px solid; padding-top: 5px; padding-bottom: 10px; margin-bottom: 10px;">
							성별</div>

						<div class="ex5" style="padding-top: 20px;">
							<input id="appe_gender1" type="radio" name="appe_gender"
								value="1"> <label for="r1">남자</label>
						</div>

						<div class="ex5">
							<input id="appe_gender2" type="radio" name="appe_gender"
								value="1"> <label for="r1">여자</label>
						</div>

						<div class="ex5">
							<input id="appe_gender3" type="radio" name="appe_gender"
								value="1"> <label for="r1">모름</label>
						</div>
					</fieldset>
				</div>

				<div class="ho">
					<fieldset class="bigex">
						<div class="ex1"
							style="font-size: x-large; text-align: center; border-bottom: 2px solid; padding-top: 5px; padding-bottom: 10px; margin-bottom: 10px;">
							연령대</div>

						<div class="ex5" style="padding-top: 20px;">
							<input id="appe_age1" type="radio" name="appe_age" value="1">
							<label for="appe_age1">학생</label>
						</div>

						<div class="ex5">
							<input id="appe_age2" type="radio" name="appe_age" value="1">
							<label for="appe_age2">성인</label>
						</div>

						<div class="ex5">
							<input id="appe_age3" type="radio" name="appe_age" value="1">
							<label for="appe_age3">노인</label>
						</div>
					</fieldset>
				</div>

				<div class="ho">
					<fieldset class="bigex">
						<div class="ex1"
							style="font-size: x-large; text-align: center; border-bottom: 2px solid; padding-top: 5px; padding-bottom: 10px; margin-bottom: 10px;">
							키</div>

						<div class="ex2" style="padding-top: 20px;">
							<input id="appe_height1" type="radio" name="appe_height"
								value="1"> <label for="appe_height1">160cm미만</label>
						</div>

						<div class="ex2">
							<input id="appe_height2" type="radio" name="appe_height"
								value="1"> <label for="appe_height2">160~170cm미만</label>
						</div>

						<div class="ex2">
							<input id="appe_height3" type="radio" name="appe_height"
								value="1"> <label for="appe_height3">170~180cm미만</label>
						</div>

						<div class="ex2">
							<input id="appe_height4" type="radio" name="appe_height"
								value="1"> <label for="appe_height4">180~190cm미만</label>
						</div>
					</fieldset>
				</div>

				<div class="ho">
					<fieldset class="bigex">
						<div class="ex1"
							style="font-size: x-large; text-align: center; border-bottom: 2px solid; padding-top: 5px; padding-bottom: 10px; margin-bottom: 10px;">
							체형</div>

						<div class="ex5" style="padding-top: 20px;">
							<input id="appe_body1" type="radio" name="appe_body" value="1">
							<label for="appe_body1">마름</label>
						</div>

						<div class="ex5">
							<input id="appe_body2" type="radio" name="appe_body" value="1">
							<label for="appe_body2">보통</label>
						</div>

						<div class="ex5">
							<input id="appe_body3" type="radio" name="appe_body" value="1">
							<label for="appe_body3">비만</label>
						</div>
					</fieldset>
				</div>

				<div class="ho">
					<fieldset class="bigex">
						<div class="ex1"
							style="font-size: x-large; text-align: center; border-bottom: 2px solid; padding-top: 5px; padding-bottom: 10px; margin-bottom: 10px;">
							상의</div>

						<div class="ex" style="padding-top: 20px;">
							<input id="appe_top_type1" type="radio" name="appe_top_type"
								value="1"> <label for="appe_top_type1">긴팔</label>
						</div>

						<div class="ex">
							<input id="appe_top_type2" type="radio" name="appe_top_type"
								value="1"> <label for="appe_top_type2">반팔</label>
						</div>

						<div class="ex3">
							<input id="appe_top_type3" type="radio" name="appe_top_type"
								value="1"> <label for="appe_top_type3">모름</label>
						</div>

						<div style="padding-left: 35px;">
							<input id="appe_top_color" type="color" name="appe_top_color"
								value="#121212"
								style="width: 23px; height: 22px; background-color: transparent; border: none;">
							<label for="appe_top_color" class="colorpick">색상</label>
						</div>
					</fieldset>
				</div>

				<div class="ho">
					<fieldset class="bigex">
						<div class="ex1"
							style="font-size: x-large; text-align: center; border-bottom: 2px solid; padding-top: 5px; padding-bottom: 10px; margin-bottom: 10px;">
							하의</div>

						<div class="ex" style="padding-top: 20px;">
							<input id="appe_bottom_type1" type="radio"
								name="appe_bottom_type" value="1"> <label
								for="appe_bottom_type1">긴바지</label>
						</div>

						<div class="ex">
							<input id="appe_bottom_type2" type="radio"
								name="appe_bottom_type" value="1"> <label
								for="appe_bottom_type2">반바지</label>
						</div>

						<div class="ex3">
							<input id="appe_bottom_type3" type="radio"
								name="appe_bottom_type" value="1"> <label
								for="appe_bottom_type3">모름</label>
						</div>

						<div style="padding-left: 35px;">
							<input id="appe_bottom_color" type="color"
								name="appe_bottom_color" value="#121212"
								style="width: 25px; height: 27px; background-color: transparent; border: none;">
							<label for="appe_bottom_color" class="colorpick">색상</label>
						</div>
					</fieldset>
				</div>
				<div class="ho">
					<fieldset
						style="width: 500px; height: 120px; border-radius: 10px; box-shadow: 0px 10px 10px -10px grey;">
						<div class="ex1"
							style="font-size: x-large; border-bottom: 2px solid; padding-top: 5px; padding-bottom: 10px; margin-bottom: 10px; padding-left: 10px;">
							소지품</div>

						<div class="ex4">
							<input id="appe_stuff_type1" type="radio" name="appe_stuff_type"
								value="1"> <label for="appe_stuff_type1">휴대폰</label>
						</div>

						<div class="ex4">
							<input id="appe_stuff_type2" type="radio" name="appe_stuff_type"
								value="1"> <label for="appe_stuff_type2">우산</label>
						</div>

						<div class="ex4">
							<input id="appe_stuff_type3" type="radio" name="appe_stuff_type"
								value="1"> <label for="appe_stuff_type3">가방</label>
						</div>

						<div class="ex4">
							<input id="appe_stuff_type4" type="radio" name="appe_stuff_type"
								value="1"> <label for="appe_stuff_type4">모름</label>
						</div>

						<div style="padding-left: 35px;">
							<input id="appe_stuff_color" type="color" name="appe_stuff_color"
								value="#121212"
								style="width: 25px; height: 27px; background-color: transparent; border: none;">
							<label for="appe_stuff_color" class="colorpick">색상</label>
						</div>
					</fieldset>
				</div>

			</div>
			<div
				style="padding-left: 35px; position: absolute; width: 50px; height: 50px; right: 20%;">
				<button
					style="width: 100px; height: 50px; font-size: 40px; background: #0094ff; border: none;"
					class="on">다음</button>
			</div>


		</main>
	</form>


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