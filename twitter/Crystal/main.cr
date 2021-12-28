require "twitter-crystal"

consumer_key        = "your consumer key"
consumer_secret     = "your consumer secret"
access_token        = "your access token"
access_token_secret = "your access token secret "

client = Twitter::REST::Client.new(consumer_key, consumer_secret, access_token, access_token_secret)

File.each_line("countries.txt") do |line|
puts line
client.update("Fuck #{line}")
