<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="resources/css/index.css">
</head>
<body>
	<jsp:include page = "common/header.jsp"/>
	
	<div class="body">
		<div class="body_sub">
			<div class="left">
				<div class="board">
					<div class="title_box">
						<a href="">게시판</a>
						<a href="" class="more">more</a>
					</div>
				</div>
			</div>
			<div class="middle">
				<div class="photo">
					<img src="resources/images/Koala.jpg" width=100% height=90% style="margin-top: 30px">
				</div>
				<div class="notice">
					<div class="title_box">
						<a href="noticeList">공지사항</a>
						<a href="noticeList" class="more">more</a>
					</div>
				</div>
			</div>
			<div class="right">
				<div class="calendar">
					<div class="title_box">
						<a href="">사내일정</a>
						<a href="" class="more">more</a>
					</div>
				</div>
				<div class="restaurant">
					<div class="title_box">
						<a href="">오늘의 식단</a>
						<a href="" class="more">more</a>
					</div>
				</div>
			</div>
		</div>			
	</div>
	
	<div class="footer">
	</div>
</body>
</html>