/*!
 * gulp
 * $ npm install gulp-ruby-sass gulp-autoprefixer gulp-minify-css gulp-jshint gulp-concat gulp-uglify gulp-imagemin gulp-notify gulp-rename gulp-livereload gulp-cache del --save-dev
 */

"use strict";

var gulp			= require("gulp"),
	fs 				= require("fs"),
	gutil			= require("gulp/node_modules/gulp-util"),
	colors			= require("gulp/node_modules/chalk"),
	browserSync		= require("browser-sync"),
	del				= require("del"),
	ncu 			= require('npm-check-updates'),
	plugins 		= require('gulp-load-plugins')({DEBUG: false});


// Directories
var START 	= startfolders(["www","public","public_html"]),
	SRC 	= START + "/static",
	DIST 	= START + "/dist",
	REV		= START + "/REV";

// Files that shoild be moved
var MOVE = {
	"fonts"	: [ SRC + "/fonts/**"],
	"php"	: [ SRC + "/php/**", "!" + SRC + "/php/admin/*"],
	"js/vendor": [ SRC + "/js/vendor/**"],
	"css/vendor": [ SRC + "/css/vendor/**"]
};

// Images that should be prosessed
var IMAGES = {
	"img" : [ SRC + "/img/**"]
};

// JS files we"ll be using
var JS = {
	"main" 	: [ SRC + "/js/plugins.js", SRC + "/js/_inc/*.js", SRC + "/js/main.js"]
};

// CSS files we"ll be using
var CSS = {
	"main"	: [ SRC + "/css/main.scss"]
};


// Styles
var css_running = false;
gulp.task("css", function(done) {
	var size = Object.size(CSS),
		counter = size;
	css_running = true;

	for (var key in CSS) {
		gulp.src(CSS[key])
			.pipe(plugins.plumber({ errorHandler: onError }))
			.pipe(plugins.sass({outputStyle: "compressed"}))
			//.pipe(plugins.less())
			.pipe(plugins.rename(key+".css"))
			.pipe(plugins.autoprefixer("last 2 version", "safari 5", "e i9", "opera 12.1", "ios 6", "android 4"))
			//.pipe(gulp.dest(REV + "/css"))
			.pipe(plugins.cssnano())
			//.pipe(plugins.rename({ suffix: ".min" }))
			.pipe(gulp.dest(REV + "/css"))
			.on('end', function() {
				counter--;
				if (size > 1) gutil.log(colors.blue("css") + colors.magenta(" (" + (size - counter) +"/"+size+")") + " ferdig");
				if (counter === 0) {
					done();
					css_running = false;
					gulp.start("rev");
				}
			});
	}

});

// Scripts
var scripts_running = false;
gulp.task("scripts", function(done) {
	var size = Object.size(JS),
		counter = size;
	scripts_running = true;

	for (var key in JS) {
		gulp.src(JS[key])
			.pipe(plugins.plumber({ errorHandler: onError }))
			.pipe(plugins.concat(key+".js"))
			//.pipe(gulp.dest(DIST + "/js"))
			.pipe(plugins.uglify())
			//.pipe(rename({ suffix: ".min" }))
			.pipe(gulp.dest(REV+ "/js"))
			.on('end', function() {
				counter--;
				if (size > 1) gutil.log(colors.blue("scripts") + colors.magenta(" (" + (size - counter) +"/"+size+")") + " ferdig");
				if (counter === 0) {
					done();
					scripts_running = false;
					gulp.start("rev");
				}
			});
	}

});

// Images
gulp.task("images", function(done) {
	var size = Object.size(IMAGES);
	for (var key in IMAGES) {
		gulp.src(IMAGES[key])
			.pipe(plugins.plumber({ errorHandler: onError }))
            .pipe(plugins.imagemin({ optimizationLevel: 3, progressive: true, interlaced: true }))
			.pipe(gulp.dest(DIST + "/"+key+"/"))
			.on('end', function() {
				size--;
				if (size === 0) {done(); }
			});
	}
});

// Svg-symbols
gulp.task("svg-symbols", function () {
	return gulp.src(SRC + "/svg/symbols/*")
		.pipe(plugins.plumber({ errorHandler: onError }))
		.pipe(plugins.svgmin())
		.pipe(plugins.svgSymbols({templates: ['default-svg']}))
		.pipe(gulp.dest(DIST + "/svg"));
});

// Svg
gulp.task("svg", function () {
	return gulp.src([SRC + "/svg/**/*", "!" + SRC + "/svg/symbols/*"])
		.pipe(plugins.plumber({ errorHandler: onError }))
		.pipe(plugins.svgmin())
		.pipe(gulp.dest(DIST + "/svg"));
});

// Clean
gulp.task("clean", function() {
	//plugins.cache.clearAll();

	return del([DIST, REV]).then(function (paths) {
		if (paths.length) {
			gutil.log("");
			gutil.log("===================================== Deleted files/folders! =====================================");
			for (var path in paths) {
				gutil.log("\t"+paths[path]);
			}
			gutil.log("--------------------------------------------------------------------------------------------------");
			gutil.log("");
		}
	});
});

// Move files
gulp.task("moveFiles", function(done) {
	var size = Object.size(MOVE) + 1;
	for (var key in MOVE) {
		gulp.src(MOVE[key])
			.pipe(plugins.plumber({ errorHandler: onError }))
			.pipe(gulp.dest(DIST + "/"+key+"/"))
			.on('end', function() {
				size--;
				if (size === 0) {done(); }
			});
	}

});

