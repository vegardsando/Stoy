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
        "elementType": "geometry",
        "stylers": [
            {
                "hue": "#ff4400"
            },
            {
                "saturation": -68
            },
            {
                "lightness": -4
            },
            {
                "gamma": 0.72
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.icon"
    },
    {
        "featureType": "landscape.man_made",
        "elementType": "geometry",
        "stylers": [
            {
                "hue": "#0077ff"
            },
            {
                "gamma": 3.1
            }
        ]
    },
    {
        "featureType": "water",
        "stylers": [
            {
                "hue": "#00ccff"
            },
            {
                "gamma": 0.44
            },
            {
                "saturation": -63
            }
        ]
    },
    {
        "featureType": "poi.park",
        "stylers": [
            {
                "hue": "#44ff00"
            },
            {
                "saturation": -23
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "hue": "#007fff"
            },
            {
                "gamma": 0.77
            },
            {
                "saturation": 65
            },
            {
                "lightness": 99
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "gamma": 0.11
            },
            {
                "weight": 5.6
            },
            {
                "saturation": 99
            },
            {
                "hue": "#0091ff"
            },
            {
                "lightness": -86
            }
        ]
    },
    {
        "featureType": "transit.line",
        "elementType": "geometry",
        "stylers": [
            {
                "lightness": -48
            },
            {
                "hue": "#ff5e00"
            },
            {
                "gamma": 1.2
            },
            {
                "saturation": -23
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "saturation": -64
            },
            {
                "hue": "#ff9100"
            },
            {
                "lightness": 16
            },
            {
                "gamma": 0.47
            },
            {
                "weight": 2.7
            }
        ]
    }];

      var mapOptions = {
          center: { lat: 63.4391142, lng: 10.4155636 },
          scrollwheel: false,
          draggable: false,
          zoom: 15,
          mapTypeControl: false,
          panControl: false,
          zoomControlOptions: {
              position: google.maps.ControlPosition.LEFT_CENTER
          }
      };

      if (desktop) {
        mapOptions.draggable = true;
      }



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

  	$m('.nav_main .facebook').one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend',
      function(e) {


		  setTimeout(function() {
			  //Kart
	    	  if ($m('.map_wrapper').length) {
	    	      maps();
				  console.log('map');
	    	  }

	          $(".grid article").fitVids();
		  }, 800)


    });


  render();

  setTimeout(function() {
    $html.addClass('lastet');
  }, 500)




if ($('.arranger').length) {

  function initialize() {
  // Scroll to bottom
    $canvasMain.scrollTop(1000);  // Er aldri så leng uansett
  }
}

/*=======================================================
				  @Click/hover events
=======================================================*/

  // Jobber, videoer, clicks
  $( ".grid article a" ).on('click', function(e) {

    if ($(this).parents('article').find('.video').children().length > 0 ) {
      e.preventDefault();

      console.log('click');

        // Sett alle vimeo-videoer på pause
        var iframe = $('iframe');
        iframe.each(function(index){
            var player = $f($(this)[0]);
            player.api('pause');
        })

        // Fjern alle video_active på andre elementer
        $('.video_active').removeClass('video_active');
        $(this).parents('article').addClass('video_active');

    }



  });

  // SCROLL DOWN
	$document.on('click', '.kontakt', function (e) {
		e.preventDefault();

		$("html, body").animate({ scrollTop: $(document).height() }, "slow");

	});




}());
