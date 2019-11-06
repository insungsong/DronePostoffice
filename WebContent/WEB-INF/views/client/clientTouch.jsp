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
	</head>
	<body>
		<form>
		<div><h3>회원 정보수정</h3></div>
		<c:forEach items="${vmemberList}" var="vmemberList">
		  <div class="form-group">
		    <!-- <label for="exampleInputEmail1">아이디</label> 아이디 정보 -->
		    <input type="hidden" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${vmemberList.vmid }" readonly="readonly">
		    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail1">이장님 성함</label>
		    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${vmemberList.vmname }">
		    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail1">계정 비밀번호</label>
		    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${vmemberList.vmpassword }">
		    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail1">전화 번호</label>
		    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${vmemberList.vmtel }">
		    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
		  </div>
		  <div class="filebox">
		  <label for="exampleInputEmail1">사진 수정</label><br>
				<input class="upload_name" value="${vmemberList.vmphoto }" disabled="disabled">
				<input id="lphoto" name="lphoto" type="file">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail1">마을 정보</label>
		    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${vmemberList.vid }" readonly="readonly">
		    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
		  </div>
		</c:forEach>
		  
		<!-- 확인 버튼 -->
		  <button type="submit" class="btn btn-primary">수정하기</button>
		</form>
	</body>
</html>