/*
	FHS Clock
		file: /jsc/application.js
*/

/* Clock */
function clock(){
	var d = new Date();
	
	var day = d.getDay();
	var month = d.getMonth();
	var date = d.getDate();
	var year = d.getFullYear();
	
	var hour = d.getHours();
	var minute = d.getMinutes();
	var second = d.getSeconds();
	
	var dayArray = new Array(
		"Sunday",
		"Monday",
		"Tuesday",
		"Wednesday",
		"Thursday",
		"Friday",
		"Saturday"
	);
	
	var monthArray = new Array(
		"January",
		"February",
		"March",
		"April",
		"May",
		"June",
		"July",
		"August",
		"September",
		"October",
		"November",
		"December"
	);
	
	if(date < 10){
		var date = '0' + date
	}
	
	if(hour > 12){
		am_pm = 'PM';
	}
	else if(hour < 12){
		am_pm = 'AM';
	}
	
	if(minute < 10){
		minute = '0' + minute
	}
	
	if(second < 10){
		second = '0' + second
	}
	
	var hour = ( hour > 12 ) ? hour - 12 : hour;
	var hour = ( hour == 0 ) ? 12 : hour;
	
	$('span#date').html(dayArray[day] + ", " + monthArray[month] + " " + date + ", " + year + "");
	$('span#time').html(hour + ":" + minute + ":" + second + " " + am_pm)
	
	$(document).ready(function(){
	
	var periods = 0;
	
	$('.period').each(function() {
		periods = periods + 1
		
	});
	
	$('.period').each(function() {
		var element = $(this);
		var finish = element.find('time.finish').attr('time');
		
		d = new Date();
		var time = (d.getHours() * 3600) + (d.getMinutes() * 60)
		
		if (time > finish) {
			$(".during").css("display", "none");
			$(".after").css("display", "block");
		}
		
	});
	
	$('.period').each(function(index) {
		var element = $(this);
		
		var start = element.find('time.start').attr('time');
		var finish = element.find('time.finish').attr('time');
		
		d = new Date();
		var time = (d.getHours() * 3600) + (d.getMinutes() * 60)
		
		if (time >= start && time <= finish) {
			element.attr('id', 'active');
    	}
    	
    	else {
    		element.attr('id', '');
    	}

	});
	
	

});
};
setInterval("clock()", 0);

var periods = "/api/periods.json"
var marquees = "/api/marquee.json"
var notices = "/api/notices.json"
