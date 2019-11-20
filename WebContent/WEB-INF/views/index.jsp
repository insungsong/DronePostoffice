<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
   <script type="text/javascript"
      src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" type="text/css"
      href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
   <script type="text/javascript"
      src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
   <link rel="stylesheet" type="text/css" href="resources/css/index.css">
</head>   
=======
	<script type="text/javascript"
		src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" type="text/css"
		href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
	<script type="text/javascript"
		src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/css/index.css">
	<link rel="stylesheet" type="text/css" href="resources/css/packaging.css">

	<style type="text/css">
		.frt_tbl_type .num, .frt_tbl_type .date, .frt_tbl_type .hit {
    		font-size: 15px;
    		line-height: 3;
		}
		.frt_tbl_type th {
		    font-size: 14px;
		    line-height: 18px;
   
		}
		.frt_tbl_type td {
		    font-size: 15px;
		}
	</style>

</head>	
>>>>>>> branch 'master' of https://github.com/KingHyunSu/FinalWebProject.git
<body>
<<<<<<< HEAD
   <div>   
   <jsp:include page="common/manageHeader.jsp"/>
   </div>
   
   <div class="body">
      <div class="body_sub">
         <div class="left">
            <div class="board">
               <div class="title_box">
                  <a href="">우편 목록</a>
                  <a href="" class="more">more</a>
                  <div class="boardwrite" style="margin-top:10px;height: 1409%;; border:solid black 1px;">
                     <iframe src="http://localhost:8080/FinalWebProject/delivery" style="width:100%;height:100%;"></iframe>
                  </div>
               </div>
            </div>
         </div>
         <div class="middle">
            <div class="photo">
               <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                 <ol class="carousel-indicators">
                   <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                   <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                   <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                 </ol>
                 <div class="carousel-inner">
                   <div class="carousel-item active">
                     <img src="resources/images/postpage1.jpg" class="d-block w-100" alt="안녕하십니까">
                   </div>
                   <div class="carousel-item">
                     <img src="resources/images/postpage2.jpg" class="d-block w-100" alt="안녕하십니까" style="height:399px;">
                   </div>
                   <div class="carousel-item">
                     <img src="resources/images/postpage3.jpg" class="d-block w-100" alt="안녕하십니까" style="height:399px;">
                   </div>
                 </div>
                 <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                   <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                   <span class="sr-only">Previous</span>
                 </a>
                 <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                   <span class="carousel-control-next-icon" aria-hidden="true"></span>
                   <span class="sr-only">Next</span>
                 </a>
               </div>
            </div>
            <div class="notice">
               <div class="title_box">
                  <a href="noticeList">공지사항</a>
                  <a href="noticeList" class="more">more</a>
                  <div class="boardwrite" style="margin-top:10px;height: 1409%;; border:solid black 1px;">
                     <iframe src="http://localhost:8080/FinalWebProject/delivery" style="width:100%;height:100%;"></iframe>
                  </div>
               </div>
            </div>
         </div>
         <div class="right">
            <div class="calendar">
               <div class="title_box">
                  <a href="">마을 요청 목록</a>
                  <a href="" class="more">more</a>
                  <div class="boardwrite" style="margin-top:10px;height: 1409%;; border:solid black 1px;">
                     <iframe src="http://localhost:8080/FinalWebProject/delivery" style="width:100%;height:100%;"></iframe>
                  </div>
               </div>
            </div>
            <div class="restaurant">
               <div class="title_box">
                  <a href="">배송 내역</a>
                  <a href="" class="more">more</a>
                  <div class="boardwrite" style="margin-top:10px;height: 1409%;; border:solid black 1px;">
                     <iframe src="http://localhost:8080/FinalWebProject/delivery" style="width:100%;height:100%;"></iframe>
                  </div>
               </div>
            </div>
         </div>
      </div>         
   </div>
   <div class="footer">
   </div>
