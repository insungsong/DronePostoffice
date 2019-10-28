<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
			<script type= "text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
			<link rel="stylesheet/css" type = "text/css" href ="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css"/>
			<script type= "text/javascript" src ="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		function mail(){
			 var url="mailAdd";
	            window.open(url,"","width=1000,height=1000,left=500");
		}
	</script>
	</head>
	<style>
		input[type=text], select {
		  width: 100%;
		  padding: 12px 20px;
		  margin: 8px 0;
		  display: inline-block;
		  border: 1px solid #ccc;
		  border-radius: 4px;
		  box-sizing: border-box;
		}
		
		input[type=submit] {
		  width: 100%;
		  background-color: #4CAF50;
		  color: white;
		  padding: 14px 20px;
		  margin: 8px 0;
		  border: none;
		  border-radius: 4px;
		  cursor: pointer;
		}
		
		input[type=submit]:hover {
		  background-color: #45a049;
		}
		
		div {
		  border-radius: 5px;
		  background-color: #f2f2f2;
		  padding: 20px;
		}
	</style>
	<body>
		
	<h3>드론 요청 양식작성</h3>
	<div>
	  <form>
	    <label for="fname">마을 이름</label>
	    <input type="text" id="fname" name="firstname" placeholder="마을 이름">
	
	    <label for="lname">대표자 성함</label>
	    <input type="text" id="lname" name="lastname" placeholder="대표자 성함">
	
		<button onclick="mail()">우편물 추가하기</button>
  </form>
</div>
		
	</body>
</html>