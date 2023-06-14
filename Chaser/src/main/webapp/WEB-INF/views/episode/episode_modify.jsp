<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	top: 10px;
}

.wnwp {
	font-family: avenir-lt-w01_85-heavy1475544, sans-serif;
	color: white;
	font-size: 1.5rem;
	font-weight: 600;
	position: relative;
	left: 42px;
	top: 20px;
}

.menu {
	font-size: large;
	color: white;
	background-color: transparent;
	border: none;
	padding-left: 250px;
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

select {
	box-sizing: border-box;
	width: 100px;
	padding: 4px;
	font-size: 14px;
	border-radius: 6px;
}

option {
	padding: 4px;
	font-size: 14px;
	color: #fff;
	background: #272822;
}
</style>
</head>

<body>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


	<script type="text/javascript">
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;
							document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}
	</script>


	<div class="topp">
		<div style="width: fit-content; height: 79px;">
			<img src="./사진1.png" alt="" class="top_img">
		</div>
		<span class="wnwp">The Chaser</span>
		<button type="button" onclick="location.href='/introduction'" class="menu"
            style="padding-left: 400px;">회사소개</button>
        <button type="button" onclick="location.href='/intro_video'" class="menu">시연영상</button>
        <button type="button" onclick="location.href='/product_use'" class="menu">시작하기</button>
	</div>
	<main id="PAGES_CONTAINER" class="PAGES_CONTAINER" tabindex="-1"
		data-main-content="true">
		<form action="/episode/episode_modify" method="post" id="form">
			<div class=main_content style="width: 100%; height: 100%;">
				<div class="board_wrap">

					<div class="board_write_wrap">
						<div class="board_write">
							<div class="title">
								<dl>
									<dt>제목</dt>
									<dd>
										<input type="text" id="episode_title" name="episode_title"
											value="${episode.episode_title }">
									</dd>
								</dl>
							</div>
							<div class="title">
								<dl>
									<dt>사건유형</dt>
									<dd>
										<select id="episode_type" name="episode_type">
											<option value="${episode.episode_type }" selected>${episode.episode_type }</option>
											<option value="절도">절도</option>
											<option value="공갈">공갈</option>
											<option value="손괴">손괴</option>
											<option value="폭행">폭행</option>
											<option value="강도">강도</option>
											<option value="방화">방화</option>
											<option value="강간">강간</option>
											<option value="살인">살인</option>
											<option value="유괴">유괴</option>
											<option value="납치">납치</option>

										</select>
									</dd>
								</dl>
							</div>
							<div class="title">
								<dl>
									<dt>장소</dt>
									<dd>

										<input type="text" id="sample4_postcode" placeholder="우편번호">
										<input type="button" onclick="sample4_execDaumPostcode()"
											value="우편번호 찾기"> <br> 
										<input type="text"
											value="${episode.episode_loc }" id="sample4_roadAddress"
											placeholder="도로명주소" name="episode_loc"> 
										<input
											type="hidden" id="sample4_jibunAddress" name="juso"
											placeholder="지번주소"> <span id="guide"
											style="color: #999; display: none"></span> 
										<input type="text"
											id="sample4_detailAddress" name="juso2" placeholder="상세주소">
										<input type="hidden" id="sample4_extraAddress"
											placeholder="참고항목"> <input type="hidden"
											name="episode_idx" value="${episode.episode_idx }">



									</dd>
								</dl>
							</div>
							<div class="info">
								<dl>
									<dt>사건발생일자</dt>
									<dd style="padding-top: 5px;">
										<input type="date"  id="time_string" name="time_string" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${episode.episode_time}'/>">
										
									</dd>
								</dl>
							</div>
							<div class="cont">
								<textarea type="text" id="episode_content" name="episode_content">${episode.episode_content }</textarea>
							</div>
						</div>
						<div class="bt_wrap" style="padding-right: 60px;">
							<button type="button" class="on" onclick="submitData()">등록</button>
							<button type="button" onclick="moveUrl('/episode/episode_list')">취소</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</main>

<script type="text/javascript">
		const moveUrl = (url) => {
			location.href = url;
		}
		
		function submitData(){
			console.log('testtttttttttttttttttttttt');
		          var input1 = document.getElementById("episode_title")['value'];
		          console.log(input1);
		          var input2 = document.getElementById("episode_type")['value'];
		          console.log(input2);
		          var input3 = document.getElementById("sample4_roadAddress")['value'];	
		          console.log(input3);
		          var input4 = document.getElementById("time_string")['value'];
		          console.log(input4);
		          var input5 = document.getElementById("episode_content")['value'];
		          
		          
		          
		          
		          console.log(input5);
		          
		          /* var input44 = document.getElementById("time_string");
		          
		          input44.innerHTML = input4.replace( /-/g, '/');
		          
		          console.log(input44.innerText); */
		       
		          if (input1 == '') {
		             alert("글 제목을 입력해주세요.");
		             return;
		          }
		          if (input2 == '') {
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
		          } else{
		        	  if (confirm("정말 진행하시겠습니까??") == true){    //확인

		        		  var form1 = document.getElementById('form')
			        	  form1.submit();

		        		 }else{   //취소

		        		     return false;

		        		 }
		        		
		        	  
		          }
		          
		          
		    }   
		

	       
	</script>




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