<?php

/**
 * Copy to password_reset_local.override.php (gitignored) to force behavior:
 *
 * use_browser_link true  - never send email; API always returns dev_reset_url
 * use_browser_link false - always send email, even on localhost
 */
return [
    // Set true if you open the site by machine name/LAN IP and still want on-screen links.
    'use_browser_link' => false,
];
