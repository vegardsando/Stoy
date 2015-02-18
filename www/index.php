<?php

// Path to your craft/ folder
$craftPath = '../craft';

define('NSM_SERVER_NAME', $_SERVER['SERVER_NAME']);

if (strstr(NSM_SERVER_NAME, '.loc')) define('CRAFT_ENVIRONMENT', 'LOCAL');
elseif (strstr(NSM_SERVER_NAME, '.dev')) define('CRAFT_ENVIRONMENT', 'DEV');
elseif(strpos(NSM_SERVER_NAME, 'serverbart') !== false) define('CRAFT_ENVIRONMENT', 'STAGE');
else define('CRAFT_ENVIRONMENT', 'PROD');

// Do not edit below this line
$path = rtrim($craftPath, '/').'/app/index.php';

if (!is_file($path))
{
	exit('Could not find your craft/ folder. Please ensure that <strong><code>$craftPath</code></strong> is set correctly in '.__FILE__);
}

require_once $path;
