# install carton first, then carton install

use 5.14.1;
use warnings;
use strict
use utf8;
use open qw/:std :utf8/;

use Twitter::API;

my $client = Twitter::API->new_with_traits(
    traits => [ qw/AppAuth ApiMethods/ ],
    consumer_key    => '',
    consumer_secret => '',
    access_token        => '',
    access_token_secret => '',
);

my $token = $client->oauth2_token;
$client->access_token($token);
my $r = $client->user_timeline(twitterapi => { count => 10 });

for my $status ( @$r ) {
    $file='countries.txt';
    open(INFO, $file)
    $count = 0; 
    foreach $line (<INFO>)  {   
    say "Fuck $line"; 
    }
}
close(INFO);

# help me
