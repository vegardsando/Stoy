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

use Guzzle\Http\Client;

class DirectoryService extends BaseApplicationComponent
{
    public function getPlugins()
    {
        return $this->_request('get', 'all');
    }


    public function getPopularPlugins()
    {
        return $this->_request('get', 'popular');
    }

    public function searchPlugins($q)
    {
        $params = array(
            'q' => $q,
        );

        return $this->_request('post', 'search', $params);
    }

    private function _request($method, $uri, $params = array())
    {
        // api
        $pluginsApiUrl = "https://dukt.net/apis/craft/plugins/".$uri;


        $enableCache = true;
        $response = false;
        $cacheKey = md5(serialize(array($pluginsApiUrl, $method, $uri, $params)));

        if(craft()->config->get('disableCache', 'directory') == true)
        {
            $enableCache = false;
        }

        if($enableCache)
        {
            $response = craft()->fileCache->get($cacheKey);
        }

        if(!$response)
        {
            // call controller

            $client = new Client();
            $request = $client->{$method}($pluginsApiUrl, array(), $params);
            $response = $request->send()->json();

            if($enableCache)
            {
                craft()->fileCache->set($cacheKey, $response, (60 * 60 * 1)); // one hour cache
            }
        }


        $plugins = $response['plugins'];

        $plugins = Directory_PluginModel::populateModels($plugins);

        return $plugins;
    }

    public function getPlugin($handle)
    {
        $plugins = $this->getPlugins();

        foreach($plugins as $plugin)
        {
            if($plugin->handle == $handle)
            {
                return $plugin;
            }
        }

        return null;
    }

    public function downloadPlugin($handle)
    {
        $plugin = $this->getPlugin($handle);
        $url = $plugin->downloadUrl;

        $tempPath = craft()->path->getTempPath();
        $downloadFilePath = $tempPath.$handle.'.zip';

        // make sure it's clean before getting started
        $this->cleanUpTemp($handle);

        $client = new Client();
        $client->get($url)->setResponseBody($downloadFilePath)->send();
    }

    public function extractDownloadedPlugin($handle)
    {
        $plugin = $this->getPlugin($handle);
        $url = $plugin->downloadUrl;

        $tempPath = craft()->path->getTempPath();
        $downloadFilePath = $tempPath.$handle.'.zip';
        $destFolder = $tempPath.$handle.'/unzip/';

        // unzip

        if(Zip::unzip($downloadFilePath, $destFolder))
        {
            // find plugin folder

            $pluginPath = false;
            $folders = IOHelper::getFolders($destFolder);

            foreach($folders as $folder)
            {
                $folderName = IOHelper::getFolderName($folder, false);

                if($folderName != "__MACOSX")
                {
                    if(IOHelper::fileExists($destFolder.$folderName.'/'.$plugin->class.'Plugin.php'))
                    {
                        // plugin is not in a sub-folder
                        $pluginPath = $destFolder.$folderName;
                        break;
                    }
                    elseif(!empty($plugin->path) && IOHelper::folderExists($destFolder.$folderName.'/'.$plugin->path))
                    {
                        // with path
                        $pluginPath = $destFolder.$folderName.'/'.$plugin->path;
                        break;
                    }
                    elseif(IOHelper::folderExists($destFolder.$folderName.'/'.$plugin->handle))
                    {
                        // with handle
                        $pluginPath = $destFolder.$folderName.'/'.$plugin->handle;
                        break;
                    }
                }
            }

            if($pluginPath)
            {
                // move to final destination
                IOHelper::move($pluginPath, CRAFT_PLUGINS_PATH.$handle);
                $this->cleanUpTemp($handle);
            }
            else
            {
                $this->cleanUpTemp($handle);
                throw new Exception("Could not find plugin folder in zip");
            }
        }
        else
        {
            $this->cleanUpTemp($handle);
            throw new Exception("Could not unzip plugin");
        }
    }

    public function cleanUpTemp($handle)
    {
        $tempPath = craft()->path->getTempPath();

        if(!empty($handle))
        {
            IOHelper::deleteFolder($tempPath.$handle);
            IOHelper::deleteFile($tempPath.$handle.'.zip');
        }
    }
}
