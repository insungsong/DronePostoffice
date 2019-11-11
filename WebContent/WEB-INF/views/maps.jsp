<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	#map{
		width : 100%;
		height : 400px;
		background-color : grey;
	}
</style>
<script type="text/javascript">
	function initMap(){
		var location = {lat:37.5475327, lng:127.1199209};
		var map = new google.maps.Map(document.getElementById('map'),{
			zoom:4,
			center:location
		});
		var marker = new google.maps.Marker({
			position : location,
			map : map
		});
	}
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDk-2Ib9S8b23dAzsXgw_Z4rq3IbPZcDzM&callback=initMap">	
</script>
</head>
<body>

	<div id = "map"></div>
</body>
</html>