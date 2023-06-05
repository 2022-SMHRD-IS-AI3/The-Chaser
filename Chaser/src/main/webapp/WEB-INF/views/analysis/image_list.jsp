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
	<h1>영상 선택 페이지</h1>
	<c:forEach items="${fileList.fileList}" var="f1">
		경로 : ${f1.directory}<br>
		이름 : ${f1.fileName}<br>
		<c:forEach items="${f1.fileList}" var="f2">
			경로 : ${f2.directory}<br>
			이름 : ${f2.fileName}<br>
			<c:forEach items="${f2.fileList}" var="f3">
			경로 : ${f3.directory}<br>
			이름 : ${f3.fileName}<br>
				<c:forEach items="${f3.fileList}" var="f4">
				경로 : ${f4.directory}<br>
				이름 : ${f4.fileName}<br>
				</c:forEach>
			</c:forEach>
		</c:forEach>
		<hr>
	</c:forEach>



</body>
</html>