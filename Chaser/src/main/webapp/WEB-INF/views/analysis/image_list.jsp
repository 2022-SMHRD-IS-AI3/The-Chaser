<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

    <script>
        var selectedFolder = null; // 선택한 폴더를 저장할 변수
        var folderCount = 0; // 폴더 개수

        function createFolder() {
            var input = document.createElement("input");
            input.type = "text";
            input.style.width = "160px";
            input.style.fontSize = "13px";
            input.style.marginLeft = "10px";
            input.style.marginTop = "10px";
            input.placeholder = "폴더 이름을 입력하세요.";

            var button = document.createElement("button");
            button.innerHTML = "확인";
            button.style.marginLeft = "2px";
            button.style.fontSize = "12px";
            button.style.width = "40px";
            button.style.height = "25px";
            button.style.backgroundColor = "white";
            button.style.borderRadius = "5px"

            button.addEventListener("click", function () {
                var folderName = input.value;
                if (folderName) {
                    createFolderElement(folderName);
                    input.remove();
                    button.remove();
                }
            });

            var container = document.getElementById("container");

            container.appendChild(input);
            container.appendChild(button);

            input.addEventListener("keyup", function (event) {
                event.preventDefault();
                if (event.keyCode === 13) {
                    // Enter 키를 눌렀을 때 확인 버튼 클릭 이벤트 발생
                    button.click();
                }
            });
        }

        function createFolderElement(folderName) {
            var folder = document.createElement("div");
            folder.className = "folder";
            folder.setAttribute("data-folder-name", folderName);
            folder.style.marginTop = "10px";
            folder.style.marginLeft = "10px";

            var image = document.createElement("img");
            image.src = "folder.png";
            image.style.width = "20px";
            image.style.height = "20px";

            var text = document.createElement("ul");
            text.innerHTML = folderName;
            text.style.fontSize = "15px";
            text.id = "file-list";
            text.className = "fa-ul";
            text.style.paddingLeft = "0px";
            // text.style.listStyleImage = "url('right.png')";

            var text_child1 = document.createElement("input");
            text_child1.type = "hidden";
            text_child1.setAttribute("name", "uploadList[" + folderCount + "].uploadFolder");
            text_child1.setAttribute("value", folderName);

            var text_child2 = document.createElement("input");
            text_child2.type = "hidden";
            text_child2.setAttribute("name", "uploadList[" + (folderCount++) + "].loc");
            text_child2.setAttribute("value", "x, y좌표");

            var folderNameElement = document.createElement("span");
            folderNameElement.className = "folder-name";
            folderNameElement.textContent = folderName;

            folder.addEventListener("click", function () {
                toggleFolderSelection(folder); // 폴더 선택 토글
            });

            folder.addEventListener("click", function (event) {
                event.preventDefault();
                toggleFolderCollapse(folder); // 폴더 접힘/펼침 토글
            });

            folder.appendChild(image);
            folder.appendChild(folderNameElement);
            text.appendChild(text_child1);
            text.appendChild(text_child2);
            folder.appendChild(text);

            var container = document.getElementById("container");
            container.appendChild(folder);
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

            var fdnm = targetList.getElementsByTagName("input")[0].getAttribute("name").split('.', 1);
            var fdnm_cnt = 0;

            for (var i = items.length - 1; i >= 0; i--) {
                var checkbox = items[i].getElementsByTagName("input")[0];
                if (checkbox.checked) {
                    var li = items[i];
                    var clonedLi = li.cloneNode(true); // li 요소를 복제하여 새로운 요소 생성
                    clonedLi.className = "added-item"; // 추가된 리스트 요소에 클래스 추가
                    li.parentNode.removeChild(li); // 기존의 li 요소 제거

                    var clonedCheckbox = clonedLi.getElementsByTagName("input")[0];
                    clonedCheckbox.type = "hidden"
                    clonedCheckbox.setAttribute("value", checkbox.getAttribute("value"));
                    clonedCheckbox.setAttribute("name", fdnm + ".uploadFolderList[" + (fdnm_cnt++) + "]");
                    
                    // clonedCheckbox.remove(); // 복제된 li 요소의 checkbox 제거

                    targetList.appendChild(clonedLi); // 복제된 li 요소를 목표 ul에 추가
                }
            }
        }
    </script>




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
            color: rgb(182, 177, 177);
            width: 100%;
            height: 858px;
            padding-top: 50px;
            padding-left: 220px;
            background-color: #2c2c2c;
        }

        .createbtn {
            font-size: 0.8rem;
            padding-bottom: 5px;
            padding-left: 160px;
            background-color: transparent;
            border: none;
            width: 100%;
            border-bottom: 2px solid;
            color: rgb(182, 177, 177);
        }

        .folder {
            /* padding-right: 15px;
            margin-bottom: 10px; */
            display: flex;
            text-align: left;
        }

        .folder img {
            margin-right: 10px;
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
        }

        .xorm {
            padding-bottom: 2px;
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
            border-radius: 15px;
            background-color: rgba(177, 176, 179, 0.986);
            width: 90px;
            height: 40px;
            position: fixed;
            top: 65%;
            left: 53%;
        }
    </style>
