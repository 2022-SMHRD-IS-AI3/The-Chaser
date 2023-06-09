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

html {
	font-size: 10px !important;
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
	color: #116DFF;
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
	padding-left: 3px;
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
	font-size: 20px;
	line-height: 21px;
	display: inline-block;
	vertical-align: top;
	cursor: pointer;
	margin-left: 4px;
	padding-left: 3px;
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
	padding-left: 70px;
	padding-bottom: 20px;
}

.ex2 {
	padding-bottom: 20px;
	padding-left: 35px;
}

.ex3 {
	padding-left: 70px;
	padding-bottom: 20px;
}

.bigex {
	width: 250px;
	height: 240px;
	border-radius: 10px;
	box-shadow: 0px 10px 10px -10px grey;
	border: #000;
	box-shadow: 0 14px 28px rgba(168, 166, 166, 0.521), 0 10px 10px
		rgba(168, 166, 166, 0.521);
}

.ex4 {
	padding-left: 20px;
	float: left;
	padding-top: 20px;
}

.ex5 {
	padding-left: 75px;
	padding-bottom: 35px;
}

.ho {
	flex-basis: 22%;
	padding-top: 50px;
	padding-left: 60px;
	height: fit-content;
}

.colorpick {
	position: relative;
	right: 9px;
}

.ekdma {
	width: 110px;
	height: 40px;
	padding: 10px 25px;
	border: 2px solid #444343;
	font-family: 'Lato', sans-serif;
	font-weight: 550;
	background: transparent;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
	font-size: 20px;
	color: #444343;
	margin-left: 25px;
}

.btn-7 {
	line-height: 39px;
	padding: 0;
}

.btn-7:hover {
	background: transparent;
	color: #FFFEFE;
}

.btn-7 span {
	position: relative;
	display: block;
	width: 100%;
	height: 100%;
}

.btn-7:before, .btn-7:after {
	position: absolute;
	content: "";
	left: 0;
	top: 0;
	background: #444343;
	transition: all 0.3s ease;
}

.btn-7:before {
	height: 0%;
	width: 2px;
}

.btn-7:after {
	width: 0%;
	height: 2px;
}

.btn-7:hover:before {
	height: 100%;
}

.btn-7:hover:after {
	width: 100%;
}

.btn-7 span:before, .btn-7 span:after {
	position: absolute;
	content: "";
	right: 0;
	bottom: 0;
	background: #444343;
	transition: all 0.3s ease;
}

.btn-7 span:before {
	width: 2px;
	height: 0%;
}

.btn-7 span:after {
	width: 0%;
	height: 2px;
}

.btn-7 span:hover:before {
	height: 100%;
}

.btn-7 span:hover:after {
	width: 100%;
}
</style>
</head>

