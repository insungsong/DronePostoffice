<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<link href="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.css" rel="stylesheet">
	<script src="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="resources/css/droneManagement.css">
	
	
</head>
<body>
	<jsp:include page = "../common/manageHeader.jsp"/>
	<div class="body">
		<div class="body_sub">
			<div class="left">
				<div class="drone_left">
					<div class="bor_title">
						<div class="subject">드론 현황</div>
					</div>
					<div class = "mail_list" style="border-bottom:1px solid #999;">
						<table cellspacing="0" border="1" class="frt_tbl_type" style="width:100%;padding-right:15px;">
							<colgroup>
								<col width="100" /><col width="*" /><col width="100"/><col width="15">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">드론명</th>
									<th scope="col">상태</th>
									<th scope="col">배터리</th>
									<th scope="col"></th>
								</tr>
							</thead>
						</table>
						<div style="max-height:500px; width:100%; overflow-x:hidden; overflow-y:scroll;">
							<table cellspacing="0" border="1" id="droneList" class="frt_tbl_type" style="border-top:0px;">
							
								<colgroup>
									<col width="100" /><col width="*" /><col width="100" />
								</colgroup>
								<tbody>		
									<c:forEach items="${droneList}" var="drone">										
										<tr>
											<td class="num">${drone.drone_id}</td>
											<td class="title">${drone.stateList.get(0).state_name}</td>
											<td class="title">100%</td> 
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="dron_left_down">
					<div class="bor_title">
						<div class="subject">드론 관리</div>
					</div>
					<div class = "mail_list" style="border-bottom:1px solid #999;">
						<table cellspacing="0" border="1" class="frt_tbl_type" style="width:100%;padding-right:15px;">
							<colgroup>
								<col width="70"/><col width="50"/><col width="*" /><col width="100"/>
							</colgroup>
							<thead>
								<tr>
									<th scope="col" colspan="2">드론명</th>
									<td colspan="2">dd</td>
								</tr>
							</thead>
						</table>
						<div style="max-height:500px; width:100%;">
							<table cellspacing="0" border="1" id="droneList" class="frt_tbl_type" style="border-top:0px;">
								<colgroup>
									<col width="70"/><col width="50"/><col width="*" /><col width="90"/>
								</colgroup>
								<tbody>											
									<tr>
										<th scope="col">배터리</th>
										<td class="title">100%</td>
										<th scope="col">현재 상태</th>
										<td class="title">대기중</td> 
									</tr>
									<tr>
										<th scope="col" colspan="2">등록 일자 일자</th>
										<td class="title" colspan="2">2018-04-12</td> 
									</tr>
									<tr>
										<th scope="col" colspan="2">최근 운용 일자</th>
										<td class="title" colspan="2">2018-04-12 14:22</td> 
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
				<div class="drone_center">
					<div class="bor_title">
						<div class="subject">드론 현재 위치</div>
					</div>
					<div class = "mail_list" style="border-bottom:1px solid #999;">
						<div id="map" style="width:100%;height:500px;">
						
						</div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=05852697430c6a36aa2521201b5d17b6">
							</script>
							<script>
									var container = document.getElementById('map');
									var options = {
										center: new kakao.maps.LatLng(33.450701, 126.570667),
										level: 3
									};
							
									var map = new kakao.maps.Map(container, options);
							</script>
					</div>
				</div>
				<div class="drone_right">
					<div class="bor_title">
						<div class="subject">배송 기록</div>
					</div>
					<div class = "mail_list" style="border-bottom:1px solid #999;">
						<table cellspacing="0" border="1" class="frt_tbl_type" style="width:100%;padding-right:15px;">
							<colgroup>
								<col width="50" /><col width="*" /><col width="60" /><col width="70" /><col width="100" /><col width="15">
							</colgroup>
							<thead>
								<tr>
									<th colspan="6">도착지</th>
								</tr>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">도착 마을</th>
									<th scope="col">총 무게</th>
									<th scope="col">상태</th>
									<th scope="col">포장 날짜</th>
									<th scope="col" colspan="2"></th>
								</tr>
							</thead>
						</table>
						<div style="max-height:500px; width:100%; overflow-x:hidden; overflow-y:scroll;">
							<table cellspacing="0" border="1" summary="명단관리 리스트" class="frt_tbl_type" style="border-top:0px;">
							
								<colgroup>
									<col width="50" /><col width="*" /><col width="60" /><col width="70" /><col width="100">
								</colgroup>
								<tbody>		
									<c:forEach items="${packageList}" var="pack">										
										<tr>
											<td class="num">${pack.package_id}</td>
											<td class="title" >${pack.village}</td>
											<td class="date">${pack.package_weight}</td>
											<td class="writer">${pack.state_id}</td>
											<td class="writer">${pack.arrival_date}</td>
											<td class="title"><button type="button" value="${pack.package_id}" onclick="pack_mailList(value)">우편 목록</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
		</div>
	</div>
</body>
</html>