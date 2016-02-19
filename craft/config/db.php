<?php

/**
 * Database Configuration
 *
 * All of your system's database configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/db.php
 */

$customDbConfig = array(

	'*' => array(
		'tablePrefix' => 'craft',
	),
	'LOCAL' => array(
		'server' 	=> 'localhost',
		'user' 		=> 'root',
		'password' 	=> 'root',
		'database' 	=> 'stoy_craft'
	),
	'DEV' => array(
		'server' 	=> '10.0.0.14',
		'port' 		=> '8889',
		//'port' => '3306',
		'user' 		=> 'root',
		'password' 	=> 'root',
		'database' 	=> '_standard_craft'
	),
	'STAGE' => array(
		'server' 	=> '',
		'user' 		=> '',
		'password' 	=> '',
		'database' 	=> ''
	),
	'PROD' => array(
		'server' 	=> '',
		'user' 		=> '',
		'password' 	=> '',
		'database' 	=> ''
	)
);

// If a local db file exists, merge the local db settings
if (is_array($customLocalDbConfig = @include(CRAFT_CONFIG_PATH . 'local/db.php')))
{
	$customGlobalDbConfig = array_merge($customDbConfig['*'], $customLocalDbConfig);
	$customDbConfig = $customGlobalDbConfig;
}
return $customDbConfig;
