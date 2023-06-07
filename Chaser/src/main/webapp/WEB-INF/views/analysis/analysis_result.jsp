<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath == '/' ? '' : pageContext.request.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>분석 결과 페이지</h1>
	<c:forEach items="${imageList}" var="image">
		<a href="${contextPath}/analysis/getWanted?episode_idx=${image.episode_idx}&img_idx=${image.img_idx}">${image}</a>
		<br>
	</c:forEach>
</body>
</html>