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
								<p class="navbar-text">Bem-vindo,
									${sessionScope.usuario.nome}!</p>
								<li><a href="control?op=sair">Sair</a></li>
							</c:if>

						</ul>
					</div>
				</div>
			</div>
		</nav>