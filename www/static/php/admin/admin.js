admin();
var adminplacement = typeof adminplacement !== 'undefined' ? adminplacement : '';
var ENV = typeof ENV !== 'undefined' ? ENV : '';

function visadminBar() {
	addFavicon();
	addStylesheet();
	addBrowserSync();
	adminBar();
}

function admin() {
	var xmlhttp;
	// compatible with IE7+, Firefox, Chrome, Opera, Safari
	xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
			console.log(JSON.parse(xmlhttp.response));
			visadminBar();
		}
	}

	if (ENV == 'PROD') {
		xmlhttp.open("GET", '/user.json', true);
		xmlhttp.send();
	} else {
		visadminBar();
	}
}

function autoDBdump() {
	var xmlhttp;
	// compatible with IE7+, Firefox, Chrome, Opera, Safari
	xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200){

			//callback(xmlhttp.responseText);
			//console.log(xmlhttp.responseText);
			json = JSON.parse(xmlhttp.responseText);
			if (typeof json.html !== 'undefined') {
				id = "dump_"+(Math.random()*100);
				outer = document.createElement('div');
				outer.id = id;
				outer.innerHTML = json.html;
				document.body.appendChild(outer);
				setTimeout(function(){
					document.getElementById(id).remove();
				}, 3000);
			}
			if (typeof json.console  !== 'undefined') {console.log(json.console); }

			setTimeout(function(){
				autoDBdump();
			}, (5*60*1000));
		}
	}
	xmlhttp.open("GET", '/static/php/admin/auto_db_dump.php?ENV='+ENV, true);
	xmlhttp.send();
}

function adminBar() {
	document.body.innerHTML += '<div id="devmode" class="'+adminplacement+' '+ENV+'"></div>';

	var xmlhttp;
	// compatible with IE7+, Firefox, Chrome, Opera, Safari
	xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200){

			autoDBdump();

			//callback(xmlhttp.responseText);
			//console.log(xmlhttp.responseText);
			json = JSON.parse(xmlhttp.responseText);
			if (typeof json.bar !== 'undefined') {
				document.getElementById('devmode').innerHTML = '<div id="devmode_adminbar">'+json.bar+'</div>';
			}
			if (typeof json.script !== 'undefined') {
				var script = document.createElement("script");
				script.innerHTML = json.script;
				document.body.appendChild(script);
			}
		}
	}
	xmlhttp.open("GET", '/static/php/admin/adminBar.php', true);
	xmlhttp.send();
}

var DeployRSSdiv = document.createElement("div");
DeployRSSdiv.id = "DeployRSS";
document.body.appendChild(DeployRSSdiv);
var DeployRSS_start = true;

function getDeployRSS($id) {
	if (!DeployRSS_start) return;
	document.documentElement.className += ' visDeployRSS';
	DeployRSSdiv.className = "vis";
	DeployRSS_start = false;
	document.getElementById("DeployRSS").innerHTML = "<div><center>Loading DeployHQ rss ...</center></div>";
	var r = new XMLHttpRequest();
	r.open("GET", "/static/php/admin/deployhq_rss.php?rss="+$id, true);
	r.onreadystatechange = function () {
		if (r.readyState != 4 || r.status != 200) return;
		DeployRSSdiv.innerHTML = r.responseText;
		DeployRSS_start = true;
	};
	r.send();
}

function closeDeployRSS() {
	DeployRSSdiv.className = "";
	DeployRSSdiv.innerHTML = "";
	document.documentElement.className = document.documentElement.className.replace(/\bvisDeployRSS\b/,'');
}

function addStylesheet() {
	var head = document.getElementsByTagName('head')[0];
	var link = document.createElement('link');
	link.rel = 'stylesheet';
	link.href = '/dist/admin/admin.min.css';
	head.appendChild(link);
}

function addFavicon() {
	var head = document.getElementsByTagName('head')[0];
	var script = document.createElement('link');
	script.rel = 'shortcut icon';
	var time = new Date().getTime();
	script.href = "/dist/php/favicon.php?t="+time+"&env="+ENV;
	head.appendChild(script);
}

function addBrowserSync() {
	var head = document.getElementsByTagName('head')[0];
	var script = document.createElement('script');
	script.src = 'http://HOST:3000/browser-sync/browser-sync-client.js'.replace("HOST", location.hostname);
	head.appendChild(script);
}
