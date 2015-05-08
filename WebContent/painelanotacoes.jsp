<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href='css/bootstrap.min.css' rel='stylesheet' />
<link href='css/custom.css' rel='stylesheet' />
<script src='js/jquery.min.js'></script>
<script src='js/bootstrap.min.js'></script>

<title>Painel de Anotações</title>
<%@ include file="css/style.css"%>
</head>
<body>
	<%@ include file="topo.jsp"%>
	<c:if
		test="${empty sessionScope.usuario.admin and not empty sessionScope.usuario}">
		<div class="panel panel-default" id="painel-login">
			<c:if test="${not empty erro}">
				<div class="alert alert-danger fade in">
					<span>${erro}</span>
				</div>
			</c:if>
			<div class="panel-heading">Gerenciar Anotações</div>
			<div class="panel-body">
				<c:if test="${empty anotacoes}">
					<div class="alert alert-danger fade in">
						<span>Não possui anotações!</span>
					</div>
				</c:if>
				<c:if test="${not empty anotacoes}">
					<table border="0" class="table">
						<c:forEach var="anotacao" items="${anotacoes}">
							<tr>
								<td>${anotacao.mensagem}</td>
								<td>${anotacao.data}</td>
								<td><a
									href="calendario.do?op=editarAnotacao&id=${anotacao.id}">Editar</a></td>
								<td><a
									href="calendario.do?op=excluirAnotacao&id=${anotacao.id}">Excluir</a></td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</div>
		</div>
	</c:if>
	<!-- <%@ include file="rodape.jsp"%> -->
</body>
</html>
