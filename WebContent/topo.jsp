<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
	<div class="container">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="calendario.do?op=eventos">MVCalendar</a>
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
						<li><a href="cadastro.jsp">Cadastre-se</a></li>
						<li><a href="login.jsp">Login</a></li>
					</c:if>
					<c:if test="${sessionScope.usuario!=null}">
						<p class="navbar-text">Olá, ${sessionScope.usuario.nome}!</p>
						<c:if test="${sessionScope.usuario.admin!=null}">
							<li><a href="calendario.do?op=painelferiados">Painel de Feriados</a></li>
							<li><a href="cadastroferiado.jsp">Cadastrar Feriado</a></li>
							<li><a href="alterarsenha.jsp">Alterar Senha</a></li>
						</c:if>
						<c:if test="${sessionScope.usuario.admin==null}">
							<li><a href="calendario.do?op=painelanotacoes">Painel de Anotações</a></li>
							<li><a href="cadastroanotacao.jsp">Cadastrar Anotação</a></li>
							<li><a href="calendario.do?op=excluirconta">Excluir Conta</a></li>
						</c:if>
						<li><a style="text-color:white" href="calendario.do?op=logoff">Logout</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</nav>