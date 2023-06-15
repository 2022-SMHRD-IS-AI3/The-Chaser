<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		<ul>
			<li>영상 번호: ${image.img_idx}</li>
			<li>영상 제목: ${image.img_nm}</li>
			<li>분석된 영상 src: ${image.img_src}</li>
			<li>영상 좌표 : ${image.img_xy}</li>
			<li>영상 총 길이 : ${image.img_length}</li>
			<li>영상 ocr : ${image.img_time}</li>
			<li>원본 영상 src: ${image.origin_img_src}</li>
			<li>원본 영상이름: ${image.origin_imgs}</li>
			<li>사건 번호: ${image.episode_idx}</li>
			<c:forEach items="${image.wantedDTOList }" var = "wanted">
				<ul>
					<li>용의자 번호 : ${wanted.w_idx}</li>
					<li>용의자 첫 프레임 : ${wanted.w_first}</li>
					<li>용의자 마지막 프레임 : ${wanted.w_last}</li>
					<li>용의자 색 : ${wanted.w_color}</li>
					<li>용의자 확정 : ${wanted.w_flag}</li>
					<li>용의자 일치율 : ${wanted.w_per}</li>
					<li>용의자 번호 : ${wanted.w_idx}</li>
					<li>사건 번호 : ${wanted.episode_idx}</li>
					<li>영상 번호 : ${wanted.img_idx}</li>
					<li>인상착의 번호 : ${wanted.appe_idx}</li>
					<li><a href="${contextPath}/analysis/analysis_modify?w_idx=${wanted.w_idx}&w_flag=Y">범인 확정</a></li>
				</ul>			
			</c:forEach>
		</ul>
		<hr>
	</c:forEach>
</body>
</html>