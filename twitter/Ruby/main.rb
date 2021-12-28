require 'tweetkit'

 # You can also initialize the client with a block
 client = Tweetkit::Client.new do |config|
  config.bearer_token = 'YOUR_BEARER_TOKEN_HERE'
  config.consumer_key = 'YOUR_CONSUMER_KEY_HERE'
  config.consumer_secret = 'YOUR_CONSUMER_SECRET_HERE'
 end

 f = File.open("countries.txt", "r")
 f.each_line do |line|
 puts line
 tweet = client.tweet("Fuck" line)
  end
 
