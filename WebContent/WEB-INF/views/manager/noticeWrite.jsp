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
			
			<style type="text/css">
			.wrapper{
				border:1px solid black;
				width:100%;
			}
			
			.write_title_group{
				border:1px solid black;
				width:99%;
				padding-left:50px;
				margin:5px;
				
			}
			.write_member_group{
				border:1px solid black;
				width:99%;
				padding-left:50px;
				margin:5px;
			}
			
			.wirte_file_group{
				border:1px solid black;
				width:99%;
				padding-left:50px;
				margin:5px;
			}
			.write_content_group{
				border:1px solid black;
				width:99%;
				padding-left:50px;
				margin:5px;
			}
			
			</style>
			
		
	</head>
	<body>
		<jsp:include page="../common/header.jsp"/>
		<form method="post" action="noticeWrite" >
			<div class="wrapper">
				<div class="write_title_group">
					<div>
						<label for="write_title">제목</label>
					</div>
					<input type="text" class="wirte_title" id="writeTitle" placeholder="제목을 입력해주세요">				
				</div>
				
				<div class="write_member_group">
					<div>
						<label for="write_mid">작성자</label>
					</div>
					<input type="text" class="write_mid" id="writeMid" placeholder="2019-10-30" readonly>	
				</div>
				
				<div class="wirte_file_group">
					<div>
						<label for="write_file">첨부파일</label>
					</div>
					<input type="text" class="write_file" id="wirteFile" placeholder="첨부파일">
				</div>
				
				<div class="write_content_group">
					<div>
						<label for="write_content">내용</label>
					</div>
					<textarea rows="5" cols="100"></textarea>
				
				</div>
			</div>
		</form> 
	</body>
</html>