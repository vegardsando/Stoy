<?php

/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/general.php
 */
 
 // Ensure our urls have the right scheme
define('URI_SCHEME', ( isset($_SERVER['HTTPS'] ) ) ? "https://" : "http://" );

// The site url
define('SITE_URL', URI_SCHEME . $_SERVER['SERVER_NAME'] . '/');

// The site basepath
define('BASEPATH', realpath(CRAFT_BASE_PATH . '/../') . '/');


/* For mer snedige configs
	http://straightupcraft.com/articles/custom-multi-environment-config-and-examples-of-how-to-customize-each-environment
*/

return array(
	'*' => array(
		
		'maxUploadFileSize' => 671088644,

        // We can use these variables in the URL and Path settings within
        // the Craft Control Panel.  i.e. siteUrl => {siteUrl}, basePath => {basePath} 
        'environmentVariables' => array(
            'siteUrl'  => SITE_URL,
            'basePath' => BASEPATH
        ),

        // We can append this value to our CSS and JS files
        // so we can cachebust them all if we need to.
        // <link rel="stylesheet" href="/css/style.css?v={{ craft.config.cacheBustValue }}" /> 
        'cacheBustValue' => '20121017',
        
        'time' => time(),

        // Create a custom variable that we can use for an environment conditional
        // We set the environment in index.php: live, dev, or local
        // This setting assumes we set the environment name in our index.php file
        // {% if craft.config.env == 'live' %} ... {% endif %}
        'env' => CRAFT_ENVIRONMENT,
        
        
        /* Whether Craft should omit the script filename currently being used to access Craft (e.g. index.php) when generating URLs.
	       When set to 'auto', Craft will do its best to determine whether the server is set up to support index.php redirects, and cache the test’s results for 24 hours. */
        'omitScriptNameInUrls' 			=> true,
        
         /* Configures Craft to generate new image transforms right when getUrl() is called, rather than when the browser first requests the image. */
        
        'generateTransformsBeforePageLoad' => false,

        // Triggers
        // If you wish to access the control panel via a different URL
        // or change your page trigger for pagination, you can do so here.
        'cpTrigger'       				=> 'admin',
        'pageTrigger'     				=> 'p',

        // User account related paths
        // Depending on your user needs, you may want to adjust several 
        // of the available user settings to customize your users workflow
        // for logging in, changing a password, or being activated
        //'loginPath'                   => 'members',
        //'logoutPath'                  => 'logout',
        //'setPasswordPath'             => 'members/set-password',
        //'setPasswordSuccessPath'      => 'members',
        //'activateAccountSuccessPath'  => 'members?activate=success',
        //'activateAccountFailurePath'  => 'members?activate=fail',
    ),
	'LOCAL' => array(
		 // Give us more useful error messages
        'devMode'    => true,

        // Have Craft send ALL emails to a single address
        'testToEmailAddress'			=> 'dev@mustasj.no',

        // Some settings helpful for debugging 
        'phpMaxMemoryLimit'          	=> '256M',
        'backupDbOnUpdate'           	=> true,
        'translationDebugOutput'     	=> false,
        'useCompressedJs'            	=> true,
        'cacheDuration'              	=> 'P1D',

        // Make member login settings nice and trusting
        // by allowing a user to stay logged in for 101 years
        // and relaxing various other related settings
        // http://www.php.net/manual/en/dateinterval.construct.php
        'userSessionDuration'           => 'P101Y',
        'rememberedUserSessionDuration' => 'P101Y',
        'rememberUsernameDuration'      => 'P101Y',
        'invalidLoginWindowDuration'    => 'P101Y',
        'cooldownDuration'              => 'PT1S',
        'maxInvalidLogins'              => 101,
	),
	'DEV' => array(
		'devMode' => true,
		// Have Craft send ALL emails to a single address
        'testToEmailAddress'			=> 'dev@mustasj.no',

	),
	'PROD' => array(
		// Setting allowAutoUpdates to false will disable the
        // ability to use the one-click update feature.  This might
        // be useful if you are managing a git workflow and want to 
        // ensure that updates happen in your repository first.
        'allowAutoUpdates' => false,
	)
);
