/*
	Clock
		file: jsc/application.js
*/


/*
	I. Clock
*/

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
	
	if(hour >= 12){
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
	
	$('p#date').html(dayArray[day] + ", " + monthArray[month] + " " + date + ", " + year + "");
	$('p#time').html(hour + ":" + minute + ":" + second + " " + am_pm)
	
	/*
		II. Periods
	*/
	
	$(document).ready(function(){
		
		// Displays "It's after school" if after last period's finish time.
		var final_period = $('ol#periods li:last-child');
		var final_time = final_period.find('time.finish').attr('datetime');
	
		d = new Date();

		var time = (d.getHours() * 3600) + (d.getMinutes() * 60)
	
		if (final_time < time) {
			$("#after").css("display", "block");
			$("#during").css("display", "none");
		}
		
		else {
			$("#during").css("display", "block");
			$("#after").css("display", "none");
		}
		
		// Shows which period is currently active.
		$('ol#periods li').each(function(index) {
			var element = $(this);
		
			var start = element.find('time.start').attr('datetime');
			var finish = element.find('time.finish').attr('datetime') - 60;
		
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

/*
	III. Marquee
*/

$(document).ready(function (){
	$("#marquee").marquee({pauseOnHover: false});
});

