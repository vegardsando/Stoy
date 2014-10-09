<?php
/* =================================================================================================
 Mustasj AS header file
 ---------------------------------------------------------------------------------------------------
 Function 			 		Variables(first is default)								Description
 ---------------------------------------------------------------------------------------------------
 
 _skjult_logo() 			true|false												Show Mustasj logo
 _init_classes()			true|false												html gets phone, tablet or desktop
 _title()					'Start template'|SEO lite|string						Set the title of the page
 _reloadr()					2000|false												Reloadr script, start-frequency 2 sek
 _minimee()					false|minimee ee tags									Use for start and stop tags for Minimee
 _logging()					false|true												true for at alle skal se logg();
 _system_on()				'string'												Output 'string' if system is on from EE
 _dev_time()																		Gives you t=timestamp in php time
 _base()																			Gives you the baseurl on the page. not use in templates other than input parsed php
 _environment_badge()		top right| left right top bottom|false					Show wich envirement you are in. False to disable
 _script()					'string'												output scripts in footer or any other place. 'minimee' as default, 'string' to other places: $scripts['string'][] = '';
 _google_analythics()		'universial'|'old'|"code", true|false|'UA', true|false	1: type of code, in code {UA} replaces 2 parameter		2: UA code UA-''	3: Get alert on missing UA/code
 
================================================================================================= */

global $base;
global $MSMbase;
global $dev_t;
global $environment_badge;
global $reloadr;
global $_title_top;
global $ee;
global $super_admin;
global $analythics_code;
global $production;
global $is_system_on;

$reloadr_override 	= false;
$ee					= false;
$skjul_environment 	= false;
$turn_off_reloadr	= false;
$super_admin		= false;
$production			= false;
$is_system_on		= false;
$host_cp			= "";
$site_label 		= "";
$dev_t 				= '?t='.time();

if(isset($this)){
	$ee 				= true;
	$admin_link 		= $this->EE->config->config['cp_url'];
	$base 				= $this->EE->config->config['site_url'];
	$MSMbase			= $base;
	if(isset($this->EE->config->_global_vars['global:MSM_site_url'])){
		$MSMbase 		= $this->EE->config->_global_vars['global:MSM_site_url'];
	}
	$member_group 		= $this->EE->session->userdata['group_id'];
	$env_short 			= $this->EE->config->_global_vars['global:env'];
	if($this->EE->config->config['is_system_on'] == 'y'){$is_system_on = true;}
	if($env_short == 'production'){$production = true;}
	$analythics_code 	= $this->EE->config->_global_vars['global:google_analytics_key'];
	$reloadr_override 	= $this->EE->config->_global_vars['global:reloadr_override']; // sjekk config_bootstrap under hver environment

	if($member_group == 1){ $super_admin = true;}
	if(!in_array($member_group, $EE_debug_member_group)){
		$reloadr_override =  true; $dev_t = '';
	}else{
		if($this->EE->config->config['multiple_sites_enabled'] == 'y'){$site_label = '('.$this->EE->config->config['site_label'].')';}
		$environment = "<b>EE ".$site_label."</b> ".$env_short; 
	}
}elseif($_SERVER["HTTP_HOST"] == 'localhost' || strpos($_SERVER['HTTP_HOST'], '192.168.') !== false || strpos($_SERVER['HTTP_HOST'], '10.0.0.') !== false){
	$base_divid 		= explode('/', $_SERVER['REQUEST_URI']);
	$base 				= '/'.$base_divid[1].'/';
	$environment 		= "Local";
	$env_short 			= 'local';
}elseif(strpos($_SERVER['HTTP_HOST'], 'local') !== false || strpos($_SERVER['HTTP_HOST'], 'maler') !== false){
	$base 				= _protocol();
	$environment 		= "Local";
	$env_short 			= 'local';
}elseif(strpos($_SERVER['HTTP_HOST'], 'serverbart') !== false || strpos($_SERVER['HTTP_HOST'], 'dev') !== false){
	$base 				= _protocol();
	$environment 		= "Dev";
	$env_short 			= 'development';
	$reloadr_override 	= true;
}else{
	$base 				= _protocol();
	$reloadr_override 	= true;
	$skjul_environment 	= true;
	$production			= true;
	// Write ?debug=true in the url to use
	if(!isset($_GET["debug"])){
		$dev_t 			= '';
	}
}

