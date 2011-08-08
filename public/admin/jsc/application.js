/*
$(function(){

  $(window).hashchange( function(){
    var hash = location.hash;
    var section = hash.replace(/(#)/, '');
    
  	$('.posts li a').each(function() {
		
		  var element = $(this);
			
		  if (element.attr('class') === section) {
			  element.parent().addClass('selected');
		  }
			
		  else {
			  element.parent().removeClass('selected');
		  }
		
	  });
	  
		$('form .types .form').each(function() {
			
			var element = $(this);
			
			if(element.attr('id') === section) {
				element.css('display', 'block');
			}
			
			else {
				element.hide();
			}
			
		});
		
		$('input.type').attr('value', section);
	  
  });

  $(window).hashchange();

});
*/
