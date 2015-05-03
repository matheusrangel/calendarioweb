<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Calendário Web</title>
<meta charset='utf-8' />
<%@ include file="js/calendario.js"%>
<style>
body {
	margin: 40px 0px 0px 0px;
	padding: 0px;
	font-size: 14px;
}

#calendar {
	padding: 40px 40px;
}

.panel-footer {
	text-align: center;
	margin-bottom: 0px;
}

.navbar-brand {
	align: center;
}
</style>
</head>
<body>
	<div class="panel panel-default">
		<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
			<div class="container">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="#">MVCalendar</a>
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#menuCollapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<div class="collapse navbar-collapse" id="menuCollapse">
						<ul class="nav navbar-nav navbar-right">
							<c:if test="${empty sessionScope.usuario}">
								<li><a href="login.jsp">Logar</a></li>
							</c:if>

							<c:if test="${sessionScope.usuario!=null}">
								<p class="navbar-text">Bem-vindo,
									${sessionScope.usuario.nome}!</p>
								<li><a href="control?op=sair">Sair</a></li>
							</c:if>

						</ul>
					</div>
				</div>
			</div>
		</nav>
		<div class="modal fade" id="evModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
						<h4 class="modal-title">Anotação</h4>
					</div>

					<div class="modal-body">
						<div class="container-fluid">
							<div class="form-group">
								<label for="evMensabem">Mensagem</label>
								<textarea name="" id="evMensabem" cols="30" rows="10"
									class="form-control"></textarea>
							</div>

							<div class="form-group">
								<input type="text" class="input-sm form-control datepicker"
									id="evData" />
							</div>
							<button class="btn btn-primary pull-right" value=""
								id="evBtnSalvar">Salvar</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="panel-body">
			<div class="container" role="main">
				<div id='calendar'></div>
			</div>
		</div>
		<div class="panel-footer">Desenvolvido por Matheus Rangel e
			Victor Pereira.</div>
	</div>
</body>
</html>