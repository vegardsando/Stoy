<?php

// Path to your craft/ folder
$craftPath = '../craft';

define('NSM_SERVER_NAME', $_SERVER['SERVER_NAME']);

if (strstr(NSM_SERVER_NAME, '.loc')) define('CRAFT_ENVIRONMENT', 'LOCAL');
elseif (strstr(NSM_SERVER_NAME, '.dev')) define('CRAFT_ENVIRONMENT', 'DEV');
elseif(strpos(NSM_SERVER_NAME, 'serverbart') !== false) define('CRAFT_ENVIRONMENT', 'STAGE');
else define('CRAFT_ENVIRONMENT', 'PROD');

// Move plugins path to right above web root
define('CRAFT_PLUGINS_PATH', realpath(dirname(__FILE__) . "/../plugins").'/');
// Move templates path to right above web root
define('CRAFT_TEMPLATES_PATH', realpath(dirname(__FILE__) . "/../templates").'/');
// Get right basepath to public root
define('BASEPATH', realpath(dirname(__FILE__)).'/');

// Do not edit below this line
$path = rtrim($craftPath, '/').'/app/index.php';

if (!is_file($path))
{
	if (function_exists('http_response_code'))
	{
		http_response_code(503);
	}

	exit('Could not find your craft/ folder. Please ensure that <strong><code>$craftPath</code></strong> is set correctly in '.__FILE__);
}

require_once $path;
