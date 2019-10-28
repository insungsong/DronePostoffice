<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="<%=application.getContextPath() %>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath() %>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath() %>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath() %>/resources/css/login.css">
		<script type="text/javascript">
			function loginManager() {
				$("button").css("background", "white");
				$("button").css("color", "black");
				$.ajax({
					url:"loginManager",
					success: function(data) {
						$(".loginForm").html(data);
						
					}
				});
				$("#manager").css("background", "#F32C28");
				$("#manager").css("color", "white");
			}
			
			function loginClient() {
				$("button").css("background", "white");
				$("button").css("color", "black");
				$.ajax({
					url:"loginClient",
					success: function(data) {
						$(".loginForm").html(data);
						
					}
				});
				$("#client").css("background", "#F32C28");
				$("#client").css("color", "white");
			}
			
			function loginAdmin() {
				$("button").css("background", "white");
				$("button").css("color", "black");
				$.ajax({
					url:"loginAdmin",
					success: function(data) {
						$(".loginForm").html(data);
						
					}
				});
				$("#admin").css("background", "#F32C28");
				$("#admin").css("color", "white");
			}
			
		</script>
	</head>
	<body>
		<jsp:include page="common/loginHeader.jsp"></jsp:include>
		<div class="login_wrapper">
			<div class="login_header">
				<h1>LOGIN</h1>
			</div>
			
			<div class="login_body">
				<div class="login_body_tag">
					<ul>
						<li><button id="manager" onclick="loginManager()">직원</button></li>
						<li><button id="client" onclick="loginClient()">이장</button></li>
						<li><button id="admin" onclick="loginAdmin()">관리자</button></li>
					</ul>
				</div>
				<div class="loginForm"></div>
			</div>
		</div>
	</body>
</html>