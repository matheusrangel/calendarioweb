<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Calendário Web</title>
<meta charset='utf-8' />
<link href='css/bootstrap.min.css' rel='stylesheet' />
<link href='css/custom.css' rel='stylesheet' />
<script src='js/jquery.min.js'></script>
<script src='js/bootstrap.min.js'></script>
<%@ include file="js/calendario.js"%>
<%@ include file="js/modal.js"%>
<%@ include file="css/style.css"%>
</head>
<body>
	<%@ include file="topo.jsp"%>

	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title"></h4>
				</div>

				<div class="modal-body">
					<div class="container-fluid">
						<div class="form-group">
							<label for="annMensabem">Mensagem:</label>
							<textarea name="" id="annMensagem" cols="30" rows="1" class="form-control"></textarea>
						</div>

						<div class="form-group">
							<label for="annData">Data:</label>
							<input type="text" class="input-sm form-control datepicker" id="annData"/>
						</div>
						<button class="btn btn-primary pull-right" value="" id="btnSalvar">Salvar</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container" role="main">
		<div id='calendar'></div>
	</div>

	<%@ include file="rodape.jsp"%>
</body>
</html>
