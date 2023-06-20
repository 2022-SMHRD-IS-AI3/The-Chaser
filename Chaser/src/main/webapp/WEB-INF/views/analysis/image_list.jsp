<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath"
	value="${pageContext.request.contextPath == '/' ? '' : pageContext.request.contextPath }"
	scope="application" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<script>
	var selectedFolder = null; // 선택한 폴더를 저장할 변수
	var folderCount = 0; // 폴더 개수

	function createFolderElement(folderName, xy) {
		var folder = document.createElement("div");
		folder.className = "folder";
		folder.setAttribute("data-folder-name", folderName);
		folder.style.marginTop = "10px";
		folder.style.marginLeft = "10px";

		var image = document.createElement("img");
		image.src = "/resources/image/down.png";
		image.style.width = "20px";
		image.style.height = "20px";
		/* image.style.filter = "invert(90%)"; */
		image.style.marginTop = "3px";
		image.setAttribute("id", "downIcon");

		var text = document.createElement("ul");
		text.innerHTML = folderName;
		text.id = "file-list";
		text.className = "fa-ul";
		text.style.paddingLeft = "0px";
		// text.style.listStyleImage = "url('right.png')";

		var delimg = document.createElement("img");
		delimg.src = "/resources/image/del.png";
		/* delimg.style.width = "30px"; */
		delimg.style.height = "27px";
		delimg.style.position = "fixed";
		delimg.style.left = "527px";
		delimg.style.filter = "invert(20%)";

		var text_child1 = document.createElement("input");
		text_child1.type = "hidden";
		text_child1.setAttribute("name", "uploadList[" + folderCount
				+ "].uploadFolder");
		text_child1.setAttribute("value", folderName);

		var text_child2 = document.createElement("input");
		text_child2.type = "hidden";
		text_child2.setAttribute("name", "uploadList[" + (folderCount++)
				+ "].loc");
		text_child2.setAttribute("value", xy);

		var folderNameElement = document.createElement("span");
		folderNameElement.className = "folder-name";
		folderNameElement.textContent = folderName;

		folder.addEventListener("click", function() {
			toggleFolderSelection(folder); // 폴더 선택 토글
		});

		folder.addEventListener("click", function(event) {
			event.preventDefault();
			toggleFolderCollapse(folder); // 폴더 접힘/펼침 토글
			if (image.getAttribute('id') === "downIcon") {
				image.src = "/resources/image/right.png";
				image.setAttribute('id', "rightIcon");
			} else {
				image.src = "/resources/image/down.png";
				image.setAttribute('id', "downIcon");
			}
		});

		delimg.addEventListener("click", function() {
			removeFolder(folder);
			//folder.remove();
		})

		folder.appendChild(image);
		folder.appendChild(folderNameElement);
		text.appendChild(text_child1);
		text.appendChild(text_child2);
		folder.appendChild(text);
		folder.appendChild(delimg);

		var container = document.getElementById("container");
		container.appendChild(folder);

		toggleFolderSelection(folder);

	}
	function removeFolder(folder) {
		var ulTag = folder.children[2];
		var liTags = ulTag.getElementsByTagName("li");

		var file_ul = document.getElementById("fileList");
		for (j = liTags.length - 1; j >= 0; j--) {
			liTags[j].setAttribute("class", "xorm");
			liTags[j].style = "";
			liTags[j].children[1].setAttribute("type", "checkbox");
			liTags[j].children[1].checked = false;

			liTags[j].children[1].setAttribute("name", "fileName");
			liTags[j].children[1].style = "";
			liTags[j].children[2].style.width = "35%";
			liTags[j].children[3].style.display = "";
			file_ul.append(liTags[j].cloneNode(true));
		}

		folder.remove();

	}

	function toggleFolderSelection(folder) {
		if (folder === selectedFolder) {
			folder.classList.remove("selected");
			selectedFolder = null;
		} else {
			if (selectedFolder) {
				selectedFolder.classList.remove("selected");
			}
			folder.classList.add("selected");
			selectedFolder = folder;
		}
	}

	function toggleFolderCollapse(folder) {
		folder.classList.toggle("collapsed");
	}

	function moveItems() {
		if (!selectedFolder) {
			alert("폴더를 선택해주세요.");
			return;
		}

		var list = document.getElementById("fileList");
		var targetList = selectedFolder.querySelector("#file-list");
		var items = list.getElementsByTagName("li");

		var fdnm = targetList.getElementsByTagName("input")[0].getAttribute(
				"name").split('.', 1);
		var fdnm_cnt = 0;

		for (var i = items.length - 1; i >= 0; i--) {
			var checkbox = items[i].getElementsByTagName("input")[0];
			if (checkbox.checked) {
				var li = items[i];

				var clonedLi = li.cloneNode(true); // li 요소를 복제하여 새로운 요소 생성
				clonedLi.className = "added-item"; // 추가된 리스트 요소에 클래스 추가
				li.parentNode.removeChild(li); // 기존의 li 요소 제거
				clonedLi.children[3].style.display = "none";
				clonedLi.children[2].style.width = "100%";

				clonedLi.style.marginLeft = "10px";

				var clonedCheckbox = clonedLi.getElementsByTagName("input")[0];
				clonedCheckbox.type = "hidden"
				clonedCheckbox.setAttribute("value", checkbox
						.getAttribute("value"));
				clonedCheckbox.setAttribute("name", fdnm + ".uploadFolderList["
						+ (fdnm_cnt++) + "]");

				// clonedCheckbox.remove(); // 복제된 li 요소의 checkbox 제거

				targetList.appendChild(clonedLi); // 복제된 li 요소를 목표 ul에 추가
			}
		}
	}
