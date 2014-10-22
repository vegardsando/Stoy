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
	var maxScroll = $header.outerHeight() - $_('.emblem-heading').outerHeight();
	var fixedmargin = $header.outerHeight() + $_('.emblem-heading').outerHeight() - 20;
	
	detect_size();
  		
	window.onresize = function(event) {
		detect_size();
	};

	var newObject = {};

	newObject.fornavn = 'Hello';
	newObject.dings = 'yalla';

	console.log(newObject);
	
	setTimeout(function(){
		$html.addClass('lastet');
	},200)

	var frontpage_slider = new Slider('.slide-container', {
		autoplay: true,
		speed: 8000,
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

	$document.on('scroll', function(){
		var scrollTop = $window.scrollTop();

		 if (scrollTop > maxScroll) {
		 	$body.addClass('fixed');
		 	$body.css('margin-top', fixedmargin + 'px');
		 	//Slider.stopPlaying();
		 } else {
		 	$body.removeClass('fixed');
		 	$body.css('margin-top', '0px');
		 	//Slider.startPlaying();
		 }

	})



/*=======================================================
					@function events
=======================================================*/



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