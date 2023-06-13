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
    

        <script>
            function createFolder() {
                var input = document.createElement("input");
                input.type = "text";
                input.style.width = "160px";
                input.style.fontSize = "13px";
                input.placeholder = "폴더 이름을 입력하세요.";
    
                var button = document.createElement("button");
                button.innerHTML = "확인";
                button.style.marginLeft = "2px"
                button.style.fontSize = "12px";
                button.style.width = "40px";
                button.style.height = "25px";
                
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
                folder.setAttribute("data-folder-name", folderName); // 폴더 이름 데이터 속성 추가
    
                var image = document.createElement("img");
                image.src = "folder.png";
                image.style.width = "20px";
                image.style.height = "20px";
    
                var text = document.createElement("span");
                text.innerHTML = folderName;
                text.style.fontSize = "15px";
    
                folder.appendChild(image);
                folder.appendChild(text);
    
                var fileList = document.createElement("ul");
                fileList.className = "file-list";
                folder.appendChild(fileList);
    
    
    
                var container = document.getElementById("container");
    
                container.appendChild(folder);
    
                // 드래그 앤 드랍 이벤트 처리
                folder.addEventListener("dragover", function (event) {
                    event.preventDefault();
                    event.stopPropagation();
                    folder.classList.add("folder-hover"); // 드롭 가능한 폴더에 대한 시각적 피드백
                });
    
                folder.addEventListener("dragleave", function (event) {
                    event.preventDefault();
                    event.stopPropagation();
                    folder.classList.remove("folder-hover"); // 드롭 가능한 폴더에서 떠날 때 시각적 피드백 제거
                });
    
                folder.addEventListener("drop", function (event) {
                    event.preventDefault();
                    event.stopPropagation();
                    folder.classList.remove("folder-hover"); // 드롭 가능한 폴더에서 떨어질 때 시각적 피드백 제거
                    // 드롭한 파일 가져오기
                    const files = event.dataTransfer.files;
                    handleUpdate(fileList); // 폴더에 파일 추가
    				alert("폴더 추가됨");
    
                });
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

            .folder {
                padding-right: 15px;
                margin-bottom: 10px;
                display: flex;
                text-align: left;
            }

            .folder img {
                margin-right: 15px;
            }

            .input-container {
                display: flex;
                align-items: center;
            }


            .folder-hover {
                border: 2px solid blue;
            }

            .list-group-item {
                padding-left: 30px;
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
        <div class=main_content
            style="width: 100%; height: 100%; padding-top: 50px; padding-left: 200px; padding-bottom: 50px;">
            <div style="width: 1500px; height: 500px; border: solid;">
                <div style="padding-top: 15px; padding-left: 30px; width: 250px;
                    height: 100%; border-right: solid; float: left;">

                    <button onclick="createFolder()" style="font-size: 1.0rem;
                        padding-bottom: 13px;
                        padding-left: 130px; background-color: transparent; border: none;">폴더
                        추가</button>
                    <div id="container"> </div>
                    <div></div>
                </div>
                <div>
                    <main class="container" style="padding-left: 120px;">
                        <label class="label" id="label" for="input">
                            <div class="inner" id="inner" style="font-size: 20px; text-align: center;">
                                드래그하거나 클릭해서 업로드</div>
                        </label>
                        <input id="input" class="input" accept="image/*" type="file" required="true" multiple="true"
                            hidden="true">
                        <div id="preview" style="padding-left: 50px;"></div>
                    </main>
                </div>

            </div>
            <div id="map" style="width: 200px; height: 200px;">
            </div>
            <div style="font-size: 30px; position: relative; bottom: 100px; left: 1380px;" class="next">
                <a href="analyzing.html" style="color: black;">분석하기</a>
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



<script>
    const columns = document.querySelectorAll(".folder");
    columns.forEach((folder) => {
        new Sortable(folder, {
            group: "shared",
            animation: 150,
            ghostClass: "blue-background-class"
        });
    });

</script>

<script>
    var input = document.getElementById("input");
    var initLabel = document.getElementById("label");

    input.addEventListener("change", (event) => {
        const files = changeEvent(event);
        handleUpdate(files);
    });

    initLabel.addEventListener("mouseover", (event) => {
        event.preventDefault();
        const label = document.getElementById("label");
        label?.classList.add("label--hover");
    });

    initLabel.addEventListener("mouseout", (event) => {
        event.preventDefault();
        const label = document.getElementById("label");
        label?.classList.remove("label--hover");
    });

    document.addEventListener("dragenter", (event) => {
        event.preventDefault();
        console.log("dragenter");
        if (event.target.className === "inner") {
            event.target.style.background = "#616161";
        }
    });

    document.addEventListener("dragover", (event) => {
        console.log("dragover");
        event.preventDefault();
    });

    document.addEventListener("dragleave", (event) => {
        event.preventDefault();
        console.log("dragleave");
        if (event.target.className === "inner") {
            event.target.style.background = "#3a3a3a";
        }
    });

    document.addEventListener("drop", (event) => {
        event.preventDefault();
        console.log("drop");
        if (event.target.className === "inner") {
            const files = event.dataTransfer?.files;
            event.target.style.background = "#3a3a3a";
            handleUpdate([...files]);
        }
    });

    function changeEvent(event) {
        const { target } = event;
        return [...target.files];
    };

    function handleUpdate(fileList) {
        const preview = document.getElementById("preview");

        fileList.forEach((file) => {
            const reader = new FileReader();
            reader.addEventListener("load", (event) => {
                const img = el("img", {
                    className: "embed-img",
                    src: event.target?.result,
                });

                const fileName = el("div", { className: "list-group-item", draggable: "true" }, "파일명: ", file.name);
                const filePath = el("div", { className: "list-group-item", draggable: "true" }, "파일 경로: ", file.webkitRelativePath || file.path || 'N/A');
                preview.append(fileName, filePath);
                const fileElement = el("li", { className: "file-item" }, file.name);
                fileList.appendChild(fileElement);
            });
            reader.readAsDataURL(file);
        });
    };

    function el(nodeName, attributes, ...children) {
        const node =
            nodeName === "fragment" ?
                document.createDocumentFragment() :
                document.createElement(nodeName);

        Object.entries(attributes).forEach(([key, value]) => {
            if (key === "events") {
                Object.entries(value).forEach(([type, listener]) => {
                    node.addEventListener(type, listener);
                });
            } else if (key in node) {
                try {
                    node[key] = value;
                } catch (err) {
                    node.setAttribute(key, value);
                }
            } else {
                node.setAttribute(key, value);
            }
        });

        children.forEach((childNode) => {
            if (typeof childNode === "string") {
                node.appendChild(document.createTextNode(childNode));
            } else {
                node.appendChild(childNode);
            }
        });

        return node;
    }
</script>



</body>

</html>