</script>




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

.main_content {
	font-family: 'cntfont';
	width: 100%;
	height: 858px;
	padding-top: 50px;
	padding-left: 220px;
}

.createbtn {
	font-size: 0.8rem;
	padding-bottom: 5px;
	padding-left: 280px;
	background-color: transparent;
	border: none;
	width: 100%;
	border-bottom: 2px solid;
}

.folder {
	/* padding-right: 15px;
            margin-bottom: 10px; */
	display: flex;
	text-align: left;
}

.folder img {
	margin-right: 5px;
}

.input-container {
	display: flex;
	align-items: center;
}

.folder.selected {
	background-color: rgb(73, 117, 240);
}

.folder.collapsed ul {
	display: none;
}

.folder.collapsed .folder-name {
	display: block;
}

.folder .folder-name {
	display: none;
}

.tag {
	margin-right: 10px;
	position: relative;
	
}

.xorm {
	padding-bottom: 2px;
	display: flex;
	padding-top: 15px;
}

.added-item {
	background-repeat: no-repeat;
	background-position: left center;
	/* padding-left: 25px; */
	padding-top: 5px;
}

.folder ul {
	margin-left: 0 !important;
}

.plusbtn {
	border-radius: 5px;
	width: 150px;
	height: 40px;
	position: fixed;
	top: 72%;
	left: 81.5%;
	border: 1px solid;
	background-color: transparent;
	border-radius: 10px;
	box-shadow: .8rem .5rem 1.4rem #BEC5D0, -.3rem -.4rem .8rem #FBFBFB;
}

.plusbtn:active {
	box-shadow: inset -.3rem -.1rem 1.4rem #FBFBFB, inset .3rem .4rem .8rem
		#BEC5D0;
	cursor: pointer;
}

.vhfejtodtjd {
	width: 23%;
	height: 100%;
	border-right: 1px solid;
	float: left;
	overflow: auto;
}

.vhfejtodtjd::-webkit-scrollbar {
	width: 10px;
}

.vhfejtodtjd::-webkit-scrollbar-thumb {
	background-color: #2f3542;
	border-radius: 10px;
}

.vhfejtodtjd::-webkit-scrollbar-track {
	background-color: grey;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}

.vkdlfsodyd {
	float: right;
	width: 77%;
	height: 100%;
	overflow: auto;
}

.vkdlfsodyd::-webkit-scrollbar {
	width: 10px;
}

.vkdlfsodyd::-webkit-scrollbar-thumb {
	background-color: #2f3542;
	border-radius: 10px;
}

.vkdlfsodyd::-webkit-scrollbar-track {
	background-color: grey;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 650px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#aaa {
	text-decoration-line: none;
	color: #fff;
}

.ekdma {
	width: 200px;
	height: 40px;
	border: 2px solid #444343;
	font-family: 'Lato', sans-serif;
	/* font-weight: 550; */
	background: transparent;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
	font-size: 20px;
	color: #444343;
	margin-top: 120px;
	margin-left: 37.5%;
}

.btn-7 {
	line-height: 39px;
	padding: 0;
}

