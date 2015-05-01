<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8' />
	<title>CalendarioWeb</title>
	
	<link href='css/bootstrap.min.css' rel='stylesheet' />
	<script src='js/bootstrap.min.js'></script>
	
	<link href='css/fullcalendar.min.css' rel='stylesheet'/>
	<script src='js/jquery.min.js'></script>
	<script src='js/moment.min.js'></script>
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