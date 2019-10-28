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
	<style type="text/css">
		.body{
			height:100%;
			background-color: white;
		}
		.request{
			width: 20%;
			height: 45%;
			background-color: #F32C28;
			margin-top: 10%;
			margin-left: 430px;
			margin-right: 80px;
			display: inline-block;
		}
		.check{
			width: 20%;
		    height: 45%;
		    margin-top: 10%;
		    background-color: #F32C28;
		    display: inline-block;
		}
		img{
			vertical-align: middle;
		    border-style: none;
		    margin: 34px;
		    background-color: white;
   		 }
	</style>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="body">
			<a href="requestBoarderList?pageNo=1"><div class="request"><img src = "./resources/images/one-finger-tap-outlined-symbol-of-a-hand_icon-icons.com_57978.png" style="width:200px;"/><h6>요청</h6></div></a>
			<a href="#"><div class="check"><img src = "./resources/images/thumb-up-stroke_icon-icons.com_57954.png "style="width:200px;"/><h6>확인</h6></div></a>
		</div>
	</body>
</html>