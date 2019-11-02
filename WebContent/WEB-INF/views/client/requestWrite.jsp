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
	<style>
		.mailWrite{
			width:100%;
			height:2000px;
			border:solid 1px black;
			float:left;
		}
	</style>
	<script type="text/javascript">
		function checkForm() {
			var result=true;
			$(".error").text("");
			
			if($("#fromaddress").val()==""){
				$("#fromaddressError").text("*보내는 사람주소를 입력하세요.");
				result = false;
			}
			if($("#toaddress").val()==""){
				$("#toaddressError").text("*받는 사람주소를 입력하세요");
				result = false;
			}
			if($("#fromname").val()==""){
				$("#fromnameError").text("*보내는 사람이름을 입력하세요");
				result = false;
			}
			if($("#toname").val()==""){
				$("#tonameError").text("*받는 사람이름을 입력하세요");
				result = false;
			}
			if($("#mailweight").val()==""){
				$("#mailweightError").text("*우편무게를 입력하세요");
				result = false;
			}
			if($("#mailweight").val()==""){
				$("#mailweightError").text("*우편무게를 입력하세요");
				result = false;
			}
			if($("#mailweight").val()==""){
				$("#mailweightError").text("*우편무게를 입력하세요");
				result = false;
			}
			if($("#mailweight").val()==""){
				$("#mailweightError").text("*우편무게를 입력하세요");
				result = false;
			}
			return result;
		}
	</script>
	</head>
	<body>
	<div class="mailWrite">
		<form id="mailWrite" name="mail_id" method="post" action="requestWrite" onsubmit="return checkForm()">
		 <div class="form-group">
		    <label for="formGroupExampleInput2">메일 고유값</label>
		    <input type="text" class="form-control" id="plusNum" name="mail_id" value="${originMailNum}" readonly="readonly">
		  </div>
		   <div class="form-group">
		    <label for="formGroupExampleInput">보내는 사람 이름</label>
		    <input type="text" class="form-control" id="fromname" name="from_name" placeholder="보내는 이름을 입력하세요" value="${maildto.to_name}">
		  	<span id="fromnameError" class="error" style="color:red">${fromnameError}</span>
		  </div>
		  <div class="form-group">
		    <label for="formGroupExampleInput2">보내는 사람 주소</label>
		    <input type="text" class="form-control" name="from_address" id="toname" placeholder="받는 사람이름을 입력하세요" value="${maildto.from_name}">
		    <span id="fromaddressError" class="error" style="color:red">${fromaddressError}</span>
		  </div>
		 
		  <div class="form-group">
		    <label for="formGroupExampleInput2">받는 사람이름</label>
		    <input type="text" class="form-control" name="to_name" id="toaddress" placeholder="보내는 사람주소를 입력하세요" value="${maildto.from_address}">
		    <span id="tonameError" class="error" style="color:red">${tonameError}</span>
		  </div>
		  <div class="form-group">
		    <label for="formGroupExampleInput2">받는 사람주소</label>
		    <input type="text" class="form-control" name="to_address" id="toaddress" placeholder="받는 사람주소 입력하세요" value="${maildto.to_address}">
		    <span id="toaddressError" class="error" style="color:red">${toaddressError}</span>
		  </div>
		  <div class="form-group">
		    <label for="formGroupExampleInput2">마을 이름</label>
		    <input type="text" class="form-control" name="vid" id="villagename" placeholder="${maildto_villageList.get(0).vname }" readonly="readonly">
		    <span id="villagenameError" class="error" style="color:red">${villagenameError}</span>
		  </div>
		   <div class="form-group">
		    <label for="formGroupExampleInput">우편물 무게</label>
		    <input type="text" class="form-control" name="mail_weight" id="mailweight" placeholder="우편물 무게를 입력하세요" value="${maildto.mail_weight}">
		  	<span id="mailweightError" class="error" style="color:red">${mailweightError}</span>
		  </div>
		  <div class="form-group">
		    <label for="formGroupExampleInput">배송 상태</label>
		    <input type="text" class="form-control" name="state_id" id="stateid" placeholder="${maildto_stateList.get(0).state_name }" readonly="readonly">
		  	<span id="stateError" class="error" style="color:red">${stateError}</span>
		  </div>
		  <button class="btn btn-danger">수정저장</button>
		</form>
	</div>
	</body>
</html>