function _script($array = 'minimee'){
	global $scripts;
	if(isset($scripts[$array]) && sizeof($scripts[$array])){
		foreach ($scripts[$array] as $key => $s) {
			echo '<script src="'.$s.'"></script>';
		}
	}
}

function _base($MSM = false){
	if(!$MSM){
		global $base;
		echo $base;
	}else{
		global $MSMbase;
		echo $MSMbase;
	}
}

function _dev_time(){
	global $dev_t;
	echo $dev_t;
}

function _logging($valg = false){
	global $super_admin;
	global $production;
	if($valg || (!$production || $super_admin)){
		echo '<script> var _logging_ = true;</script>';
	}
}

function _google_analythics($code = 'universal', $UA = false, $alert = true){
	global $super_admin;
	global $ee;
	global $analythics_code;
	global $production; 

	if($UA == false){
		$UA = $analythics_code;
	}
	
	if($code == 'universal'){
		echo "
			<script>
	            (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
	            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
	            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
	            e.src='//www.google-analytics.com/analytics.js';
	            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
	            ga('create','UA-".$UA."');ga('send','pageview');
	        </script>";
	}else if($code == 'old'){
		echo "
			<script>
			    var _gaq = _gaq || [];
			  _gaq.push(['_setAccount', 'UA-".$UA."']);
			  _gaq.push(['_trackPageview']);
			
			  (function() {
			    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
			    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
			  })();
		  </script>";
	}else if($code != ''){
		$code = str_replace("{UA}", $UA, $code);
		echo $code;
	}
	
	if($super_admin && $ee && $alert && $production){
	
		if($UA == '' || $UA == false){
			echo '<script>console.log("ingen Google Analythics kode!");</script>';
		}
		
	}
}

function _system_on($string = false){
	global $is_system_on;
	if($string != false && $is_system_on){
		echo $string;
	}
}

function _protocol(){
    $protocol 			= (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
    $domainName 		= $_SERVER['SERVER_NAME'];
    return $protocol.$domainName.'/';
}

if(isset($environment) && !$skjul_environment){
	if(isset($admin_link)){
		if($host_cp_url != false){$host_cp = '<a href="'.$host_cp_url.'" target="_blank" class="environment_admin" style="font-size:10px;">CP</a>';}
		$admin = $host_cp."<a class='environment_admin' title='Kontrollpanel' href='".$admin_link."'>&#9874;</a><a title='Logg ut' class='environment_admin' href='{path='LOGOUT'}'>&#8855;</a>";
		}else{$admin = "";}
	$environment_badge = '<style type="text/css">#environment{-webkit-transform:translate3d(0,0,0); transform:translate3d(0,0,0); position:fixed; z-index:9999; font-size: 12px; overflow: hidden;height: 30px;}#environment a{color: white;padding:5px 10px;display:inline-block; vertical-align:top; text-decoration:none; line-height:19px;position: relative;} .environment_admin {background:gray;font-size:22px;height: 100%;line-height:17px;border-right:1px solid darkgray;}#environment.top{top:0;} #environment.left{left:0;}#environment.middle{left:50%;}#environment.bottom{bottom:0;}#environment.right{right:0;}#environment.local{background: #e54545;}#environment.development{background: orange;}#environment.production{background: #1FBE7B;}#environment, #environment a, #environment a b{font-family: arial, sans-serif !important;} #environment a b{color: black !important;}
	</style>
	<div id="environment" class="%placement% '.$env_short.'"><a href="#" onClick="location.reload(true)"><b>&#8634;</b> '.$environment.'</a>'.$admin.'</div>'; 
}

function _environment_badge($new_placement = "top right"){
	if($new_placement != false){
		global $environment_badge;
		$environment_badge = str_replace("%placement%", $new_placement, $environment_badge);
		echo $environment_badge;
	}
}

if(!$turn_off_reloadr && !$reloadr_override) {
    $reloadr = "
        <script src='/static/_reloadr/reloadr.js'></script>
    <script>
        Reloadr.go({
            server: [
              '../../*.php',
              '../../*.html',
              '../../static/css/*.css',
              '../../static/css/*/*.css',
              '../../static/js/*.js',
              '../../static/img/*',
              '../../static/temp/*',
              '../../templates/*/*/*'
            ],
            path: '/static/_reloadr/reloadr.php',
            frequency: %frequency%
        });
    </script>";
}

function _reloadr($new_frequency = 2000){
	global $reloadr;
	if($new_frequency != false){
		$reloadr = str_replace("%frequency%", $new_frequency, $reloadr);
		echo $reloadr;
	}
}

if(isset($env_short) && !$ee){ 
	$_title_top 	=  "<title>".$env_short." | ". "%replace_title%</title><meta name='description' content=''>";
}else{ 
	$_title_top 	=  "%ee_title%";
}

if(isset($environment) && !$skjul_environment){ 
	$_title_top .= "<meta name='robots' content='noindex, nofollow' />";
	
	if(isset($env_short)){
		$_title_top .= '<link rel="shortcut icon" href="/static/php/favicon.php'.$dev_t.'&env='.$env_short.'" />';
	}
}

function _title($new_title = 'Start template', $ee_title = "{exp:seo_lite use_last_segment='yes'}"){
	global $_title_top;
	$_title_top 	= str_replace("%replace_title%", $new_title, $_title_top);
	$_title_top 	= str_replace("%ee_title%", $ee_title, $_title_top);
	echo $_title_top;
}

function _skjult_logo($activate = true){
	global $production;

	if($activate || $production){
		global $ee;
		if($ee){ echo "{if '{exp:detect_mobile:isnotmobile}'}<!--"; }else{echo '<!-- ';}
		echo '
	
	                                       @@@@@@@@@@@@@@                                                                            
	                                  @@@@@@@@@@@@@@@@@@@@@@@@                                                                      
	                                @@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                     
	                             @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                  
	                           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                               
	                         @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                              
	                        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                            
	                      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                           
	                     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                           
	                    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                          
	                   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                         
	                   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                        
	                  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                       
	                  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                       
	                 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                       
	                 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                       
	                 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                       
	                 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                       
	          @@@@@    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   @@@@@                                                
	           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                 
	                  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                       
	                            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                 
	                 @@@@@@                                             @@@@@@                                                      
	                 @@@@@@                                             @@@@@@                                                      
	                 @@@@@@                                             @@@@@@                                                      
	                 @@@@@@                                             @@@@@@                                                      
	                   @@@@                                             @@@@                                                        
	                   @@@@                                             @@@@                                                        
	                   @@@@                                             @@@@                                                        
	                                                                                                                                           
	                                                                                                                                          
	                                             @@                                                                                  
	                                            @@@@                                                                                  
	                                           @@@@@@                                                                                
	                          @@@@@@@@@@@@@@@@@@@  @@@@@@@@@@@@@@@@@@@                                                               
	                        @@@@@@@@@@@@@@@@@@@@    @@@@@@@@@@@@@@@@@@@@                                                             
	                       @@@@@@@@@@@@@@@@@@@        @@@@@@@@@@@@@@@@@@@                                                            
	                       @@@                                        @@@                                                            
	                       @@                                          @@                                                            
	                       @@                                          @@                                                            
	                       
	                                      WWW.MUSTASJ.NO
	    ';
	    if($ee){ echo "-->{/if}"; }else{echo '-->';}
    }
}

function _init_classes($activate = true){
	if($activate){
		global $ee;
		if($ee){ echo " {if '{exp:detect_mobile:ismobile}'}phone{if:elseif '{exp:detect_mobile:istablet}'}tablet{if:else}desktop{/if}"; }
	}
}


function _minimee($string = false){
	global $ee;
	if($string != false && $ee){
		global $turn_off_minimee;
		global $super_admin;
		
		if(!$super_admin || ($super_admin && !$turn_off_minimee)){
			echo $string; 
		}
	}
}
?>