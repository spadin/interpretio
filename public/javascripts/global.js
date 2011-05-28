hide_active_controls = function() {
	// turn off other active menus
	$(".widget.active").removeClass("active");
}

toggle_widget_state = function(e) {
	// toggle widget between minimized and un-minimized states
	var minimized = 0;
	var delay = .3;

	var parent = $(this).closest('.ui_toggle');
	if (parent.length == 0) {
		return false;
	}

	var content = parent.next().children('.elementBody');

	if (parent.hasClass("active")) {
		// turn off
		content.slideUp();
		minimized = 1;
	}
	else {
		// turn on
		content.slideDown();
	}

	parent.toggleClass("active");
}

prepare_toggles = function() {
	// hide content initially
	$(".ui_toggle_container .elementBody").hide();
  $("#attendees .elementBody").show();

	// add behavior for minimizing widget
	$(".ui_toggle").click(toggle_widget_state);
}

prepare_windows = function() {
	$(".window").hover(function() {
		$(this).children(".window_label").fadeTo('slow', 0);
	}, function() {
		$(this).children(".window_label").fadeTo('slow', 0.8);
	})
}

get_attendees = function() {
	var attendees = [{'user': {'id': 1, 'fname': 'Jason', 'lname': 'McCreary', 'phone_number': '502.640.3554'}}];

	$.getJSON('/participants.json', function(attendees) {
		console.log('%s', attendees.toSource());
		var attendee_container = $('#attendees .elementBody .ebCont');
		
		if (attendee_container.length == 0) {
			return false;
		}

		for (i in attendees) {
			if ($('#attendee_' + attendees[i].user.id).length != 0) {
				continue;
			}
			
			console.log('%s', attendees[i].toSource());
			var name = attendees[i].user.fname + ' ' + attendees[i].user.lname;
			attendee_container.append('<div id="attendee_' + attendees[i].user.id + '" class="attendee"><img alt="' + name + '" src="/res/images/203299_4710281_1367346_q.jpg"><h4>' + name + '</h4><p class="info">' + attendees[i].user.phone_number + '</p></div>').fadeIn('slow');
		}
	});
}

get_conference_log = function() {
	var logs = [{'log': {'message': 'whatever', 'timestamp': '8:35pm'}, 'user': {'fname': 'Jason', 'lname': 'McCreary'}}, {'log': {'message': 'whatever', 'timestamp': '8:35pm'}, 'user': {'fname': 'Jason'}}];
	
//	$.getJSON('ajax/test.json', function(data) {
		var log_container = $('#log ol');
		
		if (log_container.length == 0) {
			return false;
		}

		for (i in logs) {
//			console.log('%s', logs[i].toSource());
			log_container.append('<li><span class="attendee">' + logs[i].user.fname + ' ' + logs[i].user.lname + ':</span> ' + logs[i].log.message + ' <span class="timestamp">' + logs[i].log.timestamp + '</span></li>').fadeIn('slow');
			log_container.parent().attr({"scrollTop": log_container.attr("scrollHeight")});
		}
//	});

}

prepare_forms = function() {
	var form = $('#translator_form');
	
	if (form.length == 1) {
		form.find(':checkbox').change(function() {
			if ($(this).is(':checked')) {
				send_data('#translator_form');
			}
		});
	}

	form = $('#log_form');
	
	if (form.length == 1) {
		form.submit(function() {
			send_data('#log_form');

			return false;
		});
	}
}

send_data = function(form) {
	form = $(form);
	var data = $(form).serialize();

	$.post(form.attr("action"), data);
	
	$('#message').val('');
}

$(document).ready(function() {
	// prepare toggles
	prepare_toggles();
	prepare_windows();
	prepare_forms();

	// add click event to document for "click-offs" of controls
	$(document).click(hide_active_controls);
	
	// setup polling
	// NOTE: this has no respect for perfomance, it's a demo
	setInterval('get_conference_log()', 10000);
	setInterval('get_attendees()', 10000);
});
