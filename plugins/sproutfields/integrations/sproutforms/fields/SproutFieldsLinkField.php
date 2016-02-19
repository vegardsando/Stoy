<?php
namespace Craft;

/**
 * Class SproutFieldsLinkField
 *
 * @package Craft
 */
class SproutFieldsLinkField extends SproutFieldsBaseField
{
	/**
	 * @return string
	 */
	public function getType()
	{
		return 'SproutFields_Link';
	}

	/**
	 * @param FieldModel $field
	 * @param mixed      $value
	 * @param mixed      $settings
	 * @param array|null $renderingOptions
	 *
	 * @return \Twig_Markup
	 */
	public function getInputHtml($field, $value, $settings, array $renderingOptions = null)
	{
		$this->beginRendering();

		$attributes = $field->getAttributes();
		$errorMessage = craft()->sproutFields_linkField->getErrorMessage($attributes['name'], $settings);

		$rendered = craft()->templates->render(
			'link/input',
			array(
				'name'             => $field->handle,
				'value'            => $value,
				'field'            => $field,
				'pattern'          => $settings['customPattern'],
				'errorMessage'     => $errorMessage,
				'renderingOptions' => $renderingOptions
			)
		);

		$this->endRendering();

		return TemplateHelper::getRaw($rendered);
	}
}
