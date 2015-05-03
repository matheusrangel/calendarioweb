<!-- Bootstrap -->
<script src='js/bootstrap.min.js'></script>
<link href='css/bootstrap.min.css' rel='stylesheet' />

<!-- FullCalendar -->
<link href='css/fullcalendar.min.css' rel='stylesheet' />
<link href='css/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='js/moment.min.js'></script>
<script src='js/jquery.min.js'></script>
<script src='js/fullcalendar.min.js'></script>
<script src='js/lang-all.js'></script>

<script>
	$(document).ready(function() {
//		$('#calendar').fullCalendar({
//			lang : 'pt-br',
//			select: function(start, end) {
//				mensagem.val('');
//				titulo.val('');
//				data.val('');
//				$('#evModal .modal-title').html('Criar evento.');
//				$('#evModal').modal();
//				salvar.val('criar');
//				// $('#calendar').fullCalendar('unselect');
//			}
//		});
		$('#calendar').fullCalendar({
			selectable: true,
			selectHelper: true,
			lang: 'pt-br',
			select: function(start, end) {
//				mensagem.val('');
//				titulo.val('');
//				data.val('');
//				$('#evModal .modal-title').html('Criar evento.');
//				$('#evModal').modal();
//				salvar.val('criar');
			},
			editable: true,
			eventClick: function(calEvent, jsEvent, view) {
//				$('#evModal .modal-title').html('Atualizar evento.');
//				titulo.val(calEvent.title);
//				mensagem.val(calEvent.mensagem);
//				data.datepicker('setDate',calEvent.start.format('DD/MM/YYYY'));
//				salvar.val('atualizar');
//				evento = calEvent;
//				$('#evModal').modal();
//				console.log(calEvent);
			},
			eventLimit: true,
//			eventSources: [
//			               {
//			                   url: 'calendario.do?op=eventos',
//			                   type: 'POST',
//			                   data: {},
//			                   error: function() {
//			                       alert('there was an error while fetching events!');
//			                   },
//			                   color: 'yellow',   // a non-ajax option
//			                   textColor: 'black' // a non-ajax option
//			               }
//			           ]

//			events: [
//			{
//				title: 'Teste - Evento',
//				start: '2015-05-02T16:10:00',
//				allDay: true
//			}
//			]
			
		});
	});
	
</script>