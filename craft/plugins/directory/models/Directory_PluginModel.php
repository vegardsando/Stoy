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

class Directory_PluginModel extends BaseModel
{
    protected function defineAttributes()
    {
        return array(
            'name'        => array(AttributeType::String, 'required' => true),
            'class'        => array(AttributeType::String, 'required' => true),
            'description'  => array(AttributeType::String, 'required' => true),
            'developer'    => array(AttributeType::String, 'required' => true),
            'developerUrl' => array(AttributeType::String, 'required' => true),
            'handle'       => array(AttributeType::String, 'required' => true),
            'url'          => array(AttributeType::String, 'required' => false),
            'path'         => array(AttributeType::String, 'required' => false),
            'zip'          => array(AttributeType::String, 'required' => false),
            'githubRepo'   => array(AttributeType::String, 'required' => false),
            'githubUser'   => array(AttributeType::String, 'required' => false),
            'downloadUrl'   => AttributeType::String,
            'infosUrl'   => AttributeType::String,
        );
    }

    public function getAttributes($names = null, $flattenValues = false)
    {
        $attributes = parent::getAttributes($names, $flattenValues);

        $attributes['isDownloadable'] = $this->isDownloadable();
        $attributes['isInstalled'] = $this->isInstalled();
        $attributes['isInstallable'] = $this->isInstallable();
        $attributes['installUrl'] = $this->installUrl();
        $attributes['localDeveloperUrl'] = $this->getLocalDeveloperUrl();
        $attributes['localInfosUrl'] = $this->getLocalInfosUrl();
        $attributes['shortDescription'] = $this->getShortDescription();

        return $attributes;
    }

    public function getShortDescription()
    {
        $max = 140;

        $str = $this->description;

        if(strlen($str) > $max)
        {
            $str = trim(substr($str, 0, $max)).'…';
        }

        return $str;
    }

    public function getLocalDeveloperUrl()
    {
        return UrlHelper::getActionUrl('directory/developerLink', array('handle' => $this->handle));
    }

    public function getLocalInfosUrl()
    {
        return UrlHelper::getActionUrl('directory/link', array('handle' => $this->handle));
    }

    public function installUrl()
    {
        return UrlHelper::getUrl('directory/install/'.$this->handle);
    }

    public function isInstallable()
    {
        if($this->isDownloadable() && !$this->isInstalled())
        {
            return true;
        }

        return false;
    }

    public function isDownloadable()
    {
        if(!empty($this->zip))
        {
            return true;
        }

        return false;
    }

    public function isInstalled()
    {
        $plugin = craft()->plugins->getPlugin($this->handle);

        if($plugin && $plugin->isInstalled)
        {
            return true;
        }

        return false;
    }
}
