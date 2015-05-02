<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Calendário Web</title>
	
	<meta charset='utf-8' />
	<link href='css/fullcalendar.min.css' rel='stylesheet' />
	<link href='css/fullcalendar.print.css' rel='stylesheet' media='print' />
	<link href='css/bootstrap.min.css' rel='stylesheet' />
	<link href='css/bootstrap-datepicker3.min.css' rel='stylesheet' />

	<!-- http://momentjs.com/ -->
	<script src='js/moment.min.js'></script>
	<script src='js/jquery.min.js'></script>
	
	<!-- http://fullcalendar.io -->
	<script src='js/fullcalendar.min.js'></script>
	<script src='js/lang-all.js'></script>
	<script src='js/bootstrap.min.js'></script>

	<!-- https://github.com/eternicode/bootstrap-datepicker -->
	<script src='js/bootstrap-datepicker.min.js'></script>
	
	<script>
		$(document).ready(function() {
		    $('#calendar').fullCalendar({
		       lang: 'pt-br'
		    })
		});
	</script>
</head>
<body>
	<div id='calendar'></div>
</body>
</html>