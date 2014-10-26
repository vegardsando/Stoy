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

	/* Elements */
	$header = $_('#main-header');
	$nav_main = $_('.nav_main');
	var maxScroll = $header.outerHeight() / 4;
	
	detect_size();
  		
	window.onresize = function(event) {
		detect_size();
	};	
	
	setTimeout(function(){
		$html.addClass('lastet');
	},1000)

	var frontpage_slider = new Slider('#frontpage-slide-container', {
		autoplay: true,
		speed: 5000,
	});


/*=======================================================
				  @Click/hover events
=======================================================*/

	$( ".studio, .foley" ).mouseover(function() {
		//$_(this).removeClass('not-hover');
		//$_(this).siblings().addClass('not-hover');
	});

	$( ".studio, .foley" ).mouseout(function() {
		//$_(this).removeClass('not-hover');
		//$_(this).siblings().removeClass('not-hover');
	});

	// FORM INPUT FOCUS
	$( ".reformed-form input, .reformed-form label" ).focus(function() {
		// Fjern alle aktive focus-klasser
		$_('.reformed-form label, .reformed-form input').removeClass('focus');
		$_(this).addClass('focus').next().addClass('focus');

		if ($_(this).val()) {
			$_(this).next().removeClass('has-val');
		}

	});

	$( ".reformed-form input" ).blur(function() {
		// Hvis det er verdi i denne, legg på hide label-class

		if ($_(this).val()) {
			$_(this).next().addClass('has-val');
		} else {
			$_(this).next().removeClass('has-val');
		}

		$_('.reformed-form label, .reformed-form input').removeClass('focus');	
	});		


/*=======================================================
					@function events
=======================================================*/

	$document.on('scroll', function(){
		var scrollTop = $window.scrollTop();

		 if (scrollTop > maxScroll) {

		 	if (!$nav_main.hasClass('fixed')) {
			 	$nav_main.addClass('fixed');
		 	}

		 	//Slider.stopPlaying();
		 } else {
		 	$nav_main.removeClass('fixed');
		 	//Slider.startPlaying();
		 }


	})

	// Sett korrekt versjon av bilder mtp desktop, tablet, phone etc
	function setImageSize() {
		$('.setsrc:not(".loaded")').each(function(){

			var denne = $(this);

			if (denne.is('img:not(":hidden")')) {
				denne.attr('src', $(this).data(lable));
				if(!denne.hasClass('setsize')){
					return
				}

				// Når bildet er lastet
				denne.imageready(function () {
					imgCover(denne);
				});

			} else {
				denne.css('background-image', 'url(' + $(this).data(lable) + ')');
			}


		});
	}

		
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

		if(gammel_label != lable){
			$('.img_cover img.loaded').removeClass('loaded');
			setImageSize();
		}

		gammel_label = lable;
	}

});