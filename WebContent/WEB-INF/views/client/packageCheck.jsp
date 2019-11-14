<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css"/>
		<script src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>	
		<link rel="stylesheet" type="text/css" href="resources/css/notice.css">
	
	<script>
		function cancel(package_id){
			var result=confirm("삭제하시겠습니까?");
			if(result==true){
				location.href = "cancel?package_id=" + package_id;
				alert("삭제되었습니다.")
			}else{
				alert("취소하셨습니다.")
			}
			
		}
	</script>
	</head>
	<body>	
	<jsp:include page="../common/ClienetRequestheader.jsp"></jsp:include>
				
				
				<table border="1" class="frt_tbl_type" style="width:100%;">	
				
								<thead class="thead-dark">
											  <tr style="height: 39px">
											     <th scope="col">패키지 번호</th>
											     <th scope="col">패키지 무게</th>
											     <th scope="col">요청 상태</th>
											     <th scope="col">요청 날짜</th>
											     <th scope="col">마을 이름</th>
											     <th scope="col">접수 요청</th>
											     <th scope="col">요청 취소</th>
											   </tr>
								</thead>
											<c:forEach items="${packageList}" var="pack">
											<tr>
													<td>${pack.package_id}</td>
													<td>${pack.package_weight}</td>
													<td>${pack.stateList.get(0).state_name}</td>
													<td>${pack.arrival_date}</td>
													<td>${pack.villageList.get(0).vname}</td>
													<td><input type="button" value="요청취소" onclick="cancel(${pack.package_id})"/></td>
													
													
											<tr>
											</c:forEach>
									</table>
								<div class="request_content" style="border-top: 2px solid #F32C28;">
								
									<table style="margin-top:10px; float:right;">
									</table>
								</div>
	</body>
</html>