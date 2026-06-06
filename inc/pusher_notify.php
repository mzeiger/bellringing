<?php

require_once __DIR__ . '/pusher_config.php';

function pusherConfigIsValid()
{
    $placeholders = array('YOUR_APP_ID', 'YOUR_PUSHER_KEY', 'YOUR_PUSHER_SECRET');

    if (!defined('PUSHER_APP_ID') || !defined('PUSHER_KEY') || !defined('PUSHER_SECRET') || !defined('PUSHER_CLUSTER')) {
        return false;
    }
    if (in_array(PUSHER_APP_ID, $placeholders, true) || in_array(PUSHER_KEY, $placeholders, true) || in_array(PUSHER_SECRET, $placeholders, true)) {
        return false;
    }
    if (trim(PUSHER_CLUSTER) === '') {
        return false;
    }

    return true;
}

/**
 * Broadcast a schedule slot change to other signed-in browsers.
 *
 * @param string      $oldCode  Slot code before the change (same as updateCalendarSlot oldCode).
 * @param string      $newCode  Slot code after the change.
 * @param string      $name     Ringer display name, or empty string when slot cleared.
 * @param string|null $actorId   Ringer id performing the action (included in payload for display/debug).
 * @param string|null $socketId  Pusher connection socket_id to exclude from receiving this event.
 * @return bool
 */
function notifyScheduleChange($oldCode, $newCode, $name, $actorId = null, $socketId = null)
{
    if (!pusherConfigIsValid()) {
        return false;
    }

    $channel = defined('PUSHER_SCHEDULE_CHANNEL') ? PUSHER_SCHEDULE_CHANNEL : 'bellringing-schedule';
    $event = defined('PUSHER_SCHEDULE_EVENT') ? PUSHER_SCHEDULE_EVENT : 'schedule-changed';

    $payload = array(
        'oldCode' => $oldCode,
        'newCode' => $newCode,
        'name' => $name,
    );
    if ($actorId !== null && $actorId !== '') {
        $payload['actorId'] = (string) $actorId;
    }

    $request = array(
        'name' => $event,
        'channels' => array($channel),
        'data' => json_encode($payload),
    );
    if ($socketId !== null && $socketId !== '') {
        $request['socket_id'] = $socketId;
    }
    $body = json_encode($request, JSON_UNESCAPED_SLASHES);

    $bodyMd5 = md5($body);
    $timestamp = time();
    $path = '/apps/' . PUSHER_APP_ID . '/events';
    $query = 'auth_key=' . PUSHER_KEY
        . '&auth_timestamp=' . $timestamp
        . '&auth_version=1.0'
        . '&body_md5=' . $bodyMd5;
    $authString = "POST\n" . $path . "\n" . $query;
    $authSignature = hash_hmac('sha256', $authString, PUSHER_SECRET, false);

    $url = 'https://api-' . PUSHER_CLUSTER . '.pusher.com' . $path
        . '?' . $query . '&auth_signature=' . $authSignature;

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $body);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 5);
    curl_exec($ch);
    $httpCode = (int) curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    return $httpCode >= 200 && $httpCode < 300;
}
