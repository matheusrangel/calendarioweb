<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Calendário Web</title>
<meta charset='utf-8' />
<link href='css/bootstrap.min.css' rel='stylesheet' />
<link href='css/custom.css' rel='stylesheet' />
<script src='js/jquery.min.js'></script>
<script src='js/bootstrap.min.js'></script>
<script>
	
</script>
<c:if test="${empty sessionScope.usuario.admin}">
<%@ include file="calendario.jsp"%>
</c:if>
<%@ include file="css/style.css"%>
</head>
<body>
	<%@ include file="topo.jsp"%>

	<div class="container" role="main">
		<div id='calendar'></div>
	</div>

	<%@ include file="rodape.jsp"%>
</body>
</html>
