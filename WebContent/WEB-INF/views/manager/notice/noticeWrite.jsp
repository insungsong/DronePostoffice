<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
			<script type ="text/javascript" src = "<%=application.getContextPath() %>/resources/js/jquery-3.4.1.min.js"></script>
			<link rel="stylesheet" type ="text/css" href="<%=application.getContextPath() %>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
			<script type="text/javascript" src="<%=application.getContextPath() %>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>			
			
			<script type="text/javascript">
				function checkForm(){
					var result= true;
					
					if($("#notice_title").val()==""){
						$("noticetitleError").text("*제목을 입력해주세요.");
					}
					if($("#notice_content").val()==""){
						$("noticecontentError").text("*내용을 입력해주세요.");
					}
					
				}
			</script>
	
		<jsp:include page="../../common/header.jsp"/>
	</head>
	<body>
		<form method="post" action="noticeWrite" >
			<div class="form-group row">
				<label for="notice_title" class="col-sm-2 col-form-label">제목</label>
				<div class="col-sm-10">
					<input type="text" id="notice_title" />
					<span id="noticetitleError" class="error" style="color:red"></span>
				</div>
			</div>
		
  			<div class="form-row">
    			<div class="col">
      				<input id="mid" type="text" class="form-control" placeholder="작성자">
    		</div>
    		<div class="col">
      			<input id="notice_date" type="text" class="form-control" placeholder="작성일">
    		</div>
    		<div class="col">
      			<input id="notice_attach_file" type="text" class="form-control" placeholder="첨부파일">
    		</div>
  			</div>
			<%-- 
			<div class="form-group row">
				<label for="noticefile" class="col-sm-2 col-form-label">첨부파일</label>
				<div class="col-sm-10">
					<input type="file" class="form-control-file" id="noticefile">
				</div>
			</div>
			--%>
			<div class="form-group">
    			<textarea class="form-control" id="notice_content" rows="3"></textarea>
  				<span id="noticecontentError" class="error" style="color:red"></span>
  			</div>
  			
  			<div class="form-group">
				<input type="submit" class="btn btn-danger" value="저장" />
			</div>
		</form>
			

	</body>
</html>