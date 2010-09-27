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

var loop = setInterval(function() {
	var d = new Date();
	var dh = d.getHours();
	var cP = 16; 
	/* make cP your earliest period
	earlier than 1600, but that's for it to
	work with the current time for me (8pm) 
	each pass with increment by 1 hour.*/
	$('.period').each(function() {
		if (dh==cP) $(this).addClass('active'); // add active if current
		else $(this).removeClass('active'); // otherwise remove it
		cP++; // Add an hour each loop, assuming each period is 1hr
	});
}, 60000); // 60000 milliseconds = 1 minute update