// Add rev to files
gulp.task("rev", function() {
	if (!css_running && !scripts_running) {
		if (del([DIST+"/js/*", "!" + DIST + "/js/vendor", DIST+"/css/*", "!" + DIST + "/css/vendor"])) {
			return gulp.src(REV+'/**/*.{js,css}')
			.pipe(plugins.plumber({ errorHandler: onError }))
			//.pipe(gulp.dest(DIST))
			.pipe(plugins.rev())
			.pipe(gulp.dest(DIST))
			.pipe(browserSync.reload({ stream:true }))
			.pipe(plugins.rev.manifest("cachebust.json", {
				//merge: true
			}))
			.pipe(gulp.dest("./"));
		}
	} else {
		return false;
	}
});


// Add adminfiles
gulp.task("admin", function(done) {
	var size = 2;
	gulp.src(SRC +'/php/admin/admin.js')
		.pipe(plugins.plumber({ errorHandler: onError }))
		.pipe(plugins.uglify())
		.pipe(plugins.rename("admin.min.js"))
		.pipe(gulp.dest(DIST + "/admin"))
		.on('end', function() {
			size--;
			if (size === 0) {done(); }
		});

	gulp.src(SRC +'/php/admin/admin.scss')
		.pipe(plugins.plumber({ errorHandler: onError }))
		.pipe(plugins.sass({outputStyle: "compressed"}))
		.pipe(plugins.autoprefixer("last 2 version", "safari 5", "e i9", "opera 12.1", "ios 6", "android 4"))
		.pipe(plugins.cssnano({discardComments: {removeAll: true}, zindex: false}))
		.pipe(plugins.rename("admin.min.css"))
		.pipe(gulp.dest(DIST + "/admin"))
		.on('end', function() {
			size--;
			if (size === 0) {done(); }
		});
});

// Watch
gulp.task("watch", function() {

	// Watch .scss files
	gulp.watch([SRC + "/css/**/*.scss"], ["css"]);

	// Watch .js files
	gulp.watch([SRC + "/js/**/*.js"], ["scripts"]);

	// Watch moving files
	var MOVEARRAY = [];
	for (var key in MOVE) { MOVEARRAY = MOVEARRAY.concat(MOVE[key]); }
	gulp.watch(MOVEARRAY, ["moveFiles"]);

	// Watch image files
	gulp.watch(SRC + "/img/**/*", ["images"]);

	// Watch svg files
	gulp.watch(SRC + "/svg/**/*", ["svg-symbols", "svg"]);

	gulp.watch(["templates/**/*.{html,twig}", "{www,public}/*.{html,php}"]).on("change", browserSync.reload);

	// Watch admin files
	gulp.watch(SRC + "/php/admin/*.{js,scss}", ["admin"]);
});

gulp.task("browser-sync", ["admin", "css", "scripts", "moveFiles", "images", "svg", "svg-symbols", "watch"], function() {
	return browserSync({
		logSnippet: false,
		logPrefix: "Browser Sync"
	});
});

// Default task
gulp.task("default", ["clean"], function() {
	gulp.start("browser-sync");
});

// Sjekk etter nye oppgraderinger til gulp
ncu.run({
	packageFile: 'package.json',
	// Any command-line option can be specified here.
	// These are set by default:
	// silent: true,
	// jsonUpgraded: true
	}).then(function(upgraded) {
		var size = 0, key;
	    for (key in upgraded) {
	        if (upgraded.hasOwnProperty(key)) size++;
	    }
		if (size) {
			gutil.log("======================================= Gulp dependencies ========================================");
			for (var key in upgraded) {
				gutil.log("\t"+ colors.red(upgraded[key]) +"\t" + key);
			}
			gutil.log("--------------------------------------------------------------------------------------------------");
			gutil.log("\t Run "+colors.blue("npm update")+" to upgrade without updating package.json");
			gutil.log("\t Run "+colors.blue("ncu -u")+" to upgrade package.json");
			gutil.log("\t Run "+colors.blue("ncu -a")+" to upgrade package.json too latest versions");
			gutil.log("--------------------------------------------------------------------------------------------------");
		} else {
			gutil.log("All dependencies are upgradeed :)");
		}
});

function startfolders(startfolders) {
	var i = 0;
	while (startfolders[i]) {
		if( fs.existsSync(startfolders[i])){
			return startfolders[i];
			break;
		}
		i++;
	}
}

// error function for plumber
var onError = function (err) {
	gutil.beep();
	gutil.log(colors.red("============================================= ERROR! ============================================="));
	gutil.log(colors.red(err));
	gutil.log(colors.red("--------------------------------------------------------------------------------------------------"));
	this.emit("end");
};

Object.size = function(obj) {
    var size = 0, key;
    for (key in obj) {
        if (obj.hasOwnProperty(key)) size++;
    }
    return size;
};

gulp.task('check-for-favicon-update', function(done) {
	var currentVersion = JSON.parse(fs.readFileSync(FAVICON_DATA_FILE)).version;
	plugins.realFavicon.checkForUpdates(currentVersion, function(err) {
		if (err) {
			throw err;
		}
	});
});

gulp.task('inject-favicon-markups', function() {
	gulp.src('./templates/_partials/_favicon.html')
		.pipe(plugins.realFavicon.injectFaviconMarkups(JSON.parse(fs.readFileSync(FAVICON_DATA_FILE)).favicon.html_code))
		.pipe(gulp.dest('./templates/_partials/'));
});
