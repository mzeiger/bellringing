<?php
/**
 * Pusher credentials for live calendar sync.
 *
 * Copy this file to pusher_config.php and replace the placeholder values with
 * your App Keys from https://dashboard.pusher.com/
 *
 * Live calendar sync will not work until all four constants are set to real values.
 */
define('PUSHER_APP_ID', 'YOUR_APP_ID');
define('PUSHER_KEY', 'YOUR_PUSHER_KEY');
define('PUSHER_SECRET', 'YOUR_PUSHER_SECRET');
define('PUSHER_CLUSTER', 'us2');

define('PUSHER_SCHEDULE_CHANNEL', 'bellringing-schedule');
define('PUSHER_SCHEDULE_EVENT', 'schedule-changed');
