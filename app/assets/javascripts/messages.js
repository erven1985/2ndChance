jQuery(function($) {

	$(".fa-times.delete").click( function() {
			var current_message_div = $(this).parents('div')[0];
				console.log(current_message_div);
		if(confirm("Are you sure?")){
			$.ajax({
				url: '/messages/' + $(current_message_div).attr("data-message_id"),
				type: 'POST',
				data: { method: 'DELETE' },
				success: function(result) {
					$(current_message_div).fadeOut(200);
					console.log(result);
				}
			});

		};
	});

});