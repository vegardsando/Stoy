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

class DirectoryController extends BaseController
{
    public function actionIndex(array $variables = array())
    {
        $variables['plugin'] = craft()->plugins->getPlugin('directory');
        craft()->templates->includeJsResource('directory/js/knockout-3.1.0.js');
        craft()->templates->includeJsResource('directory/js/directory.js');
        craft()->templates->includeCssResource('directory/css/directory.css');

        $this->renderTemplate('directory', $variables);
    }

    public function actionGetPlugins()
    {
        try {

            $plugins = craft()->directory->getPlugins();

            $this->returnJson(array(
                'plugins' => $plugins
            ));
        }
        catch(\Exception $e)
        {
            $this->returnErrorJson($e->getMessage());
        }
    }

    public function actionGetPopularPlugins()
    {
        try {
            $plugins = craft()->directory->getPopularPlugins();

            $this->returnJson(array(
                'plugins' => $plugins
            ));
        }
        catch(\Exception $e)
        {
            $this->returnErrorJson($e->getMessage());
        }
    }

    public function actionSearchPlugins()
    {
        try {
            $q = craft()->request->getPost('q');
            $plugins = craft()->directory->searchPlugins($q);

            $this->returnJson(array(
                'plugins' => $plugins
            ));
        }
        catch(\Exception $e)
        {
            $this->returnErrorJson($e->getMessage());
        }
    }

    public function actionLink()
    {
        $handle = craft()->request->getRequiredParam('handle');
        $plugin = craft()->directory->getPlugin($handle);
        $this->redirect($plugin->infosUrl);
    }

    public function actionDeveloperLink()
    {
        $handle = craft()->request->getRequiredParam('handle');
        $plugin = craft()->directory->getPlugin($handle);
        $this->redirect($plugin->developerUrl);
    }
}