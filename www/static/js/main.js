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

    // Lag array av lines
    var groups = [],
        $groups = $('#grid g'),
        bodyOffset = $('body').offset().top;
    for (var i = 0; i < $groups.length; i++) {
        var $group = $groups.eq(i),
            off = $group.offset(),
            bound = $group.get(0).getBoundingClientRect();
        groups.push({
            left: off.left,
            right: off.left + bound.width,
            top: off.top - bodyOffset,
            bottom: off.top + bound.height - bodyOffset,
            width: bound.width,
            height: bound.height,
            obj: $group,
            isLogo: $group.attr('class') == 'logo',
            line1: $group.find('line').get(0),
            line2: $group.find('line').get(1),
            hover: false,
            to: null
        });

    }

    function groupFadeout(g) {
        setTimeout(function() {
            var rand1 = Math.random();
            var rand2 = Math.random();
            clearTimeout(g.to);
            if (g.isLogo) {
                var del1 = (rand1 * 5 + 3);
                var dur1 = (rand1 * 2 + 2);
                var del2 = (rand2 * 5 + 3);
                var dur2 = (rand2 * 2 + 2);
                g.line1.style.transitionDelay    = del1 + 's';
                g.line1.style.transitionDuration = dur1 + 's';
                g.line1.style.strokeWidth = 0.6;
                g.line2.style.transitionDelay    = del2 + 's';
                g.line2.style.transitionDuration = dur2 + 's';
                g.line2.style.strokeWidth = 0.6;
                g.to = setTimeout(function() {
                    g.line1.removeAttribute('style');
                    g.line2.removeAttribute('style');
                    g.hover = false;
                }, Math.max(del1+dur1, del2+dur2) * 1000);
            } else {
                g.line1.style.transitionDelay = (rand1 / 3 + 0.2) + 's';
                g.line1.style.strokeWidth = 0.6;
                g.line2.style.transitionDelay = (rand2 / 3 + 0.2) + 's';
                g.line2.style.strokeWidth = 0.6;
                g.to = setTimeout(function() {
                    g.line1.removeAttribute('style');
                    g.line2.removeAttribute('style');
                }, 500);
            }
        }, 200);
    }

    function clamp(val, min, max) {
        return Math.max(Math.min(val, max), min);
    }

    function distance(p1, p2) {
        var xl = p1.x - p2.x;
        xl = xl * xl;
        var yl = p1.y - p2.y;
        yl = yl * yl;

        return Math.sqrt(xl + yl);
    }

    function intersects(circle, rect) {
        var dist = distance(circle, {x: rect.left + ((rect.right-rect.left)/2), y: rect.top + ((rect.bottom-rect.top)/2) });
        if (dist > area) {
            return { overlap: false };
        }

        var closestX = clamp(circle.x, rect.left, rect.right);
        var closestY = clamp(circle.y, rect.top, rect.bottom);

        // Calculate the distance between the circle's center and this closest point
        var distanceX = circle.x - closestX;
        var distanceY = circle.y - closestY;

        // If the distance is less than the circle's radius, an intersection occurs
        var distanceSquared = (distanceX * distanceX) + (distanceY * distanceY);

        return {
            overlap: distanceSquared < (circle.r * circle.r),
            distance: distanceSquared
        };
    }

    function groupFadein(group, distance) {
        var rand = Math.random();

        var dist = Math.max(Math.abs(Math.round(distance/1300) - 10) + Math.round((Math.random() * 4 -2)), 1);
        if (group.isLogo) dist = 10;

        //dist = 10;
        group.line1.style.strokeWidth = dist+'px';
        group.line1.style.transitionDelay = '0s';
        group.line1.style.transitionDuration = group.isLogo ? '0s' : rand > 0.5 ? '.05s' : '.3s';
        group.line2.style.strokeWidth = dist+'px';
        group.line2.style.transitionDelay = '0s';
        group.line2.style.transitionDuration = group.isLogo ? '0s' : rand < 0.5 ? '.05s' : '.3s';

        groupFadeout(group);
    }

    function fadeInDelay(group, delay) {
        setTimeout(function() {
            groupFadein(group, 0);
        }, delay);
    }

	$body.addClass('lastet');
    if (touch) rippling = true;

    render();

/*=======================================================
				  @Click/hover events
=======================================================*/

    $document.on("mousemove", "#grid", function (e) {
        mouse_x = e.pageX;
        mouse_y = e.pageY;
        mouseover = true;
    });
    $document.on('mouseleave', '#grid', function(e) {
        mouseover = false;
    });

    $document.on('touchstart', '#grid', function(e) {
        if (e.originalEvent.touches.length > 1) {
            rippling = false;
        }
    });
    $document.on('touchend', '#grid', function() {
        rippling = true;
    });
    $document.on('touchmove', '#grid', function(e) {
        if (rippling) return true;
        mouse_x = e.originalEvent.touches[0].pageX;
        mouse_y = e.originalEvent.touches[0].pageY;
        return false;
    });

    function render() {

        now = Date.now();
        delta = now - then;

        if (delta > interval && !rippling && mouseover) {
            for (i = 0; i < groups.length; i++) {
                var group = groups[i];
                var randX1 = mouse_x + (Math.random() * 40 - 20);
                var randY1 = mouse_y + (Math.random() * 40 - 20);
                var overlap1 = intersects({x: randX1, y: randY1, r: area}, group);

                if (overlap1.overlap) {
                    groupFadein(group, overlap1.distance);
                }
                //break;
            }
            then = now - (delta % interval);
        }

        window.requestAnimationFrame(render);
    }

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
