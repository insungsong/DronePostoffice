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
			background-color: red;
		}
		.request{
			width: 24%;
			height: 40%;
			background-color: blue;
			margin-top: 14%;
			margin-left: 349px;
			margin-right: 80px;
			display: inline-block;
		}
		.check{
			width: 24%;
		    height: 40%;
		    margin-top: 10%;
		    background-color: yellow;
		    display: inline-block;
		}
	</style>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="body">
			<a href="#"><div class="request"><img src = "./resources/images/Koala.jpg" style="width:200px;"/></div></a>
			<a href="#"><div class="check"><img src = "./resources/images/Koala.jpg "style="width:200px;"/></div></a>
		</div>
	</body>
</html>