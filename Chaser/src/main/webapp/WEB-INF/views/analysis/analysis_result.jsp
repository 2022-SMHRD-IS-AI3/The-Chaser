<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>분석 결과 페이지</h1>
	<form action="/analysis_modify" method="post">
		<c:forEach items="${list}" var="wanted">
			<input type="text" name="w_flag" value="${w_flag }">
			<input type="submit" value="전송">
		</c:forEach>
	</form>
</body>
</html>