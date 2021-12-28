<?php

include __DIR__.'/vendor/autoload.php';

use RestCord\DiscordClient;
use Discord\WebSockets\Intents;
use Discord\WebSockets\Event;

$discord = new DiscordClient(['token' => 'TOKEN']); 

$discord->on(Event::MESSAGE_CREATE, function (Message $message, Discord $discord) {
    if ($message->content == 'Fuck') {
    ($file = fopen("countries.txt", "r")
    while(!feof($file)) {
        $country = fgets($file);
        $discord->channel->createMessage($message->channel_id, $country);
    }
    fclose($file);
    }
});
