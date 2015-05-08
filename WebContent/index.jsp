<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>MVCalendar</title>
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
	<c:if test="${not empty sessionScope.usuario.admin}">
		<c:redirect url="/calendario.do?op=painelferiados" />
	</c:if>
	<c:if test="${empty feriados}">
		<c:redirect url="/calendario.do?op=eventos" />
	</c:if>
	
	<div class="alert alert-danger fade in">
		<span>${erro}</span>
	</div>

	<div class="container" role="main">
		<div id='calendar'></div>
	</div>

	<%@ include file="rodape.jsp"%>
</body>
</html>
