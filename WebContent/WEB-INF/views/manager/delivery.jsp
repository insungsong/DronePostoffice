<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
	
	
	
	
	function pack_mailList(value){
		var url = 'pack_mailList?package_id='+value;
		window.open(url,"","width=800,height=700,right=300")
	}
	
	function drone_info(value){
		var len = $('td#pack').length;
		var index;
		
		for(var i = 0; i < len; i++){
			if($('td#pack').eq(i).text() == value){
				index = i;
			}
		}

		$.ajax({
			url:'delivery_Ajax?package_id='+value+'&index='+index,
			success:function(data){
				$('.pack_droneList').html(data);
			}
		});
		//var url = 'delivery_Popup?package_id='+value+'&index='+index;
		//window.open(url,"","width=800,height=700,right=300")
	}
	function drone_send(id,value){
		
	}
</script>
</head>
<body>
	<div class="body">
		<div class="body_sub">
			<div class="pack_deli">
				<div class="bor_title">
					<div class="subject">패키지 목록</div>
				</div>
				<div class = "mail_list" style="border-bottom:1px solid #999;">
					<table cellspacing="0" border="1" class="frt_tbl_type" style="width:100%;padding-right:15px;">
						<colgroup>
							<col width="100" /><col width="*" /><col width="80" /><col width="100" /><col width="100"><col width="100"><col width="100"><col width="100"><col width="15">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">NO</th>
								<th scope="col">마을 이름</th>
								<th scope="col">총 무게</th>
								<th scope="col">상태</th>
								<th scope="col">우편</th>
								<th scope="col">드론</th>
								<th scope="col"></th>
								<th scope="col" colspan="2"></th>
							</tr>
						</thead>
					</table>
					<div style="max-height:500px; width:100%; overflow-x:hidden; overflow-y:scroll;">
						<table cellspacing="0" border="1" summary="명단관리 리스트" class="frt_tbl_type" style="border-top:0px;">
						
							<colgroup>
								<col width="100" /><col width="*" /><col width="80" /><col width="100" /><col width="100"/><col width="100"><col width="100"><col width="100">
							</colgroup>
							<tbody>
									
								<c:forEach items="${packageList}" var="pack">										

									<tr>
										<td class="num" id="pack">${pack.package_id}</td>
										<td class="title" >${pack.villageList.get(0).vname}</td>
										<td class="date">${pack.package_weight}g</td>
										<td class="writer">${pack.stateList.get(0).state_name}</td>
										<td class="title"><button type="button" value="${pack.package_id}" onclick="pack_mailList(value)">우편 목록</button></td>
										<td class="title"><button type="button" id="drone" value="${pack.package_id}" onclick="drone_info(value)">드론 목록</button></td>
										<td>
											<form action="drone_delivery" method="post">
												<input type="hidden" name="send_path" value='${pack.villageList.get(0).send_path}'>
												<input type="hidden" name="package_id" value="${pack.package_id}">
												<input type="hidden" name="drone_id" id="droneId">
												<input type="submit" class="delivery" value="출발" disabled>
											</form>
										</td>
										<td class="title"><button type="button"  id="${pack.package_id}^^${pack.villageList.get(0).return_path}" onclick="drone_return(id,value)" class="return" disabled="disabled">복귀</button></td>
									</tr>
					
								</c:forEach>
							</tbody>
							
						</table>
					</div>
				</div>
			</div>
			
			<div class="pack_droneList">
				
			</div>
		</div>
	</div>
	
</body>
</html>