<script>
	$(document).ready(function() {
		var mensagem = $('#myModal #annMensabem');
		var data = $('#myModal #annData');
		var salvar = $('#myModal #btnSalvar');
		var evento;

		salvar.on('click',function(e){
			e.preventDefault();

			switch($(this).val()){
				case 'criar':
				eventData = {
					mensagem: mensagem.val(),
					start: moment(data.datepicker('getDate')),
					allDay: true
				};
				$('#calendar').fullCalendar('renderEvent', eventData);
				break;

				case 'atualizar':
				evento.mensagem = mensagem.val();
				evento.start = moment(data.datepicker('getDate'));
				evento.allDay = true;
				$('#calendar').fullCalendar('updateEvent', evento);
				break;
			}
			$('#myModal').modal('hide');
		});

		$('#calendar').fullCalendar({
			selectable: true,
			selectHelper: true,
			lang: 'pt-br',
			select: function(start, end) {
				mensagem.val('');
				data.val('');
				$('#myModal .modal-title').html('Criar anotacao:');
				$('#myModal').modal();
				salvar.val('criar');
			},
			editable: true,
			eventClick: function(calEvent, jsEvent, view) {
				$('#myModal .modal-title').html('Atualizar anotacao:');
				mensagem.val(calEvent.mensagem);
				data.datepicker('setDate',calEvent.start.format('DD/MM/YYYY'));
				salvar.val('atualizar');
				evento = calEvent;
				$('#myModal').modal();
			},
			eventLimit: true
		});
		
		$('.datepicker').datepicker({
			format: 'dd/mm/yyyy'
		});
	});
</script>