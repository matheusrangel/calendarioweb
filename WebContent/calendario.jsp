<!-- FullCalendar -->
<link href='css/fullcalendar.min.css' rel='stylesheet' />
<link href='css/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='js/moment.min.js'></script>
<script src='js/jquery.min.js'></script>
<script src='js/fullcalendar.min.js'></script>
<script src='js/lang-all.js'></script>

<!-- Bootstrap -->
<script src='js/bootstrap.min.js'></script>
<link href='css/bootstrap.min.css' rel='stylesheet' />
<link href='css/bootstrap-datepicker3.min.css' rel='stylesheet' />
<script src='js/bootstrap-datepicker.min.js'></script>

<script>

$(document).ready(function() {
	$('#calendar').fullCalendar({
		editable : false,
		selectable: true,
		selectHelper: true,
		lang: 'pt-br',
		eventSources: [
						{
							<c:if test="${!empty anotacoes}">
							events: [
								${anotacoes}
							],
							color: 'blue',
							textColor: 'white'
							</c:if>
			             }
			           ],
	 	monthNames:['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho',
                    'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
	});

});
</script>