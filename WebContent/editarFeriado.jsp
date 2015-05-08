<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href='css/bootstrap.min.css' rel='stylesheet' />
<link href='css/custom.css' rel='stylesheet' />
<script src='js/jquery.min.js'></script>
<script src='js/bootstrap.min.js'></script>

<title>Editar Feriado</title>
<%@ include file="css/style.css"%>
</head>
<body>
	<%@ include file="topo.jsp"%>
	<c:if test="${not empty sessionScope.usuario.admin}">
		<div class="panel panel-default" id="painel-login">
			<c:if test="${not empty erro}">
				<div class="alert alert-danger fade in">
					<span>${erro}</span>
				</div>
			</c:if>
			<div class="panel-heading">Editar Feriado</div>
			<div class="panel-body">
				<form action="calendario.do?op=salvarFeriado" method="post"
					class="form-horizontal">
					<div class="form-group" id="inputs-login">
						<textarea class="form-control" rows="4" cols="50" maxlength="80" name="descricao"
						  required>${feriado.descricao}</textarea><br> 
						  Data atual: ${feriado.data}
						 <input type="date" class="form-control" name="data" required><br>
						 <input type="hidden" name="id" value="${feriado.id}">
					<input type="submit" class="btn btn-default" value="Salvar">
				</form>
			</div>
		</div>
	</c:if>
	<%@ include file="rodape.jsp"%>
</body>
</html>
