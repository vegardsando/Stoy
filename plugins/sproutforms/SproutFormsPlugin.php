<?php
namespace Craft;

/**
 * Class SproutFormsPlugin
 *
 * @package Craft
 */
class SproutFormsPlugin extends BasePlugin
{
	/**
	 * @return string
	 */
	public function getName()
	{
		$pluginName         = Craft::t('Sprout Forms');
		$pluginNameOverride = $this->getSettings()->pluginNameOverride;

		return ($pluginNameOverride) ? $pluginNameOverride : $pluginName;
	}

	/**
	 * @return string
	 */
	public function getDescription()
	{
		return 'Simple, beautiful forms. 100% control.';
	}

	/**
	 * @return string
	 */
	public function getVersion()
	{
		return '2.1.5';
	}

	/**
	 * @return string
	 */
	public function getSchemaVersion()
	{
		return '2.1.1';
	}

	/**
	 * @return string
	 */
	public function getDeveloper()
	{
		return 'Barrel Strength Design';
	}

	/**
	 * @return string
	 */
	public function getDeveloperUrl()
	{
		return 'http://barrelstrengthdesign.com';
	}

	/**
	 * @return string
	 */
	public function getDocumentationUrl()
	{
		return 'http://sprout.barrelstrengthdesign.com/craft-plugins/forms/docs';
	}

	/**
	 * @return string
	 */
	public function getReleaseFeedUrl()
	{
		return 'https://sprout.barrelstrengthdesign.com/craft-plugins/forms/releases.json';
	}

	/**
	 * @return bool
	 */
	public function hasCpSection()
	{
		return true;
	}

	/**
	 * Get Settings URL
	 */
	public function getSettingsUrl()
	{
		return 'sproutforms/settings';
	}

