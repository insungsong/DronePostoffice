<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=application.getContextPath() %>/resources/js/paho-mqtt-min.js"></script>
<script type="text/javascript" src="<%=application.getContextPath() %>/resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
<div id="map" style="width:500px;height:400px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=05852697430c6a36aa2521201b5d17b6">
</script>
<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.5475224, 127.1199882), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
		
	
		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null); 
		
		//mqtt broker와 연결
		$(function() {
			//MQTT Broker와 연결하기
			client = new Paho.MQTT.Client(location.hostname, 61614, "clientId"); //location.hostname: 자동으로 호스트네임 가져옴
			client.onMessageArrived = onMessageArrived;
			client.connect({onSuccess:onConnect});
		});
		
		//연결이 완료되었을 때 자동으로 실행(콜백)되는 함수
		function onConnect() {
			console.log("Connect");
			client.subscribe("/drone/fc/pub");
		}
		
		var marker = null;
		//메시지를 수신했을 때 자동으로 실행(콜백)되는 함수
		function onMessageArrived(message) {
			var json = message.payloadString;
			var obj = JSON.parse(json);
			if(obj.msgid=="GLOBAL_POSITION_INT") {
				var currLat = obj.currLat;
				var currLng = obj.currLng;
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(currLat, currLng); 
				
				if(marker != null) {
					marker.setMap(null);
					marker.setPosition(markerPosition);
				} else {
					// 마커를 생성합니다
					marker = new kakao.maps.Marker({
					    position: markerPosition
					});
				}
				
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				map.setCenter(markerPosition);
			}	
		}
	</script>
</body>
</html>