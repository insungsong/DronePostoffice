<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/packaging.css">

	<script type="text/javascript"
		src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" type="text/css"
		href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
	<script type="text/javascript"
		src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<link href="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.css" rel="stylesheet">

<script src="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.js"></script>

<script type="text/javascript">
	
	
	function weight_check(){
		
		var total = [];
		var check = 0;
		
		$('input:checkbox:checked').each(function(){
			total.push(parseInt($(this).attr('value')));
		});
		
		total_weight = 0;
		
		for(var i = 0; i < total.length; i++){
			total_weight += total[i];
		}
	
		$("#total_weight").text(total_weight+'g');
		console.log($("#total_weight").text());
	}
	
	function Auto_weight_check(){
			if($("#chk_auto").prop("checked")){
				//if(parseInt($("input[name='chk_auto']:checked")) < parseInt($("#total_weight"))){
					$("#chk").prop("checked",true);
				//}
			}else{
				$("#chk").prop("checked",false);
			}
	}
	
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
			url:"packaging",
			data:{"mailIdList":Array,"totalWeight":$("#total_weight").text()},
			success:function(data){
				console.log('성공');
			}
		});
	}
</script>
</head>
<body>
	<jsp:include page = "../common/header.jsp"/>
	<div class="body">
		<div class="body_sub">
			<div class="pack_left">
				<div class="bor_title">
					<div class="subject">우편 목록</div>
					<div class="searching">
						<form action="pack_search" method="post">
							<input type="text" name="search_text" class="input_text">
							<input type="submit" value="조회" class="input_submit">
						</form>
					</div>
				</div>
				<div class = "mail_list">
					<table cellspacing="0" border="1" summary="명단관리  리스트" class="frt_tbl_type" style="width:100%;padding-right:15px;">
						<colgroup>
							<col width="50" /><col width="80" /><col width="100" /><col width="80" /><col width="*" /><col width="50" />
							<col width="50"/><col width="15">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">NO</th>
								<th scope="col">발신자</th>
								<th scope="col">발신자 주소</th>
								<th scope="col">수신자</th>
								<th scope="col">수신자 주소</th>
								<th scope="col">무게</th>
								<th scope="col"><input type="checkbox" name="chk_auto" id='chk_auto' value="" onclick="Auto_weight_check()" /><label for="chk_all"></label></th>
								<th scope="col"></th>
							</tr>
						</thead>
					</table>
					<div style="max-height:500px; width:100%; overflow-x:hidden; overflow-y:scroll;">
						<table cellspacing="0" border="1" summary="명단관리 리스트" class="frt_tbl_type" style="border-top:0px;">
						
							<colgroup>
								<col width="50" /><col width="80" /><col width="100" /><col width="80" /><col width="*" /><col width="50" />
								<col width="50" />
							</colgroup>
							<tbody>		
								<c:forEach items="${mailList}" var="mail">	
									<c:if test="${mail.state_id eq 's001'}">									
										<tr>
											<td class="num">${mail.mail_id}</td>
											<td class="title" >${mail.from_name}</td>
											<td class="date">${mail.from_address}</td>
											<td class="writer">${mail.to_name}</td>
											<td class="writer">${mail.to_address}</td>
											<td class="writer">${mail.mail_weight}g</td>
											<td class="frm"><input type="checkbox" id="chk" name="${mail.mail_id}"  value="${mail.mail_weight}" onclick="weight_check()"/></td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<table border="1" class="frt_tbl_type" style="width:100%;padding-right:15px;border-top: 1px solid #999;">
						<colgroup>
							<col width="*" /><col width="50" /><col width="100" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col" colspan="5">총 무게</th>
								<th scope="col" id="total_weight"></th>
								<th scope="col"><button type="button" name="" id='chk_all' value="" onclick="packaging()">패키징</button></th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			
			<div class="pack_right">
				<div class = "mail_list">
					<table cellspacing="0" border="1" summary="명단관리  리스트" class="frt_tbl_type" style="width:100%;padding-right:15px;">
						<colgroup>
							<col width="100" /><col width="*" /><col width="80" /><col width="100" /><col width="100" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">NO</th>
								<th scope="col">마을 이름</th>
								<th scope="col">총 무게</th>
								<th scope="col">상태</th>
								<th scope="col">포장 날짜</th>
								<th scope="col"><input type="checkbox" name="chk_auto" id='chk_auto' value="" onclick="Auto_weight_check()" /><label for="chk_all"></label></th>
								<th scope="col"></th>
							</tr>
						</thead>
					</table>
					<div style="max-height:500px; width:100%; overflow-x:hidden; overflow-y:scroll;">
						<table cellspacing="0" border="1" summary="명단관리 리스트" class="frt_tbl_type" style="border-top:0px;">
						
							<colgroup>
								<col width="100" /><col width="*" /><col width="80" /><col width="100" /><col width="100" />
							</colgroup>
							<tbody>		
								<c:forEach items="${packagingList}" var="package">										
									<tr>
										<td class="num">${package.package_id}</td>
										<td class="title" >${package.village}</td>
										<td class="date">${package.package_weight}</td>
										<td class="writer">${package.state_id}</td>
										<td class="writer">${package.arrival_date}</td>
										<td class="frm"><input type="checkbox" id="chk" name=""  value="" onclick="weight_check()"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<table border="1" class="frt_tbl_type" style="width:100%;padding-right:15px;border-top: 1px solid #999;">
						<colgroup>
							<col width="*" /><col width="50" /><col width="100" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col" colspan="5">총 무게</th>
								<th scope="col" id="total_weight"></th>
								<th scope="col"><button type="button" name="" id='chk_all' value="" onclick="packaging()">패키징</button></th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>