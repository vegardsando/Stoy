<?php
namespace Craft;

return [
    'endpoints' => [
        'user.json' => [
            'elementType' => 'User',
            'criteria' => [
                'id' => craft()->userSession->isAdmin() ? craft()->userSession->getId() : false
            ],
            'first' => true,
            'transformer' => function (UserModel $user) {
                return [
                    'email' => $user->email,
                    'image' => $user->getPhotoUrl('28')
                ];
            },
        ]
    ]
];
