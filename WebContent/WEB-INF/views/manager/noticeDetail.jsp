<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
			<script type ="text/javascript" src = "<%=application.getContextPath() %>/resources/js/jquery-3.4.1.min.js"></script>
			<link rel="stylesheet" type ="text/css" href="<%=application.getContextPath() %>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
			<script type="text/javascript" src="<%=application.getContextPath() %>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>			
	</head>
	<body>
	<form>
		<div class="form-group">
			<label for="notice_id">Num</label> 
			<input id="notice_id"  type="int" class="form-control" value="${notice.notice_id }" readonly>
		</div>
	
		<div class="form-group">
			<label for="notice_title">Title</label> 
			<input id="notice_title"  type="text" class="form-control" value="${notice.notice_title }" readonly>
		</div>
		
		<div class="form-group">
			<label for="mid">Writer</label> 
			<input id="mid" type="text" class="form-control" value="${notice.mid }" readonly>
		</div>
		
		<div class="form-group">
			<label for="notice_date">Date</label> 
			<input id="notice_date" name="notice_date" type="text" class="form-control" value='<fmt:formatDate value="${notice.notice_date}" pattern="yyyy-MM-dd"/>'  readonly>
		</div>
		
		<div class="form-group">
			<label for="notice_content">Content</label>
			<textarea id="notice_content" class="form-control" rows="3"  readonly>${notice.notice_content }</textarea>
		</div>
	</form>
	</body>
</html>