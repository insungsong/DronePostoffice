<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>

<script type="text/javascript" src="<%=application.getContextPath() %>/resources/js/paho-mqtt-min.js"></script>
	<script type="text/javascript"
		src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>

	<div id="map2" style="width: 750px; height: 500px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=05852697430c6a36aa2521201b5d17b6">
		</script>

	<script type="text/javascript">
			var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
	
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			var marker = null;
			var customOverlay = null;
	  		

	  		
	  		
		 $(function() {
	       //MQTT Broker와 연결하기
	       client = new Paho.MQTT.Client("106.253.56.124", 61623, "clientId"+new Date().getTime()); //location.hostname: 자동으로 호스트네임 가져옴
	       client.onMessageArrived = onMessageArrived;
	       client.connect({onSuccess:onConnect});
	    });
		 
		//연결이 완료되었을 때 자동으로 실행(콜백)되는 함수
		    function onConnect() {
		       console.log("Connect");
		       client.subscribe("/drone/fc/pub");
		    }
		    
		    
		    //메시지를 수신했을 때 자동으로 실행(콜백)되는 함수
		    function onMessageArrived(message) {
		       var json = message.payloadString;

		       var obj = JSON.parse(json);
		      
		       if(obj.msgid=="GLOBAL_POSITION_INT") {
			          var currLat = obj.currLat;
			          var currLng = obj.currLng;
			          var alt = obj.alt;
						
			          
			          //var markerPosition = new kakao.maps.LatLng(currLat, currLng); // 마커가 표시될 위치입니다 
			          var markerPosition = new kakao.maps.LatLng(currLat, currLng);
					  
			          
			          var imageSrc = './resources/box.png', // 마커이미지의 주소입니다    
					    imageSize = new kakao.maps.Size(34, 35), // 마커이미지의 크기입니다
					    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
					      
					    
						// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
						var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
						   
						
			         
			          if(marker != null) {
			              marker.setMap(null);
			              marker.setPosition(markerPosition);
			           } else {
			          	// 마커를 생성합니다
			   			marker = new kakao.maps.Marker({
			   			    position: markerPosition, 
			   			    image: markerImage // 마커이미지 설정 
			   			});
			           }
			          
			          
			          
			          // 마커가 지도 위에 표시되도록 설정합니다
			          marker.setMap(map);
			          map.setCenter(markerPosition);
			          
	
				      // 커스텀 오버레이에 표시할 내용입니다     
				      // HTML 문자열 또는 Dom Element 입니다 
				      var content = '<div class="customoverlay">' +
				          '    <span class="title" id="start"></span>' +
				          '    <span class="first" id="time"></span>' +
				          '    <span class="first" id="distance"></span>' +
				          '</div>';
	
				      // 커스텀 오버레이가 표시될 위치입니다 
				      var position = new kakao.maps.LatLng(currLat, currLng);  
	
				      
				      if(customOverlay != null) {
				    	  customOverlay.setMap(null);
				    	  customOverlay.setPosition(position);
			           } else {
			        	// 커스텀 오버레이를 생성합니다
						      customOverlay = new kakao.maps.CustomOverlay({
						          position: position,
						          content: content,
						          xAnchor: 0.4,
						       	  yAnchor: 1.1
						      });
			           }
				      
				      
	
				      // 커스텀 오버레이를 지도에 표시합니다
				      customOverlay.setMap(map);
				          
			
			  		 
			               
			     }
		       if(obj.msgid == "VFR_HUD"){
			          var groundSpeed = obj.groundSpeed;
			          $("#speed").text(groundSpeed+'m/s');
			         	
			          //예상 시간 구하기
			          var len = parseFloat($('#total_length').text());
			          var speed = parseFloat(groundSpeed);
			          
			         
			          if(speed == 0){
			        	  $('#time').text('속력 측정 불가');
			        	  $('#time').css('color','red');
			          } else {
				          var expectancy_time = (len/speed)/60;
				          var MathFloor = Math.floor(expectancy_time);
				          
				          var cho = expectancy_time - MathFloor;
				          var banalo = cho.toFixed(2);
				          var finalCho = banalo*100;
				          $('#distance').text(MathFloor+'분'+finalCho+'초');
				          $('#distance').css('color','black');
			          }
			          
			       }
		       	
		       }
		       
		</script>
</body>
</html>