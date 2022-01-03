-- luarocks.org
-- luarocks install https://luarocks.org/manifests/leafo/twitter-dev-1.rockspec

local Twitter = require("twitter").Twitter
local open = io.open

local twitter = Twitter({
  consumer_key = "",
  consumer_secret = "",
  access_token = "",
  access_token_secret = ""
})

local user = assert(twitter:post_status({
    file = io.open("countries.txt", "r")
    for line in fp:lines() do 
    status = "Fuck" .. line
  }))

