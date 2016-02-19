<?php
namespace Craft;

/**
 * Class SproutFormsPlainTextField
 *
 * @package Craft
 */
class SproutFormsPlainTextField extends SproutFormsBaseField
{
	/**
	 * @return string
	 */
	public function getType()
	{
		return 'PlainText';
	}

	/**
	 * @param FieldModel $field
	 * @param mixed      $value
	 * @param array      $settings
	 * @param array      $renderingOptions
	 *
	 * @return \Twig_Markup
	 */
	public function getInputHtml($field, $value, $settings, array $renderingOptions = null)
	{
		$this->beginRendering();

		$rendered = craft()->templates->render(
			'plaintext/input',
			array(
				'name'             => $field->handle,
				'value'            => $value,
				'field'            => $field,
				'settings'         => $settings,
				'renderingOptions' => $renderingOptions
			)
		);

		$this->endRendering();

		return TemplateHelper::getRaw($rendered);
	}

	/**
	 * @return string
	 */
	public function getTemplatesPath()
	{
		return craft()->path->getPluginsPath().'sproutforms/templates/_components/fields/';
	}
}
