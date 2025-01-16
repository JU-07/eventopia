<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBQsyE-sXuxVD0qnrf51po1SNS3luOxkPU&callback=console.debug&loading=async&libraries=maps,marker&v=beta"></script> -->

<!--   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBQsyE-sXuxVD0qnrf51po1SNS3luOxkPU&callback=initMap&v=weekly&loading=async" async defer></script> -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBQsyE-sXuxVD0qnrf51po1SNS3luOxkPU&libraries=places&loading=async&callback=initMap"
	async defer></script>

<style>
#map {
	height: 600px;
	width: 100%;
}
</style>
</head>
<body>
	<!-- <gmp-map center="35.6895,139.6917" zoom="8" map-id="DEMO_MAP_ID" style="height: 400px"> -->
	<!-- <gmp-advanced-marker position="35.6895,139.6917" title="My location"></gmp-advanced-marker> -->
	<!-- </gmp-map> -->
	<div id="map"></div>
	<script type="text/javascript" src="js/map.js" defer="defer"></script>
</body>
</html>