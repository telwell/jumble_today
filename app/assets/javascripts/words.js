$(document).ready(function(){
  $( " #sortable0, #sortable1, #sortable2, #sortable3" ).sortable({
  stop: function( event, ui ) {
		var eventId = event.target.id;
		var wordId = $(event.target).data('word-id');
    var guess = $(event.target).find('li').map(function(i, li){
      return li.innerHTML;
    });
    guess = Array.from(guess);
    guess = guess.join('');
    $.ajax({
      url: '/check',
      method: 'GET',
			dataType: 'json',
      data: {
				eventId: eventId,
				wordId: wordId,
        guess: guess
      },
			success: function(data, status, xhr){
				if (data.isMatch) {
					match = $('#' + data.eventId);
					match.sortable( "disable" );
					match.addClass('unjumbled');
				}
			},
			error: function(xhr, status, error){
				console.log(error);
			}
    })
  }
  });
  $( " #sortable0, #sortable1, #sortable2, #sortable3" ).disableSelection();
})
