<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
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

.dlalwl {
	width: 700px;
	height: 500px;
}

.image_content {
	width: 100%;
	display: flex;
	box-shadow: 0 5px 18px -7px rgb(196, 193, 193);
	margin-bottom: 50px;
}

.image_content:nth-child(even) {
	flex-direction: row-reverse;
}
</style>
</head>

<body>
	<%@ include file="./includes/header.jsp"%>

	<main id="PAGES_CONTAINER" class="PAGES_CONTAINER" tabindex="-1"
		data-main-content="true">
		<div class="main_content"
			style="width: 100%; height: 100%; padding-left: 200px; padding-right: 200px;">
			<h1
				style="text-align: center; font-family: 'btnfont'; margin-top: 50px; font-weight: 600; margin-bottom: 20px; font-size: 5rem;">
				The Chaser</h1>
			<h2
				style="margin-left: 120px; margin-right: 120px; text-align: center; margin-bottom: 80px; line-height: 150%;">
				이 프로그램은 범인의 동선을 CCTV 영상에서 추적하여 지도로 나타내는 혁신적인 솔루션입니다. <br>범죄 예방과
				검거에 도움을 주는 이 프로그램은 빠르고 정확한 정보 제공과 자원 절약을 통해 현장 조사와 수사 과정을 효율적으로 운영할
				수 있도록 지원합니다. 또한, 법 집행 기관과의 협력을 강화하고 범죄율 감소를 위한 노력에 기여하는 효과적인 도구입니다
			</h2>
			<div class="image_content" style="display: flex;">
				<div>
					<img src="/resources/image/intro1.jpg" alt="" class="dlalwl">
				</div>
				<div>
					<p
						style="font-size: xx-large; margin-left: 100px; font-weight: 550; margin-top: 150px;">효율적인
						업무 관리</p>
					<p
						style="margin-left: 100px; margin-right: 100px; font-size: 2rem;">AI
						기술을 활용한 움직임 트래킹 모델로써 사람이 수동으로 모니터링 하는 것 보다 훨씬 효율적이고 대량의 CCTV영상을 분석
						할 수 있기 때문에 인력과 시간을 절약 할 수 있습니다.</p>
				</div>
			</div>
			<div class="image_content" style="display: flex;">
				<div>
					<img src="/resources/image/intro2.jpg" alt="" class="dlalwl">
				</div>
				<div>
					<p
						style="font-size: xx-large; margin-left: 100px; font-weight: 550; margin-top: 150px;">범인의
						동선 시각화</p>
					<p
						style="margin-left: 100px; margin-right: 100px; font-size: 2rem;">
						범인의 동선을 시각화 하여 지도상에서 표현하고 범인의 이동경로 표시, 범죄 발생 장소와의 관계 등을 파악 할수
						있습니다.. 이를 통해 범인의 동선을 더 잘 이해하고 추적하는데 도움을 줍니다.</p>
				</div>
			</div>
			<div class="image_content" style="display: flex;">
				<div>
					<img src="/resources/image/intro3.jpg" alt="" class="dlalwl">
				</div>
				<div>
					<p
						style="font-size: xx-large; margin-left: 100px; font-weight: 550; margin-top: 150px;">다중
						CCTV에서의 인물 일치</p>
					<p
						style="margin-left: 100px; margin-right: 100px; font-size: 2rem;">
						여러가지 CCTV영상에서 동일한 인물을 찾는 기능을 제공합니다. 이를 통해 범인이 여러 지역에서 활동하는 경우에도
						동일한 인물을 식별하고 추적이 가능합니다.</p>
				</div>
			</div>
			<div class="image_content" style="display: flex;">
				<div>
					<img src="/resources/image/intro4.jpg" alt="" class="dlalwl">
				</div>
				<div>
					<p
						style="font-size: xx-large; margin-left: 100px; font-weight: 550; margin-top: 150px;">범죄자의
						인상착의 정보 활용</p>
					<p
						style="margin-left: 100px; margin-right: 100px; font-size: 2rem;">
						범죄자의 인상착의 정보는 범죄 예방 및 수사에 중요한 역할을 합니다. 모델은 범죄자의 인상착의 정보를 기준으로 추적이
						가능하여 범죄자의 성별, 나이, 체형, 옷차림, 소지품 등을 학습하여 CCTV 영상에서 해당 특징을 감지하고 추적 할
						수 있습니다.</p>
				</div>
			</div>

		</div>
	</main>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>



</body>

</html>