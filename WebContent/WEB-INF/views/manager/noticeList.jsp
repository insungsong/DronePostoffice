<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page session="true"%>

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
			.noticeList_area{
				border:1px solid black;
				height:909px;
			}
			.noticeList_sub_area{
				margin:20px;
				border: solid 1px black;
    			height: 873px;
			}
			.noticeList_title{
				margin:10px;
				border: solid 1px black;
				height:30px;
				text-align:center;
			}
			.noticeList_search{
				margin:10px;
				border: solid 1px black;
				height:50px;
			}
			.noticeList_content{
				margin: 10px;
				border: solid 1px black;
				height: 740px;
			}
			
			.noticeWirte_btn{
				margin:5px;
				height:45px;
				flex-direction:column;
				width:99%;
				padding:3px;
			}
			
			.notice_table{
				margin:10px;
				height:600px;
				border: solid 1px black;
			}
			.notice_page{
				margin-left: 41%;
				padding-top: 8px;
			}
			
			</style>
		
	</head>
	<body>
			<jsp:include page="../common/manageHeader.jsp"/>
			<div class="body">
				<div class="body_sub">
				
					<div class="noticeList_area">
					<div class="noticeList_sub_area">
					<div class="noticeList_title">공지사항 목록</div>
					
					<div class="noticeList_search">
						<form id="noticeSearchForm" method="get" action="noticeSearch">
							<select id="searchNotice" name="searchNotice">
								<option value="notice_title">제목</option>
								<option value="mid">작성자</option>
							</select>
							<input type="text" id="searchWord" name="searchWord" style="height: 25px">
							<button>검색</button>
						</form>
					</div>
					
					<div class="noticeList_content">
						<div class=noticeWirte_btn>
							<a href="noticeWrite" class="btn btn-warning">글쓰기</a>
						</div>
						<div class="notice_table">
							<table class="table table-sm" >
								<thead>
									<tr style="background:gray">
										<th scope="col">글번호</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										
										<th scope="col">작성일</th>
									</tr>
								
								<tbody>
									<c:forEach var="notice" items="${noticeList}">	
										<tr>
											<th scope="row">${notice.notice_id}</th>
											<td><a href="noticeDetail?notice_id=${notice.notice_id}">${notice.notice_title}</a></td>
											<td>${notice.mid}</td>
											
											<td><fmt:formatDate value="${notice.notice_date}" pattern="yyyy-MM-dd" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<c:if test="${totalPageNum >= 1}">
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
						</c:if>
						
					
					</div>
				
					</div>
					</div>


				</div>
			
			</div>
	</body>
</html>