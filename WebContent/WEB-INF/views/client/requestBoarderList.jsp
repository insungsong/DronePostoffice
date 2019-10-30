<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
			<script type= "text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
			<link rel="stylesheet" type = "text/css" href ="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css"/>
			<script type= "text/javascript" src ="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
	<style type="text/css">
		.request_board_area{
			border:1px solid black;
			height:909px;
		}
		.request_board_second{
			margin:20px;
			border: solid 1px black;
    		height: 873px;
		}
		.request_text{
			margin:10px;
			border: solid 1px black;
			height:30px;
			text-align:center;
		}
		.request_content{
			margin: 10px;
			border: solid 1px black;
			height: 740px;
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
			height:595px;
			border: solid 1px black;
		}
		.btn{
			margin-left: 10px;
   			margin-top: 10px;
		}
		.btn-toolbar{
			margin-left: 41%;
		}
	</style>
	<script type="text/javascript">
		function requestDelete(name){
			console.log(name);
			$.ajax({
				url:"requestRemove",
				data:{"mail_id":name},
				success:function(data){
					console.log('성공');
				}
			});
		}
	</script>
	</head>
	<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="request_board_area">
			<div class="request_board_second">
				<div class="request_text">요청 목록</div>
				<div class="request_serch">
					<nav class="navbar navbar-light bg-light">
					  <form class="form-inline">
					    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
					    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
					  </form>
					</nav>
				</div>
				<div class="request_content">
					<form action="requestWrite">
						<div class="client_write_button">
							<button class="btn btn-primary btn-lg active" role="button" aria-pressed="true">글쓰기</button>
						</div>
					</form>
					<div class="client_content_content">
								<table class="table">
									<thead class="thead-dark">
									   <tr>
									     <th scope="col">요청 번호</th>
									     <th scope="col">보내는 사람</th>
									     <th scope="col">보내는 주소</th>
									     <th scope="col">받는 사람</th>
									     <th scope="col">받는 주소</th>
									     <th scope="col">메일 무게</th>
									     <th scope="col">배송 상태</th>
									     <th scope="col">요청 취소</th>
									   </tr>
									  </thead>
									  <tbody>
									    <c:forEach items="${MailList}" var="MailList">
											 <tr>
											    <td id="Mail_id"><a href="boardDetail?mail_id=${MailList.mail_id }">${MailList.mail_id }</a></td>
												<td id="Mail_fromname">${MailList.from_name}</td>
												<td id="Mail_fromaddress">${MailList.from_address}</td>
												<td id="Mail_toname">${MailList.to_name }</td>
												<td id="Msil_toaddress">${MailList.to_address}</td>
												<td id="Mail_weight">${MailList.mail_weight}</td>
												<td id="Mail_state_id">${MailList.state_id}</td>
												<td><button type="button" name="${MailList.mail_id }" id="mail_id" class="btn btn-danger" style="width:58px;height:29px;margin:0px;padding:0px" onclick="requestDelete(name)">취소</button></td>
											 <tr>
										</c:forEach>
									</tbody>
							</table>
						</div>
						<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
								<a href="requestBoarderList?pageNo=1" class="btn btn-success">처음</a>
								<c:if test="${groupNo > 1}">
									<a href="requestBoarderList?pageNo=${startPageNo-1}" class="btn btn-secondary">[이전]</a>
								</c:if>		
								<div class="btn-group mr-2" role="group" aria-label="First group">
									<c:forEach begin="${startPageNo }" end="${endPageNo }" var="i">
											<c:if test="${pageNo==i }">
												<a href="requestBoarderList?pageNo=${i}"class="btn btn-secondary active">${i}</a>
											</c:if>
											<c:if test="${pageNo!=i }">
												<a href="requestBoarderList?pageNo=${i}"class="btn btn-secondary">${i}</a>
											</c:if>
							    	</c:forEach>
							    <c:if test="${groupNo<totalGroupNum }">
							    	<a href="requestBoarderList?pageNo=${endPageNo+1}" class="btn btn-success">다음</a>
							    </c:if>
							  </div>
							  <a href="requestBoarderList?pageNo=${totalPageNum}" class="btn btn-success">맨끝</a>
						</div>					
					</div>			
				</div>
			</div>		
		</body>
	</html>