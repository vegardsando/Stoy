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

class Directory_InstallController extends BaseController
{
    public function actionPrepare()
    {
        $data = craft()->request->getRequiredPost('data');

        $plugin = craft()->directory->getPlugin($data['handle']);

        $this->returnJson(array(
            'alive' => true,
            'nextStatus' => Craft::t("Downloading {plugin}…", array('plugin' => $plugin->name)),
            'nextAction' => 'directory/install/download'
        ));
    }

    public function actionDownload()
    {
        $data = craft()->request->getRequiredPost('data');

        $plugin = craft()->directory->getPlugin($data['handle']);

        $craftPlugin = craft()->plugins->getPlugin($data['handle']);

        if($craftPlugin)
        {
            if($craftPlugin->isInstalled)
            {
                $this->returnJson(array('alive' => true, 'errorDetails' => "Plugin already installed.", 'finished' => true));
            }
        }

        try
        {
            craft()->directory->downloadPlugin($data['handle']);

            $this->returnJson(array(
                'alive' => true,
                'nextStatus' => Craft::t("Installing {plugin}…", array('plugin' => $plugin->name)),
                'nextAction' => 'directory/install/extract'
            ));
        }
        catch(\Exception $e)
        {
            $this->returnJson(array('alive' => true, 'errorDetails' => $e->getMessage(), 'finished' => true));
        }
    }

    public function actionExtract()
    {
        try
        {
            $data = craft()->request->getRequiredPost('data');

            $extract = craft()->directory->extractDownloadedPlugin($data['handle']);

            $this->returnJson(array(
                'alive' => true,
                'finished' => true,
                'returnUrl' => 'directory',
                'extract' => $extract
            ));
        }
        catch(\Exception $e)
        {
            $this->returnJson(array('alive' => true, 'errorDetails' => $e->getMessage(), 'finished' => true));
        }
    }
}