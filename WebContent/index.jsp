<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Calendário Web</title>
	
	<meta charset='utf-8' />
	<!-- Bootstrap -->
	<script src='js/bootstrap.min.js'></script>
	<link href='css/bootstrap.min.css' rel='stylesheet' />

	<!-- FullCalendar -->
	<link href='css/fullcalendar.min.css' rel='stylesheet' />
	<link href='css/fullcalendar.print.css' rel='stylesheet' media='print' />
	<script src='js/moment.min.js'></script>
	<script src='js/jquery.min.js'></script>
	<script src='js/fullcalendar.min.js'></script>
	<script src='js/lang-all.js'></script>

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