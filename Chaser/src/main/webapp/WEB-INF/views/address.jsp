<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    	new daum.Postcode({
        	oncomplete: function(data) {
            	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            	// 예제를 참고하여 다양한 활용법을 확인해 보세요.
        	}
    	}).open();
	</script>

	<h1>
		Hello world!  
	</h1>


</body>
</html>