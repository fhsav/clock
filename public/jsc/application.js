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
	
	if(second < 10){
		second = '0' + second
	}
	
	var hour = ( hour > 12 ) ? hour - 12 : hour;
	var hour = ( hour == 0 ) ? 12 : hour;
	
	$('span#date').html(dayArray[day] + ", " + monthArray[month] + " " + date + ", " + year + "");
	$('span#time').html(hour + ":" + minute + ":" + second + " " + am_pm)
};
setInterval("clock()", 0);
