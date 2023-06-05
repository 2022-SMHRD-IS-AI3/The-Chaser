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
	
		<form action="${contextPath}/analysis/image_insert" method="post">
			<input type="text" name="path" placeholder="영상 경로">
			<tr>
				<input type="text" name="uploadList[0].loc" placeholder="영상이 찍힌 위치">
				<input type="text" name="uploadList[0].uploadFolder" placeholder="영상 폴더 이름">
				<input type="text" name="uploadList[0].uploadFolderList[0]" placeholder="영상 파일 경로">
				<input type="text" name="uploadList[0].uploadFolderList[1]" placeholder="영상 파일 경로">
				<input type="text" name="uploadList[0].uploadFolderList[2]" placeholder="영상 파일 경로">
			</tr>
			<tr>
				<input type="text" name="uploadList[1].loc" placeholder="영상이 찍힌 위치">
				<input type="text" name="uploadList[1].uploadFolder" placeholder="영상 폴더 이름">
				<input type="text" name="uploadList[1].uploadFolderList[0]"  placeholder="영상 파일 경로">
				<input type="text" name="uploadList[1].uploadFolderList[1]"  placeholder="영상 파일 경로">
			</tr>
			<tr>
				<input type="text" name="uploadList[2].loc" placeholder="영상이 찍힌 위치">
				<input type="text" name="uploadList[2].uploadFolder" placeholder="영상 폴더 이름">
				<input type="text" name="uploadList[2].uploadFolderList[0]"  placeholder="영상 파일 경로">
			</tr>
			<tr>
				<input type="text" name="uploadList[3].loc" placeholder="영상이 찍힌 위치">
				<input type="text" name="uploadList[3].uploadFolder" placeholder="영상 폴더 이름">
				<input type="text" name="uploadList[3].uploadFolderList[0]"  placeholder="영상 파일 경로">
				<input type="text" name="uploadList[3].uploadFolderList[1]"  placeholder="영상 파일 경로">
				<input type="text" name="uploadList[3].uploadFolderList[2]"  placeholder="영상 파일 경로">
			</tr>
			<input type="submit">	
		</form>



</body>
</html>