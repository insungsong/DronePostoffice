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
			height:800px;
			border:solid 1px black;
			float:left;
		}
		.mailCheck{
			width:48%;
			height:800px;
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
		    <label for="formGroupExampleInput2">메일 고유값</label>
		    <input type="text" class="form-control" id="formGroupExampleInput2" readonly="readonly">
		  </div>
		  <div class="form-group">
		    <label for="formGroupExampleInput2">받는 사람주소</label>
		    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="받는 사람주소를 입력하세요">
		  </div>
		  <div class="form-group">
		    <label for="formGroupExampleInput">보내는 사람주소</label>
		    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="보내는 사람주소를 입력하세요">
		  </div>
		  <div class="form-group">
		    <label for="formGroupExampleInput2">받는 사람이름</label>
		    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="받는 사람이름을 입력하세요">
		  </div>
		  <div class="form-group">
		    <label for="formGroupExampleInput2">보내는사람 이름</label>
		    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="보내는 사람이름을 입력하세요">
		  </div>
		  <div class="form-group">
		    <label for="formGroupExampleInput2">우편 무게</label>
		    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="우편 무게를 입력하세요">
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