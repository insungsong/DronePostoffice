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
	
 	/* function btnRegister(){
		$.ajax({
			url:"stateCheck",
			data:{"state_id":"s001"},
			success:function(result){
				console.log(result);
				console.log(result.state_id)
				var var1=JSON.parse(result);
				console.log(var1.json.state_name);
				
			}
		
		});
	
	} */
	
 	function check(state_id,mail_id){
		var result=confirm("요청 하시겠습니까?");
		if(result==true){
	 		location.href = "stateCheck?state_id=" + state_id + "&mail_id=" + mail_id;
	 		alert("요청완료");
		}else{
			alert("취소하셨습니다.");
		}
		
		
	 /* 	var result=true;
	 	if(result==true){
	 		$("#btn").val("염현지ㅄ");
	 		return true;
	 	}
	 	console.log($("#btn").val()) */;
	 	/* $("btn").val("접수 완료"); */
		/* $.ajax({
			url:"stateCheck?state_id=" +state_id+ "&mail_id="+mail_id,
			success:function(result){
				$("#btn").val("접수완료");
			}
		}); */
 	}
	
	function btn(){
		
	}
 
</script>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>

	<form id="form1">
	<table id="customers" class="table">
		<thead class="thead-dark">
		${vmname} 님 환영합니다.
		<tr>
			<th>요청 번호</th>
			<th>보내는 사람</th>
			<th>보내는 주소</th>
			<th>받는 사람</th>
			<th>받는 주소</th>
			<th>메일 무게</th>
			<th>요청 상태</th>
			<th>요청 확인</th>
			<th>마을 이름</th>
			<th>접수 요청</th>
		</tr>
		</thead>
		<tbody>
		<tr>
		
		<c:forEach items="${CheckList}" var="check">
				<td>${check.mail_id}</td>
				<td>${check.from_name}</td>
				<td>${check.from_address}</td>
				<td>${check.to_name}</td>
				<td>${check.to_address}</td>
				<td>${check.mail_weight}</td>
				<td>${check.state_id}</td>
				<td>${check.state_name}</td>
				<td>${check.village_name}</td>
				
				<%-- <select name="state"> 
					<c:forEach items="${stateList }" var="state">
						<option value="${state.state_id}">${state.state_name }</option>
					</c:forEach>
				</select> --%>
				
				<td><input id="btn" type="button" value="접수 요청하기" onClick="check('s005','${check.mail_id}')"/></td>

			</tr>
		</c:forEach>
	</tbody>
	</table>
	</form>
	<input id="btn1" type="button"  value="메인으로" onClick="main()" class="btn btn-primary " />

		</body>
	</html>