.btn-7:hover {
	background: transparent;
	color: #444343;
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

<body onselectstart="return false" ondragstart="return false">
	<div class="topp">
		<div style="width: fit-content; height: 79px;">
			<img src="/resources/image/moon.png" alt="" class="top_img">
		</div>
		<span class="wnwp"><a href="/main" id="aaa">The Chaser</a></span>
		<button type="button" onclick="location.href='/introduction'"
			class="menu" style="padding-left: 400px;">회사소개</button>
		<button type="button" onclick="location.href='/intro_video'"
			class="menu">시연영상</button>
		<button type="button" onclick="location.href='/product_use'"
			class="menu">시작하기</button>
	</div>
	<main id="PAGES_CONTAINER" class="PAGES_CONTAINER" tabindex="-1"
		data-main-content="true">
		<div class="main_content">
			<div
				style="width: 1500px; height: 500px; margin-top: 50px; border: 2px solid; box-shadow: 0 14px 28px rgba(168, 166, 166, 0.521), 0 10px 10px rgba(168, 166, 166, 0.521);">
				<div class="vhfejtodtjd">
					<button class="createbtn" data-bs-toggle="modal"
						data-bs-target="#staticBackdrop">폴더 생성</button>
					<form action="${contextPath}/analysis/image_insert" method="post"
						id="form1">
						<input type="hidden" value="${episode_idx}" name="episode_idx">
						<input type="hidden" value="cctv 파일 경로" name="path">
						<div id="container">
							<c:forEach items="${old_fileList}" var="old_file">
								<div class="folder" data-folder-name="${old_file.uploadFolder}"
									style="margin-top: 10px; margin-left: 10px;">
									<img src="/resources/image/folder.png"
										style="width: 20px; height: 20px;"> <span
										class="folder-name">${old_file.uploadFolder}</span>
									<ul id="file-list" class="fa-ul"
										style="font-size: 15px; padding-left: 0px;">
										<a href="/analysis/image_delete?img_idx=${old_file.idx}">${old_file.uploadFolder}</a>
										<c:forEach items="${old_file.uploadFolderList}" var="olds">
											<li class="added-item"><span class="fa-li"><i
													class="fa fa-angle-right"></i></span>${olds}</li>
										</c:forEach>
									</ul>
								</div>
							</c:forEach>
						</div>
					</form>
				</div>
				<div class="vkdlfsodyd">
					<ul class="fa-ul" id="fileList" style="margin-top: 10px;">
						<div style="width: 35%; float: left;">이름</div>
						<div
							style="width: 65%; border-left: 2px solid; display: flex; padding-left: 12px;">경로</div>
						<c:forEach var="files" items="${fileList}">
							<li class="xorm"><span class="fa-li"><i
									class="fa fa-angle-right"></i></span> <input type="checkbox"
								class="tag" value="${files.directory}" name="fileName">
								<div style="width: 35%;">${files.fileName}</div>
								<div style="width: 65%;">${files.directory}</div></li>
						</c:forEach>
					</ul>
					<button class="plusbtn" onclick="moveItems()">파일 추가</button>
				</div>
			</div>
			<button class="ekdma btn-7">
				<span><a href="#"
					style="text-decoration-line: none; color: black;"
					onclick="document.getElementById('form1').submit();">분석시작</a></span>
			</button>
		</div>

	</main>
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">녹화된 장소를 선택하세요</h5>
				</div>
				<div class="modal-body">
					<div class="map_wrap">
						<div id="map"
							style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
						<div class="hAddr">
							<span class="title">지도중심기준 행정동 주소정보</span> <span id="centerAddr"></span>
						</div>


					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="loc_confirm"
						onclick="checkLoc();">확인</button>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js""></script>
	<script type=" text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c85ff3c34864a0b1cc76a56f7ada7356&libraries=services"></script>

	<script>
		var loc = "${episode_loc}";

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(35.14978041369325,
					126.91990640689913), // 지도의 중심좌표
			level : 1
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		var myModalEl = document.getElementById('staticBackdrop')
		myModalEl.addEventListener('shown.bs.modal', function(event) {
			map.relayout();
		})

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		geocoder.addressSearch(loc, function(result, status) {
			// 정상적으로 검색이 완료됐으면
			if (status === kakao.maps.services.Status.OK) {
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
		});

		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		infowindow = new kakao.maps.InfoWindow({
			zindex : 1
		}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			// 클릭한 위도, 경도 정보를 가져옵니다 
			var latlng = mouseEvent.latLng;

			var message = latlng.getLat() + ', ' + latlng.getLng();
			var message1 = latlng.getLat();
			var message2 = latlng.getLng();

			searchDetailAddrFromCoords(mouseEvent.latLng, function(result,
					status) {

				if (status === kakao.maps.services.Status.OK) {
					var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
							+ result[0].road_address.address_name + '</div>'
							: '';

					var content = '<div class="bAddr">'
							+ '<span class="title"> 주소정보</span>' + detailAddr
							+ '</div>';

					// 마커를 클릭한 위치에 표시합니다 
					marker.setPosition(mouseEvent.latLng);
					marker.setMap(map);

					// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
					infowindow.setContent(content);
					infowindow.open(map, marker);

					image_loc = result[0].road_address.address_name;
					image_xy = message;
					document.getElementById('loc_confirm').setAttribute(
							'data-bs-dismiss', "modal");
				}

			});
		});

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
					callback);
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');

				for (var i = 0; i < result.length; i++) {
					// 행정동의 region_type 값은 'H' 이므로
					if (result[i].region_type === 'H') {
						infoDiv.innerHTML = result[i].address_name;
						break;
					}
				}
			}
		}

		var image_loc = "";
		var image_xy = "";

		function checkLoc() {
			if (image_loc == "") {
				alert("장소를 선택해주세요");
			} else {
				marker.setMap(null);
				infowindow.setMap(null);
				document.getElementById('loc_confirm').removeAttribute(
						'data-bs-dismiss');
				createFolderElement(image_loc, image_xy);

			}
		}
	</script>
</body>

</html>