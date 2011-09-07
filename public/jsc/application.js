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
		var periods = $('ol#periods').children().length;
		
		var element = $('ol#periods:nth-child(' + periods + ')');
		var final_time = element.find('time.finish').attr('time');
	
		d = new Date();

		var time = (d.getHours() * 3600) + (d.getMinutes() * 60)
	
		if (time < final_time) {
			$(".during").show("display", "block");
			$(".after").hide("display", "none");
		}
		
		else {
			$(".after").show("display", "block");
			$(".during").css("display", "none");
		}
		
		// Shows which period is currently active.
		$('ol#periods li').each(function(index) {
			var element = $(this);
		
			var start = element.find('time.start').attr('time');
			var finish = element.find('time.finish').attr('time');
		
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

