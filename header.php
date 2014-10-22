<?php
/*----------------------------------
	javascript plugin variabler
------------------------------------*/
global $scripts; global $turn_off_minimee;

$scripts['minimee'][] 	=  "static/js/vendor/jquery.animate-enhanced.js";	// css3 animasjon for .animate()
//$scripts['minimee'][] 	=  "static/js/vendor/jquery.fitvids.js";			// plugin for å skallere videoer

/*----------------------------------
	System settings
------------------------------------*/

$turn_off_minimee 			= false;
$EE_debug_member_group 		= array(1); //Sett inn EE membergroup id slik, array(1,4) membergroup 3 er gjester, de som besøker siden
$host_cp_url 				= false;

/*----------------------------------*/

include_once 'static/php/header_top.php';
?>
<!DOCTYPE html>
<?php _skjult_logo(false); //false for å ikke vise logo, vises uansett i produksjon ?>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js <?php _init_classes() ?>"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <!--<meta name="author" content="Mustasj / http://www.mustasj.no" href="/humans.txt">-->
        <?php _title(); //title first, then SEO lite tag ?>
        <!-- Mustasj change to no zoom for mobile -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
		<?php _reloadr(); //false for å deaktivere reloadr ?>
		<?php _minimee('{exp:minimee:css queue="screen"}'); ?>
        <link rel="stylesheet" href="static/css/normalize.css">
        <link rel="stylesheet" href="static/css/compiled/main.css<?php _dev_time() ?>">
        <?php _minimee('{/exp:minimee:css}'); ?>
		<style>html{opacity: 0;}</style>
    </head>
    <body>
    	<?php
    		// Dersom schedule.txt i root eksisterer legges den i topp med schedule informasjon
    		if(file_exists("important_msg.txt") && filesize("important_msg.txt") > 0){$schedule_text = file_get_contents("important_msg.txt");  echo '<div id="important_msg"><span>'.$schedule_text.'</span></div>';}
    	?>
		<?php _environment_badge(); // 'top bottom left middle right' eller false for å skjule ?>
		<!--[if lt IE 9]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <header id="main-header">

            <nav class="nav_main">
                <ul>
                    <li class="active">
                        <a>Hjem</a>
                    </li>
                    <li>
                        <a>Studio</a>
                    </li>
                    <li>
                        <a>Portefølje</a>
                    </li>
                    <li>
                        <a>Kontakt</a>
                    </li>                                                            
                </ul>
            </nav>        

            <img class="logo" src="static/img/logo.png">

            <section class="slide-container">

              <!--First Slide-->
              <div class="slide current setsrc text-right" data-desktop="/static/temp/bg3.jpg"
                                data-tablet="static/temp/bg3.jpg"
                                data-phone="static/temp/bg3.jpg">
                <div class="slide-text">
                    <ul class="pagination"></ul>
                    <p>
        Støy lydstudio er et profesjonelt lydstudio med en Pro Tools-basert workflow. Vi holder til i nyoppussede lokaler i Båtsmannsgate 4, ved Dora i Trondheim.</p>
                
                </div>
              </div>
              <div class="slide setsrc text-left" data-desktop="static/temp/bg.jpg"
                                data-tablet="static/temp/bg.jpg"
                                data-phone="static/temp/bg.jpg">
                <div class="slide-text">
                    <ul class="pagination"></ul>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at ipsum nibh. Vivamus a blandit leo, non rhoncus felis. Vestibulum ante erat, ullamcorper ac sem non, commodo auctor massa. Maecenas a eleifend nunc. Curabitur quis sapien volutpat, semper mauris nec, efficitur nisi. Pellentesque sit amet tellus ac dui varius tristique. Aenean sodales mauris non facilisis interdum.</p>
                </div>
              </div>

              <div class="slide setsrc text-left" data-desktop="static/temp/bg2.jpg"
                                data-tablet="static/temp/bg2.jpg"
                                data-phone="static/temp/bg2.jpg">
                <div class="slide-text">
                    <ul class="pagination"></ul>
                    <p>Støy lydstudio er et profesjonelt lydstudio med en Pro Tools-basert workflow. Vi holder til i nyoppussede lokaler i Båtsmannsgate 4, ved Dora i Trondheim.</p>
                </div>
              </div>              


            </section>

            <figure class="divider down"></figure>

        </header>    
