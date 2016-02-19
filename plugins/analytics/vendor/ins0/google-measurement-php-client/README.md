GATracking
==========

Master:
![Build Status](https://travis-ci.org/ins0/google-measurement-php-client.png?branch=master)

GATracking is a Server-Side PHP Client to communicate to Google Analytics over the Google Measurement Protocol API

https://developers.google.com/analytics/devguides/collection/protocol/v1/devguide

### Class Features

- Array Configuration
- Async / Multi Requests
- SSL Support (not default - set over options)
- Adapter Support (sockets)
- Tests

### Tracking Features

- Simple
    - Page Tracking
    - Event Tracking
- Social
    - Social Tracking
- Exception
    - Exception Tracking
- Campaign
    - Campaign Tracking
- App
    - App Event Tracking
    - App Screen Tracking
- User
    - User Timing Tracking
    - User ID Tracking
- Ecommerce
    - Ecommerce Transaction Tracking
    - Ecommerce Item Tracking
- Proxy
    - Client IP Address
    - Client User Agent

## Quick start

### Install via Composer
In the `require` key of `composer.json` file add the following

    "ins0/google-measurement-php-client": "dev-master"

Run the Composer update command

    $ composer update


#Requirements#

PHP >= 5.3.3

Google Analytics Universal Account (more information available here https://support.google.com/analytics/answer/2817075?hl=en)

#Example#

see example_files directory





Thanks
==========

first GIT release .... yaahhh!
