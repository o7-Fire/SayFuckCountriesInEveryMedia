import time
import random

import requests

import func


HEADERS = {
    "accept": "*/*",
    "accept-language": "en-US,en-MY;q=0.9",
    "content-type": "application/json",
    "sec-fetch-dest": "empty",
    "sec-fetch-mode": "cors",
    "sec-fetch-site": "same-origin",
    "x-debug-options": "bugReporterEnabled",
    "x-discord-locale": "en-US"
}


def status(token: str, x_super_properties: str = None, *, 
        count: int = func.ALL_COUNTRIES, loop: bool = True):
    HEADERS['authorization'] = token
    HEADERS['x-super-properties'] = x_super_properties
    def f():
        for t in func.get_countries(count):
            r = requests.patch(
                "https://ptb.discord.com/api/v9/users/@me/settings", 
                HEADERS=HEADERS, json=str({"custom_status": {"text": t}})
            )
            time.sleep(10+10*random.random())
    f()
    while loop: 
        f()


def webhook(token: str, count: int = 1):
    fs = func.get_countries(count)
    res = []
    session = requests.Session()
    for f in fs:
        json = { 'content': f }
        r = session.post(f"https://discord.com/api/webhooks/{token}", json=json) 
        res.append(r)
    return res
