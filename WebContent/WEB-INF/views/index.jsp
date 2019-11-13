<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript"
		src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" type="text/css"
		href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
	<script type="text/javascript"
		src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/css/index.css">
</head>
<body>
	<jsp:include page = "common/manageHeader.jsp"/>
	
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