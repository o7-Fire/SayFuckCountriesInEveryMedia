# api solve everything

import pytweet

client = pytweet.Client(
    "BEARERTOKEN", 
    consumer_key="CONSUMERKEY", 
    consumer_secret="CONSUMERSECRET", 
    access_token="TOKEN", 
    access_token_secret="TOKENSECRET",
) 

countries = open("countries.txt", "r").read().split("\n")
while True:
    for country in countries:
        cc = f"Fuck {country}"
        client.tweet(cc)
