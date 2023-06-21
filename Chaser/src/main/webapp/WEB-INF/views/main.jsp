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
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.4/TweenMax.min.js"></script>
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

.move:hover {
	color: #FFFFFF;
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
	color: #FFFFFF;
	font-family: 'btnfont';
	font-weight: 800;
	font-size: 8.0rem;
}

.btn {
	-webkit-transition: all 0.2s cubic-bezier(0.25, 0.46, 0.45, 0.94);
	-moz-transition: all 0.2s cubic-bezier(0.25, 0.46, 0.45, 0.94);
	-o-transition: all 0.2s cubic-bezier(0.25, 0.46, 0.45, 0.94);
	-ms-transition: all 0.2s cubic-bezier(0.25, 0.46, 0.45, 0.94);
	transition: all 0.2s cubic-bezier(0.25, 0.46, 0.45, 0.94);
	position: absolute;
	top: 45%;
	padding: 10px 30px;
	left: 23%;
	width: 120px;
	height: 50px;
	border-radius: 25px;
	overflow: hidden;
	outline: none;
	text-decoration: none;
	text-align: center;
	font-size: 1.5rem;
	letter-spacing: 2px;
}

.btn:focus {
	outline: none;
}

@media screen and (min-width: 30em) {
	.btn {
		max-width: 220px;
	}
	.btn.btn-small {
		max-width: 180px;
	}
}

@media screen and (min-width: 40em) {
	.btn {
		display: inline-block;
	}
}

.btn-dark {
	background-color: #121212;
	color: #fff;
	border-color: #fff;
}

.btn-dark:hover {
	color: #807F83;
}

.btn-glitch {
	transform: translateZ(0);
	overflow: visible;
}

.btn-glitch.btn-glitch-active {
	-webkit-filter: url("#filter");
	filter: url("#filter");
}

.btn-glitch.btn-glitch-active::after, .btn-glitch.btn-glitch-active::before
	{
	content: "";
	width: 1px;
	position: absolute;
	top: -1px;
	bottom: -1px;
}

.pattern {
	position: absolute;
	width: 280px;
	height: 50px;
	top: 45%;
	background-color: rgb(255, 255, 255);
	left: 8%;
	border: none;
	border-radius: 25px;
	background: rgba(255, 255, 255, .1);
	font-size: 1.5rem;
	text-align: center;
}

#Logsuccess {
	visibility: hidden;
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
		<button type="button" onclick="moveUrl('/introduction')" class="menu"
			style="padding-left: 400px;">회사소개</button>
		<button type="button" onclick="moveUrl('/intro_video')" class="menu">시연영상</button>
		<button type="button" id="Logsuccess"
			onclick="moveUrl('/product_use')" class="menu">시작하기</button>
	</div>
	<main id="PAGES_CONTAINER" class="PAGES_CONTAINER" tabindex="-1"
		data-main-content="true">
		<div class=main_content style="width: 100%; height: 100%;">
			<div class="jb-box">
				<video muted autoplay loop>
					<source src="/resources/videoplayback.mp4#t=00:00:46" type="video/mp4">
				</video>
				<div class="jb-text">
					<p>Chase Your Criminal</p>
					<br>
					<p style="padding-right: 100px;">The Better World</p>
				</div>
				<svg style="position: absolute; width: 0; height: 0;" width="0"
					height="0" version="1.1" xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" class="svg-sprite">
          <defs>
              <filter id="filter">
                  <feTurbulence type="fractalNoise"
						baseFrequency="0.000001 0.000001" numOctaves="1" result="warp"
						seed="1"></feTurbulence>
                  <feDisplacementMap xChannelSelector="R"
						yChannelSelector="G" scale="30" in="SourceGraphic" in2="warp"></feDisplacementMap>
              </filter>
          </defs>
      </svg>
				<div>
					<input class="pattern" type="password" id="loginText"
						name="loginText" placeholder="Enter The Code">
				</div>
				<div>
					<button type="button" onclick="submitData()" id="LoginTxt"
						name="LoginTxt" class="btn btn-small btn-dark btn-glitch">Verify</button>
				</div>
			</div>
		</div>
	</main>
	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script>
    function submitData() {
      var inputData = document.getElementById('loginText')['value'];
      if (inputData == 'smhrd') {
        $("#Logsuccess").css("visibility", "visible");
      } else {
        alert("다시 입력해주세요");
        return;
      }
    }
    const moveUrl = (url) => {
      console.log('move..............url...............')
      location.href = url;
    }
  </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
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
	<script>
    var $text = document.querySelector('.btn-glitch-active'),
      $filter = document.querySelector('.svg-sprite'),
      $turb = $filter.querySelector('#filter feTurbulence'),
      turbVal = { val: 0.000001 },
      turbValX = { val: 0.000001 };
    var glitchTimeline = function () {
      var timeline = new TimelineMax({
        repeat: -1,
        repeatDelay: 2,
        paused: true,
        onUpdate: function () {
          $turb.setAttribute('baseFrequency', turbVal.val + ' ' + turbValX.val);
        }
      });
      timeline
        .to(turbValX, 0.1, { val: 0.5 })
        .to(turbVal, 0.1, { val: 0.02 });
      timeline
        .set(turbValX, { val: 0.000001 })
        .set(turbVal, { val: 0.000001 });
      timeline
        .to(turbValX, 0.2, { val: 0.4 }, 0.4)
        .to(turbVal, 0.2, { val: 0.002 }, 0.4);
      timeline
        .set(turbValX, { val: 0.000001 })
        .set(turbVal, { val: 0.000001 });
      // console.log("duration is: " + timeline.duration());
      return {
        start: function () {
          timeline.play(0);
        },
        stop: function () {
          timeline.pause();
        }
      };
    };
    btnGlitch = new glitchTimeline();
    $('.btn-glitch')
      .on('mouseenter', function () {
        $(this).addClass('btn-glitch-active');
        btnGlitch.start();
      })
      .on('mouseleave', function () {
        var $this = $(this);
        if ($this.hasClass('btn-glitch-active')) {
          $this.removeClass('btn-glitch-active');
          btnGlitch.stop();
        }
      });
  </script>
</body>
</html>


