/*jslint vars: true, plusplus: true, devel: true, nomen: true, indent: 4, maxerr: 50 */
/*global define */
var $ = $,
    Modernizr = Modernizr,
    $m = $;

//function init_page() { /* Aktiver når man har EE */
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
        label = '',
        mouse_x = 0,
        mouse_y = 0,
        gammel_label,
        resizeTimeout,
        rippling,
        mouseover,
        area = 120,
        fps = 24,
        now,
        then = Date.now(),
        interval = 1000/fps,
        delta;

/*=======================================================
					@function events
=======================================================*/

	function detect_size() {
		var window_width = $window.width();
		//logg('detecting size');
		if (window_width <= 767) {
			label = 'phone';
			if (gammel_label !== label) {
				$html.addClass('phone').removeClass('desktop tablet');
				desktop = tablet = false;
                phone = true;
			}
		} else if (window_width <= 1024) {
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

        if(gammel_label != label){
            setImageSrc();
        }

		gammel_label = label;
	}

	detect_size();

	window.onresize = function (event) {
        clearTimeout(resizeTimeout);
        resizeTimeout = setTimeout(detect_size, 100);
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

    // Sett korrekt versjon av bilder mtp desktop, tablet, phone etc
    function setImageSrc() {
        $m('.setsrc:not(".loaded")').each(function(){

            var denne = $m(this);

            if (denne.is('img:not(":hidden")')) {
                denne.attr('src', $(this).data(label));
                if(!denne.hasClass('setsrc')){
                    return
                }

            } else {
                denne.css('background-image', 'url(' + $(this).data(label) + ')');
            }


        });
    }

    //Kart
    if ($m('.map').length) {
        maps();
    }

	$html.addClass('lastet');

    render();

/*=======================================================
				  @Click/hover events
=======================================================*/

    $document.on("mousemove", "#grid", function (e) {
        mouse_x = e.pageX;
        mouse_y = e.pageY;
        mouseover = true;
    });



    $('#grid').on('click', function(e) {
        var delayOffset = 1;
        rippling = true;
        for (var i = 0; i < groups.length; i+=Math.ceil(Math.random()*3)) {
            fadeInDelay(groups[i], i*delayOffset);
        }
        setTimeout(function() {
            rippling = false;
            render();
        }, groups.length*delayOffset + 500);
    });

}());
