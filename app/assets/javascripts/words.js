$(document).ready(function(){
  var wordCount = $('.word-list').length;
  var solvedCount = 0;

  $( "#sortable0, #sortable1, #sortable2, #sortable3" ).sortable({
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
      method: 'POST',
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
          solvedCount += 1;
          if ( solvedCount == wordCount ){
            var check = [];
            var words = $('.word-list');
            var jumbleId = $('#word-wrapper').data('jumble-id');
            words.each(function(i, word){
              var store = $(word).find('li').map(function(i, el) { return el.innerHTML; });
              store = Array.from(store).join('');
              check.push(store)
            })
            $.ajax({
              url: '/check_victory',
              method: 'POST',
        			dataType: 'script',
              data: {
        				check: check,
                jumbleId: jumbleId
              }
            })
          }
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
