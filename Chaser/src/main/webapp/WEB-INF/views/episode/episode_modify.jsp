<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사건 수정 페이지</h1>
	<form action="episode_modify" method="post">
		<table>
			<tr>
				<td>사건제목</td>
				<td>사건유형</td>
				<td>발생시간</td>
				<td>장소</td>
			</tr>
		</table>
		<input type="text" name="episode_idx" value="1">
		<input type="submit" value="전송">
	</form>
</body>
</html>