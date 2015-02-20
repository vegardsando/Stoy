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