=======
	<div>	
	<jsp:include page="common/manageHeader.jsp"/>
	</div>
	<div class="body">
		<div class="body_sub">
			<div class="left">
				<div class="board">
					<div class="title_box">
						<a href="">우편 목록</a>
						<a href="" class="more">more</a>
						
							<div class="boardwrite" style="margin-top:10px;height: 100%;">	
								<div class = "mail_list">
									<table cellspacing="0" border="1" class="frt_tbl_type" style="width:100%;padding-right:15px;">
										<colgroup>
											<col width="35" /><col width="60" /><col width="140" /><col width="60" /><col width="*" /><col width="80" />
											<col width="45"/>
										</colgroup>
										<thead>
											<tr>
												<th scope="col" rowspan="2">NO</th>
												<th scope="col" colspan="2">발신자</th>
												<th scope="col" colspan="2">수신자</th>
												<th scope="col" rowspan="2">도착 마을</th>
												<th scope="col" rowspan="2">무게</th>
											</tr>
											<tr>
												<th scope="col">이름</th>
												<th scope="col">주소</th>
												<th scope="col">이름</th>
												<th scope="col">주소</th>
												
											</tr>
										</thead>
									</table>
									<div style="max-height:500px; width:100%; overflow-x:hidden; overflow-y:scroll;">
										<table cellspacing="0" id="mailTable" border="1" class="frt_tbl_type" style="border-top:0px;">
										
											<colgroup>
												<col width="35" /><col width="60" /><col width="140" /><col width="65" /><col width="*" /><col width="80" />
												<col width="30"/>
											</colgroup>
											<tbody>	
											<c:choose>
												<c:when test="${mailList.size() lt 1}">									
													<tr>
														<td class="num" colspan="8" style="height:30px; background:#fbfbf9;">우편이 없습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
													
											<c:forEach items="${mailList}" var="mail">                     
				                              <tr>
				                                 <td class="num">${mail.mail_id}</td>
				                                 <td class="num">${mail.from_name}</td>
				                                 <td class="num">${mail.from_address}</td>
				                                 <td class="num">${mail.to_name}</td>
				                                 <td class="num">${mail.to_address}</td>
				                                 <td class="num" id="villName">${mail.villageList.get(0).vname}</td>
				                                 <td class="num" id="mail_weight">${mail.mail_weight}</td>
				                                 
				
				                              </tr>
				   								<input type="hidden" id ="${mail.villageList.get(0).vid}" class="hidden_vid">
				                         </c:forEach>
												</c:otherwise>
											</c:choose> 
											</tbody>
										</table>
									</div>
								</div>
							</div>					
						</div>
					</div>
				</div>
			</div>
			<div class="middle">
				<div class="photo">
					<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
					  <ol class="carousel-indicators">
					    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					  </ol>
					  <div class="carousel-inner">
					    <div class="carousel-item active">
					      <img src="resources/images/postpage1.jpg" class="d-block w-100" alt="안녕하십니까" style="height:399px;">
					    </div>
					    <div class="carousel-item">
					      <img src="resources/images/postpage2.jpg" class="d-block w-100" alt="안녕하십니까" style="height:399px;">
					    </div>
					    <div class="carousel-item">
					      <img src="resources/images/postpage3.jpg" class="d-block w-100" alt="안녕하십니까" style="height:399px;">
					    </div>
					  </div>
					  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
					</div>
				</div>
				
				
				<div class="notice">
					<div class="title_box">
						<a href="noticeList">공지사항</a>
						<a href="noticeList" class="more">more</a>
					</div>
					<div class="boardwrite" style="margin-top:10px;height: 100%; border:solid black 1px;">
					<!-- 공지사항 -->
					<div class="mail_list" >				
						<table border="1" class="frt_tbl_type" >
							<colgroup>
								<col width="15%"/><col width="21%"/><col width="21%"/>
								<col width="21%"/><col width="22%"/>
							</colgroup>
							<thead>
								<tr style="height: 39px">
									<th scope="col">글번호</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">부서</th>
									<th scope="col">작성일</th>
								</tr>
							</thead>
						</table>
						<div style="max-height:348px; width:100%;overflow-x:hidden; overflow-y:scroll;">
							<table>
								<colgroup>
									<col width="15%"/><col width="21%"/><col width="21%"/>
									<col width="21%"/><col width="22%"/>
								</colgroup>
								<tbody >
									<c:forEach var="notice" items="${noticeList}">	
										<tr style="height: 34px;">
											<td><a href="noticeDetail?notice_id=${notice.notice_id}" style="font-size:15px;">${notice.notice_id}</a></td>
											<td><a href="noticeDetail?notice_id=${notice.notice_id}" style="font-size:15px;">${notice.notice_title}</a></td>
											<td>${notice.memberList.get(0).mname}</td>
											<td>${notice.deptList.get(0).dept_name}</td>
											<td><fmt:formatDate value="${notice.notice_date}" pattern="yyyy-MM-dd" /></td>
											</tr>
										</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					</div>
					
				</div>
			</div>
			
			
			
			<div class="right">
				<div class="calendar">
					<div class="title_box">
						<a href="">마을 요청 목록</a>
						<a href="" class="more">more</a>
						<div class="boardwrite" style="margin-top:10px;height: 1409%; border:solid black 1px;">
							<table border="1" class="frt_tbl_type" style="width:100%;">	
								<thead class="thead-dark">
											  <tr style="height: 39px">
											     <th scope="col">패키지 번호</th>
											     <th scope="col">패키지 무게</th>
											     <th scope="col">요청 날짜</th>
											     <th scope="col">요청 상태</th>
											     <th scope="col">마을 이름</th>
											     
											   </tr>
								</thead>
							</table>
							<div style="max-height:348px; width:100%;overflow-x:hidden; overflow-y:scroll;">
								<table>
									<tbody>
										<c:forEach items="${packageList}" var="pack">
												<td><a href="packageDetail?package_id=${pack.package_id}" style="font-size:15px;">${pack.package_id}</a></td>
												<td>${pack.package_weight}</td>
												<td>${pack.arrival_date}</td>
												<td>${pack.stateList.get(0).state_name}</td>
												<td>${pack.villageList.get(0).vname}</td>
							
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="restaurant">
					<div class="title_box">
						<a href="">배송 내역</a>
						<a href="" class="more">more</a>
					</div>
						<div class="boardwrite" style="margin-top:10px;height: 100%;; border:solid black 1px;">
							<table cellspacing="0" border="1" class="frt_tbl_type" style="width:100%;padding-right:15px;">
							<colgroup>
								<col width="100" /><col width="*" /><col width="90" /><col width="100" />
							</colgroup>
						<thead>
							<tr>
								<th scope="col">NO</th>
								<th scope="col">마을 이름</th>
								<th scope="col">총 무게</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
					</table>
					<div style="max-height:348px; width:100%;overflow-x:hidden; overflow-y:scroll;">
						<table cellspacing="0" border="1" class="frt_tbl_type" style="border-top:0px;">
							<colgroup>
								<col width="110" /><col width="*" /><col width="95" /><col width="85" />
							</colgroup>
							<tbody>
									
								<c:forEach items="${packageList}" var="pack">
									<c:if test="${pack.state_id ne 's004'}">								
										<tr id="packageListId">
											<td class="num" id="pack">${pack.package_id}</td>
											<td class="title" >${pack.villageList.get(0).vname}</td>
											<td class="date">${pack.package_weight}g</td>
											<td class="writer" id="stateName">${pack.stateList.get(0).state_name}</td>	
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
							
						</table>
						
						</div>
					</div>
				</div>
			</div>
		</div>	
>>>>>>> branch 'master' of https://github.com/KingHyunSu/FinalWebProject.git
</body>
</html>