<body>

	<div class="topp">
		<div style="width: fit-content; height: 79px;">
			<img src="/resources/image/moon.png" alt="" class="top_img">
		</div>
		<span class="wnwp"><a href="/main">The Chaser</a></span>
		<button type="button" onclick="location.href='/introduction'"
			class="menu" style="padding-left: 400px;">회사소개</button>
		<button type="button" onclick="location.href='/intro_video'"
			class="menu">시연영상</button>
		<button type="button" onclick="location.href='/product_use'"
			class="menu">시작하기</button>
	</div>


	<main id="PAGES_CONTAINER" class="PAGES_CONTAINER" tabindex="-1"
		data-main-content="true">
		<form action="/analysis/appearance" method="post" id="form">
			<div class="main_content"
				style="width: 100%; height: 890px; display: flex; flex-wrap: wrap; padding-left: 280px; padding-right: 180px;">

				<div class="ho">

					<fieldset class="bigex">
						<div class="ex1"
							style="font-size: x-large; text-align: center; border-bottom: 2px solid; padding-top: 5px; padding-bottom: 5px; margin-bottom: 10px;">
							성별</div>

						<div class="ex5" style="padding-top: 20px;">
							<input id="appe_gender1" type="radio" name="appe_gender"
								value="M"
								<c:if test="${appe.appe_gender.toString() eq 'M' }"> checked </c:if>>
							<label for="appe_gender1">남자</label>
						</div>
						<div class="ex5">
							<input id="appe_gender2" type="radio" name="appe_gender"
								value="F"
								<c:if test="${appe.appe_gender.toString() eq 'F' }"> checked </c:if>>
							<label for="appe_gender2">여자</label>
						</div>
						<div class="ex5">
							<input id="appe_gender3" type="radio" name="appe_gender"
								value="0"
								<c:if test="${appe.appe_gender.toString() eq '0' }"> checked </c:if>>
							<label for="appe_gender3">모름</label>
						</div>

					</fieldset>
				</div>

				<div class="ho">
					<fieldset class="bigex">
						<div class="ex1"
							style="font-size: x-large; text-align: center; border-bottom: 2px solid; padding-top: 5px; padding-bottom: 5px; margin-bottom: 10px;">
							연령대</div>

						<div class="ex5" style="padding-top: 20px;">
							<input id="appe_age1" type="radio" name="appe_age" value="1"
								<c:if test="${appe.appe_age eq '1' }">checked </c:if>> <label
								for="appe_age1">학생</label>
						</div>
						<div class="ex5">
							<input id="appe_age2" type="radio" name="appe_age" value="2"
								<c:if test="${appe.appe_age eq '2' }">checked </c:if>> <label
								for="appe_age2">성인</label>
						</div>
						<div class="ex5">
							<input id="appe_age3" type="radio" name="appe_age" value="3"
								<c:if test="${appe.appe_age eq '3' }">checked </c:if>> <label
								for="appe_gender3">노인</label>
						</div>

					</fieldset>
				</div>

				<div class="ho">
					<fieldset class="bigex">
						<div class="ex1"
							style="font-size: x-large; text-align: center; border-bottom: 2px solid; padding-top: 5px; padding-bottom: 5px; margin-bottom: 10px;">
							키</div>

						<div class="ex2" style="padding-top: 13px;">
							<input id="appe_height1" type="radio" name="appe_height"
								value="1"
								<c:if test="${appe.appe_height eq '1' }">checked </c:if>><label
								for="appe_height1">160cm미만</label>
						</div>
						<div class="ex2">
							<input id="appe_height2" type="radio" name="appe_height"
								value="2"
								<c:if test="${appe.appe_height eq '2' }">checked </c:if>>
							<label for="appe_height2">160~170cm미만</label>
						</div>
						<div class="ex2">
							<input id="appe_height3" type="radio" name="appe_height"
								value="3"
								<c:if test="${appe.appe_height eq '3' }">checked </c:if>>
							<label for="appe_height3">170~180cm미만</label>
						</div>
						<div class="ex2">
							<input id="appe_height4" type="radio" name="appe_height"
								value="4"
								<c:if test="${appe.appe_height eq '4' }">checked </c:if>>
							<label for="appe_height4">180cm이상</label>
						</div>

					</fieldset>
				</div>

				<div class="ho">
					<fieldset class="bigex">
						<div class="ex1"
							style="font-size: x-large; text-align: center; border-bottom: 2px solid; padding-top: 5px; padding-bottom: 5px; margin-bottom: 10px;">
							체형</div>

						<div class="ex5" style="padding-top: 20px;">
							<input id="appe_body1" type="radio" name="appe_body" value="마름"
								<c:if test="${appe.appe_body.toString() eq '마름' }">
									checked </c:if>>
							<label for="appe_body1">마름</label>
						</div>
						<div class="ex5">
							<input id="appe_body2" type="radio" name="appe_body" value="보통"
								<c:if test="${appe.appe_body.toString() eq '보통' }">
									checked </c:if>>
							<label for="appe_body2">보통</label>
						</div>
						<div class="ex5">
							<input id="appe_body3" type="radio" name="appe_body" value="비만"
								<c:if test="${appe.appe_body.toString() eq '비만' }">
									checked </c:if>>
							<label for="appe_body3">비만</label>

						</div>



					</fieldset>
				</div>

				<div class="ho">
					<fieldset class="bigex">
						<div class="ex1"
							style="font-size: x-large; text-align: center; border-bottom: 2px solid; padding-top: 5px; padding-bottom: 5px; margin-bottom: 10px;">
							상의</div>

						<div class="ex" style="padding-top: 20px;">
							<input id="appe_top_type1" type="radio" name="appe_top_type"
								value="긴팔"
								<c:if test="${appe.appe_top_type.toString() eq '긴팔' }"> checked </c:if>>
							<label for="appe_top_type1">긴팔</label>
						</div>
						<div class="ex">
							<input id="appe_top_type2" type="radio" name="appe_top_type"
								value="반팔"
								<c:if test="${appe.appe_top_type.toString() eq '반팔' }"> checked </c:if>>
							<label for="appe_top_type2">반팔</label>
						</div>
						<div class="ex3">
							<input id="appe_top_type3" type="radio" name="appe_top_type"
								value="모름"
								<c:if test="${appe.appe_top_type.toString() eq '모름' }"> checked </c:if>>
							<label for="appe_top_type3">모름</label>
						</div>

						<c:choose>
							<c:when test="${appe.appe_top_color.toString() eq 'c' }">
								<div class="ex3">
									<input id="appe_top_color" type="color" name="appe_top_color"
										value="c"
										style="width: 22px; height: 22px; background-color: transparent; border: none; position: relative; right: 4px; bottom: 5px">
									<label for="appe_top_color" class="colorpick">색상</label>
								</div>
							</c:when>
							<c:otherwise>
								<div class="ex3">
									<input id="appe_top_color" type="color" name="appe_top_color"
										style="width: 22px; height: 22px; background-color: transparent; border: none; position: relative; right: 4px; bottom: 5px">
									<label for="appe_top_color" class="colorpick">색상</label>
								</div>
							</c:otherwise>
						</c:choose>

					</fieldset>
				</div>

				<div class="ho">
					<fieldset class="bigex">
						<div class="ex1"
							style="font-size: x-large; text-align: center; border-bottom: 2px solid; padding-top: 5px; padding-bottom: 5px; margin-bottom: 10px;">
							하의</div>

						<div class="ex" style="padding-top: 20px;">
							<input id="appe_bottom_type1" type="radio"
								name="appe_bottom_type" value="긴바지"
								<c:if test="${appe.appe_bottom_type.toString() eq '긴바지' }"> checked </c:if>>
							<label for="appe_bottom_type1">긴바지</label>
						</div>
						<div class="ex">
							<input id="appe_bottom_type2" type="radio"
								name="appe_bottom_type" value="반바지"
								<c:if test="${appe.appe_bottom_type.toString() eq '반바지' }"> checked </c:if>>
							<label for="appe_bottom_type2">반바지</label>
						</div>
						<div class="ex3">
							<input id="appe_bottom_type3" type="radio"
								name="appe_bottom_type" value="모름"
								<c:if test="${appe.appe_bottom_type.toString() eq '모름' }"> checked </c:if>>
							<label for="appe_bottom_type3">모름</label>
						</div>

						<c:choose>
							<c:when test="${appe.appe_bottom_color eq 'c' }">
								<div class="ex3">
									<input id="appe_bottom_color" type="color"
										name="appe_bottom_color" value="c"
										style="width: 22px; height: 22px; background-color: transparent; border: none; position: relative; right: 4px; bottom: 5px">
									<label for="appe_bottom_color" class="colorpick">색상</label>
								</div>
							</c:when>
							<c:otherwise>
								<div class="ex3">
									<input id="appe_bottom_color" type="color"
										name="appe_bottom_color"
										style="width: 22px; height: 22px; background-color: transparent; border: none; position: relative; right: 4px; bottom: 5px">
									<label for="appe_bottom_color" class="colorpick">색상</label>
								</div>
							</c:otherwise>
						</c:choose>

					</fieldset>
				</div>
				<div class="ho">
					<fieldset
						style="width: 550px; height: 170px; border-radius: 10px; box-shadow: 0 14px 28px rgba(168, 166, 166, 0.521), 0 10px 10px rgba(168, 166, 166, 0.521);">
						<div class="ex1"
							style="font-size: x-large; border-bottom: 2px solid; padding-top: 5px; padding-bottom: 5px; margin-bottom: 10px; padding-left: 10px; text-align: center;">
							소지품</div>

						<div class="ex4">
							<input id="appe_stuff_type1" type="radio" name="appe_stuff_type"
								value="배낭"
								<c:if test="${appe.appe_stuff_type.toString() eq '배낭' }"> checked </c:if>>
							<label for="appe_stuff_type1">배낭</label>
						</div>

						<div class="ex4">
							<input id="appe_stuff_type2" type="radio" name="appe_stuff_type"
								value="우산"
								<c:if test="${appe.appe_stuff_type.toString() eq '우산' }"> checked </c:if>>
							<label for="appe_stuff_type2">우산</label>
						</div>

						<div class="ex4">
							<input id="appe_stuff_type3" type="radio" name="appe_stuff_type"
								value="손가방"
								<c:if test="${appe.appe_stuff_type.toString() eq '손가방' }"> checked </c:if>>
							<label for="appe_stuff_type3">손가방</label>
						</div>

						<div class="ex4">
							<input id="appe_stuff_type4" type="radio" name="appe_stuff_type"
								value="넥타이"
								<c:if test="${appe.appe_stuff_type.toString() eq '넥타이' }"> checked </c:if>>
							<label for="appe_stuff_type4">넥타이</label>
						</div>

						<div class="ex4">
							<input id="appe_stuff_type5" type="radio" name="appe_stuff_type"
								value="캐리어"
								<c:if test="${appe.appe_stuff_type.toString() eq '캐리어' }"> checked </c:if>>
							<label for="appe_stuff_type5">캐리어</label>
						</div>

						<div class="ex4">
							<input id="appe_stuff_type6" type="radio" name="appe_stuff_type"
								value="모름"
								<c:if test="${appe.appe_stuff_type.toString() eq '모름' }"> checked </c:if>>
							<label for="appe_stuff_type6">모름</label>
						</div>

						<c:choose>
							<c:when test="${appe.appe_stuff_color.toString() eq 'c' }">
								<div class="ex4">
									<input id="appe_stuff_color" type="color"
										name="appe_stuff_color" value="c"
										style="width: 22px; height: 22px; background-color: transparent; border: none; position: relative; right: 4px; bottom: 5px">
									<label for="appe_stuff_color" class="colorpick">색상</label>
								</div>
							</c:when>
							<c:otherwise>
								<div class="ex4">
									<input id="appe_stuff_color" type="color"
										name="appe_stuff_color"
										style="width: 22px; height: 22px; background-color: transparent; border: none; position: relative; right: 4px; bottom: 5px">
									<label for="appe_stuff_color" class="colorpick">색상</label>
								</div>
							</c:otherwise>
						</c:choose>

					</fieldset>
				</div>
				<div
					style="padding: 5px 5px 5px 5px; position: absolute; width: 50px; height: 50px; right: 25%; bottom: 10%;">
					<button type="button" class="ekdma btn-7" onclick="submitData()">
						<span>다음</span>
					</button>
				</div>
			</div>

			<input type="hidden" name="episode_idx" value="${episode_idx} ">


		</form>
	</main>



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
	<script>
		function submitData() {

			var input1 = document.getElementById("appe_gender1")['checked'];
			var input2 = document.getElementById("appe_gender2")['checked'];
			var input3 = document.getElementById("appe_gender3")['checked'];
			//console.log(input1);
			//console.log(input2);
			//console.log(input3);
			var input4 = document.getElementById("appe_age1")['checked'];
			var input5 = document.getElementById("appe_age2")['checked'];
			var input6 = document.getElementById("appe_age3")['checked'];
			//console.log(input4);
			//console.log(input5);
			//console.log(input6);
			var input7 = document.getElementById("appe_height1")['checked'];
			var input8 = document.getElementById("appe_height2")['checked'];
			var input9 = document.getElementById("appe_height3")['checked'];
			var input10 = document.getElementById("appe_height4")['checked'];

			var input11 = document.getElementById("appe_body1")['checked'];
			var input12 = document.getElementById("appe_body2")['checked'];
			var input13 = document.getElementById("appe_body3")['checked'];

			var input14 = document.getElementById("appe_top_type1")['checked'];
			var input15 = document.getElementById("appe_top_type2")['checked'];
			var input16 = document.getElementById("appe_top_type3")['checked'];

			var input17 = document.getElementById("appe_bottom_type1")['checked'];
			var input18 = document.getElementById("appe_bottom_type2")['checked'];
			var input19 = document.getElementById("appe_bottom_type3")['checked'];
			console.log(input17);
			console.log(input18);
			console.log(input19);
			var input20 = document.getElementById("appe_stuff_type1")['checked'];
			var input21 = document.getElementById("appe_stuff_type2")['checked'];
			var input22 = document.getElementById("appe_stuff_type3")['checked'];
			var input23 = document.getElementById("appe_stuff_type4")['checked'];
			var input24 = document.getElementById("appe_stuff_type5")['checked'];
			var input25 = document.getElementById("appe_stuff_type6")['checked'];

			/* var input17 = document.getElementById("appe_stuff_type1");
			
			input44.innerHTML = input4.replace( /-/g, '/');
			
			console.log(input44.innerText); */

			if ((input1 == false) && (input2 == false) && (input3 == false)) {
				alert("성별을 입력해주세요.");
				return;
			}
			if ((input4 == false) && (input5 == false) && (input6 == false)) {
				alert("연령대를 입력해주세요.");
				return;
			}
			if ((input7 == false) && (input8 == false) && (input9 == false)
					&& (input10 == false)) {
				alert("키를 입력해주세요.");
				return;
			}
			if ((input11 == false) && (input12 == false) && (input13 == false)) {
				alert("체형을 입력해주세요.");
				return;
			}
			if ((input14 == false) && (input15 == false) && (input16 == false)) {
				alert("상의 종류를 입력해주세요.");
				return;
			}
			if ((input17 == false) && (input18 == false) && (input19 == false)) {
				alert("하의 종류를 입력해주세요.");
				return;
			}
			if ((input20 == false) && (input21 == false) && (input22 == false)
					&& (input23 == false) && (input24 == false)
					&& (input25 == false)) {
				alert("소지품 종류를 입력해주세요.");
				return;
			} else {
				var form1 = document.getElementById('form')
				form1.submit();
			}
			/* if (input2 == '') {
			   alert("타입을 입력해주세요.");
			   return;
			}
			if (input3 == '') {
			   alert("장소를 입력해주세요.");
			   return;
			}
			if (input4 == '') {
			   alert("발생 시간을 입력해주세요.");
			   return;
			}
			if (input5 == '') {
			   alert("사건에 대한 내용을 입력해주세요.");
			   return;
			} */

		}
	</script>

</body>

</html>