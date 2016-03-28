/*jslint browser: true*/
/*global jQuery, console, svg4everybody,requestFrame, Modernizr, runforceFeed*/

var $m = jQuery;

if (typeof svg4everybody === 'function') { svg4everybody(); }
if (typeof requestFrame === 'function') { requestFrame('native'); } // re/ declares requestAnimationFrame & cancelAnimationFrame

(function () {
    'use strict';
	/* A couple of selections. */
	var $body         = $m(document.body),
        $window       = $m(window),
        $html         = $m(document.documentElement),
        $document	  = $m(document),
        desktop,
    		tablet,
    		phone,
    		touch = Modernizr.touch || document.documentElement.hasOwnProperty('ontouchstart'),
        mouse_x = 0,
        mouse_y = 0,
        mouseover,
        map,
        area = 120,
        fps = 24,
        now,
        then = Date.now(),
        interval = 1000/fps,
        delta,
        label = '',
    		gammel_label,
        window_width,
        resizeTO;

/*=======================================================
					@function events
=======================================================*/

	function detect_size() {
		window_width = $window.width();
		if (window_width < 768) {
			label = 'phone';
			if (gammel_label !== label) {
				$html.addClass('phone').removeClass('desktop tablet');
				desktop = tablet = false;
                phone = true;
			}
		} else if (window_width < 1025) {
			label = 'tablet';
			if (gammel_label !== label) {
				$html.removeClass('phone').addClass('desktop tablet');
				desktop = phone = false;
                tablet = true;
			}
		} else {
			label = 'desktop';
			if (gammel_label !== label) {
				$html.removeClass('phone tablet').addClass('desktop');
				desktop = true;
                tablet = phone = false;
			}
		}
		gammel_label = label;
	}

    detect_size();
	//runforceFeed();
	window.onresize = function () {
        clearTimeout(resizeTO);
        resizeTO = setTimeout(detect_size, 100);
	};

  function render() {

      now = Date.now();
      delta = now - then;

      if (delta > interval) {
          //console.log('rendering');
          then = now - (delta % interval);
      }

      window.requestAnimationFrame(render);
  }

  function maps() {

      //'use strict';

      var styles = [{
          "featureType": "road",
          "elementType": "geometry",
          "stylers": [
              { "visibility": "simplified" },
              { "color": "#50504f" }
          ]
      }, {
          "featureType": "landscape",
          "stylers": [
              { "color": "#c8c8c8" }
          ]
      }, {
          "featureType": "administrative",
          "elementType": "labels.text.fill",
          "stylers": [
              { "color": "#000000" }
          ]
      }, {
          "featureType": "water",
          "stylers": [
              { "color": "#ffffff" }
          ]
      }, {
          "featureType": "transit",
          "stylers": [
              { "color": "#ffffff" }
          ]
      }, {
          "featureType": "poi",
          "stylers": [
              { "visibility": "simplified" },
              { "color": "#8d8c8d" }
          ]
      }, {
          "stylers": [
              { "lightness": 60 },
              { "visibility": "simplified" }
          ]
      }];

      var mapOptions = {
          center: { lat: 63.4391142, lng: 10.4155636 },
          scrollwheel: false,
          zoom: 15,
          mapTypeControl: false,
          panControl: false,
          zoomControlOptions: {
              position: google.maps.ControlPosition.LEFT_CENTER
          }
      };



      map = new google.maps.Map(document.getElementById('map'), mapOptions);
      map.setOptions({styles: styles});

      var marker = new google.maps.Marker({
          position: new google.maps.LatLng(63.4391142, 10.4155636),
          icon: {
              path: google.maps.SymbolPath.CIRCLE,
              scale: 10
          },
          draggable: false,
          map: map
      });


  }

  //Kart
  if ($m('.map_wrapper').length) {
      maps();
  }

  setTimeout(function(){
      $html.addClass('lastet');
      //$(".grid article").fitVids();
  },1000);

  render();

	$html.addClass('lastet');


if ($('.arranger').length) {

  function initialize() {
  // Scroll to bottom
    $canvasMain.scrollTop(1000);  // Er aldri så leng uansett
  }
}

/*=======================================================
				  @Click/hover events
=======================================================*/

  // Forside - vimeo-videoer
  $( ".grid article" ).on('click', function() {

      // Sett alle vimeo-videoer på pause
      var iframe = $('iframe');
      iframe.each(function(index){
          var player = $f($(this)[0]);
          player.api('pause');
      })

      // Fjern alle video_active på andre elementer
      $('.video_active').removeClass('video_active');
      $(this).addClass('video_active');

  });


}());
