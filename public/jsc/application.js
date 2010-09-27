/*
	FHS Clock
		file: /jsc/application.js
*/

/* Clock */
$(function($){
	var options = {
		timeNotation: '12h',
		am_pm: true,
	}
	$('#time').jclock(options);
});

