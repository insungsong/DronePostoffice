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
	
	var total = 0;
	
	function weight_check(value){

		data = value.split(",");
		var weight = data[0]
		console.log(weight);
		var val = parseInt(value);
		
		
		total += val;
		
		console.log(total);
		$("#total_weight").text(total+'g');
	};
	
	function packaging(){
		var Array = [];
		
		$('input[id="chk"]:checkbox:checked').each(function(){
			check = $(this).attr('name');
			Array.push(check);
		});
		
		for(var i= 0; i < Array.length; i++){
			console.log('array' + Array[i]);
		};
		
		
		$.ajax({
			url:"packaging",
			data:{"mailIdList":Array},
			success:function(data){
				console.log('성공');
			}
		});
	}
</script>
</head>
<body>
	<jsp:include page = "../../common/header.jsp"/>
	<div class="body">
		<div class="body_sub">
			<div class="pack_left">
					<table border="1" class="frt_tbl_type" style="width:100%;padding-right:15px;">
						<colgroup>
							<col width="5%" /><col width="10%" /><col width="20%" /><col width="10%" /><col width="30%" /><col width="5%" /><col width="10%" /><col width="7%" />
						</colgroup>
						<thead>
							<tr>		
								<th scope="col">NO</th>
								<th scope="col">발신자</th>
								<th scope="col">발신자 주소</th>
								<th scope="col">수신자</th>
								<th scope="col">수신자 주소</th>
								<th scope="col">무게</th>
								<th scope="col"><input type="checkbox" name="" id='chk_all' value="" onclick="CtlExecutor.doCheckAll();" /><label for="chk_all"></label></th>
							</tr>
						</thead>
					</table>
					
					<div style="max-height:500px; width:100%; overflow-x:hidden; overflow-y:scroll;">
						<table border="1" class="frt_tbl_type" style="border-top:0px;">
							<colgroup>
								<col width="5%" /><col width="10%" /><col width="20%" /><col width="10%" /><col width="30%" /><col width="5%" /><col width="10%" /><col width="5%" />
							</colgroup>
							<tbody>			
								<c:forEach items="${mailList}" var="mail">								
								<tr>
									<td class="num">${mail.mail_id}</td>
									<td class="title" >${mail.from_name}</td>
									<td class="date">${mail.from_address}</td>
									<td class="writer">${mail.to_name}</td>
									<td class="writer">${mail.to_address}</td>
									<td class="writer">${mail.mail_weight}g</td>
									<td class="frm"><input type="checkbox" id="chk" name="${mail.mail_id}"  value="${mail.mail_weight}" onclick="weight_check(value)"/></td>
								</tr>	
								</c:forEach>		
							</tbody>
						</table>
					</div>
		
					<table border="1" class="frt_tbl_type" style="width:100%;padding-right:15px;margin-top:50px;border-top: 1px solid #999;">
						<colgroup>
							<col width="5%" /><col width="10%" /><col width="20%" /><col width="10%" /><col width="30%" /><col width="5%" /><col width="10%" /><col width="7%" />
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
			<div class="pack_right">
			</div>
		</div>
	</div>
	
</body>
</html>