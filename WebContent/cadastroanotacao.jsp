<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href='css/bootstrap.min.css' rel='stylesheet' />
<link href='css/custom.css' rel='stylesheet' />
<script src='js/jquery.min.js'></script>
<script src='js/bootstrap.min.js'></script>

<title>Cadastrar Anota��o</title>
<%@ include file="css/style.css"%>
</head>
<body>
	<%@ include file="topo.jsp"%>
	<c:if test="${empty sessionScope.usuario.admin and not empty sessionScope.usuario}">
		<div class="panel panel-default" id="painel-login">
			<c:if test="${not empty erro}">
				<div class="alert alert-danger fade in">
					<span>${erro}</span>
				</div>
			</c:if>
			<div class="panel-heading">Cadastro Anota��o</div>
			<div class="panel-body">
				<form action="calendario.do?op=cadastrarAnotacao" method="post"
					class="form-horizontal">
					<div class="form-group" id="inputs-login">
						<textarea class="form-control" rows="4" cols="50" maxlength="80" name="mensagem" placeholder="Mensagem" required></textarea>
						<br> <input type="date"
							class="form-control" name="data" required><br>
					<input type="submit" class="btn btn-default" value="Enviar">
				</form>
			</div>
		</div>
	</c:if>
	<%@ include file="rodape.jsp"%>
</body>
</html>
