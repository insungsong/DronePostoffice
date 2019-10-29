<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="<%=application.getContextPath() %>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath() %>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath() %>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath() %>/resources/css/loginCommon.css">
		<script type="text/javascript">
			  
			function check() {
				var result = true;
				if($("#lid").val() == "") {
					alert("*아이디를 입력하세요.")
					result = false;
				}else if($("#lpassword").val() == "") {
					alert("*비밀번호를 입력하세요.")
					result = false;
				}
				return result;
			}  
			
			var msg = '${midError}';
			alert(msg);
			
		</script>
	</head>
	<body>
		<form method="post" action="loginManager" onsubmit="return check()">
			<div class="lid">
				<input id="mid" name="mid" type="text" placeholder="직원 아이디">
				<span id="midError" class="error" style="color: red">${midError}</span>
			</div>
			<div class="lpassword">
				<input id="mpassword" name="mpassword" type="text" placeholder="비밀번호">
				<span id="mpasswordError" class="error" style="color: red">${mpasswordError}</span>
			</div>
			<div class="lbutton">
				<input type="submit" value="로그인">
			</div>
		</form>	 
		
		<div class="jbutton">
			<a href="joinManager">회원가입</a>
		</div>
	</body>
</html>