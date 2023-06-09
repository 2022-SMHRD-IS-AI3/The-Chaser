<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>

<h2>KIT 웹앱 프로그래밍</h2>

<form action="/apiTest" method="POST">
  <label for="fname">학번:</label><br>
  <input type="text" id="fname" name="num"><br>
  <label for="lname">이름:</label><br>
  <input type="text" id="lname" name="name"><br><br>
  <input type="submit" value="확인">
</form>
	
	<button id="btn">버튼</button>
<script>

$("#btn").click(function(){
	
	$.ajax({
		url : "http://localhost:9091/",
		type : "GET",
		data : {
			num : 12345
		},
		success : function(){
			alert("성공");			
		} ,
		error : function(){
			alert("실패");	
		}
	});
	
})
</script>

</body>
</html>