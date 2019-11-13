<%@page import="com.postoffice.web.dto.MailDTO"%>
<%@page import="com.postoffice.web.dto.StateDTO"%>
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
			/* border-top:1px solid red; */
			border-top: 2px solid red;
			height:909px;
		}
		.request_board_second{
			margin:20px;
			border: solid 1px black;
    		height: 873px;
		}
		.request_text{
			margin:10px;
			margin-bottom:20px;
			/* border: solid 1px black; */
			height:30px;
			text-align:center;
		}
		.request_content{
			margin: 10px;
			/* border: solid 1px black; */
			height: 740px;
		}
		.request_serch{
			margin:10px;
			/* border: solid 1px black; */
			height: 22px;
			margin-top: 40px;
    		margin-left: 22px;
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
	<script type="text/javascript">
		function packaging(){
			var Array = [];
			
			$('input:checkbox:checked').each(function(){
				check = $(this).attr('name');
				Array.push(check);
			});
			
			for(var i= 0; i < Array.length; i++){
				console.log('array' + Array[i]);
			};
			$.ajax({
				url:"mailpackaging",
				data:{"mailIdList":Array,"totalWeight":$("#total_weight").text()},
				success:function(data){
					location.reload();
				}
			});
		}
		
		
		
		
		var pageLen;
		var totalChkLen;
		
		var first_href;
		var href2;
		var now_href;	
		var href4 = [];
		var href5;
		var end_href;
		
		var totalWeight;
		var totalMailId;
		
		$(function(){
			//이동할 페이징 갯수
			pageLen = $('a#href4').length;
			
			//현재 페이지 체크박스 총 갯수
			totalChkLen = $('input#chk').length;
			
			//(페이지 이동시)서버에서 넘어온 무게,메일 id
			totalWeight = $('#totalWeight').val();
			totalMailId = $('#totalMailId').val();

			//데이터(무게,메일 id) 추가하지 않은 기본 href 경로
			first_href = $('a#href1').attr('href');
			href2 = $('a#href2').attr('href');
			now_href = $('a#href3').attr('href');			
			href5 = $('a#href5').attr('href');
			end_href = $('a#href6').attr('href');
			href4 = [];
			for(var i = 0; i < pageLen; i++){
				var hrefArr = $('a#href4').eq(i).attr('href');
				href4.push(hrefArr);
			}
			
			//(페이지 이동시)서버에서 넘어온 데이터(무게, 메일 id)로 파라미터 변경
			$('a#href1').attr('href',first_href+'&totalWeight='+totalWeight+'&totalMailId='+totalMailId);
			$('a#href2').attr('href',href2+'&totalWeight='+totalWeight+'&totalMailId='+totalMailId);
			$('a#href3').attr('href',now_href+'&totalWeight='+totalWeight+'&totalMailId='+totalMailId);
			for(var i = 0; i < pageLen; i++){
				$('a#href4').eq(i).attr('href', href4[i]+'&totalWeight='+totalWeight+'&totalMailId='+totalMailId);
			}
			$('a#href5').attr('href',href5+'&totalWeight='+totalWeight+'&totalMailId='+totalMailId);
			$('a#href6').attr('href',end_href+'&totalWeight='+totalWeight+'&totalMailId='+totalMailId);
			
			//(페이지 이동시)서버에서 넘어온 데이터(체크한 메일 id) 배열에 ,로 split 
			var mailIdArr = totalMailId.split(',');
			
			//(페이지 이동시)서버에서 넘어온 데이터(체크한 메일 id)랑 현재 페이지 메일 id 비교해서 같으면 체크 true
			for(var j = 0; j < mailIdArr.length; j++){
				for(var i = 0; i < totalChkLen; i++){
					if(mailIdArr[j] == $('input#chk').eq(i).attr('name')){
						$('input#chk').eq(i).prop("checked", true);
					}
				}
			}
		});
		
		
		function weight_check(){
				var intTotalWeight = parseInt(totalWeight);
				var total_weight = 0;
				
				var check = 0;
				var Wtotal = [intTotalWeight];
				var Ntotal = [totalMailId];
				
				//체크 된 메일(메일 id, 무게) 가져와서 배열에 push
				$('input:checkbox:checked').each(function(){
					Wtotal.push(parseInt($(this).attr('value')));
					Ntotal.push($(this).attr('name'));
				});
				
				
				//배열에 들어있는 무게 전부 더해서 총 합 추출
				for(var i = 0; i < Wtotal.length; i++){
					total_weight += Wtotal[i];
				}
				
				//페이지에 출력
				$("#total_weight").text(total_weight+'g');

				
				
				
				//현재 페이지에서 추가한 체크 데이터로 파라미터 변경 
				$('a#href1').attr('href',first_href+'&totalWeight='+total_weight+'&totalMailId='+Ntotal);
				$('a#href2').attr('href',href2+'&totalWeight='+total_weight+'&totalMailId='+Ntotal);
				$('a#href3').attr('href',now_href+'&totalWeight='+total_weight+'&totalMailId='+Ntotal);
				for(var z = 0; z < pageLen; z++){
					$('a#href4').eq(z).attr('href', href4[z]+'&totalWeight='+total_weight+'&totalMailId='+Ntotal);
				}
				$('a#href5').attr('href',href5+'&totalWeight='+total_weight+'&totalMailId='+Ntotal);
				$('a#href6').attr('href',end_href+'&totalWeight='+total_weight+'&totalMailId='+Ntotal);
			}
	</script>
	
	</head>
	<body>
	<h5>${mailpackaginList}</h5>
	<jsp:include page="../common/ClienetRequestheader.jsp"></jsp:include>
		<div class="menubar">
			<ul style=margin-bottom:5px>
				<li style="position: absolute;right: 7px; border:0;">${vmname}님 환영합니다.<a href = "logout" style=display:inline>로그아웃</a>
			</ul>
		</div>
		<div class="request_board_area">
			<div class="request_board_second">
				<div class="request_text">
				<div class="alert alert-danger" role="alert">
				<a href="#" class="alert-link">요청 게시판</a>
				</div>
				</div>
				<div class="request_serch">
					  <form id="searchForm" action="searchBoard" method="get">
							<select id="searchType" name="searchType">
								<option value="from_name">보내는 사람 조회</option>
								<option value="to_name">받는 사람 조회</option>
							</select>
							<input type="text" id="keyWord" name="keyword" style="height: 25px">
							<button>검색</button>
					  </form>
				</div>
				<div class="request_content">
					<form action="requestWrite">
						<div class="client_write_button">
							<button class="btn btn-primary btn-lg active" role="button" aria-pressed="true">글쓰기</button>
						</div>
					</form>
					<!-- hidden start-->
					<input type = "hidden" id="totalWeight" value="${totalWeight }"/>
					<input type = "hidden" id="totalMailId" value="${totalMailId }"/>
					<!-- hiden end -->
					<table>
						<tr>
							<th scope="col" colspan="5">총 무게</th>					
							<th scope="col" id="total_weight">${totalWeight}</th>
							<th scope="col"><button type="button" name="" id='chk_all' value="" onclick="packaging()">패키징</button></th>
						</tr>
					</table>
					<div class="client_content_content">
								<table class="table">
									<thead class="thead-dark">
									   <tr>
									     <th scope="col">요청 번호</th>
									     <th scope="col">요청 날짜</th>
									     <th scope="col">보내는 사람</th>
									     <th scope="col">보내는 주소</th>
									     <th scope="col">받는 사람</th>
									     <th scope="col">받는 주소</th>
									     <th scope="col">메일 무게</th>
									     <th scope="col">배송 상태</th>
									     <th scope="col">마을 분류</th>
									     <th scope="col">취소</th>
									     <td scope="col" id="total_weight"></td>
									   </tr>
									  </thead>
									  <tbody>
										  	<c:forEach items="${MailList}" var="MailList">
												 <tr>
												    <td id="Mail_id"><a href="boardDetail?mail_id=${MailList.mail_id }">${MailList.mail_id }</a></td>
												    <td id="Mail_mail_date"><a href="boardDetail?mail_id=${MailList.mail_id }">${MailList.mail_date}</a></td>
													<td id="Mail_fromname"><a href="boardDetail?mail_id=${MailList.mail_id }">${MailList.from_name}</a></td>
													<td id="Mail_fromaddress"><a href="boardDetail?mail_id=${MailList.mail_id }">${MailList.from_address}</a></td>
													<td id="Mail_toname"><a href="boardDetail?mail_id=${MailList.mail_id }">${MailList.to_name }</a></td>
													<td id="Msil_toaddress"><a href="boardDetail?mail_id=${MailList.mail_id }">${MailList.to_address }</a></td>
													<td id="Mail_weight"><a href="boardDetail?mail_id=${MailList.mail_id }">${MailList.mail_weight }</a></td>
													<td id="Mail_state_name"><a href="boardDetail?mail_id=${MailList.mail_id }">${MailList.stateList.get(0).state_name}</a></td>
													<td id="Mail_vname"><a href="boardDetail?mail_id=${MailList.mail_id }">${MailList.villageList.get(0).vname}</a></td>
													<td><button type="button" name="${MailList.mail_id }" id="mail_id" class="btn btn-danger" style="width:58px;height:29px;margin:0px;padding:0px" onclick="requestDelete(name)">취소</button></td>
													<td class="frm"><input type="checkbox" id="chk" name="${MailList.mail_id}"  value="${MailList.mail_weight}" onclick="weight_check()"/></td>
												</tr>
											</c:forEach>						  
									</tbody>
							</table>
						</div>

						<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">

								<a href="requestBoarderList?pageNo=1" id = "href1" class="btn btn-success">처음</a>

								<c:if test="${groupNo > 1}">
									<a href="requestBoarderList?pageNo=${startPageNo-1}" id="href2" class="btn btn-secondary">[이전]</a>
								</c:if>		
								<div class="btn-group mr-2" role="group" aria-label="First group">
									<c:forEach begin="${startPageNo }" end="${endPageNo }" var="i">
											<c:if test="${pageNo==i }">
												<a href="requestBoarderList?pageNo=${i}" id="href3" class="btn btn-secondary active">${i}</a>
											</c:if>
											<c:if test="${pageNo!=i }">
												<a href="requestBoarderList?pageNo=${i}" id="href4" class="btn btn-secondary">${i}</a>
											</c:if>
							    	</c:forEach>
							    <c:if test="${groupNo<totalGroupNum }">
							    	<a href="requestBoarderList?pageNo=${endPageNo+1}" id="href5" class="btn btn-success">다음</a>
							    </c:if>
							  </div>
							  <a href="requestBoarderList?pageNo=${totalPageNum}" id="href6" class="btn btn-success">맨끝</a>
						</div>					
					</div>			
				</div>
			</div>		
		</body>
		<script type="text/javascript">
		
		
	</script>
	</html>