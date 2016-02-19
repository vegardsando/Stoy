<?php
namespace Craft;

/**
 * Class SproutFields_NotesFieldType
 *
 * @package Craft
 */
class SproutFields_NotesFieldType extends BaseFieldType
{
	private $options = array(
		'style'  => array(
			'infoPrimaryDocumentation'   => 'Primary Information',
			'infoSecondaryDocumentation' => 'Secondary Information',
			'warningDocumentation'       => 'Warning',
			'dangerDocumentation'        => 'Danger',
			'highlightDocumentation'     => 'Highlight'
		),
		'output' => array(
			'markdown' => 'Markdown',
			'richText' => 'Rich Text',
			'html'     => 'HTML'
		)
	);

	/**
	 * @return string
	 */
	public function getName()
	{
		return Craft::t('Notes');
	}

	/**
	 * @return array
	 */
	protected function defineSettings()
	{
		return array(
			'instructions' => array(AttributeType::Mixed),
			'style'        => array(AttributeType::Mixed, 'default' => 'infoPrimaryDocumentation'),
			'output'       => array(AttributeType::Mixed, 'default' => 'markdown')
		);
	}

	/**
	 * @return string
	 */
	public function getSettingsHtml()
	{
		$settings = $this->getSettings();

		return craft()->templates->render(
			'sproutfields/_fieldtypes/notes/settings', array(
				'options'  => $this->options,
				'settings' => $settings
			)
		);
	}

	/**
	 * @param string $name   Our blocktype handle
	 * @param string $value  Always returns blank, our block
	 *                       only styles the Instructions field
	 *
	 * @return string Return our blocks input template
	 */
	public function getInputHtml($name, $value)
	{
		$settings       = $this->getSettings();
		$selectedStyle  = $settings->style;
		$pluginSettings = craft()->plugins->getPlugin('sproutfields')->getSettings()->getAttributes();

		// @todo - can probably simplify this code once settings are in place
		$selectedStyleCss = "";
		if (isset($pluginSettings[$selectedStyle]))
		{
			$selectedStyleCss = str_replace("{{ name }}", $name, $pluginSettings[$selectedStyle]);
		}

		return craft()->templates->render(
			'sproutfields/_fieldtypes/notes/input',
			array(
				'name'             => $name,
				'settings'         => $settings,
				'selectedStyleCss' => $selectedStyleCss
			)
		);
	}
}
