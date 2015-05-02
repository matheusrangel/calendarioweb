<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href='css/bootstrap.min.css' rel='stylesheet' />
<link href='css/custom.css' rel='stylesheet' />
<script src='js/jquery.min.js'></script>
<script src='js/bootstrap.min.js'></script>

<title>Cadastro</title>
</head>
<body>
<div class="panel panel-default" id="painel-login">
		<div class="panel-heading">Cadastro</div>
		<div class="panel-body">
			<form action="calendario.do?op=cadastro" method="post" class="form-horizontal">
				<div class="form-group" id="inputs-login">
					<input type="text" class="form-control" name="nome" placeholder="Nome"><br>
					<input type="text" class="form-control" name="login" placeholder="Login"><br>
					<input type="password" class="form-control" name="senha" placeholder="Senha">
				</div>
				<input type="submit" class="btn btn-default" value="Cadastrar-se">
			</form>
		</div>
	</div>
</body>
</html>