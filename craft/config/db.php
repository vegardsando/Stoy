<?php

/**
 * Database Configuration
 *
 * All of your system's database configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/db.php
 */

return array(

	'*' => array(
		'tablePrefix' => 'craft',
	),
	'LOCAL' => array(
		'server' => 'localhost',
		'user' => 'root',
		'password' => 'root',
		'database' => 'stoy_craft'
	),
	'DEV' => array(
		'server' => '10.0.0.14',
		'port' => '8889',
		//'port' => '3306',
		'user' => 'root',
		'password' => 'root',
		'database' => 'standard_craft'
	),
	'STAGE' => array(
		'server' => 'serverbart',
		'user' => '',
		'password' => '',
		'database' => ''
	),
	'PROD' => array(
		'server' => '',
		'user' => '',
		'password' => '',
		'database' => ''
	)
);
