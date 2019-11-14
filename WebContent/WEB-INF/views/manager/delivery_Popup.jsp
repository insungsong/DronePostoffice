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
	<link href="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.css" rel="stylesheet">
	<script src="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="resources/css/droneManagement.css">
	
	<style type="text/css">
		.drone{
			width: 100%;
			height: 200px;
		}
		#droneList tr {
			cursor: pointer;
		}
		#droneList tr:hover{
            background-color: #fbb;
        }
        #droneList tr:visited{
        	 background-color: #fbb;
        }
        .drone_log{
        	width: 100%;
		    height: 350px;
		    margin-top: 50px;
        }
        .click_color{
        	background:#fdd;
        }
	</style>
	
	<script type="text/javascript">
		$(function(){
			var stateLen = $('input#state_id').length;
			for(var i = 0; i < stateLen; i++){
				if($('input#state_id').eq(i).val() != 'sd001'){
					$('input#state_id').eq(i).attr('disabled');
				}
			}
		})
		
		function drone_click(data){
			var sp = data.split(',');
			var drone_id = sp[0];
			var state_id = sp[1];
			
			if(state_id == 'sd001'){
				$('#ok').prop('disabled',false);
			}else{
				$('#ok').prop('disabled',true);
			}
			
			$.ajax({
				url:'delivery_Popup_Ajax?drone_id='+drone_id,
				success:function(data){
					$('#droneLog').html(data);
				}
			});
			
			$('#ok').attr('value',drone_id);
		}
		
		function drone_ok(value){
			$(".delivery",opener.document).val(value);
			
			var index;
			
			var buttonLen = $('button.delivery').length;
			for(var i = 0; i < buttonLen; i++){
				if($('.delivery').eq(i).attr('value') != null){
					console.log($('.delivery').eq(i).val());
					index = i;
				}
			}
			
			$('.delivery').eq(index).prop('disabled',false);
			console.log(index);
			
			window.opener.parent.location.reload();
			window.self.close();
		}
	</script>
</head>
<body>
	<div class="drone">
		<div class="bor_title">
			<div class="subject">드론 목록</div>
		</div>
		<div class = "mail_list" style="border-bottom:1px solid #999;">
			<table cellspacing="0" border="1" class="frt_tbl_type" style="width:100%;padding-right:15px;">
				<colgroup>
					<col width="100" /><col width="*" /><col width="100"/><col width="120"><col width="15">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">드론명</th>
						<th scope="col">상태</th>
						<th scope="col">배터리</th>
						<th scope="col">최근 운용 일자</th>
						<th scope="col"></th>
					</tr>
				</thead>
			</table>
			<div style="max-height:500px; width:100%; overflow-x:hidden; overflow-y:scroll;">
				<table cellspacing="0" border="1" class="frt_tbl_type" style="border-top:0px;">
				
					<colgroup>
						<col width="100" /><col width="*" /><col width="100"/><col width="120">
					</colgroup>
					<tbody id = "droneList">		
						<c:forEach items="${droneInfo}" var="drone">										
							<tr id="${drone.drone_id},${drone.stateList.get(0).state_id}" onclick="drone_click(id)">
								<td class="num">${drone.drone_id}</td>
								<td class="title">${drone.stateList.get(0).state_name}</td>
								<td class="title">100%</td> 
								<td class="title">2018-04-12 14:22</td> 
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="drone_log" id="droneLog">
	
	</div>
	<div>
		<button type="button" id="ok" onclick="drone_ok(value)" disabled="disabled">확인</button>
	</div>
</body>
</html>