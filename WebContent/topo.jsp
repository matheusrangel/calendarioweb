
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
	<div class="container">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp">CalendarioWeb</a>
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#menuCollapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse" id="menuCollapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="cadastro.jsp">Cadastro</a></li>
					<c:if test="${empty sessionScope.usuario}">
						<li><a href="login.jsp">Logar</a></li>
					</c:if>

					<c:if test="${sessionScope.usuario!=null}">
						<c:if test="${sessionScope.usuario.admin!=null}">
							<li><a href="alterarsenha.jsp">Alterar Senha</a></li>
						</c:if>
						<p class="navbar-text">Olá, ${sessionScope.usuario.nome}!</p>
						<li><a href="calendario.do?op=logoff">Sair</a></li>
					</c:if>

				</ul>
			</div>
		</div>
	</div>
</nav>