</head>

<body>
    <div class="topp">
        <div style="width: fit-content; height:79px;">
            <img src="./사진1.png" alt="" class="top_img">
        </div>
        <span class="wnwp">The
            Chaser</span>
        <button type="button" onclick="location.href='introduce.html'" class="menu"
            style="padding-left: 400px;">회사소개</button>
        <button type="button" onclick="location.href='demo_video.html'" class="menu">시연영상</button>
        <button type="button" onclick="location.href='product_use.html'" class="menu">시작하기</button>
    </div>
    <main id="PAGES_CONTAINER" class="PAGES_CONTAINER" tabindex="-1" data-main-content="true">
        <div class="main_content">
            <div
                style="width: 1500px; height: 500px; margin-top: 50px; border: solid; box-shadow: 0 14px 28px rgba(168, 166, 166, 0.521), 0 10px 10px rgba(168, 166, 166, 0.521);">
                <div style="width: 16%; height: 100%; border-right: solid; float: left;">
                    <button onclick="createFolder()" class="createbtn">폴더
                        생성</button>
                        <form action="${contextPath}/analysis/image_insert" method="post" id="form1">
                            <input type="hidden" value="${episode_idx}" name="episode_idx">
                            <input type="hidden" value="cctv 파일 경로" name="path">
                            <div id="container">
                            	<c:forEach items="${old_fileList}" var="old_file">
                            		<div class="folder" data-folder-name="${old_file.uploadFolder}" style="margin-top: 10px; margin-left: 10px;">
									<img src="folder.png" style="width: 20px; height: 20px;">
									<span class="folder-name">${old_file.uploadFolder}</span>
										<ul id="file-list" class="fa-ul" style="font-size: 15px; padding-left: 0px;"><a href="/analysis/image_delete?img_idx=${old_file.idx}">${old_file.uploadFolder}</a>
											<c:forEach items="${old_file.uploadFolderList}" var="olds">
												<li class="added-item">
									        		<span class="fa-li"><i class="fa fa-angle-right"></i></span>${olds}
												</li>
											</c:forEach>
										</ul>
									</div>
                            	</c:forEach>
                            </div>
                        </form>
                </div>
                <div style="float: right; width: 84%; height: 100%; overflow: scroll;">
                    <ul class="fa-ul" id="fileList" style="margin-top: 10px;">
                        <c:forEach var="files" items="${fileList}">
              				<li class="xorm">
              					<span class="fa-li"><i class="fa fa-angle-right"></i></span>
              					<input type="checkbox" class="tag" value="${files.directory}" name="fileName">${files.fileName}
              				</li>
                    	</c:forEach>
                    </ul>
                    <button class="plusbtn" onclick="moveItems()">추가</button>
                </div>
            </div>
            <a href="#" 
            	style="font-size: 1.5rem; position: relative; margin-top: 10px; left: 1450px;"
            	onclick="document.getElementById('form1').submit();">다음</a>
        </div>

    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>