<?php

/**
 * Craft Directory by Dukt
 *
 * @package   Craft Directory
 * @author    Benjamin David
 * @copyright Copyright (c) 2014, Dukt
 * @license   https://dukt.net/craft/directory/docs
 * @link      https://dukt.net/craft/directory
 */

namespace Craft;

class DirectoryPlugin extends BasePlugin
{
    /**
     * Get Name
     */
    function getName()
    {
        return Craft::t('Directory');
    }

    /**
     * Get Version
     */
    function getVersion()
    {
        return '1.0.12';
    }

    /**
     * Get Developer
     */
    function getDeveloper()
    {
        return 'Dukt';
    }

    /**
     * Get Developer URL
     */
    function getDeveloperUrl()
    {
        return 'https://dukt.net/';
    }

    /**
     * Has CP Section
     */
    public function hasCpSection()
    {
        return true;
    }

    public function registerCpRoutes()
    {
        return array(
            'directory' => array('action' => "directory/index"),
            "directory/install/(?P<handle>.*)" => 'directory/install',
        );
    }
}