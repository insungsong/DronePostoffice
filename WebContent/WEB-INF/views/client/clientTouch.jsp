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
		<style type="text/css">
			#lphoto{
				input:-webkit-autofill {
				   -webkit-box-shadow: 0 0 0 1000px white inset;
				}
			}
		</style>
	</head>
	<body>
		<form action="clientAfterWrite" method="post" enctype="multipart/form-data">
		<div><h3>회원 정보수정</h3></div>
		<c:forEach items="${vmemberList}" var="vmemberList">
		  <div class="form-group">
		    <!-- <label for="exampleInputEmail1">아이디</label> 아이디 정보 -->
		    <input type="hidden" name="vmid" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${vmemberList.vmid }" readonly="readonly">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail1">이장님 성함</label>
		    <input type="text" name="vmname" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${vmemberList.vmname }">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail1">계정 비밀번호</label>
		    <input type="text" name="vmpassword" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${vmemberList.vmpassword }">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail1">전화 번호</label>
		    <input type="text" name="vmtel" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${vmemberList.vmtel }">
		  </div>
		  <div class="filebox">
		  <label for="exampleInputEmail1">사진 수정</label><br>
				<input class="upload_name" name="vmphoto" value="${vmemberList.vmphoto }" readonly="readonly">
				<input id="lphoto" name="lphoto" type="file" value="파일 추가하기">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail1">마을 정보</label>
		    <input type="text" name="vid" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${vmemberList.vid }" readonly="readonly">
		  </div>
		</c:forEach>
		  <button type="submit" class="btn btn-primary">수정하기</button>
		</form>
	</body>
</html>