<?php
/**
 * @link      https://dukt.net/craft/analytics/
 * @copyright Copyright (c) 2016, Dukt
 * @license   https://dukt.net/craft/analytics/docs/license
 */

namespace Craft;

class Analytics_ColumnModel extends BaseModel
{
    protected function defineAttributes()
    {
        return array(
            'id' => AttributeType::String,
            'type' => AttributeType::String,
            'group' => AttributeType::String,
            'status' => AttributeType::String,
            'uiName' => AttributeType::String,
            'description' => AttributeType::String,
            'allowInSegments' => AttributeType::Bool,
        );
    }
}
