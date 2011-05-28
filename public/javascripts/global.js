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

$(document).ready(function() {
	// prepare toggles
	prepare_toggles();
	prepare_windows();

	// add click event to document for "click-offs" of controls
	$(document).click(hide_active_controls);
});
