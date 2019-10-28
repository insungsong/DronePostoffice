<%@page import="com.postoffice.web.dto.BoardDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css" />
<script
	src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<style>
#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #4CAF50;
	color: white;
}
</style>
<script>
	function main() {
		location.href = "client_index";
	}
</script>
</head>
<body>

	<table id="customers">
		<tr>
			<th>요청번호</th>
			<th>마을이름</th>
			<th>우편정보</th>
			<th>작성자</th>
			<th>작성날짜</th>
			<th>마을번호</th>
			<th>상태</th>
		</tr>
		
		<tr> 

		<c:forEach var="check" items="${CheckList}">
				<td>${check.bid}</td>
				<td>${check.btitle}</td>
				<td>${check.bcontent}</td>
				<td>${check.battachfile}</td>
				<td>${check.bdate}</td>
				<td>${check.vid}</td>
			</tr>
		</c:forEach>

	</table>
	<input type="button" value="메인으로" onClick="main()"
		class="btn btn-primary " />


</body>
</html>