	public function init()
	{
		Craft::import('plugins.sproutforms.contracts.SproutFormsBaseField');

		Craft::import('plugins.sproutforms.integrations.sproutreports.datasources.*');
		Craft::import('plugins.sproutforms.integrations.sproutimport.*');

		craft()->on('email.onBeforeSendEmail', array(sproutForms(), 'handleOnBeforeSendEmail'));

		if (craft()->request->isCpRequest() && craft()->request->getSegment(1) == 'sproutforms')
		{
			// @todo Craft 3 - update to use info from config.json
			craft()->templates->includeJsResource('sproutforms/js/brand.js');
			craft()->templates->includeJs("
				sproutFormsBrand = new Craft.SproutBrand();
				sproutFormsBrand.displayFooter({
					pluginName: 'Sprout Forms',
					pluginUrl: 'http://sprout.barrelstrengthdesign.com/craft-plugins/forms',
					pluginVersion: '" . $this->getVersion() . "',
					pluginDescription: '" . $this->getDescription() . "',
					developerName: '(Barrel Strength)',
					developerUrl: '" . $this->getDeveloperUrl() . "'
				});
			");
		}
	}

	/**
	 * @return array
	 */
	protected function defineSettings()
	{
		return array(
			'pluginNameOverride'     => AttributeType::String,
			'templateFolderOverride' => AttributeType::String
		);
	}

	/**
	 * @return array
	 */
	public function registerCpRoutes()
	{
		return array(
			'sproutforms/forms/new' => array(
				'action' => 'sproutForms/forms/editFormTemplate'
			),
			'sproutforms/forms/edit/(?P<formId>\d+)' => array(
				'action' => 'sproutForms/forms/editFormTemplate'
			),
			'sproutforms/forms/(?P<formId>\d+)/fields/new' => array(
				'action' => 'sproutForms/fields/editFieldTemplate'
			),
			'sproutforms/forms/(?P<formId>\d+)/fields/edit/(?P<fieldId>\d+)' => array(
				'action' => 'sproutForms/fields/editFieldTemplate'
			),
			'sproutforms/entries/edit/(?P<entryId>\d+)' => array(
				'action' => 'sproutForms/entries/editEntryTemplate'
			),
			'sproutforms/settings' => array(
				'action' => 'sproutForms/settings/settingsIndexTemplate'
			),
			'sproutforms/forms/(?P<groupId>\d+)' => 'sproutforms/forms',
			'sproutforms/examples' => 'sproutforms/_cp/examples',
		);
	}

	/**
	 * @return array
	 */
	public function registerUserPermissions()
	{
		return array(
			'editSproutFormsSettings' => array(
				'label' => Craft::t('Edit Form Settings')
			)
		);
	}

	/**
	 * Event registrar
	 *
	 * @param string   $event
	 * @param \Closure $callback
	 *
	 * @deprecate Deprecated for version 0.9.0 in favour of defineSproutEmailEvents()
	 */
	public function sproutformsAddEventListener($event, \Closure $callback)
	{
		switch ($event)
		{
			case 'saveEntry':
			{
				// only event supported at this time
				craft()->on('sproutForms.saveEntry', $callback);
				break;
			}
		}
	}

	/**
	 * @return array
	 */
	public function defineSproutEmailEvents()
	{
		$sproutEmail = craft()->plugins->getPlugin('sproutEmail');

		if ($sproutEmail && version_compare($sproutEmail->getVersion(), '0.9.2', '>='))
		{
			require_once dirname(__FILE__).'/integrations/sproutemail/SproutForms_SaveEntryEvent.php';

			return array(new SproutForms_SaveEntryEvent());
		}

		sproutForms()->log('Sprout Email 0.9.2+ is required for Dynamic Events integration.');
	}

	/**
	 * @return array
	 */
	public function registerSproutReportsDataSources()
	{
		return array(
			new SproutFormsEntriesDataSource()
		);
	}

	public function registerSproutImportElements()
	{
		return array(
			'sproutforms_form'     => array(
					'model'   => 'Craft\\SproutForms_FormModel',
					'method'  => 'saveForm',
					'service' => 'sproutForms_forms',
			),
			'sproutforms_entry'    => array(
					'model'   => 'Craft\\SproutForms_EntryModel',
					'method'  => 'saveEntry',
					'service' => 'sproutForms_entries',
			),
		);
	}

	public function registerSproutImportImporters()
	{
		return array(
			new SproutForms_FormSproutImportImporter()
		);
	}

	/**
	 * Redirects to examples after installation
	 *
	 * @return void
	 */
	public function onAfterInstall()
	{
		craft()->request->redirect(UrlHelper::getCpUrl().'/sproutforms/settings/examples');
	}

	/**
	 * @throws \Exception
	 */
	public function onBeforeUninstall()
	{
		$forms = sproutForms()->forms->getAllForms();

		foreach ($forms as $form)
		{
			sproutForms()->forms->deleteForm($form);
		}
	}

	public function registerSproutFormsFields()
	{
		$basePath = craft()->path->getPluginsPath().'sproutforms/integrations/sproutforms/fields/';
		require_once $basePath.'SproutFormsNumberField.php';
		require_once $basePath.'SproutFormsPlainTextField.php';
		require_once $basePath.'SproutFormsCheckboxesField.php';
		require_once $basePath.'SproutFormsDropdownField.php';
		require_once $basePath.'SproutFormsMultiSelectField.php';
		require_once $basePath.'SproutFormsRadioButtonsField.php';
		require_once $basePath.'SproutFormsAssetsField.php';

		return array(
			new SproutFormsNumberField(),
			new SproutFormsPlainTextField(),
			new SproutFormsCheckboxesField(),
			new SproutFormsDropdownField(),
			new SproutFormsMultiSelectField(),
			new SproutFormsRadioButtonsField(),
			new SproutFormsAssetsField(),
		);
	}
}

/**
 * @return SproutFormsService
 */
function sproutForms()
{
	return Craft::app()->getComponent('sproutForms');
}
