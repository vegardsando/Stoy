<?php
namespace Craft;

class SproutFieldsService extends BaseApplicationComponent
{
	/**
	 * @var SproutFields_LinkFieldService
	 */
	public $link;

	/**
	 * @var SproutFields_EmailFieldService
	 */
	public $email;

	/**
	 * @var SproutFields_EmailSelectFieldService
	 */
	public $emailSelect;

	/**
	 * @var SproutFields_PhoneFieldService
	 */
	public $phone;

	public function init()
	{
		parent::init();

		$this->link        = Craft::app()->getComponent('sproutFields_linkField');
		$this->email       = Craft::app()->getComponent('sproutFields_emailField');
		$this->emailSelect = Craft::app()->getComponent('sproutFields_emailSelectField');
		$this->phone       = Craft::app()->getComponent('sproutFields_phoneField');
	}
}
