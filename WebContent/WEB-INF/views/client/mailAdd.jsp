<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			width:48%;
			height:500px;
			border:solid 1px black;
			float:left;
		}
		.mailCheck{
			width:48%;
			height:500px;
			border:solid 1px black;
			float:right;
		}
	</style>
	<script type="text/javascript">
	/* 	function mailSend(data) {
			$.ajax({
				url:"mailSend",
				
				$(".mailCheck").html();
			}
			});
		} */
	</script>
	</head>
	<body>
	<div class="mailWrite">
		<form name="mail_info">
		  <div class="form-group">
		    <label for="formGroupExampleInput">보내는 이</label>
		    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Example input">
		  </div>
		  <div class="form-group">
		    <label for="formGroupExampleInput2">받는 이</label>
		    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Another input">
		  </div>
		  <div class="form-group">
		    <label for="formGroupExampleInput2">보내는이 주소</label>
		    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Another input">
		  </div>
		  <div class="form-group">
		    <label for="formGroupExampleInput2">배송지 주소</label>
		    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Another input">
		  </div>
		  <button type="button" class="btn btn-danger" onclick="mailSend()">추가하기</button>
		</form>
	</div>
	<div class="mailCheck">
		<table class="table">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">First</th>
		      <th scope="col">Last</th>
		      <th scope="col">Handle</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row">1</th>
		      <td>Mark</td>
		      <td>Otto</td>
		      <td>@mdo</td>
		    </tr>
		    <tr>
		      <th scope="row">2</th>
		      <td>Jacob</td>
		      <td>Thornton</td>
		      <td>@fat</td>
		    </tr>
		    <tr>
		      <th scope="row">3</th>
		      <td>Larry</td>
		      <td>the Bird</td>
		      <td>@twitter</td>
		    </tr>
		  </tbody>
		</table>
	</div>
	</body>
</html>