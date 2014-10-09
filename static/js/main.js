var $_ = $,
	desktop,
	tablet,
	phone,
	touch = Modernizr.touch || 'ontouchstart' in document.documentElement,
	lable = '',
	gammel_label;


//function init_page() { /* Aktiver når man har EE */
$_(document).ready(function() {
	
	/* A couple of selections. */
	$body         = $_(document.body);
	$window       = $_(window);
	$html         = $_(document.documentElement);
	$document	  = $_(document);
	
	detect_size();
  		
	window.onresize = function(event) {
		detect_size();
	};
	
	$html.addClass('lastet');
/*=======================================================
				  @Click/hover events
=======================================================*/

/*=======================================================
					@function events
=======================================================*/
		
	function detect_size(){
		var window_width = $window.width();
		//logg('detecting size');
		if(window_width <= 767){
			lable = 'phone';
			if(gammel_label != lable){
				$html.addClass('phone').removeClass('desktop tablet');
				desktop = false; tablet = false; phone = true;
				console.log('phone');
			}
		}else if(window_width <= 1024){
			lable = 'tablet';
			if(gammel_label != lable){
				$html.removeClass('phone').addClass('desktop tablet');
				desktop = false; tablet = true; phone = false;
				console.log('tablet');
			}
		}else{
			lable = 'desktop';
			if(gammel_label != lable){
				$html.removeClass('phone tablet').addClass('desktop');
				desktop = true; tablet = false; phone = false;
				console.log('desktop');
			}
		}
		gammel_label = lable;
	}

});