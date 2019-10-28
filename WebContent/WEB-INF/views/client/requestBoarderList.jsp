<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
			<script type= "text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
			<link rel="stylesheet/css" type = "text/css" href ="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css"/>
			<script type= "text/javascript" src ="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
	<style type="text/css">
		.request_board_area{
			border:1px solid black;
			height:800px;
		}
		.request_board_second{
			margin:20px;
			border: solid 1px black;
    		height: 760px;
		}
		.request_text{
			margin:10px;
			border: solid 1px black;
			height:30px;
			text-align:center;
		}
		.request_content{
			margin:10px;
			border: solid 1px black;
			height:630px;
		}
		.request_serch{
			margin:10px;
			border: solid 1px black;
			height:50px;
		}
		.request_box{
			margin:5px;
			border: solid 1px black;
			height:50px;
			float: right;
		}
		.serch_keyword{
			border: solid 1px black;
			float: right;
    		margin-top: 13px;
    		margin-right: 7px;
		}
		.client_content_list{
			border: solid 1px black;
			height:50px;
			margin:5px;
		}
		.client_content_ul{
			display:inline-flex;
			list-style:none;
		}
		.client_content_num{
			margin-right: 280px;
    		margin-left: 85px;
		}
		.client_content_title{
			margin-right: 320px;
		}
		.client_content_Writer{
			margin-right: 170px;
		}
		.client_content_village{
			margin-right: 170px;;
		}
		
		.client_content_content{
			margin:10px;
			height:525px;
			border: solid 1px black;
		}
	</style>
	
	<script type="text/javascript">
		function writeBoard() {
			location.href="writeBoard";
		}
	</script>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="request_board_area">
			<div class="request_board_second">
				<div class="request_text">요청 목록</div>
				<div class="request_serch">
					<div class="serch_box"><span class="serch_keyword">검색</span></div>
				</div>
				<div class="request_content">
					<div class="client_content_list">
						<ul class="client_content_ul">
							<li class="client_content_num">글번호</li>
							<li class="client_content_title">제목</li>
							<li class="client_content_Writer">작성자</li>
							<li class="client_content_village">마을</li>
							<li class="client_content_date">작성일</li>
						</ul>
					</div>
					<div class="client_write_button">
						<input type="button" value="글작성" onclick="writeBoard()"/>
					</div>
					<div class="client_content_content">
						${boardList }
					</div>
				</div>
			</div>
		</div>		
	</body>
</html>