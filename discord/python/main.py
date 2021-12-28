import requests
import time
import random

headers = {
    "accept": "*/*",
    "accept-language": "en-US,en-MY;q=0.9",
    "authorization": "", #your discord token
    "content-type": "application/json",
    "sec-fetch-dest": "empty",
    "sec-fetch-mode": "cors",
    "sec-fetch-site": "same-origin",
    "x-debug-options": "bugReporterEnabled",
    "x-discord-locale": "en-US",
    "x-super-properties": "" #your x-super-properties
}
countries = open("../../countries.txt", "r").read().split("\n")
while True:
	for country in countries:
		#finalmessage = f"Fuck {random.choice(countries)}"
		finalmessage = f"Fuck {country}"
		print(finalmessage)
		r = requests.patch("https://ptb.discord.com/api/v9/users/@me/settings", headers=headers, data=
		'{\"custom_status\":{\"text\":\"' + finalmessage + '\"}}')
		time.sleep(10)
