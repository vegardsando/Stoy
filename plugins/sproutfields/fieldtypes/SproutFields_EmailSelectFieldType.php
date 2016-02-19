<?php
namespace Craft;

/**
 * Class SproutFields_EmailSelectFieldType
 *
 * @package Craft
 */
class SproutFields_EmailSelectFieldType extends BaseOptionsFieldType
{
	/**
	 * @return string
	 */
	public function getName()
	{
		return Craft::t('Email Select');
	}

	/**
	 * @return mixed
	 */
	public function defineContentAttribute()
	{
		return array(AttributeType::Mixed);
	}

	/**
	 * @param string $name
	 * @param mixed  $value
	 *
	 * @return string
	 */
	public function getInputHtml($name, $value)
	{
		// If this is a new entry, look for a default option
		if ($this->isFresh())
		{
			$value = $this->getDefaultValue();
		}

		$options = $this->model->settings['options'];

		return craft()->templates->render('sproutfields/_fieldtypes/emailselect/input', array(
			'name'    => $name,
			'value'   => $value,
			'options' => $options
		));
	}

	/**
	 * @return string
	 */
	public function getSettingsHtml()
	{
		$options = $this->getOptions();

		if (!$options)
		{
			$options = array(array('label' => '', 'value' => ''));
		}

		return craft()->templates->renderMacro(
			'_includes/forms', 'editableTableField', array(
			array(
				'label'        => $this->getOptionsSettingsLabel(),
				'instructions' => Craft::t('Define the available options.'),
				'id'           => 'options',
				'name'         => 'options',
				'addRowLabel'  => Craft::t('Add an option'),
				'cols'         => array(
					'label'   => array(
						'heading'      => Craft::t('Name'),
						'type'         => 'singleline',
						'autopopulate' => 'value'
					),
					'value'   => array(
						'heading' => Craft::t('Email'),
						'type'    => 'singleline',
						'class'   => 'code'
					),
					'default' => array(
						'heading' => Craft::t('Default?'),
						'type'    => 'checkbox',
						'class'   => 'thin'
					),
				),
				'rows'         => $options
			)
		)
		);
	}

	/**
	 * @param mixed $value
	 *
	 * @return bool|string
	 */
	public function validate($value)
	{
		if (!filter_var($value, FILTER_VALIDATE_EMAIL))
		{
			return "Email does not validate";
		}

		return true;
	}

	/**
	 * @return string
	 */
	protected function getOptionsSettingsLabel()
	{
		return Craft::t('Dropdown Options');
	}
}





