<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href='css/bootstrap.min.css' rel='stylesheet' />
<link href='css/custom.css' rel='stylesheet' />
<script src='js/jquery.min.js'></script>
<script src='js/bootstrap.min.js'></script>

<title>Alterar Senha do Admin</title>
</head>
<body>
	<%@ include file="topo.jsp"%>
	<c:if test="${empty sessionScope.usuario.admin}">
		<c:redirect url="index.jsp"/>
	</c:if>
	<c:if test="${not empty sessionScope.usuario.admin}">
		<div class="panel panel-default" id="painel-login">
			<c:if test="${not empty erro}">
				<div class="alert alert-danger fade in">
					<span>${erro}</span>
				</div>
			</c:if>
			<div class="panel-heading">Alterar senha</div>
			<div class="panel-body">
				<form action="calendario.do?op=alterarsenha" method="post"
					class="form-horizontal">
					<div class="form-group" id="inputs-login">
						<input type="password" class="form-control" name="senha_atual"
							placeholder="Senha Atual" required><br> <input
							type="password" class="form-control" name="senha_nova"
							placeholder="Nova Senha" required><br>
					</div>
					<input type="submit" class="btn btn-default" value="Alterar Senha">
				</form>
			</div>
		</div>
	</c:if>
</body>
</html>