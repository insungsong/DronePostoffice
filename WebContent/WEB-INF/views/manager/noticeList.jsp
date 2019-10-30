<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
			<script type ="text/javascript" 
			src = "<%=application.getContextPath() %>/resources/js/jquery-3.4.1.min.js"></script>
			<link rel="stylesheet" type ="text/css" 
			href="<%=application.getContextPath() %>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
			<script type="text/javascript" 
			src="<%=application.getContextPath() %>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>		
			<style type="text/css">
			.wrapper{
				border: 1px solid black;
				display: flex;
				width:100%;
   				height:810px;
			}
			.content{
				margin:5px;
				border:1px solid black;
				flex-grow:1;
				height:798px;
				width:100%;
				
				display:flex;
				min-height:0;
			}
			.noticeWirte_btn{
				margin:5px;
				border:1px solid black;
				height:45px;
				flex-direction:column;
				width:100%;
				padding:3px;
			}
			
			.notice_table{
				border:1px solid black;
				margin-top:5px;
				padding:5px;
				height:670px;
			}
			.notice_page{
				border:1px solid black;
				margin-top:300px;
				padding-left:40%;
				padding-top:2px;
				width:100%;
				height:6%;
			}
			
			</style>
		
	</head>
	<body>
			<jsp:include page="../common/header.jsp"/>
			<div class= wrapper>
				
				<div class=content>
					
					<div class=noticeWirte_btn>
						<a href="noticeWrite" class="btn btn-warning">글쓰기</a>
						<c:if test="${mid == null }">
						</c:if>
						
							<div class="notice_table">
							<table class="table table-sm" >
								<thead>
									<tr style="background:gray">
										<th scope="col">글번호</th>
										<th scope="col">제목</th>
										<!-- <th scope="col">부서</th> -->
										<th scope="col">작성자</th>
										<th scope="col">작성일</th>
									</tr>
								
								<tbody>
									<c:forEach var="notice" items="${noticeList}">	
										<tr>
											<th scope="row">${notice.notice_id}</th>
											<td><a href="noticeDetail?notice_id=${notice.notice_id}">${notice.notice_title}</a></td>
											<%-- <td>${notice.dept_id}</td> --%>
											<td>${notice.mid}</td>
											<td><fmt:formatDate value="${notice.notice_date}" pattern="yyyy-MM-dd" /></td>
										</tr>
									</c:forEach>
								
							</table>

							<div class="notice_page">
							<a href="noticeList?pageNum=1" class="btn btn-primary">처음</a>
							<c:if test="${groupNum >1}">
								<a href="noticeList?pageNum=${startPageNum-1}" class="btn btn-success">이전</a>
							</c:if>
								<div style="display: inline-block;" class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
								 
								 <div class="btn-group mr-2" role="group" aria-label="First group">
								 	<c:forEach begin="${startPageNum}" end="${endPageNum}" var="i">
								 		<c:if test="${pageNum==i}">
								 			<a href="noticeList?pageNum=${i}" class="btn btn-secondary active">${i}</a>
								 		</c:if>
								 		<c:if test="${pageNum!=i}">
								 			<a href="noticeList?pageNum=${i}" class="btn btn-secondary">${i}</a>
								 		</c:if>
								 	</c:forEach>
								  </div>
								
								</div>	
								<c:if test="${groupNum <totalGroupNum}">
									<a href="noticeList?pageNum=${endPageNum+1}" class="btn btn-success">다음</a>
								</c:if>
								<a href="noticeList?pageNum=${totalPageNum}" class="btn btn-primary">맨끝</a>
							</div>
						</div>
					
					</div>

				</div>
			
			</div>

	</body>
</html>